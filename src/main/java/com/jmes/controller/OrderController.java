package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    public OrderService orderService;

    /**
     * @description 신규 주문 등록
     */
    @RequestMapping(value = "/registerNewOrder", method = RequestMethod.POST)
    public String registerNewOrder(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.registerNewOrder(map);

        return "jsonView";
    }

    /**
     * @description 신규 주문 등록 & 확정
     */
    @RequestMapping(value = "/registerNewOrderConfirm", method = RequestMethod.POST)
    public String registerNewOrderConfirm(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.registerNewOrderConfirm(map);

        return "jsonView";
    }
}