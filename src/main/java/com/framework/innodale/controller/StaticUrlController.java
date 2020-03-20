package com.framework.innodale.controller;

import com.framework.innodale.component.CreateBarcodeStream;
import com.framework.innodale.component.Pagging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class StaticUrlController {

    @RequestMapping(value = "/static/{pathName}/{fileName}")
    public String staticUrlController(Model model, HttpServletRequest request, HttpServletResponse response,
                                      @PathVariable("pathName") String pathName, @PathVariable("fileName") String fileName)  throws Exception{
        return "/pages/" + pathName + "/" + fileName;
    }

    @RequestMapping(value = "/barcode/{codeType}/{barcode}")
    public ModelAndView barcodeUrlController(@PathVariable("codeType") String codeType, @PathVariable("barcode") String barcode) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("barcodeView");
        modelAndView.addObject("codeType", codeType);
        modelAndView.addObject("barcode", barcode);

        return modelAndView;
    }
}
