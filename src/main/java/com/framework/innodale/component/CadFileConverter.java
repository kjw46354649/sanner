package com.framework.innodale.component;

import com.aspose.cad.Image;
import com.aspose.cad.InterpolationMode;
import com.aspose.cad.SmoothingMode;
import com.aspose.cad.TextRenderingHint;
import com.aspose.cad.fileformats.cad.CadDrawTypeMode;
import com.aspose.cad.fileformats.cad.CadImage;
import com.aspose.cad.fileformats.cad.cadconsts.CadEntityTypeName;
import com.aspose.cad.fileformats.cad.cadconsts.CadPlotStandardScaleType;
import com.aspose.cad.fileformats.cad.cadobjects.CadBaseEntity;
import com.aspose.cad.imageoptions.*;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Component(value = "cadFileConverter")
public class CadFileConverter {

    private static String CMD_TO_NORMAL_DFX2010_WIN_EXE = "D:/ODAFileConverter/ODAFileConverter.exe";
    private static String CMD_TO_NORMAL_DFX2010_LINUX_EXE = "ODAFileConverter";
    private static CommandExecuteUtil commandExecuteUtil;

    @Autowired
    private Environment environment;

//    @Autowired
//    private CommandExecuteUtil commandExecuteUtil;

    public static void cadfile_converter(File orginalFile) throws IOException, InterruptedException {

        String sourceFilePath = orginalFile.getParentFile().toString();
        String targetFilePath = sourceFilePath + File.separator + "convert";
        String fileName = new String(orginalFile.getName().getBytes("x-windows-949"), "ksc5601");

        // 1. cad file(dwg, dxf) to normal cad2010 converter
        cadfile_to_dxf2010(sourceFilePath, targetFilePath, fileName);
        String convertFileName = targetFilePath + File.separator + fileName.substring(0, fileName.lastIndexOf(".")) + ".dwg";

        // 2. cad file converter to pdf converter
        cadfile_to_pdf_png(orginalFile);
    }

    /**
     * CAD FILE TO DXF2010 VERSION CONVERT
     * @param orginalFile
     * @throws IOException
     * @throws InterruptedException
     */
    public static String  cadfile_to_dxf2010(String orginalFile, String targetFilePath, String fileName) throws IOException, InterruptedException {
        int result = CommandExecuteUtil.execCommand(CMD_TO_NORMAL_DFX2010_WIN_EXE, orginalFile, targetFilePath, "ACAD2010", "DWG", "0", "1", fileName);
        return targetFilePath;
    }

    /**
     * AUTO CAD 2010 TO PDF AND PNG IMAGE
     * @param orginalFile
     * @throws UnsupportedEncodingException
     */
    public static void cadfile_to_pdf_png(File orginalFile) throws UnsupportedEncodingException {

        String sourceFilePath = orginalFile.getAbsolutePath();
        String soruceFileName = new String(orginalFile.getName().getBytes("x-windows-949"), "ksc5601");

        Image cadImage = Image.load(sourceFilePath);

        int cadWidth = cadImage.getSize().getWidth();
        int cadHeight = cadImage.getSize().getHeight();

        CadRasterizationOptions rasterizationOptions = new CadRasterizationOptions();

        rasterizationOptions.setLayouts(new String[] {"Model"});

        HashMap<String, Object> cadOption = new HashMap<String, Object>();
        cadOption.put("unitType", cadImage.getUnitType());
        cadOption.put("metric", false);
        cadOption.put("coefficient", 1.0);

        DefineUnitSystem(cadOption);

        boolean currentUnitIsMetric = (boolean)cadOption.get("metric");
        double currentUnitCoefficient = (double)cadOption.get("coefficient");

        if (currentUnitIsMetric){
            double metersCoeff = 1 / 1000.0;
            double scaleFactor = metersCoeff / currentUnitCoefficient;

            if(cadHeight < cadWidth) {
                rasterizationOptions.setPageWidth((float) (297 * scaleFactor));
                rasterizationOptions.setPageHeight((float) (210 * scaleFactor));
            }else {
                rasterizationOptions.setPageWidth((float) (210 * scaleFactor));
                rasterizationOptions.setPageHeight((float) (297 * scaleFactor));
            }
            rasterizationOptions.setUnitType(UnitType.Millimeter);

        }else{
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
        rasterizationOptions.setNoScaling(true);
        rasterizationOptions.setDrawType(CadDrawTypeMode.UseObjectColor);

        PdfOptions pdfOptions = new PdfOptions();
        pdfOptions.setVectorRasterizationOptions(rasterizationOptions);

        rasterizationOptions.getGraphicsOptions().setSmoothingMode(SmoothingMode.HighQuality);
        rasterizationOptions.getGraphicsOptions().setTextRenderingHint(TextRenderingHint.AntiAliasGridFit);
        rasterizationOptions.getGraphicsOptions().setInterpolationMode(InterpolationMode.HighQualityBicubic);

        cadImage.save(orginalFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + ".pdf", pdfOptions);

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

        cadImage.save(orginalFile.getParentFile().toString() + File.separator + soruceFileName.substring(0, soruceFileName.lastIndexOf(".")) + ".png", pngOptions);

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

            File file = new File("D:/Project/workspace-jmes/src/test/resources/test/D107-78417A.dxf");
            String fileName = file.getName();

            cadfile_converter(file);

        }catch(Exception exception){
            exception.printStackTrace();
        }

    }

}
