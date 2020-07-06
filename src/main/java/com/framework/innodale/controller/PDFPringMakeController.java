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
import java.io.*;
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
     * @param model
     * @param session
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/makeCadPrint", method = RequestMethod.GET)
    public void makeCadPrint(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        String[] dxfGfileSeqList = ((String)hashMap.get("imgGfileSeq")).split("\\^");

        hashMap.put("dxfGfileSeqList", dxfGfileSeqList);
        hashMap.put("queryId", "common.selectGfileFileList");
        List<Map<String, Object>> imageList = innodaleService.getList(hashMap);

        // 문서 만들기
        PDDocument document = new PDDocument();

        // Add Page
        for(Map<String, Object> fileInfo : imageList) {
            //Creating a blank page
            PDPage addPage = new PDPage(PDRectangle.A4);
            //Adding the blank page to the document
            PDImageXObject pdImageXObject = PDImageXObject.createFromFile((String)fileInfo.get("FILE_PATH"), document);
            PDPageContentStream contentStream = new PDPageContentStream(document, addPage);
            contentStream.drawImage(pdImageXObject, 0, 0, PDRectangle.A4.getWidth(), PDRectangle.A4.getHeight());
            // contentStream.drawImage(pdImageXObject, 0f, -10f, pdImageXObject.getWidth() / 300f * 72, pdImageXObject.getHeight() / 300f * 72);
            contentStream.close();
            document.addPage( addPage );
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
     * @param model
     * @param session
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/makeCadBarcodePrint", method = RequestMethod.GET)
    public void makeCadBarcodePrint(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        Document document = new Document();
        document.setMargins(15,15,15,15);

        // 한글 처리를 위한 글꼴 설정 추가
        String fontPath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.font.path") + "/malgun/malgun.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

        Font headFont = new Font(bf, 8, Font.NORMAL);
        Font titleFont = new Font(bf, 6, Font.NORMAL);
        Font boldFont = new Font(bf, 10, Font.BOLD);

        PdfWriter.getInstance(document, out);

        String[] selectControlLists = ((String) hashMap.get("selectControlList")).split("\\^");

        hashMap.put("selectControlLists", selectControlLists);
        hashMap.put("queryId", "orderMapper.selectControlCadBarcodeListList");
        List<Map<String, Object>> controlImageList = innodaleService.getList(hashMap);

        int iCount = 0;

        document.open();

        for(Map<String, Object> controlInfo : controlImageList) {

            if(iCount > 0) document.newPage();

            PdfPTable table = new PdfPTable(12);
            table.init();

            table.setWidthPercentage(100);
            table.setWidths(new int[] {20, 2, 15, 15, 4, 10, 10, 10, 7, 4, 4, 6});

            BitMatrix bitMatrix = CreateBarcodeStream.generateCode128BarcodeImage((String)controlInfo.get("BARCODE_NUM"), 110, 35);
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
            table.addCell(createImageCell(barcodeImage, 1, 2, headFont));
            table.addCell(createCell((String)controlInfo.get("CONTROL_VER"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("ORDER_COMP_NM"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("SIZE_TXT"), 1, 1, headFont));
            table.addCell(createCell("Part", 1, 1, titleFont));
            table.addCell(createCell((String)controlInfo.get("MATERIAL_TYPE_NM"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("WORK_TYPE_NM"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("MATERIAL_FINISH_HEAT"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("CONTROL_ORDER_QTY"), 1, 2, boldFont));
            table.addCell(createCell("원칭", 1, 1, titleFont));
            table.addCell(createCell("대칭", 1, 1, titleFont));
            table.addCell(createCell("가공납기", 1, 1, titleFont));

            table.addCell(createCell((String)controlInfo.get("DRAWING_VER"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("CONTROL_NUM"), 2, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("PART_NUM"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("MATERIAL_DETAIL_NM"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("EMERGENCY_BARCODE_NM"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("MAIN_INSPECTION_NM"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("ORIGINAL_SIDE_QTY"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("OTHER_SIDE_QTY"), 1, 1, headFont));
            table.addCell(createCell((String)controlInfo.get("INNER_DUE_DT"), 1, 1, headFont));

            document.add(table);

            table.flushContent();

            if(controlInfo.get("IMAGE_PATH") != null && !"".equals(controlInfo.get("IMAGE_PATH"))) {
                Image pngImage = Image.getInstance((String) controlInfo.get("IMAGE_PATH"));
                pngImage.setAbsolutePosition(0, 17);
                pngImage.scaleAbsolute(PageSize.A4.getWidth(), PageSize.A4.getHeight() - 50);

                document.add(pngImage);
            }

            iCount++;
        }

        document.close();
    }

    /**
     * 클라이언트에서 출력 리스트를 받아서 PDF 작성이후 파일 URL 을 넘긴다.
     * @param model
     * @param session
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/makeItemOrderSheetPrint", method = RequestMethod.POST)
    public void makeItemOrderSheetPrint(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        String paramName = request.getParameter("paramName");
        String paramData = request.getParameter("paramData");
        String[] arrayParamName = paramName.split(":");
        String[] arrayParams = paramData.split(":");
        // AllData input Map
        for (int i = 0; i < arrayParamName.length; i++) {
            hashMap.put(arrayParamName[i], arrayParams[i]);
        }

        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        Document document = new Document(PageSize.A4.rotate(), 15, 15, 15, 15);

        // 한글 처리를 위한 글꼴 설정 추가
        String fontPath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.font.path") + "/malgun/malgun.ttf";
        BaseFont bf = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);

        Font headFont = new Font(bf, 10, Font.BOLD);
        Font contentsFont = new Font(bf, 8, Font.NORMAL);

        PdfWriter.getInstance(document, out);

        hashMap.put("queryId", "material.selectItemOrderRegisterPopTable");
        List<Map<String, Object>> infoList = innodaleService.getList(hashMap);
        List<Map<String, Object>> dataList = null;

        int iCount = 0;

        document.open();

        for(int j=0; j < infoList.size(); j++) {
            HashMap<String, Object> map = new HashMap<String, Object>();

            hashMap.put("queryId", "material.selectItemOrderRegisterOrderSheetListPdf");
            hashMap.put("CONCAT_SEQ", infoList.get(j).get("CONCAT_SEQ"));
            dataList = innodaleService.getList(hashMap);
            if(iCount > 0) document.newPage();

            PdfPTable table = new PdfPTable(10);
            table.init();
            table.setWidthPercentage(100);
            table.setWidths(new int[] {5, 10, 15, 15, 30, 30, 5, 5, 20, 5});

            table.addCell(createCell("주문번호", 2, 1, headFont));
            table.addCell(createCell((String)infoList.get(j).get("MATERIAL_ORDER_NUM"), 2, 1, contentsFont));
            table.addCell(createCell("주문일자", 1, 1, headFont));
            table.addCell(createCell((String)infoList.get(j).get("ORDER_DT"), 1, 1, contentsFont));
            table.addCell(createCell("주문업체", 2, 1, headFont));
            table.addCell(createCell((String)infoList.get(j).get("MATERIAL_COMP_NM"), 2, 1, contentsFont));

            table.addCell(createCell("No", 1, 1, headFont));
            table.addCell(createCell("형태", 1, 1, headFont));
            table.addCell(createCell("상세종류", 1, 1, headFont));
            table.addCell(createCell("요청 소재", 1, 1, headFont));
            table.addCell(createCell("요청사항", 1, 1, headFont));
            table.addCell(createCell("비고", 1, 1, headFont));
            table.addCell(createCell("수량", 1, 1, headFont));
            table.addCell(createCell("납기", 1, 1, headFont));
            table.addCell(createCell("관리번호", 1, 1, headFont));
            table.addCell(createCell("Part", 1, 1, headFont));

            for(int i=0; i<dataList.size(); i++) {
                table.addCell(createCell(""+(dataList.get(i).get("SEQ")), 1, 1, contentsFont));
                table.addCell(createCell((String)dataList.get(i).get("MATERIAL_KIND_NM"), 1, 1, contentsFont));
                table.addCell(createCell((String)dataList.get(i).get("MATERIAL_DETAIL_NM"), 1, 1, contentsFont));
                table.addCell(createCell((String)dataList.get(i).get("SIZE_TXT"), 1, 1, contentsFont));
                table.addCell(createCell((String)dataList.get(i).get("REQUEST_NOTE"), 1, 1, contentsFont));
                table.addCell(createCell((String)dataList.get(i).get("ORDER_NOTE"), 1, 1, contentsFont));
                table.addCell(createCell(""+dataList.get(i).get("ORDER_QTY"), 1, 1, contentsFont));
                table.addCell(createCell((String)dataList.get(i).get("HOPE_DUE_DT"), 1, 1, contentsFont));
                table.addCell(createCell((String)dataList.get(i).get("CONTROL_NUM"), 1, 1, contentsFont));
                table.addCell(createCell(""+dataList.get(i).get("PART_NUM"), 1, 1, contentsFont));
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
    	return cell;
    }

    private static PdfPCell createImageCell(Image image, int colspan, int rowspan, Font font) {
        PdfPCell cell = new PdfPCell(image, true);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(colspan);
        cell.setRowspan(rowspan);
        cell.setFixedHeight(40f);
        cell.setPadding(0);
        return cell;
    }

}

