package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

@Controller
public class StaticUrlController {

    @Autowired
    private InnodaleService innodaleService;

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
     * 도면의 경우 용량 적은 내용을 표시 한다.
     * @param GFILE_SEQ
     * @param req
     * @param res
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/qimage/{gfileSeq}")
    public ModelAndView quickImageFileView(@PathVariable("gfileSeq") String GFILE_SEQ, HttpServletRequest req, HttpServletResponse res) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        HashMap<String, Object> fileInfo = new HashMap<String, Object>();
        fileInfo.put("GFILE_SEQ", GFILE_SEQ);
        fileInfo.put("queryId", "common.selectQuickGfileFileImageInfo");

        modelAndView.addObject("imageInfo", innodaleService.getInfo(fileInfo));
        String rootPath = req.getSession().getServletContext().getRealPath("/");

        modelAndView.setViewName("imageView");
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
     * @param FILE_SEQ
     * @param req
     * @param res
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/downloadfile/{gfileSeq}")
    public ModelAndView downloadFileView(@PathVariable("gfileSeq") String FILE_SEQ, HttpServletRequest req, HttpServletResponse res) throws Exception {

        ModelAndView modelAndView = new ModelAndView();

        HashMap<String, Object> fileInfo = new HashMap<String, Object>();
        fileInfo.put("FILE_SEQ", FILE_SEQ);
        fileInfo.put("queryId", "common.selectFileSingleInfo");
        modelAndView.setViewName("fileDownloadView");
        modelAndView.addObject("fileInfo", innodaleService.getInfo(fileInfo));

        return modelAndView;
    }

    /**
     * 신규 주문등록
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/newOrderRegistration")
    public String newOrderRegistrationController(Model model, HttpServletRequest request, HttpServletResponse response)  throws Exception{
        return "/common/register_control";
    }

    /**
     * 거래 명세표
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/transactionStatement")
    public String transactionStatementController(Model model, HttpServletRequest request, HttpServletResponse response)  throws Exception{
        return "/common/transaction_statement";
    }

    /**
     * 월 마감 진행
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/controlMonthClose")
    public String controlMonthCloseController(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/common/control_month_close";
    }

    /**
     * 주문상세 List
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/controlDetail")
    public String controlDetailController(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/common/control_detail";
    }

    /**
     * 월간 상세현황 상세 List
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/monthReportDetail")
    public String monthReportDetailController(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/common/month_report_detail";
    }

    /**
     * 월간 상세현황 상세 List
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/monthReportInspectionDetail")
    public String monthReportInspectionDetailController(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/common/month_report_inspection_detail";
    }

    /**
     * 외주현황 상세 List
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/outsideDetail")
    public String outsideDetailController(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/common/outside_detail";
    }

    /**
     * CAM 작업업 상세 List
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/camWorkDetail")
    public ModelAndView camWorkDetailView(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("/common/cam_work_detail");
        mav.addObject("controlSeq", map.get("controlSeq"));
        mav.addObject("controlDetailSeq", map.get("controlDetailSeq"));

        return mav;
    }
}
