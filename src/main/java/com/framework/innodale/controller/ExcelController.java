package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import com.itextpdf.text.Document;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import net.sf.jxls.transformer.XLSTransformer;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

@Controller
public class ExcelController {

    @Autowired
    private Environment environment;

    @Autowired
    private InnodaleService innodaleService;

    @RequestMapping("/downloadExcel")
    public void excelDownLoad(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, Exception {
        HashMap<String, Object> paramMap = new HashMap<String, Object>();
        HashMap<String, Object> map = new HashMap<String, Object>();

        List<Map<String, Object>> dataList = null;

        String excelDir = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.excel.template.path");

        InputStream is = null;
        Workbook workbook = null;
        FileOutputStream fos = null;
        FileInputStream fileInputStream = null;

        try {

            String sqlIds = req.getParameter("sqlId");
            String paramName = req.getParameter("paramName");
            String paramData = req.getParameter("paramData");
            String mapInputId = req.getParameter("mapInputId");
            String templateFileName = req.getParameter("template");

            SimpleDateFormat time = new SimpleDateFormat("yyyyMMddhhmmss");
            Date today = new Date();
            String date = time.format(today);

            String[] arrayQueryId = sqlIds.split(":");
            String[] arrayParamName = paramName.split(":");
            String[] arrayParams = paramData.split(":");
            String[] arrayMapInputIds = mapInputId.split(":");

            // AllData input Map
            for (int i = 0; i < arrayParamName.length; i++) {
                paramMap.put(arrayParamName[i], arrayParams[i]);
            }

            for(int j = 0; j < arrayQueryId.length; j++) {
                paramMap.put("queryId", arrayQueryId[j]);

                dataList = innodaleService.getList(paramMap);
                map.put(arrayMapInputIds[j], dataList);
            }

            // 검사 성적서 관련 추가 코드
            Map<String,Object> tempMap = new HashMap<>();
            if(templateFileName.indexOf("inspection_result_template") >= 0) {
                List<Map<String,Object>> pointList = (List<Map<String, Object>>) map.get("data2");
                List<Map<String,Object>> valueList = (List<Map<String, Object>>) map.get("data");

                for(int j=0;j<pointList.size();j++) {
                    Map<String,Object> temp = pointList.get(j);
                    String pointSeq = String.valueOf(temp.get("POINT_SEQ"));
                    List<String> list = new ArrayList<>();

                    for(int i=0;i<valueList.size();i++) {
                        Map<String,Object> valueMap = valueList.get(i);
                        String targetPoint = String.valueOf(valueMap.get("POINT_SEQ")+"");
                        String resultValue = String.valueOf(valueMap.get("RESULT_VALUE")+"");

                        if(targetPoint.equals(pointSeq)) {
                            list.add(resultValue);
                        }
                    }
                    if(list.size() > 0) {
                        temp.put("list",list);
                    }
                    pointList.set(j,temp);
                }
                map.put("data2",pointList);
                tempMap = (Map<String, Object>) valueList.get(0);
            }

            is = new BufferedInputStream(new FileInputStream(excelDir + File.separator + templateFileName + ".xlsx"));
            XLSTransformer xls = new XLSTransformer();
            workbook = xls.transformXLS(is, map);

            if(templateFileName.indexOf("inspection_result_template") >= 0) {
                tempMap.put("queryId","common.selectGfileFileListInfo");
                HashMap<String,Object> imgInfo = (HashMap<String, Object>) innodaleService.getInfo(tempMap);

                XSSFSheet sheet = (XSSFSheet) workbook.getSheetAt(0);

                InputStream ips = new FileInputStream(imgInfo.get("FILE_PATH")+"");
                byte[] bytes = IOUtils.toByteArray(ips);
                int pictureIdx = workbook.addPicture(bytes, XSSFWorkbook.PICTURE_TYPE_JPEG);
                ips.close();

                XSSFCreationHelper helper = (XSSFCreationHelper) workbook.getCreationHelper();
                XSSFDrawing drawing = (XSSFDrawing) sheet.createDrawingPatriarch();
                XSSFClientAnchor anchor = (XSSFClientAnchor) helper.createClientAnchor();

                anchor.setCol1(1);
                anchor.setCol2(12);
                anchor.setRow1(11);
                anchor.setRow2(41);

                XSSFPicture picture = (XSSFPicture) drawing.createPicture(anchor,pictureIdx);

                picture.resize(1.075,1.032);
            }

            res.setHeader("Content-Disposition", CommonUtility.getDisposition(templateFileName + date + ".xlsx", CommonUtility.getBrowser(req)));
            res.setHeader("Content-Transfer-Encoding", "binary");
            res.setContentType("application/x-msexcel");
            res.setContentType("application/octet-stream; charset=utf-8");
            workbook.write(res.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null) is.close();
            if (workbook != null) workbook.close();
            if (fos != null) fos.close();
            if (fileInputStream != null) fileInputStream.close();
        }
    }



    @RequestMapping("/itemOrderRegisterOrderSheetPrint")
    public void itemOrderRegisterOrderSheetPrint(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, Exception {
        HashMap<String, Object> paramMap = new HashMap<String, Object>();

        List<HashMap<String, Object>> sheetMaps = new ArrayList<HashMap<String, Object>>();
        List<String> sheetNames = new ArrayList<>();
        List<Map<String, Object>> dataList = null;
        List<Map<String, Object>> infoList = null;

        String excelDir = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.excel.template.path");

        InputStream is = null;
        Workbook workbook = null;
        FileOutputStream fos = null;
        FileInputStream fileInputStream = null;
        XLSTransformer transformer = new XLSTransformer();

        try {

            String sqlIds = req.getParameter("sqlId");
            String paramName = req.getParameter("paramName");
            String paramData = req.getParameter("paramData");
            String mapInputId = req.getParameter("mapInputId");
            String templateFileName = req.getParameter("template");

            SimpleDateFormat time = new SimpleDateFormat("yyyyMMddhhmmss");
            Date today = new Date();
            String date = time.format(today);

            String[] arrayQueryId = sqlIds.split(":");
            String[] arrayParamName = paramName.split(":");
            String[] arrayParams = paramData.split(":");
            String[] arrayMapInputIds = mapInputId.split(":");

            is = new BufferedInputStream(new FileInputStream(excelDir + File.separator + templateFileName + ".xlsx"));
            XLSTransformer xls = new XLSTransformer();

            // AllData input Map
            for (int i = 0; i < arrayParamName.length; i++) {
                paramMap.put(arrayParamName[i], arrayParams[i]);
            }

            // 정보성 쿼리.
            paramMap.put("queryId", "material.selectItemOrderRegisterPopTable");
            infoList = innodaleService.getList(paramMap);
            for(int j=0; j < infoList.size(); j++) {
                HashMap<String, Object> map = new HashMap<String, Object>();
                sheetNames.add((String) infoList.get(j).get("MATERIAL_COMP_NM"));

                paramMap.put("queryId", "excel.selectItemOrderRegisterOrderSheetListExcel");
                paramMap.put("CONCAT_SEQ", infoList.get(j).get("CONCAT_SEQ"));
                dataList = innodaleService.getList(paramMap);
                map.put("MATERIAL_ORDER_NUM", dataList.get(0).get("MATERIAL_ORDER_NUM"));
                map.put("ORDER_DT", dataList.get(0).get("ORDER_DT"));
                map.put("ORDER_COMP_NM", dataList.get(0).get("ORDER_COMP_NM"));
                map.put("data", dataList);
                sheetMaps.add(map);
            }

            workbook = transformer.transformMultipleSheetsList(is, sheetMaps, sheetNames, "data", new HashMap(), 0);

            File file = new File(excelDir + File.separator + "excel");
            file.mkdirs();
            fos = new FileOutputStream(new File(excelDir + File.separator + "excel" + File.separator + templateFileName + date + ".xlsx"));
            workbook.write(fos);
            fos.close();

            // System.out.println(excelDir + File.separator + templateFileName + date + ".xlsx");

            /*res.setHeader("Content-Disposition", CommonUtility.getDisposition(templateFileName + date + ".xlsx", CommonUtility.getBrowser(req)));
            res.setHeader("Content-Transfer-Encoding", "binary");
            res.setContentType("application/x-msexcel");
            res.setContentType("application/octet-stream; charset=utf-8");
            workbook.write(res.getOutputStream());*/


            //First we read the Excel file in binary format into FileInputStream
            FileInputStream input_document = new FileInputStream(new File(excelDir + File.separator + "excel" + File.separator + templateFileName + date + ".xlsx"));
            // Read workbook into HSSFWorkbook
            XSSFWorkbook my_xls_workbook = new XSSFWorkbook(input_document);
            // Read worksheet into HSSFSheet
            XSSFSheet my_worksheet = my_xls_workbook.getSheetAt(0);
            // To iterate over the rows
            Iterator<Row> rowIterator = my_worksheet.iterator();
            //We will create output PDF document objects at this point
            Document iText_xls_2_pdf = new Document();
            File pdfFile = new File(excelDir + File.separator + "pdf");
            pdfFile.mkdirs();
            PdfWriter.getInstance(iText_xls_2_pdf, new FileOutputStream(new File(excelDir + File.separator + "pdf" + File.separator + templateFileName + date + ".pdf")));
            iText_xls_2_pdf.open();
            //we have two columns in the Excel sheet, so we create a PDF table with two columns
            //Note: There are ways to make this dynamic in nature, if you want to.
            PdfPTable my_table = new PdfPTable(10);
            //We will use the object below to dynamically add new data to the table
            PdfPCell table_cell;
            //Loop through rows.
            while(rowIterator.hasNext()) {
                Row row = rowIterator.next();
                Iterator<Cell> cellIterator = row.cellIterator();
                while(cellIterator.hasNext()) {
                    Cell cell = cellIterator.next(); //Fetch CELL
                    switch(cell.getCellType()) { //Identify CELL type
                        //you need to add more code here based on
                        //your requirement / transformations
                        case Cell.CELL_TYPE_STRING:
                            //Push the data from Excel to PDF Cell
                            table_cell=new PdfPCell(new Phrase(cell.getStringCellValue()));
                            //feel free to move the code below to suit to your needs
                            my_table.addCell(table_cell);
                            break;
                    }
                    //next line
                }

            }
            //Finally add the table to PDF document
            iText_xls_2_pdf.add(my_table);
            iText_xls_2_pdf.close();
            //we created our pdf file..
            input_document.close(); //close xls

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null) is.close();
            if (workbook != null) workbook.close();
            if (fos != null) fos.close();
            if (fileInputStream != null) fileInputStream.close();
        }
    }
}
