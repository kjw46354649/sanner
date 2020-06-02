package com.jmes.service.impl;

import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private InnodaleDao innodaleDao;

    @Override
    public boolean userAuthorizeCheck(HttpServletRequest request, Model model, Map<String, Object> hashMap) throws Exception {

        boolean bReturnValue = false;

        String userInputPw = String.valueOf(hashMap.get("userPassword"));

        /** Wave 시스템 사용자 인증 조회 **/
        hashMap.put("user_id", 		String.valueOf(hashMap.get("userId")));
        hashMap.put("queryId", 		"systemMapper.selectLoginUserInfo");

        Map<String, Object> userInfo = innodaleDao.getInfo(hashMap);

        model.addAttribute("result",		"error");
        if(userInfo == null) {
            hashMap.put("autoReturnCode",		"REC0001");
            return bReturnValue;
        }else if("0".equals(String.valueOf(userInfo.get("DEL_YN")))){
            hashMap.put("autoReturnCode",		"REC0002");
            return bReturnValue;
        }else if(!userInputPw.equals(String.valueOf(userInfo.get("USER_PWD")))){
            hashMap.put("autoReturnCode",		"REC0003");
            return bReturnValue;
        }

        /** user infomation **/
        hashMap.put("userInfo", 	userInfo);
        hashMap.put("ROLE_SEQ", 	userInfo.get("ROLE_SEQ"));

        /** user Menu search list **/
        hashMap.put("queryId", 		"systemMapper.selectSessionMenuList");
        hashMap.put("userMenu", 	innodaleDao.getList(hashMap));

        model.addAttribute("result",		"success");

        return true;

    }
}
