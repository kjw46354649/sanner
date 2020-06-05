package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import net.sf.jxls.transformer.XLSTransformer;
import org.apache.poi.ss.usermodel.Workbook;
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
                System.out.println(arrayQueryId[j]);
                paramMap.put("queryId", arrayQueryId[j]);

                dataList = innodaleService.getList(paramMap);
                System.out.println(arrayMapInputIds[j]);
                map.put(arrayMapInputIds[j], dataList);
            }


            //Resource resource = new ClassPathResource("classpath:excelTemplate" + File.separator + templateFileName + "data.txt");
            //InputStream inputStream = resource.getInputStream();
            is = new BufferedInputStream(new FileInputStream(excelDir + File.separator + templateFileName + ".xlsx"));
            XLSTransformer xls = new XLSTransformer();
            workbook = xls.transformXLS(is, map);

            // System.out.println(excelDir + File.separator + templateFileName + date + ".xlsx");

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
        HashMap<String, Object> map = new HashMap<String, Object>();

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
            paramMap.put("queryId", "selectItemOrderRegisterPopTable");
            infoList = innodaleService.getList(paramMap);

            System.out.println("#######################################");
            System.out.println(infoList);
            System.out.println(infoList.get(0).get("MATERIAL_COMP_NM"));
            System.out.println(infoList.get(0).get("MATERIAL_COMP_EMAIL"));
            System.out.println(infoList.get(0).get("MATERIAL_COMP_CD"));
            System.out.println("#######################################");

            for(int j=0; j < infoList.size(); j++) {
                sheetNames.add((String) infoList.get(j).get("MATERIAL_COMP_NM"));

                paramMap.put("queryId", "excel.selectItemOrderRegisterOrderSheetListExcel");
                paramMap.put("MATERIAL_COMP_CD", infoList.get(j).get("MATERIAL_COMP_CD"));
                dataList = innodaleService.getList(paramMap);
                map.put("data", dataList);
                sheetMaps.add(map);
            }

            workbook = transformer.transformMultipleSheetsList(is, sheetMaps, sheetNames, "data", new HashMap(), 0);

            //Resource resource = new ClassPathResource("classpath:excelTemplate" + File.separator + templateFileName + "data.txt");
            //InputStream inputStream = resource.getInputStream();
            fos =new FileOutputStream(new File("classpath:excelTemplate" + File.separator + templateFileName + ".xlsx"));
            workbook.write(fos);

            // System.out.println(excelDir + File.separator + templateFileName + date + ".xlsx");

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
}
