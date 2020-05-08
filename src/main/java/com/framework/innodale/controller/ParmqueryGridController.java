package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
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
public class ParmqueryGridController {

    @Autowired
    public InnodaleService innodaleService;

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/paramQueryGridSelect", method = RequestMethod.POST)
    public String dHtmlGridList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        List<Map<String, Object>> list = this.innodaleService.getList(hashMap);
        model.addAttribute("data", list);
        return "jsonView";
    }

    /**
     * 그리드 삽입/갱신
     */
    @RequestMapping(value = "/paramQueryModifyGrid", method = RequestMethod.POST)
    public String paramQueryModifyGrid(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.innodaleService.modifyGrid(map);
        return "jsonView";
    }

    /**
     * 그리드 삭제
     */
    @RequestMapping(value = "/paramQueryDeleteGrid", method = RequestMethod.POST)
    public String paramQueryDeleteGrid(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);

        this.innodaleService.deleteGrid(map);

        return "jsonView";
    }


    /**
     * 그리드 삽입/갱신/삭제
     */
    @RequestMapping(value = "/paramQueryCRUDGrid", method = RequestMethod.POST)
    public String paramQueryCRUDGrid(HttpServletRequest request) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.innodaleService.CRUDGrid(map);
        return "jsonView";
    }

}
