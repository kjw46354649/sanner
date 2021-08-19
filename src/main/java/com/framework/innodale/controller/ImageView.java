package com.framework.innodale.controller;

import com.framework.innodale.component.ImageUtil;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
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

        if(fileInfo != null && fileInfo.containsKey("FILE_PATH") && Files.exists(Paths.get((String)fileInfo.get("FILE_PATH"))) ){
            fileName = (String)fileInfo.get("FILE_PATH");
        }
        // InputStream in = getClass().getResourceAsStream(fileName);

        File imgFile = new File(fileName);
        BufferedImage rotateImg = null;

        BufferedImage img = ImageIO.read(imgFile);
        if(img.getHeight() >= (img.getWidth() + 300)) {
            // 이미지 회전시키기 시계방향 270도 (반시계 90)
            rotateImg = new BufferedImage(img.getHeight(),img.getWidth(),img.getType());
            Graphics2D g2d = rotateImg.createGraphics();
            g2d.translate(0,img.getWidth());
            g2d.rotate(Math.toRadians(270));
            g2d.drawImage(img,0,0,null);

            ImageIO.write(rotateImg,"png",out);
        }else {
            byte[] buf = Files.readAllBytes(Paths.get(fileName));
            out.write(buf);
        }

        out.flush();

        img.flush();

        if(rotateImg != null) {
            rotateImg.flush();
        }
    }

}