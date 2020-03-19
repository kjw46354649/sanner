package com.framework.innodale.controller;

import com.framework.innodale.component.CreateBarcodeStream;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import org.springframework.web.servlet.view.AbstractView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.Map;

public class BarcodeView extends AbstractView {

    public BarcodeView() {
        setContentType("image/png; charset=UTF-8");
    }

    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception{

        String codeType = (String)model.get("codeType");
        String barcode = (String)model.get("barcode");

        res.setContentType(getContentType());
        res.setHeader("Content-Transfer-Encoding", "binary");

        OutputStream out = res.getOutputStream();
        barcode = new String(barcode.getBytes("UTF-8"), "ISO-8859-1");

        BitMatrix bitMatrix = null;

        switch (codeType){
            case "code128" :
                bitMatrix = CreateBarcodeStream.generateCode128BarcodeImage(barcode);
                break;
            case "qrcode" :
                bitMatrix = CreateBarcodeStream.generateQRCodeImage(barcode);
                break;
        }

        MatrixToImageWriter.writeToStream(bitMatrix, "png", out);

        out.flush();
    }
}