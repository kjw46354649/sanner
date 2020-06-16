package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.DrawingBoardService;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Controller
public class DrawingBoardController {

    private static final Logger logger = LoggerFactory.getLogger(DrawingBoardController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    public DrawingBoardService drawingBoardService;

    /**
     * Json List
     */
    @RequestMapping(value = "/drawing-json-list",  method= RequestMethod.POST)
    public String jsonList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        model.addAttribute("list", this.innodaleService.getList(hashMap));
        return "jsonView";
    }

    /**
     * Json Info
     */
    @RequestMapping(value = "/drawing-json-info",  method=RequestMethod.POST)
    public String jsonInfo(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        model.addAttribute("info", this.innodaleService.getInfo(hashMap));
        return "jsonView";
    }

    @RequestMapping(value="/drawing")
    public String drawingLogin(Model model, HttpSession session, HttpServletRequest request) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        hashMap.put("queryId", "drawingMapper.selectDrawingAreaList");
        model.addAttribute("areaList", this.innodaleService.getList(hashMap));

        /** Session clear **/
        if(session.getAttribute("drawingInfo") != null){
            session.removeAttribute("drawingInfo");
        }
        session.setMaxInactiveInterval(-1);

        return "board/login";
    }

    @RequestMapping(value="/drawing-worker")
    public String drawingWorker(Model model, HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        /** 사용자 선택에서 장비 정보가 없고 세션 정보도 없는 경우 장비 선택 화면으로 이동 **/
        if(session.getAttribute("drawingInfo") == null && (!hashMap.containsKey("EQUIP_SEQ") || "".equals(hashMap.get("EQUIP_SEQ")))){
            return "redirect:/drawing";
        }
        HashMap<String, Object> drawingInfo = new HashMap<String, Object>();

        if(hashMap.containsKey("EQUIP_SEQ") && !"".equals(hashMap.get("EQUIP_SEQ"))) {
            /** 장비 선택 정보 **/
            HashMap<String, Object> machineInfo = new HashMap<String, Object>();

            machineInfo.put("EQUIP_SEQ", hashMap.get("EQUIP_SEQ"));
            machineInfo.put("EQUIP_NM", hashMap.get("EQUIP_NM"));

            /** 최종 Session 에 저장되는 정보 **/
            drawingInfo.put("machineInfo", machineInfo);
        }

        /** Session clear **/
        if(session.getAttribute("drawingInfo") != null){
            session.removeAttribute("drawingInfo");
        }

        session.setAttribute("drawingInfo", drawingInfo);
        session.setMaxInactiveInterval(-1);

        hashMap.put("queryId", "drawingMapper.selectDrawingWorkerGroupList");
        model.addAttribute("workerGroupList", this.innodaleService.getList(hashMap));

        return "board/drawing-worker";
    }

    @RequestMapping(value="/drawing-board")
    public String drawingBoard(Model model, HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        /** Session 정보가 없을 경우 첫 장비 선택 화면으로 이동 **/
        if(drawingInfo == null){
            return "redirect:/drawing";
        }

        /** 장비 선택 정보 **/
        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        if(machineInfo == null){
            return "redirect:/drawing";
        }

        /** 사용자 선택에서 장비 정보가 없을 경우 사용자 선택 화면으로 이동 **/
        if((userInfo == null && (!hashMap.containsKey("USER_ID") || "".equals(hashMap.get("USER_ID"))))){
            return "redirect:/drawing-worker";
        }

        if(hashMap.containsKey("USER_ID") && !"".equals(hashMap.get("USER_ID"))) {
            /** 사용자 조회 화면에서 넘어 온 경우 **/
            userInfo = new HashMap<String, Object>();

            userInfo.put("USER_ID", hashMap.get("USER_ID"));
            userInfo.put("USER_NM", hashMap.get("USER_NM"));
            userInfo.put("USER_GFILE_SEQ", hashMap.get("USER_GFILE_SEQ"));

            /** 최종 Session 에 저장되는 정보 **/
            drawingInfo.put("userInfo", userInfo);
        }

        /** 장비 정보를 기초로 최근 작업정보 **/
        machineInfo.put("queryId", "drawingMapper.selectDrawingBoardLastWork");
        drawingInfo.put("lastWork",innodaleService.getInfo(machineInfo));

        /** 장비 정보를 기초로 진행중인 작업 정보 **/
        machineInfo.put("queryId", "drawingMapper.selectDrawingBoardCurrentWork");
        drawingInfo.put("currentWork",innodaleService.getInfo(machineInfo));

        session.setAttribute("drawingInfo", drawingInfo);

        hashMap.put("queryId", "drawingMapper.selectDrawingErrorReasonList");
        model.addAttribute("errorReasonList", this.innodaleService.getList(hashMap));

        return "board/drawing-board";
    }

    /** 신규 작업을 시작한 경우 **/
    @RequestMapping(value="/drawing-board-start")
    public String drawingBoardStart(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardStart(hashMap);

        return "jsonView";
    }

    /** 신규 작업을 임시 정지 한 경우 **/
    @RequestMapping(value="/drawing-board-pause")
    public String managerDrawingBoardPause(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardPause(hashMap);

        return "jsonView";
    }

    /** 신규 작업을 임시 정지 후 재 실행 한 경우 **/
    @RequestMapping(value="/drawing-board-restart")
    public String managerDrawingBoardRestart(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardRestart(hashMap);

        return "jsonView";
    }

    /** 작업을 완료한 경우 **/
    @RequestMapping(value="/drawing-board-complete")
    public String managerDrawingBoardComplete(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardComplete(hashMap);

        return "jsonView";
    }

    /** 작업 취소 경우 **/
    @RequestMapping(value="/drawing-board-cancel")
    public String managerDrawingBoardCancel(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardCancel(hashMap);

        return "jsonView";
    }

}
