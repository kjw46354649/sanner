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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
public class PopController {

    private static final Logger logger = LoggerFactory.getLogger(PopController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    public PopService popService;

    @RequestMapping(value="/pop")
    public String popAction(Model model, HttpServletRequest request, Locale locale) throws Exception {
        logger.info("pop page submit");
        return "pop/pop_action";
    }

    @RequestMapping(value="/popVue")
    public String popActionVue(Model model, HttpServletRequest request, Locale locale) throws Exception {
        logger.info("pop page submit");
        return "pop/pop_action_vue";
    }

    @RequestMapping(value="/pop/{popLocation}")
    public String popActionLocation(@PathVariable("popLocation") String popLocation, Model model) throws Exception {
        logger.info("pop page submit");
        model.addAttribute("popLocation", popLocation);
        return "pop/pop_action";
    }

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/popParamQueryGridSelect", method = RequestMethod.POST)
    public String popParamQueryGridSelect(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        List<Map<String, Object>> list = this.innodaleService.getList(hashMap);
        model.addAttribute("data", list);
        return "jsonView";
    }

    /**
     * @description Scanning Barcode
     */
    @RequestMapping(value = "/popScanningBarcodePop", method = RequestMethod.POST)
    public String popScanningBarcodePop(Model model, HttpServletRequest request) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        popService.createScanningBarcodePop(model, hashMap);

        return "jsonView";
    }
}
