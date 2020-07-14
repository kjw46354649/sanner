package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class CadFileConvertController {

    private static final Logger logger = LoggerFactory.getLogger(CadFileConvertController.class);

    @Autowired
    private InnodaleService innodaleService;

    /**
     * @description 주문 CAD 파일을 업로드 한다.
     */
    @RequestMapping(value = "/cadFileConvert", method = RequestMethod.POST)
    public String cadFileConvert(HttpServletRequest request) throws Exception {

        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.innodaleService.modifyGrid(map);   // db 매핑 정보로 DXF 키를 업데이트 한다.

        // background 방식으로 처리 된다.
        // CONVERT 작업과 DXF 키로 이미지 KEY를 업로드 한다.
        /*try {
            //Task 실행가능 여부 확
            if(asyncConfig.checkSampleTaskExecute()) {
                cadeFileConvertTaskService.jobRunningInBackground(map);
            }else {
                logger.info("Thread 개수 초과");
            }
        } catch (Exception e) {
            logger.error("Thread Err :: " + e.getMessage());
        }*/

        return "jsonView";
    }


}
