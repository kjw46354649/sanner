package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.FileUploadService;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
public class FileUploadController {

    @Autowired
    private FileUploadService fileUploadService;

    /**
     *
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadNormalFile")
    public String uploadNormalFiles(Model model, MultipartHttpServletRequest request) throws Exception {

        model.addAttribute("result", "false");
        model.addAttribute("message", "처리 할수 없는 파일 형식 입니다.");

        fileUploadService.createFileUpload(request, model);

        return "jsonView";
    }

    @RequestMapping(value = "/uploadFileEditor")
    public ModelAndView showImage(Model model, MultipartHttpServletRequest request, HttpServletResponse resp) throws Exception {
        PrintWriter printWriter = null;
        JsonObject json = new JsonObject();
        model.addAttribute("result", "false");
        model.addAttribute("message", "처리 할수 없는 파일 형식 입니다.");

        fileUploadService.createFileUpload(request, model);

        ArrayList<HashMap<String, Object>> resultList = (ArrayList<HashMap<String, Object>>)model.getAttribute("fileUploadList");
        int index = 0;
        String imgPath = null;
        for(HashMap<String, Object> obj : resultList) {
            imgPath = "/image/" + obj.get("GFILE_SEQ");
        }

        ModelAndView mv = new ModelAndView("jsonView");
        try {
            json.addProperty("url",imgPath);
            json.addProperty("uploaded",1);
            json.addProperty("fileName","");
            printWriter = resp.getWriter();
            printWriter.println(json);
//            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('1', '"+imgPath+ "', '업로드 완료')</script>");
            printWriter.flush();
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(printWriter != null) { printWriter.close(); }
        }

        mv.addObject("uploaded", true);
        mv.addObject("url", imgPath);
        return mv;
    }


    /**
     * 견적 파일 업로드만 처리 하고 등록된 내용중에 리스트를 조회한다.
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadEstimateCadFiles")
    public String uploadEstimateCadFiles(Model model, MultipartHttpServletRequest request) throws Exception {

        model.addAttribute("result", "false");
        model.addAttribute("message", "처리 할수 없는 파일 형식 입니다.");
        model.addAttribute("queryId", "estimate.selectEstimateCadFiles");

//        fileUploadService.uploadDxfCadFiles(request, model);
        fileUploadService.uploadDxfAndPdfCadFiles(request, model);

        return "jsonView";
    }

    /**
     * 주문 파일 리버전 처리시 선택한 주문관리번호를 먼저 저장처리
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/controlCadRevPrev")
    public String controlCadRevPrev(Model model, HttpServletRequest request) throws Exception {

        Map<String, Object> map = CommonUtility.getParameterMap(request);
        model.addAttribute("workKey", fileUploadService.controlCadRevPrev(map));

        return "jsonView";
    }

    /**
     * 주문 파일 업로드만 처리 하고 등록된 내용중에 리스트를 조회한다.
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadControlCadFiles")
    public String uploadControlCadFiles(Model model, MultipartHttpServletRequest request) throws Exception {

        model.addAttribute("result", "false");
        model.addAttribute("message", "처리 할수 없는 파일 형식 입니다.");

        fileUploadService.uploadDxfAndPdfCadFilesControlOrder(request, model);

        return "jsonView";
    }

    /**
     * 재고 관리 파일 업로드만 처리 하고 등록된 내용중에 리스트를 조회한다.
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadInsideStockCadFiles")
    public String uploadInsideStockCadFiles(Model model, MultipartHttpServletRequest request) throws Exception {

        model.addAttribute("result", "false");
        model.addAttribute("message", "처리 할수 없는 파일 형식 입니다.");

//        fileUploadService.uploadDxfCadFiles(request, model);
        fileUploadService.uploadDxfAndPdfCadFiles(request, model);

        return "jsonView";
    }
}
