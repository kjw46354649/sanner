package com.tomes.controller;

import com.framework.innodale.service.InnodaleService;
import com.tomes.config.JwtTokenProvider;
import com.tomes.domain.SingleResult;
import com.tomes.exception.CompanyDisabledException;
import com.tomes.exception.CompanyNotFoundException;
import com.tomes.service.ResponseService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Api(tags = {"01. Authorize"})
@RequiredArgsConstructor
@RestController
@RequestMapping("/tomes")
@CrossOrigin
public class TomesAuthorizeController {

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Autowired
    private ResponseService responseService;

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @ApiOperation(value = "시스템 로그인", notes = "시스템 로그인을 한다.")
    @GetMapping("/login")
    public SingleResult login(@ApiParam(value = "사업자 번호", required = true) @RequestParam String compNum) throws Exception {

        HashMap<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("queryId", "tomesMapper.selectPortalLogin");
        paramMap.put("COMP_NUM", compNum);

        Map<String, Object> companyInfo = innodaleService.getInfo(paramMap);

        if(companyInfo == null) throw new CompanyNotFoundException();

        if("N".equals(companyInfo.get("PORTAL_SHOW_YN"))) throw new CompanyDisabledException();

        return responseService.getSingleResult(jwtTokenProvider.createToken(String.valueOf(companyInfo.get("COMP_NUM")),
                String.valueOf(companyInfo.get("COMP_CD")), String.valueOf(companyInfo.get("COMP_NM"))));

    }

//    @ApiImplicitParams({
//        @ApiImplicitParam(name = "X-AUTH-TOKEN", value = "로그인 성공 후 access_token", required = true, dataType = "String", paramType = "header")
//    })
//    @ApiOperation(value = "시스템 사용가능 여부확인", notes = "시스템 사용 가능 여부를 확인 한다.")
//    @GetMapping("/company/{compNum}")
//    public SingleResult buyer(@ApiParam(value = "업체코드", required = true) @RequestParam String compNum) throws Exception {
//
//        HashMap<String, Object> paramMap = new HashMap<String, Object>();
//
//        paramMap.put("COMP_CD", compNum);
//        paramMap.put("queryId", "systemMapper.getUserAuthorize");
//
//        return responseService.getSingleResult(innodaleService.getInfo(paramMap));
//    }

}
