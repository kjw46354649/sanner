package com.framework.innodale.controller;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

public class ImageView extends AbstractView {

    public ImageView() {
        setContentType("image/png; charset=UTF-8");
    }

    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception{

        HashMap<String, Object> fileInfo = (HashMap<String, Object>)model.get("imageInfo");

        res.setContentType(getContentType());
        res.setHeader("Content-Transfer-Encoding", "binary");

        OutputStream out = res.getOutputStream();

        String fileName = (String)model.get("blank_image");

        if(fileInfo != null && fileInfo.containsKey("FILE_PATH")){
            fileName = (String)fileInfo.get("FILE_PATH");
        }
        // InputStream in = getClass().getResourceAsStream(fileName);
        InputStream in = new FileInputStream(new File(fileName));
        FileCopyUtils.copy(in, out);

        out.flush();
    }

}