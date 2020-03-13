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

    @RequestMapping(value = "/main")
    public String index(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("logger");

        return "pages/main/main.tiles";
    }

    @RequestMapping(value = "/userManger")
    public String userManger(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("logger");

        return "pages/system/user-manger-list.tiles";
    }

    @RequestMapping(value = "/menuManager")
    public String menuManager(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("logger");

        return "pages/system/menu-manager-list.tiles";
    }

    @RequestMapping(value = "/commonReferenceCode")
    public String commonReferenceCode(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("logger");

        return "pages/system/common-reference-code-list.tiles";
    }

    @RequestMapping(value = "/authorityGroupMaster")
    public String authorityGroupMaster(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("logger");

        return "pages/system/authority-group-master.tiles";
    }

    @RequestMapping(value = "/authorityMenuManagement")
    public String authorityMenuManagement(Model model, HttpServletRequest request, Locale locale) throws Exception {

        logger.info("logger");

        return "pages/system/authority-menu-management.tiles";
    }

}
