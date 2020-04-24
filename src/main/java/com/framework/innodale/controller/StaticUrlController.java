package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

@Controller
public class StaticUrlController {

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private Environment environment;

    @Autowired
    ServletContext context;

    @RequestMapping(value = "/imageviewer")
    public String imageViewerController(Model model, HttpServletRequest request, HttpServletResponse response)  throws Exception{
        return "/common/image_viewer";
    }

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

    @RequestMapping(value = "/image/{gfileSeq}")
    public ModelAndView imageFileView(@PathVariable("gfileSeq") String GFILE_SEQ, HttpServletRequest req, HttpServletResponse res) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        HashMap<String, Object> fileInfo = new HashMap<String, Object>();
        fileInfo.put("GFILE_SEQ", GFILE_SEQ);
        fileInfo.put("queryId", "common.selectGfileFileImageInfo");
        modelAndView.setViewName("imageView");
        modelAndView.addObject("imageInfo", innodaleService.getInfo(fileInfo));
//        modelAndView.addObject("blank_image", environment.getRequiredProperty(CommonUtility.getServerType() + ".blank.image.path"));
        String rootPath = req.getSession().getServletContext().getRealPath("/");

        modelAndView.addObject("blank_image", rootPath + File.separator + "resource" + File.separator + "main" + File.separator + "blank.jpg");

        return modelAndView;
    }
}
