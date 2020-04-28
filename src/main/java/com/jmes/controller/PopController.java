package com.jmes.controller;

import com.framework.innodale.service.InnodaleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
public class PopController {

    private static final Logger logger = LoggerFactory.getLogger(PopController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @RequestMapping(value="/pop")
    public String popAction(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("pop page submit");

        return "pop/pop_action";
    }

}
