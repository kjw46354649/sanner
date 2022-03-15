package com.tomes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.entity.ActionType;
import com.framework.innodale.entity.MessageType;
import com.framework.innodale.entity.NotificationMessage;
import com.framework.innodale.service.InnodaleService;
import com.tomes.domain.CommonResult;
import com.tomes.domain.SingleResult;
import com.tomes.exception.ParameterException;
import com.tomes.service.ResponseService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
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

    private final ResponseService responseService;

    @Autowired
    SqlSessionTemplate batchSqlSessionTemplate;


    private MessageSource messageSource;

    @PostMapping("/drawing")
    public CommonResult mctWork(HttpServletRequest request, @RequestBody Map<String,Object> parameters) {
        Map<String, Object> paramMap = new HashMap<>();
        HashMap<String, Object> alarmMap = new HashMap<>();
        CommonResult result = responseService.getSingleResult("200");

        try {
            if(parameters.containsKey("dataList")) {
                List<Map<String,Object>> dataList = (List<Map<String, Object>>) parameters.get("dataList");
                for(Map<String,Object> map : dataList) {
                    if(!map.containsKey("seq") || !map.containsKey("equip_name") || !map.containsKey("part_cnt") || !map.containsKey("event_time") || !map.containsKey("execution")) {
                        throw new ParameterException();
                    }else {
                        batchSqlSessionTemplate.insert("tomesMapper.insertNcIfWorkData", map);
                    }
                }
            }else {
                throw new ParameterException();
            }

//            simpMessagingTemplate.convertAndSend("/topic/notice", getNotificationUserMessage(alarmMap));
        }catch (ParameterException pe) {
            result =  responseService.getFailResult(500, "파라미터를 확인해주세요.");
        }catch (Exception e) {
            result =  responseService.getFailResult(500, "알수없는 오류가 발생하였습니다.");
        }
        return result;
    }

    // code정보에 해당하는 메시지를 조회합니다.
    private String getMessage(String code) {
        return getMessage(code, null);
    }

    // code정보, 추가 argument로 현재 locale에 맞는 메시지를 조회합니다.
    private String getMessage(String code, Object[] args) {
        return messageSource.getMessage(code, args, LocaleContextHolder.getLocale());
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
