package com.framework.innodale.component;

import com.aspose.cad.*;
import com.aspose.cad.fileformats.cad.CadDrawTypeMode;
import com.aspose.cad.fileformats.cad.CadImage;
import com.aspose.cad.fileformats.cad.cadtables.CadStyleTableObject;
import com.aspose.cad.imageoptions.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Component(value = "cadFileConverter")
public class CadFileConverter {

    private static String CMD_TO_NORMAL_DFX2010_WIN_EXE = "D:/ODAFileConverter/ODAFileConverter.exe";
    private static String CMD_TO_NORMAL_DFX2010_LINUX_EXE = "ODAFileConverter";
    private static CommandExecuteUtil commandExecuteUtil;

    @Autowired
    private Environment environment;

    public static String cadfile_converter(File sourceFile, String convertPath) throws IOException, InterruptedException {

//        License license = new License();
//        license.setLicense("Aspose.CAD.lic");

        String message = "DXF File Converter Success!.";

        try {

            // 01. ODAFileConverter convert cad 2013 dwg
            convertODAFileConvert(sourceFile, convertPath);

            // 02. Convert File Make
            String sourceFileName = new String(sourceFile.getName().getBytes("x-windows-949"), "ksc5601");
            String fileOnlyName = sourceFileName.substring(0, sourceFileName.lastIndexOf("."));
            String targetFileFullPath = sourceFile.getParentFile().toString() + File.separator + convertPath + File.separator + fileOnlyName + ".dwg";
            File convertFile = new File(targetFileFullPath);

            // 02. ASPOSE Cad to Java convert
            convertAsposeCadTOJava(convertFile);

        }catch(Exception exception){
            message = exception.getMessage();
        }

        return message;
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
     * ODA File Convert CAD FILE TO DXF2010 VERSION CONVERT
     * @param orginalFile
     * @throws IOException
     * @throws InterruptedException
     */
    public static void convertODAFileDirectoryConvert(File sourceFile, String convertPath) throws IOException, InterruptedException {
        String targetFilePath = sourceFile.getParentFile().toString() + File.separator + convertPath;
        if ("window".equals(CommonUtility.getServerType())){
            CommandExecuteUtil.execCommand(CMD_TO_NORMAL_DFX2010_WIN_EXE, sourceFile.getParentFile().toString(), targetFilePath, "ACAD2013", "DWG", "0", "1");
        }else{
            CommandExecuteUtil.execCommand(CMD_TO_NORMAL_DFX2010_LINUX_EXE, sourceFile.getParentFile().toString(), targetFilePath, "ACAD2013", "DWG", "0", "1");
        }
    }

    /**
     * AUTO CAD 2010 TO PDF AND PNG IMAGE
     * @param orginalFile
     * @throws UnsupportedEncodingException
     */
    public static void convertAsposeCadTOJava(File convertFile) throws UnsupportedEncodingException {

        boolean isRotate = false;

        String sourceFilePath = convertFile.getAbsolutePath();
        String soruceFileName = new String(convertFile.getName().getBytes("x-windows-949"), "ksc5601");

        CadImage cadImage = (CadImage)Image.load(sourceFilePath);

        int cadWidth = cadImage.getSize().getWidth();
        int cadHeight = cadImage.getSize().getHeight();

//        for (Object style : cadImage.getStyles()) {
//            System.err.println("getStyleName=[" + ((CadStyleTableObject) style).getStyleName());
//            System.err.println("getBigFontName=[" + ((CadStyleTableObject) style).getBigFontName());
//            System.err.println("getRoundTripTableStyle=[" + ((CadStyleTableObject) style).getRoundTripTableStyle());
//            System.err.println(("image styles  " + ((CadStyleTableObject) style).getStyleName() + " -> " + ((CadStyleTableObject) style).getPrimaryFontName()));
//        }

//        for(Object style : cadImage.getStyles())
//        {
//            // Set the font name
//            ((com.aspose.cad.fileformats.cad.cadtables.CadStyleTableObject)style).setPrimaryFontName("Arial");
//        }

        CadRasterizationOptions rasterizationOptions = new CadRasterizationOptions();
        rasterizationOptions.setLayouts(new String[] {"Model"});

        // export to raster
        //A4 size at 300 DPI - 2480 x 3508
        if(cadHeight < cadWidth) {
            rasterizationOptions.setPageWidth(3350);
            rasterizationOptions.setPageHeight(2480);
            isRotate = true;
        }else{
            rasterizationOptions.setPageWidth(2480);
//            rasterizationOptions.setPageHeight(3508);
            rasterizationOptions.setPageHeight(3350);
        }

        rasterizationOptions.setAutomaticLayoutsScaling(true);
        rasterizationOptions.setNoScaling(false);
        rasterizationOptions.setDrawType(CadDrawTypeMode.UseDrawColor);

        rasterizationOptions.getGraphicsOptions().setSmoothingMode(SmoothingMode.None);
        rasterizationOptions.getGraphicsOptions().setTextRenderingHint(TextRenderingHint.SystemDefault);
        rasterizationOptions.getGraphicsOptions().setInterpolationMode(InterpolationMode.HighQualityBicubic);
        rasterizationOptions.setContentAsBitmap(true);

//        PdfOptions pdfOptions = new PdfOptions();
//        pdfOptions.setVectorRasterizationOptions(rasterizationOptions);

        // cadImage.save(convertFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + ".pdf", pdfOptions);

        PngOptions pngOptions = new PngOptions();
        pngOptions.setVectorRasterizationOptions(rasterizationOptions);

//        String distinctImagePath = convertFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + ".png";
        String distinctImagePath = convertFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf("."));

        if(isRotate){
            cadImage.save(distinctImagePath + ".jpg", pngOptions);
            ImageUtil.rotate90(new File(distinctImagePath + ".jpg"), new File(distinctImagePath + ".png"));

        }else{
            cadImage.save(distinctImagePath + ".png", pngOptions);
        }
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
