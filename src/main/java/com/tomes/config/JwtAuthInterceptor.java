package com.tomes.config;

import com.framework.innodale.component.ThreadLocalUtil;
import com.framework.innodale.service.InnodaleService;
import com.tomes.exception.TokenException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Locale;
import java.util.Map;

public class JwtAuthInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    public InnodaleService innodaleService;

    @Autowired
    public JwtTokenProvider jwtTokenProvider;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String jwtToken = jwtTokenProvider.resolveToken(request);
        if(!jwtTokenProvider.validateToken(jwtToken)){
            throw new TokenException();
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        ThreadLocalUtil.clearSharedInfo();
        super.afterCompletion(request, response, handler, ex);
    }

}
