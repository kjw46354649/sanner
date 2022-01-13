package com.tomes.config;

import com.framework.innodale.component.CommonUtility;
import com.tomes.domain.CommonResult;
import com.tomes.exception.AuthenticationFailException;
import com.tomes.exception.CompanyDisabledException;
import com.tomes.exception.CompanyNotFoundException;
import com.tomes.exception.TokenException;
import com.tomes.service.ResponseService;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RequiredArgsConstructor
@RestControllerAdvice
public class ExceptionAdvice {

    @Autowired
    private ResponseService responseService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    protected CommonResult exception(HttpServletRequest request, Exception e) {

        insertErrorLog(request,e);

        e.printStackTrace();
        return responseService.getFailResult(Integer.parseInt(getMessage("unKnown.code")), getMessage("unKnown.msg"));
    }

    @ExceptionHandler(AuthenticationFailException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    protected CommonResult authenticationFailException(HttpServletRequest request, AuthenticationFailException e) {
        e.printStackTrace();
        return responseService.getFailResult(Integer.parseInt(getMessage("authenticationFailException.code")), getMessage("authenticationFailException.msg"));
    }

    @ExceptionHandler(CompanyNotFoundException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    protected CommonResult companyNotFoundException(HttpServletRequest request, CompanyNotFoundException e) {
        e.printStackTrace();
        return responseService.getFailResult(Integer.parseInt(getMessage("companyNotFound.code")), getMessage("companyNotFound.msg"));
    }

    @ExceptionHandler(CompanyDisabledException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    protected CommonResult companyDisabledException(HttpServletRequest request, CompanyDisabledException e) {
        return responseService.getFailResult(Integer.parseInt(getMessage("companyDisabled.code")), getMessage("companyDisabled.msg"));
    }

    @ExceptionHandler(TokenException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public CommonResult tokenException(HttpServletRequest request, TokenException e) {
        return responseService.getFailResult(Integer.parseInt(getMessage("tokenException.code")), getMessage("tokenException.msg"));
    }

    // code정보에 해당하는 메시지를 조회합니다.
    private String getMessage(String code) {
        return getMessage(code, null);
    }

    // code정보, 추가 argument로 현재 locale에 맞는 메시지를 조회합니다.
    private String getMessage(String code, Object[] args) {
        return messageSource.getMessage(code, args, LocaleContextHolder.getLocale());
    }
    private void insertErrorLog(HttpServletRequest request, Exception e) {

        try {
            HashMap<String,Object> requestMap = CommonUtility.getParameterMap(request);

            HashMap<String,Object> hashMap = new HashMap<>();
            hashMap.put("queryId","common.insertErrorLog");
            hashMap.put("REQUEST_URL",request.getRequestURI());
            hashMap.put("ERROR_NAME",e.getClass().getName());
            hashMap.put("ERROR_MSG",e.getMessage());
            hashMap.put("REQUEST_PARAM",requestMap.toString());
            hashMap.put("LOGIN_USER_ID",requestMap.get("LOGIN_USER_ID"));

            sqlSessionTemplate.insert((String)hashMap.get("queryId"), hashMap);

        }catch (Exception exception) {
            exception.printStackTrace();
        }
    }

}
