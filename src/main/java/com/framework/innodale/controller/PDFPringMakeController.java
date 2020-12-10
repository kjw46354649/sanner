package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.component.CreateBarcodeStream;
import com.framework.innodale.service.InnodaleService;
import com.google.zxing.common.BitMatrix;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class PDFPringMakeController {

    private static final Logger logger = LoggerFactory.getLogger(PDFPringMakeController.class);

    private static final int BLACK = 0xFF000000;
    private static final int WHITE = 0xFFFFFFFF;

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
    @RequestMapping(value = "/makeCadPrint", method = RequestMethod.GET)
    public void makeCadPrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        String[] selectControlLists = ((String) hashMap.get("selectControlList")).split("\\|");

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
            // contentStream.drawImage(pdImageXObject, 0f, -10f, pdImageXObject.getWidth() / 300f * 72, pdImageXObject.getHeight() / 300f * 72);
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
    @RequestMapping(value = "/makeCadBarcodePrint", method = RequestMethod.GET)
    public void makeCadBarcodePrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        Document document = new Document();
        document.setMargins(15, 15, 15, 15);

        // 한글 처리를 위한 글꼴 설정 추가
        String fontPath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.font.path") + "/malgun/malgun.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

        float small = 7.0f;
        float medium = 10.0f;
        float large = 12.0f;

        Font smallNormalFont = new Font(bf, small, Font.NORMAL);
        Font smallBoldFont = new Font(bf, small, Font.BOLD);
        Font mediumNormalFont = new Font(bf, medium, Font.NORMAL);
        Font mediumBoldFont = new Font(bf, medium, Font.BOLD);
        Font largeNormalFont = new Font(bf, large, Font.NORMAL);
        Font largeBoldFont = new Font(bf, large, Font.BOLD);

        PdfWriter.getInstance(document, out);

        String[] selectControlLists = ((String) hashMap.get("selectControlList")).split("\\|");
        String sameDrawingPrint = ((String) hashMap.get("flag"));
        hashMap.put("selectControlLists", selectControlLists);
        hashMap.put("queryId", "orderMapper.selectControlCadBarcodeListList");
        List<Map<String, Object>> controlImageList = innodaleService.getList(hashMap);

        int iCount = 0;

        document.open();

        for (Map<String, Object> controlInfo : controlImageList) {
            if (iCount > 0) document.newPage();

            PdfPTable table = new PdfPTable(13);
            table.init();

            table.setWidthPercentage(100);
            table.setWidths(new int[]{22, 2, 15, 15, 5, 9, 9, 8, 5, 3, 4, 4, 7});

            BitMatrix bitMatrix = CreateBarcodeStream.generateCode128BarcodeImage((String) controlInfo.get("BARCODE_NUM"), 90, 35);
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
            //barcodeImage.setAbsolutePosition(2, 700);
            //barcodeImage.scaleAbsolute(120, 70);
            //document.add(barcodeImage);
            table.addCell(createImageCell(barcodeImage, 1, 2, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("CONTROL_VER"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("ORDER_COMP_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("SIZE_TXT"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("SURFACE_TREAT_NM"), 2, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("WORK_TYPE_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("MATERIAL_FINISH_HEAT"), 1, 1, mediumNormalFont));
            if (controlInfo.get("WORK_TYPE_NM").equals("조립")) {
                table.addCell(createQtyCell((String) controlInfo.get("CONTROL_ORDER_QTY"), 1, 2, largeBoldFont));
                table.addCell(createEACell("SET", 1, 2, smallBoldFont));
            } else if (controlInfo.get("WORK_TYPE_NM").equals("파트")) {
                table.addCell(createQtyCell1((String) controlInfo.get("CONTROL_ORDER_QTY"), 1, 1, largeBoldFont));
                table.addCell(createEACell1("EA", 1, 1, smallBoldFont));
            } else {
                table.addCell(createQtyCell((String) controlInfo.get("CONTROL_ORDER_QTY"), 1,2, largeBoldFont));
                table.addCell(createEACell("EA", 1, 2, smallBoldFont));
            }
            table.addCell(createCell("원칭", 1, 1, smallNormalFont));
            table.addCell(createCell("대칭", 1, 1, smallNormalFont));
            table.addCell(createCell("가공납기", 1, 1, smallNormalFont));

            table.addCell(createCell((String) controlInfo.get("DRAWING_VER"), 1, 1, mediumNormalFont));
            String controlNumPart = (String) controlInfo.get("CONTROL_NUM_PART");
            if (controlNumPart.length() <= 22) {
                table.addCell(createCell((String) controlInfo.get("CONTROL_NUM_PART"), 2, 1, largeBoldFont));
            } else {
                table.addCell(createCell((String) controlInfo.get("CONTROL_NUM_PART"), 2, 1, mediumBoldFont));
            }
            table.addCell(createCell((String) controlInfo.get("TOTAL_SHEET"), 1, 1, largeNormalFont));
            table.addCell(createCell((String) controlInfo.get("MATERIAL_TYPE_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("EMERGENCY_BARCODE_NM"), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("MAIN_INSPECTION_NM"), 1, 1, mediumNormalFont));
            if (controlInfo.get("WORK_TYPE_NM").equals("파트")) {
                String partUnit = String.valueOf(controlInfo.get("PART_UNIT_QTY"));
                String orderQty = String.valueOf(controlInfo.get("ORDER_QTY"));

                table.addCell(createCellPartUnit(partUnit + " × " + orderQty, 2, 1, smallNormalFont));
            }
            table.addCell(createCell(String.valueOf(controlInfo.get("ORIGINAL_SIDE_QTY")), 1, 1, mediumNormalFont));
            table.addCell(createCell(String.valueOf(controlInfo.get("OTHER_SIDE_QTY")), 1, 1, mediumNormalFont));
            table.addCell(createCell((String) controlInfo.get("INNER_DUE_DT"), 1, 1, mediumBoldFont));

            document.add(table);

            table.flushContent();

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

                        if (fileInfo.get("FILE_PATH") != null && !"".equals(fileInfo.get("FILE_PATH"))) {
                            Image pngImage = Image.getInstance((String) fileInfo.get("FILE_PATH") + ".print.png");
                            pngImage.setAbsolutePosition(0, 0);
                            pngImage.scaleAbsolute(PageSize.A4.getWidth(), PageSize.A4.getHeight());
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
    @RequestMapping(value = "/makeItemOrderSheetPrint", method = RequestMethod.GET)
    public void makeItemOrderSheetPrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        String MATERIAL_ORDER_NUM = ((String) hashMap.get("MATERIAL_ORDER_NUM"));
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
//            table.addCell(createCellBackground("납기", 1, 1, headFont, headBackground));
            table.addCell(createCellBackground("관리번호", 1, 1, headFont, headBackground));
//            table.addCell(createCellBackground("Part", 1, 1, headFont, headBackground));

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
                table.addCell(createCell((String) dataList.get(i).get("REQUEST_NOTE"), 2, 1, contentsFont));
                table.addCell(createCell((String) dataList.get(i).get("ORDER_NOTE"), 1, 1, contentsFont));
//                table.addCell(createCell((String) dataList.get(i).get("INNER_DUE_DT"), 1, 1, contentsFont));
                table.addCell(createCell((String) dataList.get(i).get("CONTROL_NUM") + partNum, 1, 1, contentsFont));
//                table.addCell(createCell("" + dataList.get(i).get("PART_NUM"), 1, 1, contentsFont));
            }
            document.add(table);

            table.flushContent();

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

    private static PdfPCell createImageCell(Image image, int colspan, int rowspan, Font font) {
        PdfPCell cell = new PdfPCell(image, true);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(40f);
        cell.setPaddingLeft(2);
        cell.setPaddingRight(2);
        return cell;
    }

}
