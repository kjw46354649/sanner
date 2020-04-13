package com.framework.innodale.component;

import com.aspose.cad.Image;
import com.aspose.cad.InterpolationMode;
import com.aspose.cad.SmoothingMode;
import com.aspose.cad.TextRenderingHint;
import com.aspose.cad.fileformats.cad.CadDrawTypeMode;
import com.aspose.cad.imageoptions.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

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

    public static void cadfile_converter(File sourceFile, String convertPath) throws IOException, InterruptedException {

        System.out.println("sourceFile=[" + sourceFile.getAbsolutePath() + "]");
        System.out.println("convertPath=[" + convertPath + "]");

        String targetFilePath = sourceFile.getParentFile().toString() + File.separator + convertPath;

        // 01. ODAFileConverter convert cad 2013 dwg
        convertODAFileConvert(sourceFile, convertPath);

        // 02. Convert File Make
        String sourceFileName = new String(sourceFile.getName().getBytes("x-windows-949"), "ksc5601");
        String fileOnlyName = sourceFileName.substring(0, sourceFileName.lastIndexOf("."));
        String targetFileFullPath = sourceFile.getParentFile().toString() + File.separator + convertPath + File.separator + fileOnlyName + ".dwg";
        File convertFile = new File(targetFileFullPath);

        // 02. ASPOSE Cad to Java convert
        convertAsposeCadTOJava(convertFile);
        // String convertFileName = targetFilePath + File.separator + fileName.substring(0, fileName.lastIndexOf(".")) + ".dwg";

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
        CommandExecuteUtil.execCommand(CMD_TO_NORMAL_DFX2010_WIN_EXE, sourceFile.getParentFile().toString(), targetFilePath, "ACAD2013", "DWG", "0", "1", sourceFileName);
//        CommandExecuteUtil.execCommand(CMD_TO_NORMAL_DFX2010_WIN_EXE, orginalFile, targetFilePath, "ACAD2010", "DWG", "0", "1", fileName);
    }

    /**
     * Convert dwg by QCad (do NOT support 3D dwg)
     *
     * @param src
     * @param destPath
     */
    @Deprecated
    public static void convertQCadDwg2Img(File convertFile) throws IOException, InterruptedException {
        // dwg2bmp.bat -f -a -b white -o d:\cad\c.jpg d:\cad\test.dwg
        //long start = System.currentTimeMillis();
        String sourceFilePath = convertFile.getAbsolutePath();
        String sourceFileName = new String(convertFile.getName().getBytes("x-windows-949"), "ksc5601");
        String targetFileName = convertFile.getParentFile().toString() + sourceFileName.substring(0, sourceFileName.lastIndexOf(".")) + "_qcad.jpg";
        CommandExecuteUtil.execCommand(CMD_DWG2JPG_QCAD, "-fs", "standard", "Arial", "-a", "-b", "white", "-q", "100", "-d", "-r", "20", "-o", targetFileName, convertFile.getParentFile().toString());
        //long end = System.currentTimeMillis();
        //System.out.println("elapse: " + (end - start));
        //System.out.println("result: " + result);
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

        System.out.println("convertAsposeCadTOJava image size width x height=[" + cadWidth + "] x [" + cadHeight + "]");

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

        PdfOptions pdfOptions = new PdfOptions();
        pdfOptions.setVectorRasterizationOptions(rasterizationOptions);

        cadImage.save(convertFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + "_aspos.pdf", pdfOptions);

        rasterizationOptions.setContentAsBitmap(true);
        PngOptions pngOptions = new PngOptions();
        pngOptions.setVectorRasterizationOptions(rasterizationOptions);

        cadImage.save(convertFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + "_aspos.png", pngOptions);

    }

    /**
     * AUTO CAD 2010 TO PDF AND PNG IMAGE
     * @param orginalFile
     * @throws UnsupportedEncodingException
     */
    public static void convertAsposeCadTOJavaBackup(File convertFile) throws UnsupportedEncodingException {

        String sourceFilePath = convertFile.getAbsolutePath();
        String soruceFileName = new String(convertFile.getName().getBytes("x-windows-949"), "ksc5601");

        Image cadImage = Image.load(sourceFilePath);

        int cadWidth = cadImage.getSize().getWidth();
        int cadHeight = cadImage.getSize().getHeight();

        System.out.println("convertAsposeCadTOJava image size width x height=[" + cadWidth + "] x [" + cadHeight + "]");

        CadRasterizationOptions rasterizationOptions = new CadRasterizationOptions();

        rasterizationOptions.setLayouts(new String[] {"Model"});

        HashMap<String, Object> cadOption = new HashMap<String, Object>();
        cadOption.put("unitType", cadImage.getUnitType());
        cadOption.put("metric", true);
        //cadOption.put("metric", false);
        cadOption.put("coefficient", (double)1.0);

        DefineUnitSystem(cadOption);

        boolean currentUnitIsMetric = (boolean)cadOption.get("metric");
        double currentUnitCoefficient = (double)cadOption.get("coefficient");

        System.out.println("convertAsposeCadTOJava currentUnitIsMetric x currentUnitCoefficient=[" + (boolean)cadOption.get("metric") + "], [" + (double)cadOption.get("coefficient") + "]");

        if (currentUnitIsMetric){
            double metersCoeff = 1 / 1000.0;
            double scaleFactor = metersCoeff / currentUnitCoefficient;

            System.out.println("convertAsposeCadTOJava scaleFactor =[" + scaleFactor + "]");

            if(cadHeight < cadWidth) {
                rasterizationOptions.setPageWidth((float) (297 * scaleFactor));
                rasterizationOptions.setPageHeight((float) (210 * scaleFactor));
            }else {
                rasterizationOptions.setPageWidth((float) (210 * scaleFactor));
                rasterizationOptions.setPageHeight((float) (297 * scaleFactor));
            }
            rasterizationOptions.setUnitType(UnitType.Millimeter);

        }else{

            System.out.println("convertAsposeCadTOJava currentUnitCoefficient =[" + currentUnitCoefficient + "]");

            if(cadHeight < cadWidth) {
                rasterizationOptions.setPageWidth((float) (11.69f / currentUnitCoefficient));
                rasterizationOptions.setPageHeight((float) (8.27f / currentUnitCoefficient));
            }else{
                rasterizationOptions.setPageWidth((float)(8.27f / currentUnitCoefficient));
                rasterizationOptions.setPageHeight((float)(11.69f / currentUnitCoefficient));
            }
            rasterizationOptions.setUnitType(UnitType.Inch);
        }

        rasterizationOptions.setAutomaticLayoutsScaling(true);
        rasterizationOptions.setNoScaling(false);
        rasterizationOptions.setDrawType(CadDrawTypeMode.UseObjectColor);

        PdfOptions pdfOptions = new PdfOptions();
        pdfOptions.setVectorRasterizationOptions(rasterizationOptions);

        rasterizationOptions.getGraphicsOptions().setSmoothingMode(SmoothingMode.HighQuality);
        rasterizationOptions.getGraphicsOptions().setTextRenderingHint(TextRenderingHint.AntiAliasGridFit);
        rasterizationOptions.getGraphicsOptions().setInterpolationMode(InterpolationMode.HighQualityBicubic);

        cadImage.save(convertFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + "_aspos.pdf", pdfOptions);

        // export to raster
        //A4 size at 300 DPI - 2480 x 3508
        if(cadHeight < cadWidth) {
            rasterizationOptions.setPageWidth(3508);
            rasterizationOptions.setPageHeight(2480);
        }else{
            rasterizationOptions.setPageWidth(2480);
            rasterizationOptions.setPageHeight(3508);
        }
        rasterizationOptions.setContentAsBitmap(true);

        PngOptions pngOptions = new PngOptions();
        pngOptions.setVectorRasterizationOptions(rasterizationOptions);

        cadImage.save(convertFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + "_aspos.png", pngOptions);

    }

    private static void DefineUnitSystem(HashMap<String, Object> cadOption)
    {
        int unitType = (int)cadOption.get("unitType");
        boolean isMetric = (boolean)cadOption.get("metric");
        double coefficient = (double)cadOption.get("coefficient");

        switch (unitType)
        {
            case UnitType.Parsec:
                coefficient = 3.0857 * 10000000000000000.0;
                isMetric = true;
                break;
            case UnitType.LightYear:
                coefficient = 9.4607 * 1000000000000000.0;
                isMetric = true;
                break;
            case UnitType.AstronomicalUnit:
                coefficient = 1.4960 * 100000000000.0;
                isMetric = true;
                break;
            case UnitType.Gigameter:
                coefficient = 1000000000.0;
                isMetric = true;
                break;
            case UnitType.Kilometer:
                coefficient = 1000.0;
                isMetric = true;
                break;
            case UnitType.Decameter:
                isMetric = true;
                coefficient = 10.0;
                break;
            case UnitType.Hectometer:
                isMetric = true;
                coefficient = 100.0;
                break;
            case UnitType.Meter:
                isMetric = true;
                coefficient = 1.0;
                break;
            case UnitType.Centimenter:
                isMetric = true;
                coefficient = 0.01;
                break;
            case UnitType.Decimeter:
                isMetric = true;
                coefficient = 0.1;
                break;
            case UnitType.Millimeter:
                isMetric = true;
                coefficient = 0.001;
                break;
            case UnitType.Micrometer:
                isMetric = true;
                coefficient = 0.000001;
                break;
            case UnitType.Nanometer:
                isMetric = true;
                coefficient = 0.000000001;
                break;
            case UnitType.Angstrom:
                isMetric = true;
                coefficient = 0.0000000001;
                break;
            case UnitType.Inch:
                coefficient = 1.0;
                break;
            case UnitType.MicroInch:
                coefficient = 0.000001;
                break;
            case UnitType.Mil:
                coefficient = 0.001;
                break;
            case UnitType.Foot:
                coefficient = 12.0;
                break;
            case UnitType.Yard:
                coefficient = 36.0;
                break;
            case UnitType.Mile:
                coefficient = 63360.0;
                break;
        }
        cadOption.put("metric", isMetric);
        cadOption.put("coefficient", coefficient);
    }

    public static void main(String[] args){
        try{

            File file = new File("D:/Project/workspace-jmes/TEST_DXF/D107-50494A_000_Work.dxf");
            cadfile_converter(file, "convert");

        }catch(Exception exception){
            exception.printStackTrace();
        }

    }

}
