package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MaterialController {

    @Autowired
    private MaterialService materialService;

    @RequestMapping(value = "/itemOrderRegisterPopSave", method = RequestMethod.POST)
    public String itemOrderRegisterPopSave(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.materialService.itemOrderRegisterPopSave(model, map);

        return "jsonView";
    }

    @RequestMapping(value = "/managerInsideStock", method = RequestMethod.POST)
    public String managerInsideStock(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        System.out.println("---managerInsideStock-----map-------" + map.toString());
        this.materialService.managerInsideStock(model, map);

        return "jsonView";
    }

    @RequestMapping(value = "/managerInsideStockPop", method = RequestMethod.POST)
    public String managerInsideStockPop(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        System.out.println("---managerInsideStockPop-----map-------" + map.toString());
        this.materialService.managerInsideStockPop(model, map);

        return "jsonView";
    }

    @RequestMapping(value = "/inWarehouseManageSave", method = RequestMethod.POST)
    public String inWarehouseManageSave(Model model, HttpServletRequest request) throws Exception {
        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        System.out.println("---inWarehouseManageSave-----hashMap-------" + hashMap.toString());
        this.materialService.inWarehouseManageSave(model, hashMap);

        return "jsonView";
    }
}
