package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.OutService;
import com.jmes.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class OutController {

    @Autowired
    private OutService outService;

    /**
     * 그리드 삽입/갱신
     */
    @RequestMapping(value = "/createOutsideClose", method = RequestMethod.POST)
    public String createOutsideClose(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.outService.createOutsideClose(map);

        return "jsonView";
    }
}
