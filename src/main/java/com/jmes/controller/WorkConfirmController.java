package com.jmes.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
public class WorkConfirmController {

    private static final Logger logger = LoggerFactory.getLogger(WorkConfirmController.class);

    @RequestMapping(value="/workConfirm")
    public String workConfirm(Model model, HttpServletRequest request, Locale locale) throws Exception {

        return "confirm/work_confirm";
    }
}
