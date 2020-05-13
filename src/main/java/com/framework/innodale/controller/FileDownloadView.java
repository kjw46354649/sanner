package com.framework.innodale.controller;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class FileDownloadView extends AbstractView {

    public FileDownloadView(){
        setContentType("application/download; ccharset=utf-8");
    }

    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {

        HashMap<String, Object> fileInfo = (HashMap<String, Object>)model.get("fileInfo");

        java.io.File file = new java.io.File((String)fileInfo.get("FILE_PATH"));

        res.setContentType(getContentType());
        res.setContentLength(100);

        String userAgent = req.getHeader("User-Agent");
        String fileName = null;

        if(userAgent.indexOf("MSIE") > -1){
            fileName = URLEncoder.encode(file.getName(), "utf-8");
        }else{
            fileName = new String(file.getName().getBytes("utf-8"), "iso-8859-1");
        }

        res.setHeader("Content-Disposition", "attachment; filename=\"" + fileInfo.get("ORGINAL_FILE_NM") + "\";");
        res.setHeader("Content-Transfer-Encoding", "binary");

        OutputStream os = res.getOutputStream();
        FileInputStream fis = null;

        try{
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, os);
        }finally{
            if(fis != null){
                try{
                    fis.close();
                }catch(IOException e){
                    System.out.println("exception : " + e.toString());
                }
            }
        }
        os.flush();

    }
}

