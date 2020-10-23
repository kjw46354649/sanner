package com.framework.innodale.controller;

import com.framework.innodale.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

    /**
     *
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadControlCadFilesTesting")
    public String uploadControlCadFilesTesting(Model model, MultipartHttpServletRequest request) throws Exception {

        model.addAttribute("result", "false");
        model.addAttribute("message", "처리 할수 없는 파일 형식 입니다.");

        fileUploadService.uploadControlCadFilesTesting(request, model);

        return "jsonView";
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

//        fileUploadService.uploadDxfCadFiles(request, model);
        // fileUploadService.uploadDxfAndPdfCadFiles(request, model);
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
