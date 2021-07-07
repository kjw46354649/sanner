package com.framework.innodale.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.component.CreateBarcodeStream;
import com.framework.innodale.service.InnodaleService;
import com.google.zxing.common.BitMatrix;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PdfPrintMakeController {

    private final Log log = LogFactory.getLog(getClass());

    private static final int BLACK = 0xFF000000;
    private static final int WHITE = 0xFFFFFFFF;

    private final float verySmall = 5.0f;
    private final float small = 7.0f;
    private final float saleSmall = 8.0f;
    private final float saleMedium = 9.0f;
    private final float medium = 10.0f;
    private final float large = 12.0f;

    @Autowired
    public Environment environment;

    @Autowired
    private InnodaleService innodaleService;

    /**
     * 클라이언트에서 출력 리스트를 받아서 PDF 작성이후 파일 URL 을 넘긴다.
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/makeCadPrint", method = RequestMethod.POST)
    public void makeCadPrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});
        String[] selectControlLists = ((String) jsonMap.get("selectControl")).split("\\|");
        hashMap.put("selectControlLists", selectControlLists);
        hashMap.put("queryId", "orderMapper.selectControlDrawingInfoList");
        List<Map<String, Object>> imageList = innodaleService.getList(hashMap);

        // 문서 만들기
        PDDocument document = new PDDocument();

        // Add Page
        for (Map<String, Object> fileInfo : imageList) {
            //Creating a blank page
            PDPage addPage = new PDPage(PDRectangle.A4);
            //Adding the blank page to the document
            PDImageXObject pdImageXObject = PDImageXObject.createFromFile((String) fileInfo.get("FILE_PATH") + ".print.png", document);
            PDPageContentStream contentStream = new PDPageContentStream(document, addPage);
            contentStream.drawImage(pdImageXObject, 0, 0, PDRectangle.A4.getWidth(), PDRectangle.A4.getHeight());
            contentStream.close();
            document.addPage(addPage);
        }

        response.setContentType("application/pdf");
        String fileName = URLEncoder.encode("drawing", "UTF-8");
        response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
        // PDF 파일 출력
        document.save(response.getOutputStream());
        document.close();
    }

    /**
     * 클라이언트에서 출력 리스트를 받아서 PDF 작성이후 파일 URL 을 넘긴다.
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/makeCadBarcodePrint", method = RequestMethod.POST)
    public void makeCadBarcodePrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        Document document = new Document();
        document.setMargins(15, 15, 15, 15);

        // 한글 처리를 위한 글꼴 설정 추가
        String fontPath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.font.path") + "/malgun/malgun.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

        Font verySmallFont = new Font(bf, verySmall, Font.NORMAL);
        Font smallNormalFont = new Font(bf, small, Font.NORMAL);
        Font smallBoldFont = new Font(bf, small, Font.BOLD);
        Font mediumNormalFont = new Font(bf, medium, Font.NORMAL);
        Font mediumBoldFont = new Font(bf, medium, Font.BOLD);
        Font largeNormalFont = new Font(bf, large, Font.NORMAL);
        Font largeBoldFont = new Font(bf, large, Font.BOLD);

        PdfWriter.getInstance(document, out);

        String[] selectControlLists = ((String) jsonMap.get("selectControl")).split("\\|");
        String sameDrawingPrint = ((String) jsonMap.get("flag"));
        hashMap.put("selectControlLists", selectControlLists);
        hashMap.put("queryId", "orderMapper.selectControlCadBarcodeList");
        List<Map<String, Object>> controlImageList = innodaleService.getList(hashMap);
        int iCount = 0;

        document.open();

        for (Map<String, Object> controlInfo : controlImageList) {
            if (iCount > 0) document.newPage();

            float[] columnWidths = {220, 80};
            PdfPTable masterTable = new PdfPTable(columnWidths);
            masterTable.setWidthPercentage(100);

            PdfPTable table = new PdfPTable(10);
            table.init();
            table.setHorizontalAlignment(Element.ALIGN_LEFT);
            table.setWidthPercentage(100);
            table.setWidths(new int[]{3, 17, 12, 7, 7, 7, 4, 5, 3, 3});

            int imgWidth = 1100;
            int imgHeight = 170;
            if(controlInfo.get("WORK_TYPE_NM").equals("파트")) {
                imgWidth = 1100;
                imgHeight = 150;
            }
            BitMatrix bitMatrix = CreateBarcodeStream.generateCode128BarcodeImage((String) controlInfo.get("BARCODE_NUM"),imgWidth, imgHeight);
            int width = bitMatrix.getWidth();
            int height = bitMatrix.getHeight();
            // Converting BitMatrix to Buffered Image
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    image.setRGB(x, y, bitMatrix.get(x, y) ? BLACK : WHITE);
                }
            }
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(image, "png", baos);
            baos.flush();
            byte[] imageInByte = baos.toByteArray();
            baos.close();
            Image barcodeImage = Image.getInstance(imageInByte);

            String verText = controlInfo.get("CONTROL_VER") + "\n" + controlInfo.get("DRAWING_VER");
            table.addCell(createCell(verText, 1, 1, smallNormalFont));

            PdfPCell imgCell = createImageCell(barcodeImage,1,1,20f,smallNormalFont);
            imgCell.setPaddingLeft(1);
            imgCell.setPaddingRight(1);
            table.addCell(imgCell);

            table.addCell(createCell((String) controlInfo.get("ORDER_COMP_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("SURFACE_TREAT_NM"), 2, 1, mediumNormalFont)); // 소재종류
            table.addCell(createCell((String) controlInfo.get("MAIN_INSPECTION_NM"), 1, 1, mediumNormalFont)); // 주요검사

            Phrase phrase = new Phrase();
            String sameSideYn = String.valueOf(controlInfo.get("SAME_SIDE_YN"));
            if(sameSideYn.equals("Y")) {
                phrase.add(
                        new Chunk("대"+ "\n", smallNormalFont)
                );
                phrase.add(new VerticalPositionMark());
            }
            String qtyTxt = (String) controlInfo.get("CONTROL_ORDER_QTY");
            String additionalQty = String.valueOf(controlInfo.get("ADDITIONAL_QTY"));
            if(Integer.parseInt(additionalQty) > 0) {
                qtyTxt += ("+" + additionalQty);
            }
            phrase.add(new Chunk(qtyTxt,mediumBoldFont));

            if (controlInfo.get("WORK_TYPE_NM").equals("조립")) {
                PdfPCell cell = createCellPhrase(phrase,1,2,Element.ALIGN_BOTTOM,Element.ALIGN_RIGHT);
                cell.setPaddingBottom(14);
                cell.setUseAscender(true);
                cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);

                table.addCell(cell);
                Phrase phrase2 = new Phrase();
                if(sameSideYn.equals("Y")) {
                    phrase2.add(
                            new Chunk("("+controlInfo.get("ORIGINAL_SIDE_QTY") + ',' + controlInfo.get("OTHER_SIDE_QTY")+ ")\n", smallNormalFont)
                    );
                    phrase2.add(new VerticalPositionMark());
                }
                phrase2.add(new Chunk("SET",smallBoldFont));
                cell = createCellPhrase(phrase2,1,2,Element.ALIGN_BOTTOM,Element.ALIGN_CENTER);
                cell.setPaddingBottom(14);
                cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);

                table.addCell(cell);
            } else if (controlInfo.get("WORK_TYPE_NM").equals("파트")) {
                PdfPCell cell = createCellPhrase(phrase,1,1,Element.ALIGN_BOTTOM,Element.ALIGN_RIGHT);
                cell.setUseAscender(true);
                cell.setBorder(Rectangle.TOP);
                table.addCell(cell);

                Phrase phrase2 = new Phrase();
                if(sameSideYn.equals("Y")) {
                    phrase2.add(
                            new Chunk("("+controlInfo.get("ORIGINAL_SIDE_QTY") + ',' + controlInfo.get("OTHER_SIDE_QTY")+ ")\n", smallNormalFont)
                    );
                    phrase2.add(new VerticalPositionMark());
                }
                phrase2.add(new Chunk("EA",smallBoldFont));
                cell = createCellPhrase(phrase2,1,1,Element.ALIGN_BOTTOM,Element.ALIGN_CENTER);
                cell.setBorder(0);
                cell.setBorderWidthTop(0.1f);
                table.addCell(cell);

            } else {
                PdfPCell cell = createCellPhrase(phrase,1,2,Element.ALIGN_MIDDLE,Element.ALIGN_RIGHT);
                cell.setPaddingBottom(0);
                cell.setPaddingLeft(2);
//                cell.setUseAscender(true);
                cell.setBorder(PdfPCell.TOP | PdfPCell.BOTTOM);

                table.addCell(cell);

                Phrase phrase2 = new Phrase();
                if(sameSideYn.equals("Y")) {
                    phrase2.add(
                            new Chunk("("+controlInfo.get("ORIGINAL_SIDE_QTY") + ',' + controlInfo.get("OTHER_SIDE_QTY")+ ")\n", smallNormalFont)
                    );
                    phrase2.add(new VerticalPositionMark());
                }
                phrase2.add(new Chunk("EA",smallBoldFont));
                cell = createCellPhrase(phrase2,1,2,Element.ALIGN_BOTTOM,Element.ALIGN_CENTER);
                cell.setPaddingBottom(14);
                cell.setBorder(PdfPCell.TOP | PdfPCell.BOTTOM);

                table.addCell(cell);
            }
            String stockRequestQty = String.valueOf(controlInfo.get("STOCK_REQUEST_QTY"));
            if(Integer.parseInt(stockRequestQty) > 0) {
                Phrase phr = new Phrase();
                String qty = String.valueOf(controlInfo.get("STOCK_REQUEST_QTY"));
                PdfPCell tCell = createCell(("충당\n재고" ), 1, 1, smallNormalFont);
                tCell.setBorder(PdfPCell.LEFT | PdfPCell.TOP | PdfPCell.BOTTOM);
                PdfPCell tCell2 = createCell(qty, 1, 1, mediumNormalFont);
                tCell2.setBorder(PdfPCell.TOP | PdfPCell.BOTTOM);
                table.addCell(tCell);
                table.addCell(tCell2);
            }else if(controlInfo.get("EMERGENCY_BARCODE_NM").equals("긴급")) {
                table.addCell(createCell((String)controlInfo.get("EMERGENCY_BARCODE_NM"), 2, 1, mediumBoldFont));
            }else{
                table.addCell(createCell("가공납기", 2, 1, smallNormalFont));
            }

            table.addCell(createCell("작업\n번호", 1, 1, smallNormalFont));
            String controlNumPart = (String) controlInfo.get("CONTROL_NUM_PART");
            if (controlNumPart.length() <= 22) {
                table.addCell(createCell((String) controlInfo.get("CONTROL_NUM_PART"), 1, 1, mediumBoldFont));
            } else {
                table.addCell(createCell((String) controlInfo.get("CONTROL_NUM_PART"), 1, 1, mediumBoldFont));
            }
            table.addCell(createCell((String) controlInfo.get("SIZE_TXT"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("WORK_TYPE_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("MATERIAL_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("MATERIAL_FINISH_HEAT"), 1, 1, mediumNormalFont));
            if (controlInfo.get("WORK_TYPE_NM").equals("파트")) {
                String partUnit = String.valueOf(controlInfo.get("PART_UNIT_QTY"));
                String orderQty = String.valueOf(controlInfo.get("ORDER_QTY"));
                table.addCell(createCellPartUnit(partUnit + " × " + orderQty, 2, 1, smallNormalFont));
            }
            table.addCell(createCell((String) controlInfo.get("INNER_DUE_DT"), 2, 1, mediumBoldFont));
            PdfPCell cell1 = new PdfPCell();
            cell1.addElement(table);
            cell1.setVerticalAlignment(Element.ALIGN_TOP);
            cell1.setBorder(0);
            cell1.setPadding(0);
            masterTable.addCell(cell1);

            if(controlInfo.get("WORK_TYPE_NM").equals("파트")) {
                String text = "PART " + controlInfo.get("PART_NUM");
                PdfPCell cell2 = createCell(text,1,1,new Font(bf, 20f, Font.BOLD));
                masterTable.addCell(cell2);
            }else {
                controlInfo.put("queryId", "orderMapper.selectControlCadOrderList");
                List<Map<String, Object>> controlOrderList = innodaleService.getList(controlInfo);

                if(controlOrderList != null && controlOrderList.size() > 0){

                    PdfPTable drawingInfoTable = new PdfPTable(2);
                    drawingInfoTable.setHorizontalAlignment(Element.ALIGN_RIGHT);
                    drawingInfoTable.setWidthPercentage(100);
                    drawingInfoTable.setWidths(new int[] {5, 80});

                    int iOrderListSize = controlOrderList.size();
                    int iCnt = 1;

                    for (Map<String, Object> controlOrderInfo : controlOrderList) {
                        PdfPCell backCell = createCell(String.valueOf(iCnt), 1, 1, smallNormalFont);
                        backCell.setBackgroundColor(BaseColor.WHITE);
                        drawingInfoTable.addCell(backCell);

                        Font normalTempFont = new Font(bf, 5.0f, Font.NORMAL);
                        Font mediumTempBoldFont = new Font(bf, 10.0f, Font.BOLD);

                        PdfPCell tempCell = new PdfPCell();
                        tempCell.setPaddingTop(0);
                        tempCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                        tempCell.setBorderWidth(0.1f);
                        tempCell.setPaddingBottom(0);
                        tempCell.setBackgroundColor(BaseColor.WHITE);

                        if (iOrderListSize > iCnt) {
                            PdfPTable tempTable = new PdfPTable(1);
                            tempTable.setWidthPercentage(100);
                            tempTable.setWidths(new int[]{80});

                            String text = String.valueOf(controlOrderInfo.get("REGIST_NUM"));
                            PdfPCell inCell = createOrderHighCell(new Phrase(text, mediumTempBoldFont),1,1);
                            tempTable.addCell(inCell);

                            text = "수량 " + String.valueOf(controlOrderInfo.get("ORDER_QTY"));
                            if(sameSideYn.equals("Y")) {
                                text += " (" + controlOrderInfo.get("ORIGINAL_SIDE_QTY") + "," + controlOrderInfo.get("OTHER_SIDE_QTY") + ")";
                            }
                            text += " " + String.valueOf(controlOrderInfo.get("DRAWING_NUM"));
                            inCell = createOrderCell(new Phrase(text,normalTempFont),1,1);
                            tempTable.addCell(inCell);

                            tempCell.addElement(tempTable);
                            drawingInfoTable.addCell(tempCell);
                        } else {
                            // 발주와 1:1 매칭
                            PdfPTable tempTable = new PdfPTable(1);
                            tempTable.setWidthPercentage(100);
                            tempTable.setWidths(new int[]{80});

//                            String text = "B4B4B4B4B4B4B4B4B4B4B4B4";
                            String text = String.valueOf(controlOrderInfo.get("REGIST_NUM"));
                            PdfPCell inCell = createOrderHighCell(new Phrase(text, mediumTempBoldFont),1,1);
                            tempTable.addCell(inCell);

                            text = "수량 " + String.valueOf(controlOrderInfo.get("ORDER_QTY"));
                            if(sameSideYn.equals("Y")) {
                                text += " (" + controlOrderInfo.get("ORIGINAL_SIDE_QTY") + "," + controlOrderInfo.get("OTHER_SIDE_QTY") + ")";
                            }
                            text += " " + String.valueOf(controlOrderInfo.get("DRAWING_NUM"));
                            inCell = createOrderCell(new Phrase(text, normalTempFont),1,1);
                            tempTable.addCell(inCell);

                            tempCell.addElement(tempTable);
                            drawingInfoTable.addCell(tempCell);
                        }
                        iCnt++;
                    }

                    PdfPCell cell2 = new PdfPCell();
                    cell2.setVerticalAlignment(Element.ALIGN_TOP);
                    cell2.addElement(drawingInfoTable);
                    cell2.setColspan(2);
                    cell2.setBorder(0);
                    cell2.setPadding(0);
                    masterTable.addCell(cell2);
                }
            }
            document.add(masterTable);

            if (controlInfo.get("IMAGE_PATH") != null && !"".equals(controlInfo.get("IMAGE_PATH"))) {

                Image pngImage = Image.getInstance((String) controlInfo.get("IMAGE_PATH") + ".print.png");
                pngImage.setAbsolutePosition(15, 10);
                pngImage.scaleAbsolute(PageSize.A4.getWidth() - 30, PageSize.A4.getHeight() - 70);
                document.add(pngImage);

            }
            iCount++;

            if (sameDrawingPrint.equals("Y")) {
                if (controlInfo.get("MULTI_ORDER_YN").equals("Y")) {
                    controlInfo.put("queryId", "orderMapper.selectImgGfileSeq");
                    List<Map<String, Object>> imageList = innodaleService.getList(controlInfo);

                    for (Map<String, Object> fileInfo : imageList) {

                        document.newPage();

                        PdfPTable orderTable = new PdfPTable(2);
                        orderTable.setHorizontalAlignment(Element.ALIGN_RIGHT);
                        orderTable.setWidthPercentage(45f);
                        orderTable.setWidths(new int[] {15, 45});

                        orderTable.addCell(createDrawingLineInCell("도면번호", 1, 1, largeNormalFont, false, false, false, false));
                        orderTable.addCell(createDrawingLineInCell(String.valueOf(fileInfo.get("DRAWING_NUM")) , 1, 1, largeNormalFont, false, false, false, false));

                        document.add(orderTable);
                        orderTable.flushContent();

                        if (fileInfo.get("FILE_PATH") != null && !"".equals(fileInfo.get("FILE_PATH"))) {

                            Image pngImage = Image.getInstance((String) fileInfo.get("FILE_PATH") + ".print.png");
                            pngImage.setAbsolutePosition(10, 10);
                            pngImage.scaleAbsolute(PageSize.A4.getWidth() - 20, PageSize.A4.getHeight() - 20);
                            document.add(pngImage);

                        }
                    }
                }
            }
        }
        document.close();
    }

    /**
     * 클라이언트에서 출력 리스트를 받아서 PDF 작성이후 파일 URL 을 넘긴다.
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/makeItemOrderSheetPrint", method = RequestMethod.POST)
    public void makeItemOrderSheetPrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        String MATERIAL_ORDER_NUM = (String) jsonMap.get("MATERIAL_ORDER_NUM");
        hashMap.put("MATERIAL_ORDER_NUM", MATERIAL_ORDER_NUM);

        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        Document document = new Document(PageSize.A5.rotate(), 10, 10, 15, 15);

        // 한글 처리를 위한 글꼴 설정 추가
        String fontPath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.font.path") + "/malgun/malgun.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

        Font headFont = new Font(bf, 8, Font.BOLD);
        Font contentsFont = new Font(bf, 8, Font.NORMAL);
        BaseColor headBackground = new BaseColor(217, 217, 217);
        PdfWriter.getInstance(document, out);

        hashMap.put("queryId", "material.selectItemOrderRegisterPopTable");
        List<Map<String, Object>> infoList = innodaleService.getList(hashMap);
        List<Map<String, Object>> dataList = null;

        int iCount = 0;

        document.open();

        for (int j = 0; j < infoList.size(); j++) {
            String userPositionNm = "";
            String userTel = "";
            HashMap<String, Object> map = new HashMap<String, Object>();
            hashMap.put("queryId", "material.selectItemOrderRegisterOrderSheetListPdf");
            hashMap.put("CONCAT_SEQ", infoList.get(j).get("CONCAT_SEQ"));
            dataList = innodaleService.getList(hashMap);

            if (infoList.get(0).get("POSITION_NM") != null && !"".equals(infoList.get(0).get("POSITION_NM")))
                userPositionNm = " " + infoList.get(0).get("POSITION_NM");
            if (infoList.get(0).get("USER_TEL") != null && !"".equals(infoList.get(0).get("USER_TEL")))
                userTel = " / " + infoList.get(0).get("USER_TEL");
            if (iCount > 0) document.newPage();

            PdfPTable table = new PdfPTable(9);
            table.init();
            table.setWidthPercentage(100);
            table.setWidths(new int[]{3, 8, 10, 10, 6, 10, 10, 20, 30});

            table.addCell(createCell("진성정밀 주문서", 5, 1, new Font(bf, 12, Font.BOLD)));
            table.addCell(createCellBackground("담당자 / TEL", 2, 1, headFont, headBackground));
            table.addCell(createCell((String) infoList.get(0).get("USER_NM") + userPositionNm + userTel, 2, 1, contentsFont));

            table.addCell(createCellBackground("주문번호", 2, 1, headFont, headBackground));
            table.addCell(createCell((String) infoList.get(j).get("MATERIAL_ORDER_NUM"), 3, 1, contentsFont));
            table.addCell(createCellBackground("주문 일자", 1, 1, headFont, headBackground));
            table.addCell(createCell((String) infoList.get(j).get("ORDER_DT"), 1, 1, contentsFont));
            table.addCell(createCellBackground("공급업체", 1, 1, headFont, headBackground));
            table.addCell(createCell((String) infoList.get(j).get("MATERIAL_COMP_NM"), 1, 1, contentsFont));

            table.addCell(createCellBackground("No", 1, 1, headFont, headBackground));
            table.addCell(createCellBackground("형태", 1, 1, headFont, headBackground));
            table.addCell(createCellBackground("소재종류", 1, 1, headFont, headBackground));
            table.addCell(createCellBackground("Size", 1, 1, headFont, headBackground));
            table.addCell(createCellBackground("수량", 1, 1, headFont, headBackground));
            table.addCell(createCellBackground("요청사항", 2, 1, headFont, headBackground));
            table.addCell(createCellBackground("비고", 1, 1, headFont, headBackground));
            table.addCell(createCellBackground("작업번호", 1, 1, headFont, headBackground));

            for (int i = 0; i < dataList.size(); i++) {
                String partNum = "";
                if (dataList.get(i).get("PART_NUM") != null && !"".equals(dataList.get(i).get("PART_NUM"))) {
                    partNum = " #" + dataList.get(i).get("PART_NUM");
                }

                table.addCell(createCell("" + (dataList.get(i).get("SEQ")), 1, 1, contentsFont));
                table.addCell(createCell((String) dataList.get(i).get("MATERIAL_KIND_NM"), 1, 1, contentsFont));
                table.addCell(createCell((String) dataList.get(i).get("MATERIAL_DETAIL_NM"), 1, 1, contentsFont));
                table.addCell(createCell((String) dataList.get(i).get("SIZE_TXT"), 1, 1, contentsFont));
                table.addCell(createCell("" + dataList.get(i).get("ORDER_QTY"), 1, 1, contentsFont));
                table.addCell(createCell1((String) dataList.get(i).get("REQUEST_NOTE"), 2, 1, contentsFont));
                table.addCell(createCell((String) dataList.get(i).get("ORDER_NOTE"), 1, 1, contentsFont));
                table.addCell(createCell((String) dataList.get(i).get("CONTROL_NUM") + partNum, 1, 1, contentsFont));
            }
            document.add(table);

            table.flushContent();

            iCount++;
        }

        document.close();
    }

    /**
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "/makeSalesDrawingPrint", method = RequestMethod.POST)
    public void makeSalesDrawingPrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        // 문서 만들기
        Document document = new Document(PageSize.A4);
        document.setMargins(15, 15, 15, 15);
        // 한글 처리를 위한 글꼴 설정 추가
        String fontPath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.font.path") + "/malgun/malgun.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

        Font smallNormalFont = new Font(bf, saleSmall, Font.NORMAL);
        Font smallBoldFont = new Font(bf, small, Font.BOLD);
        Font mediumNormalFont = new Font(bf, saleMedium, Font.NORMAL);
        Font largeBoldFont = new Font(bf, large, Font.BOLD);

        PdfWriter.getInstance(document, out);

        String[] selectControlLists = ((String) jsonMap.get("selectControlList")).split("\\|");
        hashMap.put("selectControlLists", selectControlLists);
        hashMap.put("queryId", "orderMapper.selectControlSalesCadBarcodeList");
        List<Map<String, Object>> controlInfoList = innodaleService.getList(hashMap);

        int iCount = 0;

        document.open();

        for (Map<String, Object> controlInfo : controlInfoList) {
            if (iCount > 0) document.newPage();

            PdfPTable table = new PdfPTable(11);
            table.init();
            table.setWidthPercentage(100);
            table.setWidths(new float[]{2.5f, 3.0f, 3.0f, 1.0f, 5.5f, 1.0f, 3.0f, 1.0f, 1.0f, 0.7f, 4.3f});
            // 바코드 생성
            BitMatrix bitMatrix = CreateBarcodeStream.generateCode128BarcodeImage((String) controlInfo.get("ORDER_BARCODE_NUM"), 90, 20);
            int width = bitMatrix.getWidth();
            int height = bitMatrix.getHeight();
            // Converting BitMatrix to Buffered Image
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    image.setRGB(x, y, bitMatrix.get(x, y) ? BLACK : WHITE);
                }
            }
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(image, "png", baos);
            baos.flush();
            byte[] imageInByte = baos.toByteArray();
            baos.close();
            Image barcodeImage = Image.getInstance(imageInByte);
            // 1st line
            table.addCell(createCell("영업도면", 1, 3, largeBoldFont));
            table.addCell(createCell((String) controlInfo.get("ORDER_COMP_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("COMP_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell("발번", 1, 1, smallBoldFont));
            table.addCell(createCell((String) controlInfo.get("ORDER_NUM"), 1, 1, mediumNormalFont));
            table.addCell(createCell("형태", 1, 1, smallBoldFont));
            table.addCell(createCell(controlInfo.get("WORK_TYPE_NM") != null && controlInfo.get("MATERIAL_TYPE_NM") != null ? controlInfo.get("WORK_TYPE_NM") + "/" + controlInfo.get("MATERIAL_TYPE_NM") : controlInfo.get("WORK_TYPE_NM") != null ? (String) controlInfo.get("WORK_TYPE_NM") : "" + controlInfo.get("MATERIAL_TYPE_NM") != null ? (String) controlInfo.get("MATERIAL_TYPE_NM") : "", 1, 1, mediumNormalFont));
            if (controlInfo.get("WORK_TYPE_NM") != null && !controlInfo.get("WORK_TYPE_NM").equals("")) {
                String content = controlInfo.get("WORK_TYPE_NM").equals("조립") ? "SET" : "EA";

                if (controlInfo.get("SAME_SIDE_YN").equals("Y")) {
                    table.addCell(createQtyCell1((String) controlInfo.get("ORDER_QTY"), 1, 1, mediumNormalFont));
                    table.addCell(createEACell1(content, 1, 1, mediumNormalFont));
                } else {
                    table.addCell(createQtyCell((String) controlInfo.get("ORDER_QTY"), 1, 2, mediumNormalFont));
                    table.addCell(createEACell(content, 1, 2, mediumNormalFont));
                }
            }
            table.addCell(createImageCell(barcodeImage, 2, 1, 20.0f, mediumNormalFont));
            // 2nd line
            table.addCell(createCell((String) controlInfo.get("PROJECT_NM"), 2, 1, mediumNormalFont));
            table.addCell(createCell("도번", 1, 1, smallBoldFont));
            table.addCell(createCell((String) controlInfo.get("DRAWING_NUM"), 1, 1, mediumNormalFont));
            table.addCell(createCell("규격", 1, 1, smallBoldFont));
            table.addCell(createCell((String) controlInfo.get("SIZE_TXT"), 1, 1, mediumNormalFont));
            if (controlInfo.get("SAME_SIDE_YN").equals("Y")) {
                table.addCell(createCellPartUnit((String) controlInfo.get("SIDE_QTY"), 2, 1, mediumNormalFont));
            }
            table.addCell(createCell(controlInfo.get("REGIST_NUM") != null ? (String) controlInfo.get("REGIST_NUM") : "", 2, 1, mediumNormalFont));
//            table.addCell(createCell(controlInfo.get("INNER_DUE_DT") != null ? "가 " + controlInfo.get("INNER_DUE_DT") : "", 1, 1, mediumNormalFont));
//            table.addCell(createCell(controlInfo.get("ORDER_DUE_DT") != null ? "발 " + controlInfo.get("ORDER_DUE_DT") : "", 1, 1, mediumNormalFont));
            // 3rd line
            table.addCell(createCell((String) controlInfo.get("MODULE_NM"), 2, 1, mediumNormalFont));
            table.addCell(createCell("품명", 1, 1, smallBoldFont));
            table.addCell(createCell((String) controlInfo.get("ITEM_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell("표면", 1, 1, smallBoldFont));
            table.addCell(createCell((String) controlInfo.get("SURFACE_TREAT_NM"), 1, 1, mediumNormalFont));
//            table.addCell(createCell(controlInfo.get("REGIST_NUM") != null && controlInfo.get("TOTAL_SHEET") != null ? controlInfo.get("REGIST_NUM") + " / " + controlInfo.get("TOTAL_SHEET"): controlInfo.get("REGIST_NUM") != null ? (String) controlInfo.get("REGIST_NUM") : "" + controlInfo.get("TOTAL_SHEET") != null ? String.valueOf(controlInfo.get("TOTAL_SHEET")) : "", 4, 1, smallNormalFont));
            Font tempNormalFont = new Font(bf, 8.5f, Font.NORMAL);
            table.addCell(createCell(controlInfo.get("ORDER_DUE_DT") != null ? controlInfo.get("INNER_DUE_DT") + "-" + controlInfo.get("ORDER_DUE_DT"): "", 3, 1, tempNormalFont));
            table.addCell(createCell(controlInfo.get("CONTROL_NUM") != null ? controlInfo.get("CONTROL_NUM") + "" : "", 1, 1, tempNormalFont));
            document.add(table);
            table.flushContent();

            if (controlInfo.get("IMAGE_PATH") != null && !controlInfo.get("IMAGE_PATH").equals("")) {
                try {
                    Image pngImage = Image.getInstance((String) controlInfo.get("IMAGE_PATH") + ".print.png");
                    pngImage.setAbsolutePosition(15, 10);
                    pngImage.scaleAbsolute(PageSize.A4.getWidth() - 30, PageSize.A4.getHeight() - 90);
                    document.add(pngImage);
                } catch (Exception e){
                    log.error(e.getMessage(), e.getCause());
                    e.printStackTrace();
                }
            }
            iCount++;
        }
        document.close();
    }

    @RequestMapping(value = "/makeStockDrawingPrint", method = RequestMethod.POST)
    public void makeStockDrawingPrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        // 문서 만들기
        Document document = new Document(PageSize.A4);
        document.setMargins(15, 15, 15, 15);
        // 한글 처리를 위한 글꼴 설정 추가
        String fontPath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.font.path") + "/malgun/malgun.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

        Font smallNormalFont = new Font(bf, saleSmall, Font.NORMAL);
        Font smallBoldFont = new Font(bf, small, Font.BOLD);
        Font mediumNormalFont = new Font(bf, 9.5f, Font.NORMAL);
        Font mediumBoldFont = new Font(bf, 9.5f, Font.BOLD);
        Font largeBoldFont = new Font(bf, 15.0f, Font.BOLD);

        PdfWriter.getInstance(document, out);

        String[] selectStockList = ((String) jsonMap.get("selectStockList")).split("\\|");
        hashMap.put("selectStockList", selectStockList);
        hashMap.put("queryId", "material.selectStockCadBarcodeList");
        List<Map<String, Object>> stockInfoList = innodaleService.getList(hashMap);

        int iCount = 0;

        document.open();

        for (Map<String, Object> stockInfo : stockInfoList) {
            if (iCount > 0) document.newPage();

            PdfPTable table = new PdfPTable(8);
            table.init();
            table.setWidthPercentage(100);
            table.setWidths(new float[]{4.0f, 2.5f, 5.5f, 1.5f, 3.5f, 2.5f, 3.5f, 5.0f});
            // 바코드 생성
            BitMatrix bitMatrix = CreateBarcodeStream.generateCode128BarcodeImage((String) stockInfo.get("BARCODE_NUM"), 2320, 800);
            int width = bitMatrix.getWidth();
            int height = bitMatrix.getHeight();
            // Converting BitMatrix to Buffered Image
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    image.setRGB(x, y, bitMatrix.get(x, y) ? BLACK : WHITE);
                }
            }
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(image, "png", baos);
            baos.flush();
            byte[] imageInByte = baos.toByteArray();
            baos.close();
            Image barcodeImage = Image.getInstance(imageInByte);
            // 1st line
            table.addCell(createCell("재고도면", 1, 2, largeBoldFont));
            table.addCell(createCell("재고번호", 1, 1, mediumBoldFont));
            table.addCell(createCell((String) stockInfo.get("INSIDE_STOCK_NUM"), 1, 1, mediumBoldFont));
            table.addCell(createCell("소재", 1, 1, mediumBoldFont));
            table.addCell(createCell((String) stockInfo.get("MATERIAL_DETAIL_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell("등록일시", 1, 1, mediumBoldFont));
            table.addCell(createCell((String) stockInfo.get("INSERT_DT"), 1, 1, mediumNormalFont));
            table.addCell(createImageCell(barcodeImage, 1, 2, 20.0f, mediumNormalFont));
            // 2nd line
            table.addCell(createCell("품명", 1, 1, mediumBoldFont));
            table.addCell(createCell((String) stockInfo.get("ITEM_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell("규격", 1, 1, mediumBoldFont));
            table.addCell(createCell((String) stockInfo.get("SIZE_TXT"), 1, 1, mediumNormalFont));
            table.addCell(createCell("발주처", 1, 1, mediumBoldFont));
            table.addCell(createCell((String) stockInfo.get("ORDER_COMP_NM"), 1, 1, mediumNormalFont));

            document.add(table);
            table.flushContent();

            if (stockInfo.get("IMAGE_PATH") != null && !stockInfo.get("IMAGE_PATH").equals("")) {
                try {
                    Image pngImage = Image.getInstance((String) stockInfo.get("IMAGE_PATH") + ".print.png");
                    pngImage.setAbsolutePosition(15, 10);
                    pngImage.scaleAbsolute(PageSize.A4.getWidth() - 30, PageSize.A4.getHeight() - 90);
                    document.add(pngImage);
                } catch (Exception e){
                    log.error(e.getMessage(), e.getCause());
                    e.printStackTrace();
                }
            }
            iCount++;
        }
        document.close();
    }

    private static PdfPCell createCell(String content, int colspan, int rowspan, Font font) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(20f);
        cell.setPaddingTop(0);
        cell.setPaddingBottom(0);
        cell.setUseAscender(true);
        return cell;
    }

    private static PdfPCell createQtyCell(String content, int colspan, int rowspan, Font font) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(20f);
        cell.setPaddingTop(0);
        cell.setPaddingBottom(0);
        cell.setUseAscender(true);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
        return cell;
    }

    private static PdfPCell createEACell(String content, int colspan, int rowspan, Font font) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(20f);
        cell.setPaddingBottom(14);
        cell.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
        return cell;
    }
    // 조립
    private static PdfPCell createQtyCell1(String content, int colspan, int rowspan, Font font) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(20f);
        cell.setPaddingTop(0);
        cell.setPaddingBottom(0);
        cell.setUseAscender(true);
        cell.setBorder(Rectangle.TOP);
        return cell;
    }
    // 조립
    private static PdfPCell createEACell1(String content, int colspan, int rowspan, Font font) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setVerticalAlignment(Element.ALIGN_BOTTOM);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(20f);
        cell.setBorder(Rectangle.TOP);
        return cell;
    }
    // 조립
    private static PdfPCell createCellPartUnit(String content, int colspan, int rowspan, Font font) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setPaddingTop(0);
        cell.setPaddingBottom(0);
        cell.setUseAscender(true);
        cell.setBorder(Rectangle.BOTTOM);
        return cell;
    }

    private static PdfPCell createCellBackground(String content, int colspan, int rowspan, Font font, BaseColor color) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(20f);
        cell.setBackgroundColor(color);
        cell.setPaddingTop(0);
        cell.setPaddingBottom(0);
        cell.setUseAscender(true);
        return cell;
    }

    private static PdfPCell createImageCell(Image image, int colspan, int rowspan, float height, Font font) {
        PdfPCell cell = new PdfPCell(image, true);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(height);
        cell.setPaddingLeft(2);
        cell.setPaddingRight(2);
        return cell;
    }

    private static PdfPCell createDrawingInCell(String content, int colspan, int rowspan, Font font,
            boolean disableTop, boolean disableRight, boolean disableBottom, boolean disableLeft) {

    	PdfPCell cell = new PdfPCell(new Phrase(content, font));
    	cell.setBackgroundColor(BaseColor.WHITE);
    	cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    	cell.setColspan(colspan);
    	cell.setRowspan(rowspan);
    	cell.setFixedHeight(11f);
        cell.setBorderWidth(0.1f);
    	// cell.setBackgroundColor(BaseColor.WHITE);
    	if(disableTop) cell.disableBorderSide(PdfPCell.TOP);
    	if(disableRight) cell.disableBorderSide(PdfPCell.RIGHT);
    	if(disableBottom) cell.disableBorderSide(PdfPCell.BOTTOM);
    	if(disableLeft) cell.disableBorderSide(PdfPCell.LEFT);
    	return cell;
    }

    private static PdfPCell createDrawingLineInCell(String content, int colspan, int rowspan, Font font,
            boolean disableTop, boolean disableRight, boolean disableBottom, boolean disableLeft) {

    	PdfPCell cell = new PdfPCell(new Phrase(content, font));
    	cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
    	cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    	cell.setColspan(colspan);
    	cell.setRowspan(rowspan);
    	cell.setFixedHeight(20f);
        cell.setBorderWidth(0.1f);
    	cell.setBackgroundColor(BaseColor.WHITE);
    	if(disableTop) cell.disableBorderSide(PdfPCell.TOP);
    	if(disableRight) cell.disableBorderSide(PdfPCell.RIGHT);
    	if(disableBottom) cell.disableBorderSide(PdfPCell.BOTTOM);
    	if(disableLeft) cell.disableBorderSide(PdfPCell.LEFT);
    	return cell;
    }

    private static PdfPCell createCell1(String content, int colspan, int rowspan, Font font) {
        PdfPCell cell = new PdfPCell(new Phrase(content, font));
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setMinimumHeight(20f);
        cell.setPaddingTop(0);
        cell.setPaddingBottom(0);
        cell.setUseAscender(true);
        return cell;
    }

    private static PdfPCell createCellPhrase(Phrase phrase, int colspan, int rowspan, int vertical, int Horizon) {
        PdfPCell cell = new PdfPCell(phrase);
        cell.setVerticalAlignment(vertical);
        cell.setHorizontalAlignment(Horizon);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(20f);
        cell.setPaddingTop(0);
        cell.setPaddingBottom(0);
        return cell;
    }

    private static PdfPCell createOrderCell(Phrase phrase, int colspan, int rowspan) {
        PdfPCell cell = new PdfPCell(phrase);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(8.0f);
        cell.setBorder(0);
        cell.setBackgroundColor(BaseColor.WHITE);
        cell.setUseAscender(true);
        return cell;
    }

    private static PdfPCell createOrderHighCell(Phrase phrase, int colspan, int rowspan) {
        PdfPCell cell = new PdfPCell(phrase);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(12f);
        cell.setBorder(0);
        cell.setBackgroundColor(BaseColor.WHITE);
        cell.setUseAscender(true);
        return cell;
    }

}