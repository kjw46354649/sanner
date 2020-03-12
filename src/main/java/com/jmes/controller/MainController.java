package com.jmes.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
public class MainController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value="/main")
    public String index(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("logger");

        return "pages/main/main.tiles";
    }

    @RequestMapping(value="/paramQuerySample")
    public String testhi1(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("logger");

        return "pages/sample/paramQuerySample.tiles";
    }

    @RequestMapping(value="/userManager")
    public String userManager(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("logger");

        return "pages/system/menu_manager_list.tiles";
    }

}
