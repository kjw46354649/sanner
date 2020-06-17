package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.PopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
public class TvController {

    private static final Logger logger = LoggerFactory.getLogger(TvController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @RequestMapping(value="/tv/pop")
    public String popAction(Model model, HttpServletRequest request, Locale locale) throws Exception {

        System.out.println("12312312312 pop page submit");

        return "tv/tv_pop";
    }

//    /**
//     * Simply selects the home view to render by returning its name.
//     */
//    @RequestMapping(value = "/popParamQueryGridSelect", method = RequestMethod.POST)
//    public String popParamQueryGridSelect(Model model, HttpServletRequest request, HttpSession session) throws Exception {
//        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
//        List<Map<String, Object>> list = this.innodaleService.getList(hashMap);
//        model.addAttribute("data", list);
//        return "jsonView";
//    }
//
//    /**
//     * @description Scanning Barcode
//     */
//    @RequestMapping(value = "/popScanningBarcodePop", method = RequestMethod.POST)
//    public String popScanningBarcodePop(Model model, HttpServletRequest request) throws Exception {
//
//        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
//
//        popService.createScanningBarcodePop(model, hashMap);
//
//        return "jsonView";
//    }
}
