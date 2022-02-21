package com.tomes.controller;

import com.framework.innodale.entity.ActionType;
import com.framework.innodale.entity.MessageType;
import com.framework.innodale.entity.NotificationMessage;
import com.framework.innodale.service.InnodaleService;
import com.tomes.domain.SingleResult;
import com.tomes.service.ResponseService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Api
@Controller
@RestController
@RequiredArgsConstructor
@RequestMapping("/tomes")
@CrossOrigin
public class TomesDrawingController {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @PostMapping("/drawing")
    public void mctWork(HttpServletRequest request, Map<String,Object> parameters) {
        Map<String, Object> paramMap = new HashMap<>();
        System.out.println(request.getParameterMap());
        HashMap<String, Object> alarmMap = new HashMap<>();
        try {
            simpMessagingTemplate.convertAndSend("/topic/notice", getNotificationUserMessage(alarmMap));
//            simpMessagingTemplate.convertAndSend("/topic/drawing", getNotificationUserMessage(alarmMap));
        }catch (Exception e) {

        }
    }

    public NotificationMessage getNotificationUserMessage(HashMap<String, Object> hashMap) throws Exception {
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>> NotificationMessage");
        NotificationMessage notificationMessage = new NotificationMessage();

        /** 사용자 정보 셋팅 */
        notificationMessage.setType(MessageType.DRAWING);
        notificationMessage.setActionType(ActionType.DB_START);
        notificationMessage.setContent01("1123");
        notificationMessage.setContent02("#@%32325");
        notificationMessage.setContent03("235325235");
        notificationMessage.setImageSeq(1232154);

        notificationMessage.setEquipId("test");
        notificationMessage.setEquipNm("testnm");
        notificationMessage.setEquipCol(1);
        notificationMessage.setEquipRow(2);
        notificationMessage.setEquipPosition(10);
        notificationMessage.setFactoryArea("FCT");

        return notificationMessage;
    }
}
