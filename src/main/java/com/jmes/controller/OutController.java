package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.jmes.service.OutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class OutController {

    @Autowired
    private OutService outService;

    /**
     * 외주주문 삭제
     */
    @RequestMapping(value = "/removeOutsideOrder", method = RequestMethod.POST)
    public String removeOutsideOrder(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.outService.removeOutsideOrder(map);

        return "jsonView";
    }

    /**
     * 그리드 삽입/갱신
     */
    @RequestMapping(value = "/createOutsideClose", method = RequestMethod.POST)
    public String createOutsideClose(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.outService.createOutsideClose(map);

        return "jsonView";
    }

    /**
     * 외주가공 요청 저장 및 제출 || 가공요청 취소 저장 및 제출
     */
    @RequestMapping(value = "/managerRequestOutside", method = RequestMethod.POST)
    public String managerRequestOutside(Model model, HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.outService.managerRequestOutside(model, map);

        return "jsonView";
    }

    /**
     * 외주마감 취소
     */
    @RequestMapping(value = "/removeOutsideClose", method = RequestMethod.POST)
    public String removeOutsideClose(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.outService.removeOutsideClose(map);

        return "jsonView";
    }

    @RequestMapping(value = "/createOutGoing", method = RequestMethod.POST)
    public String createOutGoing(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.outService.createOutGoing(map);

        return "jsonView";
    }
    @RequestMapping(value = "/createOutGoingForGrid", method = RequestMethod.POST)
    public String createOutGoingForGrid(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.outService.createOutGoingForGrid(map);

        return "jsonView";
    }
}
