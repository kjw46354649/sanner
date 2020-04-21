package com.framework.innodale.component;

import com.aspose.cad.*;
import com.aspose.cad.fileformats.cad.CadDrawTypeMode;
import com.aspose.cad.fileformats.cad.CadImage;
import com.aspose.cad.imageoptions.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import javax.activation.CommandMap;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

@Component(value = "cadFileConverter")
public class CadFileConverter {

    private static String CMD_DWG2JPG_QCAD = "D:/QCAD/qcad.exe -no-gui -allow-multiple-instances -autostart scripts/Pro/Tools/Dwg2Bmp/Dwg2Bmp.js";
    private static String CMD_TO_NORMAL_DFX2010_WIN_EXE = "D:/ODAFileConverter/ODAFileConverter.exe";
    private static String CMD_TO_NORMAL_DFX2010_LINUX_EXE = "ODAFileConverter";
    private static CommandExecuteUtil commandExecuteUtil;

    @Autowired
    private Environment environment;

//    @Autowired
//    private CommandExecuteUtil commandExecuteUtil;

    public static String cadfile_converter(File sourceFile, String convertPath) throws IOException, InterruptedException {

        System.out.println("sourceFile=[" + sourceFile.getAbsolutePath() + "]");
        System.out.println("convertPath=[" + convertPath + "]");

        // String targetFilePath = sourceFile.getParentFile().toString() + File.separator + convertPath;

        License license = new License();
        license.setLicense("Aspose.CAD.lic");

        String message = "DXF File Converter Success!.";

        try {

            // 01. ODAFileConverter convert cad 2013 dwg
            convertODAFileConvert(sourceFile, convertPath);

            // 02. Convert File Make
            String sourceFileName = new String(sourceFile.getName().getBytes("x-windows-949"), "ksc5601");
            String fileOnlyName = sourceFileName.substring(0, sourceFileName.lastIndexOf("."));
            String targetFileFullPath = sourceFile.getParentFile().toString() + File.separator + convertPath + File.separator + fileOnlyName + ".dwg";
            File convertFile = new File(targetFileFullPath);

            System.out.println("sourceFile=[" + sourceFile.getAbsolutePath() + "]");
            System.out.println("targetFileFullPath=[" + targetFileFullPath + "]");

//            CadImage cadImage = (CadImage)Image.load(sourceFile.getAbsolutePath());
//            cadImage.save(targetFileFullPath);

            // 02. ASPOSE Cad to Java convert
            convertAsposeCadTOJava(convertFile);
            // String convertFileName = targetFilePath + File.separator + fileName.substring(0, fileName.lastIndexOf(".")) + ".dwg";

        }catch(Exception exception){
            message = exception.getMessage();
        }

        return message;
        // 03. cad file converter to pdf converter
        // convertQCadDwg2Img(convertFile);
    }

    /**
     * ODA File Convert CAD FILE TO DXF2010 VERSION CONVERT
     * @param orginalFile
     * @throws IOException
     * @throws InterruptedException
     */
    public static void convertODAFileConvert(File sourceFile, String convertPath) throws IOException, InterruptedException {
        String sourceFileName = new String(sourceFile.getName().getBytes("x-windows-949"), "ksc5601");
        String targetFilePath = sourceFile.getParentFile().toString() + File.separator + convertPath;
        if ("window".equals(CommonUtility.getServerType())){
            CommandExecuteUtil.execCommand(CMD_TO_NORMAL_DFX2010_WIN_EXE, sourceFile.getParentFile().toString(), targetFilePath, "ACAD2013", "DWG", "0", "1", sourceFileName);
        }else{
            CommandExecuteUtil.execCommand(CMD_TO_NORMAL_DFX2010_LINUX_EXE, sourceFile.getParentFile().toString(), targetFilePath, "ACAD2013", "DWG", "0", "1", sourceFileName);
        }
    }

    /**
     * AUTO CAD 2010 TO PDF AND PNG IMAGE
     * @param orginalFile
     * @throws UnsupportedEncodingException
     */
    public static void convertAsposeCadTOJava(File convertFile) throws UnsupportedEncodingException {

        String sourceFilePath = convertFile.getAbsolutePath();
        String soruceFileName = new String(convertFile.getName().getBytes("x-windows-949"), "ksc5601");

        Image cadImage = Image.load(sourceFilePath);

        int cadWidth = cadImage.getSize().getWidth();
        int cadHeight = cadImage.getSize().getHeight();

        CadRasterizationOptions rasterizationOptions = new CadRasterizationOptions();
        rasterizationOptions.setLayouts(new String[] {"Model"});

        // export to raster
        //A4 size at 300 DPI - 2480 x 3508
        if(cadHeight < cadWidth) {
            rasterizationOptions.setPageWidth(3508);
            rasterizationOptions.setPageHeight(2480);
        }else{
            rasterizationOptions.setPageWidth(2480);
            rasterizationOptions.setPageHeight(3508);
        }

        rasterizationOptions.setAutomaticLayoutsScaling(true);
        rasterizationOptions.setNoScaling(false);
        rasterizationOptions.setDrawType(CadDrawTypeMode.UseObjectColor);

        // rasterizationOptions.getGraphicsOptions().setSmoothingMode(SmoothingMode.HighQuality);
        // rasterizationOptions.getGraphicsOptions().setTextRenderingHint(TextRenderingHint.AntiAliasGridFit);
        rasterizationOptions.getGraphicsOptions().setInterpolationMode(InterpolationMode.HighQualityBicubic);

//        PdfOptions pdfOptions = new PdfOptions();
//        pdfOptions.setVectorRasterizationOptions(rasterizationOptions);

        // cadImage.save(convertFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + "_aspos.pdf", pdfOptions);

        rasterizationOptions.setContentAsBitmap(true);
        PngOptions pngOptions = new PngOptions();
        pngOptions.setVectorRasterizationOptions(rasterizationOptions);

        cadImage.save(convertFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + "_aspos.png", pngOptions);

    }

    public static void main(String[] args){
        try{

            File file = new File("D:/Project/workspace-jmes/TEST_DXF/SDVB-ABL08-22_TEST-TEST.dxf");
            cadfile_converter(file, "convert");

        }catch(Exception exception){
            exception.printStackTrace();
        }

    }

}
