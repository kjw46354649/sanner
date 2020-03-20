package com.framework.innodale.component;

import com.aspose.cad.Image;
import com.aspose.cad.InterpolationMode;
import com.aspose.cad.SmoothingMode;
import com.aspose.cad.TextRenderingHint;
import com.aspose.cad.imageoptions.CadRasterizationOptions;
import com.aspose.cad.imageoptions.PdfOptions;
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

        String sourceFilePath = orginalFile.getAbsolutePath();
        String targetFilePath = sourceFilePath + File.pathSeparatorChar + "convert";
        String fileName = new String(orginalFile.getName().getBytes("x-windows-949"), "ksc5601");

        // 1. cad file(dwg, dxf) to normal cad2010 converter
        cadfile_to_dxf2010(sourceFilePath, targetFilePath, fileName);

        String convertFileName = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase() + ".DXF";

        // 2. cad file converter to pdf converter
        // cadfile_to_pdf(orginalFile);

        // 3. cad file converter to image converter
        // cadfile_to_image(orginalFile);

    }

    /**
     * CAD FILE TO DXF2010 VERSION CONVERT
     * @param orginalFile
     * @throws IOException
     * @throws InterruptedException
     */
    public static String  cadfile_to_dxf2010(String orginalFile, String targetFilePath, String fileName) throws IOException, InterruptedException {
        int result = commandExecuteUtil.execCommand(CMD_TO_NORMAL_DFX2010_WIN_EXE, orginalFile, targetFilePath, "DXF", "0", "1", fileName);
        return targetFilePath;
    }

    public static void cadfile_to_pdf(File orginalFile) throws UnsupportedEncodingException {

        String sourceFilePath = orginalFile.getAbsolutePath();
        String soruceFileName = new String(orginalFile.getName().getBytes("x-windows-949"), "ksc5601");

        Image cadImage = Image.load(sourceFilePath);

        // Create an instance of CadRasterizationOptions class
        CadRasterizationOptions rasterizationOptions = new CadRasterizationOptions();
        rasterizationOptions.setPageWidth(1600);
        rasterizationOptions.setPageHeight(1600);

        // Set the Entities type property to Entities3D.
        rasterizationOptions.setAutomaticLayoutsScaling(true);
        rasterizationOptions.setNoScaling (false);
        // rasterizationOptions.setScaleMethod(ScaleType.GrowToFit);
        rasterizationOptions.setContentAsBitmap(true);

        // Set Layouts
        rasterizationOptions.setLayouts(new String[] {"Model"});

        // Create an instance of PDF options class
        PdfOptions pdfOptions = new PdfOptions();
        pdfOptions.setVectorRasterizationOptions(rasterizationOptions);

        // Set Graphics options
        rasterizationOptions.getGraphicsOptions().setSmoothingMode(SmoothingMode.HighQuality);
        rasterizationOptions.getGraphicsOptions().setTextRenderingHint(TextRenderingHint.AntiAliasGridFit);
        rasterizationOptions.getGraphicsOptions().setInterpolationMode(InterpolationMode.HighQualityBicubic);

        // Export to PDF by calling the Save method
        cadImage.save(sourceFilePath + "/" + soruceFileName + ".pdf", pdfOptions);
    }

    public static void cadfile_to_image(File orginalFile) throws UnsupportedEncodingException {

//        String sourceFilePath = orginalFile.getAbsolutePath();
//        String soruceFileName = new String(orginalFile.getName().getBytes("x-windows-949"), "ksc5601");
//
//        PDDocument document = PDDocument.load(new File(dxfFileFullPath));
//        PDFRenderer pdfRenderer = new PDFRenderer(document);
//
//        System.out.println( "전체페이지 수 : " + document.getNumberOfPages() );
//        BufferedImage bim = pdfRenderer.renderImageWithDPI( 0, 100, ImageType.RGB );
//        // suffix in filename will be used as the file format
//        ImageIOUtil.writeImage( bim, outDir + "/" + fileName + ".png", 100 );
//        document.close();
    }

    public static void main(String[] args){
        try{

            File file = new File("D:/Project/workspace-jmes/src/test/resources/test/[D107-77540A] M plate-topJig.dxf");

            cadfile_converter(file);

        }catch(Exception exception){
            exception.printStackTrace();
        }

    }

}
