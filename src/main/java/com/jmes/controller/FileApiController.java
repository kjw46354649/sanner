package com.jmes.controller;

import com.framework.innodale.entity.ActionType;
import com.framework.innodale.entity.NotificationMessage;
import com.jmes.service.DrawingApiService;
import com.tomes.domain.CommonResult;
import com.tomes.exception.ParameterException;
import com.tomes.service.ResponseService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Api
@Controller
@RestController
@RequiredArgsConstructor
@RequestMapping("/tomes")
@CrossOrigin
public class FileApiController {

    private final ResponseService responseService;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    private final int BAD_REQUEST = 400;
    private final int INTERNAL_SERVER_ERROR = 500;

    @PostMapping("/fileSendNotice")
    public CommonResult fileSendNotice(HttpServletRequest request, @RequestBody Map<String,Object> parameters, HttpServletResponse response) {
        CommonResult result = responseService.getSingleResult("200");

        try {
            if(parameters.containsKey("equip_name")) {
                System.out.println("fileSendNotice >>>>>>>>>>>>>>>>>>>>>>>> " + parameters.toString());
                NotificationMessage notificationMessage = new NotificationMessage();
                notificationMessage.setActionType(ActionType.FILE_SEND_NOTICE);
                notificationMessage.setEquipNm((String) parameters.get("equip_name"));

                simpMessagingTemplate.convertAndSend("/topic/file", notificationMessage);
            }else {
                throw new ParameterException();
            }
        }catch (ParameterException pe) {
            response.setStatus(BAD_REQUEST);
            result =  responseService.getFailResult(BAD_REQUEST, "파라미터를 확인해주세요.");
        }catch (Exception e) {
            response.setStatus(INTERNAL_SERVER_ERROR);
            result =  responseService.getFailResult(INTERNAL_SERVER_ERROR, "알수없는 오류가 발생하였습니다.");
            e.printStackTrace();
        }
        return result;
    }

    @PostMapping("/fileSendFinish")
    public CommonResult fileSendFinish(HttpServletRequest request, @RequestBody Map<String,Object> parameters, HttpServletResponse response) {
        CommonResult result = responseService.getSingleResult("200");

        try {
            if(parameters.containsKey("equip_name") && parameters.containsKey("file_name")) {
                System.out.println("fileSendFinish >>>>>>>>>>>>>>>>>>>>>>>> " + parameters.toString());
                NotificationMessage notificationMessage = new NotificationMessage();
                notificationMessage.setActionType(ActionType.FILE_SEND_COMPLETE);
                notificationMessage.setEquipNm((String) parameters.get("equip_name"));
                notificationMessage.setContent01((String) parameters.get("file_name"));
                simpMessagingTemplate.convertAndSend("/topic/file", notificationMessage);
            }else {
                throw new ParameterException();
            }
        }catch (ParameterException pe) {
            response.setStatus(BAD_REQUEST);
            result =  responseService.getFailResult(BAD_REQUEST, "파라미터를 확인해주세요.");
        }catch (Exception e) {
            response.setStatus(INTERNAL_SERVER_ERROR);
            result =  responseService.getFailResult(INTERNAL_SERVER_ERROR, "알수없는 오류가 발생하였습니다.");
            e.printStackTrace();
        }
        return result;
    }

}
