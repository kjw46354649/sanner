package com.framework.innodale.controller;

import com.framework.innodale.service.InnodaleService;
import net.sf.jxls.transformer.XLSTransformer;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ExcelController {

    @Autowired
    private Environment environment;

    @Autowired
    private InnodaleService innodaleService;

    @RequestMapping("excelDownLoad")
    public void excelDownLoadMaterualPurchsing(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, Exception {
        HashMap<String, Object> paramMap = new HashMap<String, Object>();
        HashMap<String, Object> map = new HashMap<String, Object>();

        List<Map<String, Object>> dataList1 = null;

        String excelDir = environment.getRequiredProperty("base.excel.template.path");

        InputStream is = null;
        Workbook workbook = null;
        FileOutputStream fos = null;
        FileInputStream fileInputStream = null;

        try {

            String sqlIds = req.getParameter("sqlId");
            String paramName = req.getParameter("paramName");
            String paramData = req.getParameter("paramData");
            String templateFileName = req.getParameter("template");

            SimpleDateFormat time = new SimpleDateFormat("yyyyMMddhhmmss");
            Date today = new Date();
            String date = time.format(today);

            is = new BufferedInputStream(new FileInputStream(excelDir + File.separator + templateFileName + ".xlsx"));

            String[] arrayQueryId = sqlIds.split(":");
            String[] arrayParamName = paramName.split(":");
            String[] arrayParams = paramData.split(":");

            for (int i = 0; i < arrayParamName.length; i++) {
                paramMap.put(arrayParamName[i], arrayParams[i]);
                paramMap.put("queryId", arrayQueryId[i]);
            }

            dataList1 = innodaleService.getList(paramMap);
            map.put("info", dataList1);

            XLSTransformer xls = new XLSTransformer();
            workbook = xls.transformXLS(is, map);

            fos = new FileOutputStream(new File(excelDir + File.separator + templateFileName + date + ".xlsx"));
            workbook.write(fos);
            File openFile = new File(excelDir + File.separator + templateFileName + date + ".xlsx");
            Desktop.getDesktop().open(openFile);
            //workbook.write(res.getOutputStream());

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
