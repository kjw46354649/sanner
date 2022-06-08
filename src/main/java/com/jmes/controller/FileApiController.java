package com.jmes.controller;

import com.jmes.service.DrawingApiService;
import com.tomes.domain.CommonResult;
import com.tomes.exception.ParameterException;
import com.tomes.service.ResponseService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Api
@Controller
@RestController
@RequiredArgsConstructor
@RequestMapping("/tomes")
@CrossOrigin
public class FileApiController {

    private final ResponseService responseService;

    @PostMapping("/fileSendNotice")
    public CommonResult fileSendNotice(HttpServletRequest request, @RequestBody Map<String,Object> parameters) {
        CommonResult result = responseService.getSingleResult("200");

        try {
            if(parameters.containsKey("equip_name")) {
                System.out.println("fileSendNotice >>>>>>>>>>>>>>>>>>>>>>>> " + parameters.toString());
            }else {
                throw new ParameterException();
            }
        }catch (ParameterException pe) {
            result =  responseService.getFailResult(400, "파라미터를 확인해주세요.");
        }catch (Exception e) {
            result =  responseService.getFailResult(500, "알수없는 오류가 발생하였습니다.");
            e.printStackTrace();
        }
        return result;
    }

    @PostMapping("/fileSendFinish")
    public CommonResult fileSendFinish(HttpServletRequest request, @RequestBody Map<String,Object> parameters) {
        CommonResult result = responseService.getSingleResult("200");

        try {
            if(parameters.containsKey("equip_name") && parameters.containsKey("file_name")) {
                System.out.println("fileSendFinish >>>>>>>>>>>>>>>>>>>>>>>> " + parameters.toString());
            }else {
                throw new ParameterException();
            }
        }catch (ParameterException pe) {
            result =  responseService.getFailResult(400, "파라미터를 확인해주세요.");
        }catch (Exception e) {
            result =  responseService.getFailResult(500, "알수없는 오류가 발생하였습니다.");
            e.printStackTrace();
        }
        return result;
    }

}
