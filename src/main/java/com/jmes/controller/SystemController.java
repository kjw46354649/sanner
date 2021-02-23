package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class SystemController {

    @Autowired
    private SystemService systemService;

    @RequestMapping(value = "/getCommonCodeList", method = RequestMethod.POST)
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

    /**
     * 업체정보 관리(I,U,D)
     */
    @RequestMapping(value = "/managerSystemCompany", method = RequestMethod.POST)
    public String managerSystemCompany(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

//        System.out.println("---managerSystemCompany-----map-------" + map.toString());
        this.systemService.managerSystemCompany(model, map);

        return "jsonView";
    }

    @RequestMapping(value = "/updateWorkingTime", method = RequestMethod.POST)
    public String updateWorkingTime(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.systemService.updateWorkingTime(map);

        return "jsonView";
    }
}
