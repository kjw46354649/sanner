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

    private final JwtTokenProvider jwtTokenProvider;

    private final ResponseService responseService;

    private final InnodaleService innodaleService;

    @ApiOperation(value = "시스템 로그인", notes = "시스템 로그인을 한다.")
    @GetMapping("/login")
    public SingleResult login(@ApiParam(value = "사업자 번호", required = true) @RequestParam String compNum,
                  @ApiParam(value = "업체 코드", required = true) @RequestParam String compCd
        ) throws Exception {

        HashMap<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("queryId", "tomesMapper.selectPortalLogin");
        paramMap.put("COMP_NUM", compNum);
        paramMap.put("COMP_CD", compCd);

        Map<String, Object> companyInfo = new HashMap<String, Object>();

        if("tomes".equals(compNum)){
            companyInfo.put("COMP_NUM", "TOMES");
            companyInfo.put("COMP_CD", "TOMES");
            companyInfo.put("COMP_NM", "TOMES");
            companyInfo.put("PORTAL_SHOW_YN", "Y");
        }else {
            companyInfo = innodaleService.getInfo(paramMap);
        }
        if(companyInfo == null) throw new CompanyNotFoundException();
        if("N".equals(companyInfo.get("PORTAL_SHOW_YN"))) throw new CompanyDisabledException();
        return responseService.getSingleResult(jwtTokenProvider.createToken(String.valueOf(companyInfo.get("COMP_NUM")),
                String.valueOf(companyInfo.get("COMP_CD")), String.valueOf(companyInfo.get("COMP_NM"))));

    }

}
