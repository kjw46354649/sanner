package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class ReportController {

    @Autowired
    private ReportService reportService;

    /**
     * 그리드 삽입/갱신
     */
    @RequestMapping(value = "/updateWorkingTime", method = RequestMethod.POST)
    public String updateWorkingTime(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.reportService.updateWorkingTime(map);

        return "jsonView";
    }
}
