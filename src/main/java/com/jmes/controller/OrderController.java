package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class OrderController {

    @Autowired
    public OrderService orderService;

    /**
     * @description 신규 주문 등록
     */
    @RequestMapping(value = "/createNewOrder", method = RequestMethod.POST)
    public String createNewOrder(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.createNewOrder(model, map);

        return "jsonView";
    }

    /**
     * @description 주문 삭제
     */
    @RequestMapping(value = "/removeControl", method = RequestMethod.POST)
    public String removeControl(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.removeControl(map);

        return "jsonView";
    }

    /**
     * @description 주문 상태 변경
     */
    @RequestMapping(value = "/managerControlStatus", method = RequestMethod.POST)
    public String managerControlStatus(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.managerControlStatus(map);

        return "jsonView";
    }

    /**
     * @description 월 마감
     */
    @RequestMapping(value = "/createMonthClose", method = RequestMethod.POST)
    public String createMonthClose(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.orderService.createMonthClose(map);
        return "jsonView";
    }

    /**
     * @description 월 마감 취소
     */
    @RequestMapping(value = "/removeMonthClose", method = RequestMethod.POST)
    public String removeMonthClose(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.removeMonthClose(map);

        return "jsonView";
    }

    /**
     * @description 거래명세표 저장
     */
    @RequestMapping(value = "/createInvoice", method = RequestMethod.POST)
    public String createInvoice(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        model.addAttribute("info", this.orderService.createInvoice(map));
        return "jsonView";
    }

    /**
     * @description 거래 명세표 삭제
     */
    @RequestMapping(value = "/removeInvoice", method = RequestMethod.POST)
    public String removeInvoice(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.orderService.removeInvoice(map);
        return "jsonView";
    }

    /**
     * @description 가공확정에서 Barcode 체크 처리
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/processConfirmBarcodeInfo")
    public String processConfirmBarcodeInfo(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.orderService.processConfirmBarcodeInfo(model, map);
        return "jsonView";
    }

    /**
     * 가공확정 (알람 처리를 위해서 별도 Controller 처리 함
     */
    @RequestMapping(value = "/processControlConfirmProcess", method = RequestMethod.POST)
    public String processControlConfirmProcess(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.orderService.updateControlConfirmProcess(map);
        return "jsonView";
    }

    /**
     * @description 관리번호 병합
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mergeControl", method = RequestMethod.POST)
    public String mergeControl(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.mergeControl(model, map);

        return "jsonView";
    }

    /**
     * @description 주문관리 저장 검사
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/validationCheckBeforeSaveFromControl", method = RequestMethod.POST)
    public String validationCheckBeforeSaveFromControl(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.validationCheckBeforeSaveFromControl(model, map);

        return "jsonView";
    }
    
    
    /**
     * @description 
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/processingRequirementsControlSave", method = RequestMethod.POST)
    public String processingRequirementsControlSave(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.processingRequirementsControlSave(model, map);

        return "jsonView";
    }
}