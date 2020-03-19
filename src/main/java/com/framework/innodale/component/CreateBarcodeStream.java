package com.framework.innodale.component;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.oned.Code128Writer;
import com.google.zxing.oned.EAN13Writer;
import com.google.zxing.qrcode.QRCodeWriter;

public class CreateBarcodeStream {

    /**
     * generate EAN13 Barcode
     * @param barcodeText
     * @return
     * @throws Exception
     */
    public static BitMatrix generateEAN13BarcodeImage(String barcodeText) throws Exception {
        EAN13Writer barcodeWriter = new EAN13Writer();
        BitMatrix bitMatrix = barcodeWriter.encode(barcodeText, BarcodeFormat.EAN_13, 300, 150);

        return bitMatrix;
    }

    /**
     * Generate CODE128 Barcode
     * @param barcodeText
     * @return
     * @throws Exception
     */
    public static BitMatrix generateCode128BarcodeImage(String barcodeText) throws Exception {
        Code128Writer barcodeWriter = new Code128Writer();
        BitMatrix bitMatrix = barcodeWriter.encode(barcodeText, BarcodeFormat.CODE_128, 300, 150);

        return bitMatrix;
    }

    /**
     * Generate QR Barcode
     * @param barcodeText
     * @return
     * @throws Exception
     */
    public static BitMatrix generateQRCodeImage(String barcodeText) throws Exception {
        QRCodeWriter barcodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = barcodeWriter.encode(barcodeText, BarcodeFormat.QR_CODE, 200, 200);

        return bitMatrix;
    }

}
