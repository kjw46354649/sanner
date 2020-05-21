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
    @RequestMapping(value = "/registerNewOrder", method = RequestMethod.POST)
    public String registerNewOrder(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.registerNewOrder(map);

        return "jsonView";
    }

    /**
     * @description 신규 주문 등록 & 확정
     */
    @RequestMapping(value = "/registerNewOrderConfirm", method = RequestMethod.POST)
    public String registerNewOrderConfirm(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.orderService.registerNewOrderConfirm(map);

        return "jsonView";
    }

    @RequestMapping(value = "/selectControlCloseRightList", method = RequestMethod.POST)
    public String selectControlCloseRightList(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        List<Map<String, Object>> list = this.orderService.selectControlCloseRightList(map);
        model.addAttribute("list", list);

        return "jsonView";
    }

    @RequestMapping(value = "/insertMonthFinishClose", method = RequestMethod.POST)
    public String insertMonthFinishClose(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.orderService.insertMonthFinishClose(map);
        return "jsonView";
    }

    /**
     * @description 거래명세표 저장
     */
    @RequestMapping(value = "/insertInvoice", method = RequestMethod.POST)
    public String insertInvoice(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        System.out.println(map);
        this.orderService.insertInvoice(map);
        return "jsonView";
    }
}