package com.jmes.service;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface LoginService {

    public boolean userAuthorizeCheck(HttpServletRequest request, Model model, Map<String, Object> hashMap) throws Exception;
}
