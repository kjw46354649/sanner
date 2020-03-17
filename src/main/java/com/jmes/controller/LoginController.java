package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Locale;
import java.util.Map;

@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @RequestMapping(value="/")
    public String index(Model model, HttpServletRequest request,  Locale locale) throws Exception {

        logger.info("logger");

        return "login/login.tiles";
    }

    @RequestMapping(value="/userLogin", method = RequestMethod.POST)
    public String userLogin(Model model, HttpSession session, HttpServletRequest request) throws Exception {

        /** initialization return model **/
        model.addAttribute("result",		"error");
        model.addAttribute("message", 		messageSource.getMessage("index.error.login.default", null, RequestContextUtils.getLocale(request)));

        /** Session clear **/
        if(session.getAttribute("authUserInfo") != null){
            session.removeAttribute("authUserInfo");
        }

        /** Note: Parameter Values Into HashMap **/
//        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
//
//        if(authService.userAuthorizeCheck(request, model, hashMap)){
//
//            session.setAttribute("authUserInfo", hashMap.get("userInfo"));
//            session.setAttribute("authUserMenu", hashMap.get("userMenu"));
//            session.setAttribute("authUserFMenu", hashMap.get("firstMenu"));
//
//            session.setMaxInactiveInterval(-1);
//        }else{
//            String autoReturnCode = String.valueOf(hashMap.get("autoReturnCode"));
//
//            if(autoReturnCode.equals("CPF22E2"))
//                model.addAttribute("message", 		messageSource.getMessage("index.error.login.notMatchPassword", null, RequestContextUtils.getLocale(request)));	// "비밀번호가 일치하지 않습니다.";
//            else if(autoReturnCode.equals("CPF22E3"))
//                model.addAttribute("message", 		messageSource.getMessage("index.error.login.notUseUserId", null, RequestContextUtils.getLocale(request)));		// "입력하신 ID는 사용하실 수 없습니다.";
//		/*else if(autoReturnCode.equals("CPF22E4"))
//			model.addAttribute("message", 		messageSource.getMessage("index.error.login.expiredPasswordDate", null, RequestContextUtils.getLocale(request)));	// "비밀번호의 사용기간이 만료되었습니다."; */
//            else if(autoReturnCode.equals("CPF2204"))
//                model.addAttribute("message", 		messageSource.getMessage("index.error.login.notexistID", null, RequestContextUtils.getLocale(request)));		// "입력하신 ID는 존재하지 않습니다.";
//            else
//                model.addAttribute("message", 		messageSource.getMessage("index.error.login.default", null, RequestContextUtils.getLocale(request)));			// "로그인 할 수 없습니다. 잠시 후 다시 시도하시기 바랍니다.";
//        }

        return "jsonView";

    }

}
