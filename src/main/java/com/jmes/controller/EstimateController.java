package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.EstimateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class EstimateController {

    @Autowired
    public EstimateService estimateService;

    /**
     * @description 견적 주문 SAVE
     */
    @RequestMapping(value = "/registerEstimateSave", method = RequestMethod.POST)
    public String registerEstimateSave(HttpServletRequest request) throws Exception {
        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        this.estimateService.registerEstimateSave(hashMap);

        return "jsonView";
    }

    /**
     * @description 견적 주문 등록
     */
    @RequestMapping(value = "/registerEstimateOrder", method = RequestMethod.POST)
    public String registerNewOrder(HttpServletRequest request) throws Exception {
        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        this.estimateService.registerEstimateOrder(hashMap);

        return "jsonView";
    }

    /**
     * @description 소재비 등록
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertMaterialCost", method = RequestMethod.POST)
    public String insertMaterialCost(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.estimateService.insertMaterialCost(map);

        return "jsonView";
    }

    /**
     * @description 소재비 삭제
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deleteMaterialCost", method = RequestMethod.POST)
    public String deleteMaterialCost(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.estimateService.deleteMaterialCost(map);

        return "jsonView";
    }
}
