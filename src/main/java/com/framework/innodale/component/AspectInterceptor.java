package com.framework.innodale.component;

import com.framework.innodale.service.InnodaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

public class AspectInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private LocaleResolver localeResolver;

    @Autowired
    public InnodaleService innodaleService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        String requestUrl = request.getRequestURI();

        Map<String, Object> userInfo =(Map<String, Object>) request.getSession().getAttribute("authUserInfo");

        if(session.getAttribute("LocalInfo") == null){
            String localeNat = RequestContextUtils.getLocale(request).toString();
            if(!"/".equals(requestUrl) && session.getAttribute("LocalInfo") == null){
                if("vi".equals(localeNat) || "vi_VN".equals(localeNat)){
                    localeNat = "vn";
                }else if("zh".equals(localeNat) || "zh_CN".equals(localeNat)){
                    localeNat = "zh";
                }else if("ko".equals(localeNat) || "ko_KR".equals(localeNat)){
                    localeNat = "kr";
                }else{
                    localeNat = "en";
                }
            }else{
                localeNat = "kr";
            }

            LocaleEditor localeEditor = new LocaleEditor();
            localeEditor.setAsText(localeNat);
            localeResolver.setLocale(request, response, (Locale) localeEditor.getValue());
            Locale.setDefault((Locale) localeEditor.getValue());
            session.setAttribute("LocalInfo", localeResolver.resolveLocale(request));

        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HttpSession session = request.getSession();
        Map<String, Object> hashMap = new HashMap<String, Object>();

        if(session.getAttribute("HighCode") == null){
            hashMap.put("queryId", "systemMapper.selectSessionCodeList");
            session.setAttribute("HighCode", CommonUtility.getCode(innodaleService.getList(hashMap)));
        }

//        if(session.getAttribute("LocalMenu") == null){
//            hashMap.put("queryId", "systemMapper.selectSessionMenuList");
//            session.setAttribute("LocalMenu", innodaleService.getList(hashMap));
//        }

        System.out.println("postHandle session.getId()=[" + session.getId() + "]" );
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)throws Exception {

        ThreadLocalUtil.clearSharedInfo();
        super.afterCompletion(request, response, handler, ex);
    }

    /** Ajax Call Check **/
    private boolean isAJAXRequest(HttpServletRequest request) {
        boolean check = false;
        String XMLHttpRequest = request.getHeader("X-Requested-With");
        if (XMLHttpRequest != null && "XMLHttpRequest".equals(XMLHttpRequest)) {
            check = true;
        }
        return check;
    }

    /** Ajax Call Check for mobile **/
    private boolean isAJAXRequestForMobile(HttpServletRequest request) {
        boolean check = false;
        String XMLHttpRequest = request.getHeader("X-Requested-From");
        if (XMLHttpRequest != null && "mobileHttpRequest".equals(XMLHttpRequest)) {
            check = true;
        }
        return check;
    }


    /**
     * not login pass url
     * @param url
     * @return
     * @throws Exception
     */
    private boolean isPassUrlList(String url) throws Exception{

        List<String> passList = new ArrayList<String>();

        // index.do => home.do
        passList.add("/");
        passList.add("/change-locale");
        passList.add("/userLogin");
        passList.add("/userLogout");

        return passList.contains(url);

    }
}
