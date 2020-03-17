package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class SystemController {
    @Autowired
    public SystemService systemService;

    @RequestMapping(value = "/getCommonCodeList")
    public String dHtmlGridList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        List<Map<String, Object>> list = this.systemService.getCommonCodeList(hashMap);

        model.addAttribute("data", list);

        return "jsonView";
    }
}
