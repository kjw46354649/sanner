package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.entity.MessageType;
import com.framework.innodale.entity.NotificationMessage;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.InspectionService;
import com.jmes.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class InspectionController {

    @Autowired
    public InnodaleService innodaleService;

    @Autowired
    public InspectionService inspectionService;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    /**
     * 검사 등록 처리
     */
    @RequestMapping(value = "/inspectionCreate",  method= RequestMethod.POST)
    public String inspectionCreate(Model model, HttpServletRequest request, HttpSession session) throws Exception{

        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        innodaleService.create(hashMap);

        /** 작업지시번호 확정인 경우 알람 처리 한다. **/
        hashMap.put("queryId", "common.selectAlarmInspectionInformation");
        Map<String, Object> alarmInfo = this.innodaleService.getInfo(hashMap);

        NotificationMessage notificationMessage = new NotificationMessage();

        notificationMessage.setType(MessageType.POP);
        notificationMessage.setContent01((String) alarmInfo.get("CONTEXT01"));
        notificationMessage.setContent02((String) alarmInfo.get("CONTEXT02"));
        notificationMessage.setContent03((String) alarmInfo.get("CONTEXT03"));
        notificationMessage.setContent04((String) alarmInfo.get("CONTEXT04"));

        simpMessagingTemplate.convertAndSend("/topic/alarm", notificationMessage);

        return "jsonView";
    }

    @RequestMapping(value = "/saveLayer",  method= RequestMethod.POST)
    public String saveLayer(Model model, HttpServletRequest request, HttpSession session) throws Exception{

        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        inspectionService.saveLayer(hashMap,model);

        return "jsonView";
    }

    @RequestMapping(value = "/modifyInspectResult",  method= RequestMethod.POST)
    public String modifyInspectResult(Model model, HttpServletRequest request, HttpSession session) throws Exception{

        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        inspectionService.modifyInspectResult(hashMap,model);

        return "jsonView";
    }
}
