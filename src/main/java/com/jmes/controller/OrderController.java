package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {

    @Autowired
    public OrderService orderService;

    /**
     * @description 신규 주문 등록
     */
    @RequestMapping(value = "/createNewOrder", method = RequestMethod.POST)
    public String createNewOrder(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.createNewOrder(map);

        return "jsonView";
    }

    /**
     * @description 신규 주문 등록 & 확정
     */
    @RequestMapping(value = "/createNewOrderConfirm", method = RequestMethod.POST)
    public String createNewOrderConfirm(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.createNewOrderConfirm(map);

        return "jsonView";
    }

    @RequestMapping(value = "/createMonthFinishClose", method = RequestMethod.POST)
    public String createMonthFinishClose(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.orderService.createMonthFinishClose(map);
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
    public String createInvoice(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.orderService.createInvoice(map);
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
}