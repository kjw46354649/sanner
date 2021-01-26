package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.CadFileConvertService;
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

    @Autowired
    private CadFileConvertService cadFileConvertService;

    /**
     * @description 주문 CAD 파일을 업로드 한다.
     */
    @RequestMapping(value = "/cadFileConvert", method = RequestMethod.POST)
    public String cadFileConvert(HttpServletRequest request) throws Exception {

        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.cadFileConvertService.createCadFileUpload(map);   // db 매핑 정보로 DXF 키를 업데이트 한다.

        return "jsonView";
    }


}
