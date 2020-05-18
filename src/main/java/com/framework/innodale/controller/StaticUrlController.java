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

    /**
     * 업로드 이미지  <IMG ~ 처리
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/imageViewer")
    public String imageViewerController(Model model, HttpServletRequest request, HttpServletResponse response)  throws Exception{
        return "/common/image_viewer";
    }

    /**
     * 사용안함 (x)
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/drawingPrint")
    public String drawingPrintController(Model model, HttpServletRequest request, HttpServletResponse response)  throws Exception{
        return "/common/drawing_print";
    }

    /**
     * 고정 페이지 호출 처리
     * @param model
     * @param request
     * @param response
     * @param pathName
     * @param fileName
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/static/{pathName}/{fileName}")
    public String staticUrlController(Model model, HttpServletRequest request, HttpServletResponse response,
                                      @PathVariable("pathName") String pathName, @PathVariable("fileName") String fileName)  throws Exception{
        return "/pages/" + pathName + "/" + fileName;
    }

    /**
     * 바코드 생성 처리
     * @param codeType
     * @param barcode
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/barcode/{codeType}/{barcode}")
    public ModelAndView barcodeUrlController(@PathVariable("codeType") String codeType, @PathVariable("barcode") String barcode) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("barcodeView");
        modelAndView.addObject("codeType", codeType);
        modelAndView.addObject("barcode", barcode);

        return modelAndView;
    }

    /**
     * 업로드 이미지 처리
     * @param GFILE_SEQ
     * @param req
     * @param res
     * @return
     * @throws Exception
     */
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

    /**
     * 하나의 Gfile로 구성되면 다운로드 처리
     * @param GFILE_SEQ
     * @param req
     * @param res
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/downloadGfile/{gfileSeq}")
    public ModelAndView downloadGFileView(@PathVariable("gfileSeq") String GFILE_SEQ, HttpServletRequest req, HttpServletResponse res) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        HashMap<String, Object> fileInfo = new HashMap<String, Object>();
        fileInfo.put("GFILE_SEQ", GFILE_SEQ);
        fileInfo.put("queryId", "common.selectGfileFileSingleInfo");
        modelAndView.setViewName("fileDownloadView");
        modelAndView.addObject("fileInfo", innodaleService.getInfo(fileInfo));

        return modelAndView;
    }

    /**
     * 하나의 gfile에 여러개의 fileseq로 구성될때 fileSeq로 다운로드 처리
     * @param GFILE_SEQ
     * @param req
     * @param res
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/downloadfile/{gfileSeq}")
    public ModelAndView downloadFileView(@PathVariable("gfileSeq") String GFILE_SEQ, HttpServletRequest req, HttpServletResponse res) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        HashMap<String, Object> fileInfo = new HashMap<String, Object>();
        fileInfo.put("GFILE_SEQ", GFILE_SEQ);
        fileInfo.put("queryId", "common.selectFileSingleInfo");
        modelAndView.setViewName("fileDownloadView");
        modelAndView.addObject("fileInfo", innodaleService.getInfo(fileInfo));

        return modelAndView;
    }
}
