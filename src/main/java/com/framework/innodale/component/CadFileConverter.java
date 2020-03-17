package com.framework.innodale.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component(value = "cadFileConverter")
public class CadFileConverter {

    @Autowired
    private CommandExecuteUtil commandExecuteUtil;

    public static void cadfile_converter() {

        // 1. cad file(dwg, dxf) cad2010 converter
        cadfile_to_dxf2010();

        // 2. cad file converter to pdf converter
        cadfile_to_pdf();

        // 3. cad file converter to image converter
        cadfile_to_image();
    }

    public static void cadfile_to_dxf2010() {

        // 1. cad file(dwg, dxf) cad2010 converter

    }

    public static void cadfile_to_pdf() {

        // 1. cad file(dwg, dxf) cad2010 converter

        // 2. cad file converter to pdf converter

        // 3. cad file converter to image converter
    }

    public static void cadfile_to_image() {

        // 1. cad file(dwg, dxf) cad2010 converter

        // 2. cad file converter to pdf converter

        // 3. cad file converter to image converter
    }

}
