package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.MachineService;
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
public class MachineController {

    @Autowired
    private MachineService machineService;

    /**
     * 장비상세 정보 관리(I,U,D)
     */
    @RequestMapping(value = "/managerEquip", method = RequestMethod.POST)
    public String managerEquip(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        System.out.println("---managerEquip-----map-------" + map.toString());
        this.machineService.managerEquip(model, map);

        return "jsonView";
    }
}
