package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SystemController {

    @Autowired
    private SystemService systemService;

    @Autowired
    private InnodaleService innodaleService;

    @RequestMapping(value = "/getCommonCodeList")
    public String getCommonCodeList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        List<Map<String, Object>> list = this.systemService.getCommonCodeList(hashMap);

        model.addAttribute("data", list);

        return "jsonView";
    }

    /**
     * 그리드 삽입/갱신
     */
    @RequestMapping(value = "/commonCodeModifyGrid", method = RequestMethod.POST)
    public String commonCodeModifyGrid(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.systemService.commonCodeModifyGrid(map);

        return "jsonView";
    }

//    @RequestMapping(value = "/company-master", method = RequestMethod.POST)
//    public String companyMaster(Model model, HttpServletRequest request) throws Exception {
//
//        HashMap<String, Object> map = new HashMap<String, Object>();
//
//        map.put("queryId", "dataSource.getCompanyUserList");
//        model.addAttribute("companyUserList", innodaleService.getList(map));
//
//        return "/pages/system/company-master";
//    }
}
