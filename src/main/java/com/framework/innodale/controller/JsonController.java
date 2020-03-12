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
import java.util.Map;

@Controller
public class JsonController {

    @Autowired
    public InnodaleService innodaleService;

    /**
     * Json Create
     */
    @RequestMapping(value = "/json-create",  method= RequestMethod.POST)
    public String jsonCreate(Model model, HttpServletRequest request, HttpSession session) throws Exception{

        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        innodaleService.create(hashMap);
        return "jsonView";
    }

    /**
     * Json Delete
     */
    @RequestMapping(value = "/json-remove",  method=RequestMethod.POST)
    public String jsonRemove(Model model, HttpServletRequest request, HttpSession session) throws Exception{
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        innodaleService.remove(hashMap);
        return "jsonView";
    }

    /**
     * Json Update
     */
    @RequestMapping(value = "/json-update",  method=RequestMethod.POST)
    public String jsonUpdate(Model model, HttpServletRequest request, HttpSession session) throws Exception{
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        innodaleService.update(hashMap);
        return "jsonView";
    }

    /**
     * Json List
     */
    @RequestMapping(value = "/json-list",  method=RequestMethod.POST)
    public String jsonList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        model.addAttribute("list", this.innodaleService.getList(hashMap));
        return "jsonView";
    }

    /**
     * Json Info
     */
    @RequestMapping(value = "/json-info",  method=RequestMethod.POST)
    public String jsonInfo(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        model.addAttribute("info", this.innodaleService.getInfo(hashMap));
        return "jsonView";
    }

}
