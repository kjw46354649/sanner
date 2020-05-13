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
import java.util.HashMap;
import java.util.Locale;

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

    /**
     * @description Scanning Barcode
     */
    @RequestMapping(value = "/scanningBarcodePop", method = RequestMethod.POST)
    public String scanningBarcodePop(HttpServletRequest request) throws Exception {
        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        this.popService.scanningBarcodePop(hashMap);

        return "jsonView";
    }
}
