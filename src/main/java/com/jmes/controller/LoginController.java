package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.LoginService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private LocaleResolver localeResolver;

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
        session.setMaxInactiveInterval(-1);

        /** Note: Parameter Values Into HashMap **/
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        if(loginService.userAuthorizeCheck(request, model, hashMap)){
            session.setAttribute("authUserInfo", hashMap.get("userInfo"));
            session.setAttribute("authUserMenu", hashMap.get("userMenu"));

            session.setMaxInactiveInterval(-1);
        }else{
            String autoReturnCode = String.valueOf(hashMap.get("autoReturnCode"));
            if(autoReturnCode.equals("REC0003"))
                model.addAttribute("message", 		messageSource.getMessage("index.error.login.notMatchPassword", null, RequestContextUtils.getLocale(request)));	// "비밀번호가 일치하지 않습니다.";
            else if(autoReturnCode.equals("REC0002"))
                model.addAttribute("message", 		messageSource.getMessage("index.error.login.notUseUserId", null, RequestContextUtils.getLocale(request)));		// "입력하신 ID는 사용하실 수 없습니다.";
            else if(autoReturnCode.equals("REC0001"))
                model.addAttribute("message", 		messageSource.getMessage("index.error.login.notexistID", null, RequestContextUtils.getLocale(request)));		// "입력하신 ID는 존재하지 않습니다.";
            else
                model.addAttribute("message", 		messageSource.getMessage("index.error.login.default", null, RequestContextUtils.getLocale(request)));			// "로그인 할 수 없습니다. 잠시 후 다시 시도하시기 바랍니다.";
        }
        return "jsonView";
    }

    @RequestMapping(value="/userLotout", method = RequestMethod.GET)
    public String userLotout(Model model, HttpSession session, HttpServletRequest request) throws Exception {
        String result = "redirect:/";

        /** Session clear **/
        if(session.getAttribute("HighCode") != null){

            session.removeAttribute("authUserInfo");
            session.removeAttribute("authUserMenu");
            session.removeAttribute("HighCode");
            session.invalidate();

        }

        return result;

    }

    @RequestMapping("/change-locale")
    public String changeLocale(@RequestParam(value = "lang", defaultValue = "ko_KR")  String newLocale,
                               HttpSession session, HttpServletRequest request, HttpServletResponse response, Locale locale) throws Exception {

        /** Begin Locale Setting **/
        LocaleEditor localeEditor = new LocaleEditor();
        localeEditor.setAsText(newLocale);
        localeResolver.setLocale(request, response, (Locale) localeEditor.getValue());
        locale.setDefault((Locale) localeEditor.getValue());
        /** End Locale Setting **/

        session.setAttribute("LocalInfo", localeEditor.getValue());

        return "redirect:/";
    }

    @RequestMapping("/drawing-change-locale")
    public String drawingChangeMainLocale(@RequestParam(value = "lang", defaultValue = "ko_KR")  String newLocale,
                               HttpSession session, HttpServletRequest request, HttpServletResponse response, Locale locale) throws Exception {

        System.out.println("newLocale=[" + newLocale + "]");

        /** Begin Locale Setting **/
        LocaleEditor localeEditor = new LocaleEditor();
        localeEditor.setAsText(newLocale);
        localeResolver.setLocale(request, response, (Locale) localeEditor.getValue());
        locale.setDefault((Locale) localeEditor.getValue());
        /** End Locale Setting **/

        session.setAttribute("LocalInfo", localeEditor.getValue());

        return "redirect:/drawing";
    }

    @RequestMapping("/drawing-change-user-locale")
    public String drawingChangeMainUserLocale(@RequestParam(value = "lang", defaultValue = "ko_KR")  String newLocale, Model model,
                               HttpSession session, HttpServletRequest request, HttpServletResponse response, Locale locale) throws Exception {

        /** Begin Locale Setting **/
        LocaleEditor localeEditor = new LocaleEditor();
        localeEditor.setAsText(newLocale);
        localeResolver.setLocale(request, response, (Locale) localeEditor.getValue());
        locale.setDefault((Locale) localeEditor.getValue());
        /** End Locale Setting **/

        session.setAttribute("LocalInfo", localeEditor.getValue());

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        /** 사용자 선택에서 장비 정보가 없고 세션 정보도 없는 경우 장비 선택 화면으로 이동 **/
        if(session.getAttribute("drawingInfo") == null){
            return "redirect:/drawing";
        }

        hashMap.put("queryId", "drawingMapper.selectDrawingWorkerGroupList");
        model.addAttribute("workerGroupList", this.innodaleService.getList(hashMap));

//        return "redirect:/drawing-worker";
        return "board/drawing-worker";
    }

}
