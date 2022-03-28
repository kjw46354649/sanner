package com.jmes.controller;

import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.DrawingApiService;
import com.tomes.domain.CommonResult;
import com.tomes.exception.ParameterException;
import com.tomes.service.ResponseService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Api
@Controller
@RestController
@RequiredArgsConstructor
@RequestMapping("/tomes")
@CrossOrigin
public class DrawingApiController {

    private final ResponseService responseService;

    @Autowired
    private DrawingApiService drawingApiService;

    @PostMapping("/drawing")
    public CommonResult mctWork(HttpServletRequest request, @RequestBody Map<String,Object> parameters) {
        CommonResult result = responseService.getSingleResult("200");

        try {

            drawingApiService.managerMctIfData(parameters);

        }catch (ParameterException pe) {
            result =  responseService.getFailResult(400, "파라미터를 확인해주세요.");
        }catch (Exception e) {
            result =  responseService.getFailResult(500, "알수없는 오류가 발생하였습니다.");
            e.printStackTrace();
        }
        return result;
    }

}
