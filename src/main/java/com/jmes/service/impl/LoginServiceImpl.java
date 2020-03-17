package com.jmes.service.impl;

import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class LoginServiceImpl implements LoginService {

    @Autowired
    private InnodaleDao innodaleDao;

    @Override
    public boolean userAuthorizeCheck(HttpServletRequest request, Model model, Map<String, Object> hashMap) throws Exception {

        boolean bReturnValue = false;

        String userInputPw = String.valueOf(hashMap.get("USER_PWD"));

        /** Wave 시스템 사용자 인증 조회 **/
        hashMap.put("USERID", 		String.valueOf(hashMap.get("USER_ID")));
        hashMap.put("queryId", 		"systemMapper.getUserAuthorize");

        Map<String, Object> userInfo = innodaleDao.getInfo(hashMap);

        model.addAttribute("result",		"error");
        if(userInfo == null) {
            hashMap.put("autoReturnCode",		"CPF2204");
            return bReturnValue;
        }else if("0".equals(String.valueOf(userInfo.get("USE_YN")))){
            hashMap.put("autoReturnCode",		"CPF22E3");
            return bReturnValue;
        }else if(!userInputPw.equals(String.valueOf(userInfo.get("USER_PWD")))){
            hashMap.put("autoReturnCode",		"CPF22E2");
            return bReturnValue;
        }

        /** user infomation **/
        hashMap.put("userInfo", 	userInfo);

        /** user Menu search list **/
        hashMap.put("queryId", 		"systemMapper.selectUserMenuList");
        hashMap.put("userMenu", 	innodaleDao.getList(hashMap));

        /** user first menu search **/
        hashMap.put("queryId", 		"systemMapper.selectUserFirstMenuView");
        hashMap.put("firstMenu", 	innodaleDao.getInfo(hashMap));

        model.addAttribute("result",		"success");

        return true;

    }
}
