package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.MachineService;
import com.jmes.service.ProductionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class ProductionController {

    @Autowired
    private ProductionService productionService;

    /**
     * MCT 임시 저장, 저장 및 완료, 취소 처리
     */
    @RequestMapping(value = "/managerCamWork", method = RequestMethod.POST)
    public String managerCamWork(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        String actionType = (String)map.get("actionType");
        switch(actionType){
            case "start":
                this.productionService.managerStartCamWork(model, map);
                break;
            case "cancel":
                this.productionService.managerCancelCamWork(model, map);
                break;
            case "complete":
            case "temp":
                this.productionService.managerCamWork(model, map);
                break;
        }
        return "jsonView";
    }

}
