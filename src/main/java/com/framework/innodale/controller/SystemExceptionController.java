package com.framework.innodale.controller;

import com.tomes.exception.AuthenticationFailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SystemExceptionController {

    /**
     * Json Create
     */
    @RequestMapping(value = "/exception")
    public void exception(Model model, HttpServletRequest request) throws Exception{

        String exception = (String) request.getAttribute("throwException");

        if(exception.equals("authenticationFailException")){
            throw new AuthenticationFailException();
        } else {
            throw new Exception();
        }
    }
}
