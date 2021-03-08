package com.tomes.config;

import com.tomes.domain.CommonResult;
import com.tomes.exception.AuthenticationFailException;
import com.tomes.exception.CompanyDisabledException;
import com.tomes.exception.CompanyNotFoundException;
import com.tomes.exception.TokenException;
import com.tomes.service.ResponseService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@RestControllerAdvice
public class ExceptionAdvice {

    @Autowired
    private ResponseService responseService;

    @Autowired
    private MessageSource messageSource;

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    protected CommonResult exception(HttpServletRequest request, Exception e) {
        return responseService.getFailResult(Integer.parseInt(getMessage("unKnown.code")), getMessage("unKnown.msg"));
    }

    @ExceptionHandler(AuthenticationFailException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    protected CommonResult authenticationFailException(HttpServletRequest request, AuthenticationFailException e) {
        return responseService.getFailResult(Integer.parseInt(getMessage("authenticationFailException.code")), getMessage("authenticationFailException.msg"));
    }

    @ExceptionHandler(CompanyNotFoundException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    protected CommonResult companyNotFoundException(HttpServletRequest request, CompanyNotFoundException e) {
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

}
