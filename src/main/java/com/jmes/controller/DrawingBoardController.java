package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.entity.ActionType;
import com.framework.innodale.entity.MessageType;
import com.framework.innodale.entity.NotificationMessage;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.DrawingBoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
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

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    /**
     * Json List
     */
    @RequestMapping(value = "/drawing-json-list")
    public String jsonList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        model.addAttribute("list", this.innodaleService.getList(hashMap));
        return "jsonView";
    }

    /**
     * Json Info
     */
    @RequestMapping(value = "/drawing-json-info")
    public String jsonInfo(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        model.addAttribute("info", this.innodaleService.getInfo(hashMap));
        return "jsonView";
    }

    /**
     * Json update
     */
    @RequestMapping(value = "/drawing-json-update")
    public String drawingJsonUpdate(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        innodaleService.update(hashMap);
        return "jsonView";
    }

    /**
     * Json delete
     */
    @RequestMapping(value = "/drawing-json-delete")
    public String drawingJsonDelete(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        innodaleService.remove(hashMap);
        return "jsonView";
    }

    /**
     * Json create
     */
    @RequestMapping(value = "/drawing-json-create")
    public String drawingJsonCreate(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        innodaleService.create(hashMap);
        return "jsonView";
    }


    /**
     * Drawing barcode Info
     */
    @RequestMapping(value = "/drawing/barcode")
    public String drawingBarcodeInfo(Model model, HttpServletRequest request, HttpSession session) throws Exception {

        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        Map<String, Object> controlPartInfo = innodaleService.getInfo(hashMap);

        if(controlPartInfo == null){
            model.addAttribute("returnCode", "RET99");
            model.addAttribute("message", "사무실에 확인 바랍니다. (Contact Admin Please)"); // 정보가 없는 경우
        }else{

            /** 추가 되어야 할 데이터 **/
            String chkPop = (String) controlPartInfo.get("CHE_POP");      // pop 선작업이 필요한 경우
            String chkPro002 = (String) controlPartInfo.get("CHE_PRO002");   // NULL 이 아닌경우 가공 확정 이후 DRAWING 작업 가능
            String chkVer = (String) controlPartInfo.get("CHE_VER");      // 최선 바코드 정보와 스캔 바코드의 DRAWING_NUM 가 다른경우
            String chkDelYn = (String) controlPartInfo.get("CHE_DEL_YN");   // 주문 정보가 삭제된 경우
            String chkCancelYn = (String) controlPartInfo.get("CHE_CANCEL_YN");// 주문 취소가 된 경우
            String chkHoldYn = (String) controlPartInfo.get("CHE_HOLD_YN");// 주문 보류 된 경우

            String controlInfo = (String) controlPartInfo.get("CONTROL_INFO"); // 일자
            // System.out.println(controlInfo);

            if("X".equals(chkDelYn)){
                model.addAttribute("returnCode", "RET99");
                model.addAttribute("message", controlInfo.replaceAll("DEL_", "") + " 삭제된 주문입니다. (Order Deleted.)"); // 삭제 처리 주문
            }else if("X".equals(chkCancelYn)){
                model.addAttribute("returnCode", "RET99");
                model.addAttribute("message", controlInfo + " 취소 주문입니다. (Order Canceled.)"); // 주문 취소 상태
            }else if("X".equals(chkVer)){
                model.addAttribute("returnCode", "RET97");
                model.addAttribute("message", controlInfo + " Error, Check the Drawing Please."); // 도면 번호가 다른 경우 처리
            }else if("X".equals(chkPro002)){
                model.addAttribute("returnCode", "RET98");
                model.addAttribute("message", controlInfo + " 가공 미확정 상태, 사무실에 확인 바랍니다. (Contact Admin Please)"); // 외주 가공 이외의 경우는 가공 확정 상태가 없는 경우 처리
            }else if("X".equals(chkPop)) {
                model.addAttribute("returnCode", "RET99");
                model.addAttribute("message", controlInfo + " POP를 먼저 찍어 주세요. (Scan POP First)"); // 현재와 같은 Location 스캔 처리
            }else if("X".equals(chkHoldYn)) {
                model.addAttribute("info", controlPartInfo);
                model.addAttribute("returnCode", "RET96");
                model.addAttribute("message", controlInfo + "<br><br>현재 <span style=\"color: red;\">'보류'</span>상태입니다.<br>계속 진행하시겠습니까?");
            }else {
                model.addAttribute("info", controlPartInfo);
                model.addAttribute("returnCode", "RET00");
            }
        }

        return "jsonView";
    }

    @RequestMapping(value="/drawing/{equipNm}")
    public String drawingTargetEquip(@PathVariable("equipNm") String equipNm, HttpServletRequest request, HttpSession session) throws Exception {
        logger.info("pop page submit");

        Map<String, Object> hashMap = new HashMap<String, Object>();
        HashMap<String, Object> drawingInfo = new HashMap<String, Object>();

        /** 장비 조회 **/
        hashMap.put("EQUIP_NM", equipNm);
        hashMap.put("queryId", "drawingMapper.selectDrawingEquipmentInfo");
        Map<String, Object> searchMachineInfo = this.innodaleService.getInfo(hashMap);

        /** 장비 선택 정보 **/
        HashMap<String, Object> machineInfo = new HashMap<String, Object>();

        machineInfo.put("EQUIP_SEQ", searchMachineInfo.get("EQUIP_SEQ"));
        machineInfo.put("EQUIP_NM", searchMachineInfo.get("EQUIP_NM"));
        machineInfo.put("FACTORY_AREA", searchMachineInfo.get("FACTORY_AREA"));
        machineInfo.put("IF_USE_YN", searchMachineInfo.get("IF_USE_YN"));

        drawingInfo.put("machineInfo", machineInfo);

        String searchUserId = String.valueOf(searchMachineInfo.get("USER_ID"));

        if(searchMachineInfo.get("USER_ID") == null || "".equals(searchMachineInfo.get("USER_ID"))){

            WebUtils.setSessionAttribute(request, "drawingInfo", drawingInfo);
            session.setMaxInactiveInterval(-1);

            return "redirect:/drawing-worker";

        }else{

            HashMap<String, Object> userInfo = new HashMap<String, Object>();

            userInfo.put("USER_ID", searchMachineInfo.get("USER_ID"));
            userInfo.put("USER_NM", searchMachineInfo.get("USER_NM"));
            userInfo.put("USER_GFILE_SEQ", searchMachineInfo.get("PHOTO_GFILE_SEQ"));

            /** 최종 Session 에 저장되는 정보 **/
            drawingInfo.put("userInfo", userInfo);

            WebUtils.setSessionAttribute(request, "drawingInfo", drawingInfo);
            session.setMaxInactiveInterval(-1);

            return "redirect:/drawing-board";
        }
    }

    @RequestMapping(value="/drawing")
    public String drawingLogin(Model model, HttpSession session, HttpServletRequest request) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        hashMap.put("queryId", "drawingMapper.selectDrawingAreaList");
        List<Map<String, Object>> areaList = this.innodaleService.getList(hashMap);
        model.addAttribute("areaList", areaList);

        if(areaList.size() > 0){
            HashMap<String, Object> areaInfo = (HashMap)areaList.get(0);
            hashMap.put("FACTORY_AREA", areaInfo.get("CODE_CD"));

            model.addAttribute("FACTORY_AREA", areaInfo.get("CODE_CD"));
        }

        if(drawingInfo != null){
            /** 장비 선택 정보 **/
            HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");

            model.addAttribute("EQUIP_SEQ", machineInfo.get("EQUIP_SEQ"));
            model.addAttribute("FACTORY_AREA", machineInfo.get("FACTORY_AREA"));
            System.out.println("machineInfo >>>>>>>>>>>>>> 2 >> " + machineInfo.toString());

            hashMap.put("FACTORY_AREA", machineInfo.get("FACTORY_AREA"));
        }

        /** 장비 리스트를 조회한다. */
        hashMap.put("queryId", "drawingMapper.selectDrawingEquipment");
        model.addAttribute("equipList", this.innodaleService.getList(hashMap));

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
        /** 장비 선택 정보 **/
        HashMap<String, Object> machineInfo = new HashMap<String, Object>();

        /** 사용자 선택에서 장비 정보가 없고 세션 정보도 없는 경우 장비 선택 화면으로 이동 **/
        if(session.getAttribute("drawingInfo") == null && (!hashMap.containsKey("EQUIP_SEQ") || "".equals(hashMap.get("EQUIP_SEQ")))){
            return "redirect:/drawing";
        }

        HashMap<String, Object> drawingInfo = new HashMap<String, Object>();


        if(hashMap.containsKey("EQUIP_SEQ") && !"".equals(hashMap.get("EQUIP_SEQ"))) {

            machineInfo.put("EQUIP_SEQ", hashMap.get("EQUIP_SEQ"));
            machineInfo.put("EQUIP_NM", hashMap.get("EQUIP_NM"));
            machineInfo.put("FACTORY_AREA", hashMap.get("FACTORY_AREA"));
            machineInfo.put("IF_USE_YN", hashMap.get("IF_USE_YN"));

            /** 최종 Session 에 저장되는 정보 **/
            drawingInfo.put("machineInfo", machineInfo);

        }else{
            drawingInfo = (HashMap<String, Object>)WebUtils.getSessionAttribute(request, "drawingInfo");
            machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        }

        /** 사용자 정보가 있는 경우 장비의 사용자 정보를 로그아웃 처리 한다. **/
        if(hashMap.containsKey("USER_ID") && !"".equals(hashMap.get("USER_ID"))) {
            hashMap.put("queryId", "drawingMapper.updateRemoveEquipmentWorker");
            this.innodaleService.update(hashMap);

            /** 로그인 정보를 알람 처리한다. **/
            HashMap<String, Object> alarmHashMap = new HashMap<String, Object>();
            alarmHashMap.put("USER_ID", hashMap.get("USER_ID"));
            alarmHashMap.put("EQUIP_SEQ", machineInfo.get("EQUIP_SEQ"));
            simpMessagingTemplate.convertAndSend("/topic/worker", getNotificationUserMessage(alarmHashMap, ActionType.WK_LOGOUT));

            session.removeAttribute("userInfo");
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
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(session.getAttribute("drawingInfo"));

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

            /** 장비 로그인 사용자 정보를 업데이트 한다. **/
            machineInfo.put("USER_ID", userInfo.get("USER_ID"));
            machineInfo.put("queryId", "drawingMapper.updateEquipmentWorker");
            innodaleService.update(machineInfo);

            /** 로그인 정보를 알람 처리한다. **/
            HashMap<String, Object> alarmHashMap = new HashMap<String, Object>();
            alarmHashMap.put("USER_ID", userInfo.get("USER_ID"));
            alarmHashMap.put("EQUIP_SEQ", machineInfo.get("EQUIP_SEQ"));
            simpMessagingTemplate.convertAndSend("/topic/worker", getNotificationUserMessage(alarmHashMap, ActionType.WK_LOGIN));

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

        if(hashMap.containsKey("RE_BARCODE_NUM") && !"".equals(hashMap.get("RE_BARCODE_NUM"))){

            hashMap.put("BARCODE_NUM", hashMap.get("RE_BARCODE_NUM"));
            hashMap.put("queryId", "drawingMapper.selectDrawingBarcodeScanInfo");
            model.addAttribute("reStartWorkinfo", this.innodaleService.getInfo(hashMap));
        }

        return "board/drawing-board";
    }

    /** 신규 작업을 시작한 경우 **/
    @RequestMapping(value="/drawing-board-start",  method= RequestMethod.POST)
    public String drawingBoardStart(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardStart(hashMap);

        HashMap<String, Object> alarmHashMap = new HashMap<String, Object>();
        alarmHashMap.put("CONTROL_SEQ", hashMap.get("CONTROL_SEQ"));
        alarmHashMap.put("CONTROL_DETAIL_SEQ", hashMap.get("CONTROL_DETAIL_SEQ"));
        alarmHashMap.put("EQUIP_SEQ", machineInfo.get("EQUIP_SEQ"));
        simpMessagingTemplate.convertAndSend("/topic/drawing", getNotificationMessage(alarmHashMap, ActionType.DB_START, "가공시작"));

        return "jsonView";
    }

    /** 신규 작업을 임시 정지 한 경우 **/
    @RequestMapping(value="/drawing-board-pause",  method= RequestMethod.POST)
    public String managerDrawingBoardPause(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardPause(hashMap);

        HashMap<String, Object> alarmHashMap = new HashMap<String, Object>();
        alarmHashMap.put("CONTROL_SEQ", hashMap.get("CONTROL_SEQ"));
        alarmHashMap.put("CONTROL_DETAIL_SEQ", hashMap.get("CONTROL_DETAIL_SEQ"));
        alarmHashMap.put("MCT_WORK_SEQ", hashMap.get("MCT_WORK_SEQ"));
        alarmHashMap.put("EQUIP_SEQ", machineInfo.get("EQUIP_SEQ"));
        simpMessagingTemplate.convertAndSend("/topic/drawing", getNotificationMessage(alarmHashMap, ActionType.DB_PAUSE, "일시정지"));

        return "jsonView";
    }

    /** 신규 작업을 임시 정지 후 재 실행 한 경우 **/
    @RequestMapping(value="/drawing-board-restart",  method= RequestMethod.POST)
    public String managerDrawingBoardRestart(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardRestart(hashMap);

        HashMap<String, Object> alarmHashMap = new HashMap<String, Object>();
        alarmHashMap.put("CONTROL_SEQ", hashMap.get("CONTROL_SEQ"));
        alarmHashMap.put("CONTROL_DETAIL_SEQ", hashMap.get("CONTROL_DETAIL_SEQ"));
        alarmHashMap.put("MCT_WORK_SEQ", hashMap.get("MCT_WORK_SEQ"));
        alarmHashMap.put("EQUIP_SEQ", machineInfo.get("EQUIP_SEQ"));
        simpMessagingTemplate.convertAndSend("/topic/drawing", getNotificationMessage(alarmHashMap, ActionType.DB_RESTART, "작업재개"));

        return "jsonView";
    }

    /** 작업을 완료한 경우 **/
    @RequestMapping(value="/drawing-board-complete",  method= RequestMethod.POST)
    public String managerDrawingBoardComplete(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardComplete(hashMap);

        HashMap<String, Object> alarmHashMap = new HashMap<String, Object>();
        alarmHashMap.put("CONTROL_SEQ", hashMap.get("CONTROL_SEQ"));
        alarmHashMap.put("CONTROL_DETAIL_SEQ", hashMap.get("CONTROL_DETAIL_SEQ"));
        alarmHashMap.put("MCT_WORK_SEQ", hashMap.get("MCT_WORK_SEQ"));
        alarmHashMap.put("EQUIP_SEQ", machineInfo.get("EQUIP_SEQ"));
        simpMessagingTemplate.convertAndSend("/topic/drawing", getNotificationMessage(alarmHashMap, ActionType.DB_COMPLETE, "작업완료"));

        return "jsonView";
    }

    /** 작업 취소 경우 **/
    @RequestMapping(value="/drawing-board-cancel",  method= RequestMethod.POST)
    public String managerDrawingBoardCancel(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardCancel(hashMap);

        HashMap<String, Object> alarmHashMap = new HashMap<String, Object>();
        alarmHashMap.put("CONTROL_SEQ", hashMap.get("CONTROL_SEQ"));
        alarmHashMap.put("CONTROL_DETAIL_SEQ", hashMap.get("CONTROL_DETAIL_SEQ"));
        alarmHashMap.put("MCT_WORK_SEQ", hashMap.get("MCT_WORK_SEQ"));
        alarmHashMap.put("EQUIP_SEQ", machineInfo.get("EQUIP_SEQ"));
        simpMessagingTemplate.convertAndSend("/topic/drawing", getNotificationMessage(alarmHashMap, ActionType.DB_CANCEL, "작업취소"));

        return "jsonView";
    }

    /** 불량실적 입력 **/
    @RequestMapping(value="/drawing-error-regist",  method= RequestMethod.POST)
    public String managerDrawingBoardErrorRegist(HttpSession session, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        HashMap<String, Object> drawingInfo = (HashMap<String, Object>)(request.getSession().getAttribute("drawingInfo"));

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)drawingInfo.get("machineInfo");
        HashMap<String, Object> userInfo = (HashMap<String, Object>)drawingInfo.get("userInfo");

        hashMap.put("machineInfo", machineInfo);
        hashMap.put("userInfo", userInfo);

        drawingBoardService.managerDrawingBoardErrorRegist(hashMap);

        return "jsonView";
    }

    private NotificationMessage getNotificationMessage(HashMap<String, Object> hashMap, ActionType actionType, String CONTEXT03) throws Exception{

        hashMap.put("queryId", "common.selectAlarmControlInformation");
        Map<String, Object> alarmInfo = this.innodaleService.getInfo(hashMap);

        NotificationMessage notificationMessage = new NotificationMessage();

        notificationMessage.setType(MessageType.DRAWING);
        notificationMessage.setActionType(actionType);
        notificationMessage.setContent01((String) alarmInfo.get("CONTEXT01"));
        notificationMessage.setContent02((String) alarmInfo.get("CONTEXT02"));
        notificationMessage.setContent03(CONTEXT03);
        notificationMessage.setImageSeq((int) alarmInfo.get("IMG_GFILE_SEQ"));

        getNotificationEquipMessage(notificationMessage, alarmInfo);

        return notificationMessage;
    }

    private NotificationMessage getNotificationUserMessage(HashMap<String, Object> hashMap, ActionType actionType) throws Exception{

        hashMap.put("queryId", "common.selectAlarmUserInformation");
        Map<String, Object> alarmInfo = this.innodaleService.getInfo(hashMap);

        NotificationMessage notificationMessage = new NotificationMessage();

        /** 사용자 정보 셋팅 */
        notificationMessage.setType(MessageType.WORKER);
        notificationMessage.setActionType(actionType);
        notificationMessage.setUserNm((String) alarmInfo.get("USER_NM"));
        notificationMessage.setUserId((String) alarmInfo.get("USER_ID"));
        notificationMessage.setUserImageSeq((alarmInfo.get("PHOTO_GFILE_SEQ") != null)?(int) alarmInfo.get("PHOTO_GFILE_SEQ"):0);

        getNotificationEquipMessage(notificationMessage, alarmInfo);

        return notificationMessage;
    }

    private void getNotificationEquipMessage(NotificationMessage notificationMessage, Map<String, Object> alarmInfo) throws Exception{

        /** 머신 정보 셋팅 **/
        notificationMessage.setContent04((String) alarmInfo.get("EQUIP_NM"));
        notificationMessage.setEquipSeq((int) alarmInfo.get("EQUIP_SEQ"));
        notificationMessage.setEquipId( (String) alarmInfo.get("EQUIP_ID"));
        notificationMessage.setEquipNm( (String) alarmInfo.get("EQUIP_NM"));
        notificationMessage.setEquipCol((int) alarmInfo.get("LAYOUT_COL"));
        notificationMessage.setEquipRow((int) alarmInfo.get("LAYOUT_ROW"));
        notificationMessage.setEquipPosition((int) alarmInfo.get("LAYOUT_SORT"));
        notificationMessage.setFactoryArea((String) alarmInfo.get("FACTORY_AREA"));

        if(alarmInfo.containsKey("WORK_MINUTE")){
            if(alarmInfo.get("WORK_MINUTE") instanceof String){
                notificationMessage.setsMinute(Integer.parseInt((String)alarmInfo.get("WORK_MINUTE")));
            }else if(alarmInfo.get("WORK_MINUTE") instanceof Integer){
                notificationMessage.setsMinute((int)alarmInfo.get("WORK_MINUTE"));
            }
        }
    }

}
