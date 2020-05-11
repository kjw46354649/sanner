package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class MaterialController {

    @Autowired
    private MaterialService materialService;


    @RequestMapping(value = "/managerInsideStock", method = RequestMethod.POST)
    public String managerInsideStock(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        System.out.println("---managerInsideStock-----map-------" + map.toString());
        this.materialService.managerInsideStock(model, map);

        return "jsonView";
    }
}