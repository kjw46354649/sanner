package com.tomes.controller;

import com.framework.innodale.service.InnodaleService;
import com.tomes.config.JwtTokenProvider;
import com.tomes.domain.ListResult;
import com.tomes.service.ResponseService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Api(tags = {"02. Order"})
@RequiredArgsConstructor
@RestController
@RequestMapping("/tomes")
@CrossOrigin
public class TomesOrderController {

    @Autowired
    private ResponseService responseService;

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    public JwtTokenProvider jwtTokenProvider;

    @ApiImplicitParams({
        @ApiImplicitParam(name = "X-AUTH-TOKEN", value = "로그인 성공 후 access_token", required = true, dataType = "String", paramType = "header")
    })
    @ApiOperation(value = "Buyer Order 리스트 조회", notes = "Buyer Order 리스트 조회한다.")
    @GetMapping("/order")
    public ListResult order(@ApiParam(value = "조회 시작 일자 (YYYYmmdd)", required = true) @RequestParam String startDt,
                @ApiParam(value = "조회 시작 일자 (YYYYmmdd)", required = true) @RequestParam String endDt,
                HttpServletRequest request) throws Exception {

        Map<String, Object> paramMap = new HashMap<String, Object>();

        String compCd = jwtTokenProvider.getTokenBody(jwtTokenProvider.resolveToken(request));

        paramMap.put("COMP_CD", compCd);
        paramMap.put("START_DT", startDt);
        paramMap.put("END_DT", endDt);
        paramMap.put("queryId", "tomesMapper.selectPortalOrderMasterList");

        return responseService.getListResult(innodaleService.getList(paramMap));
    }

    @ApiImplicitParams({
        @ApiImplicitParam(name = "X-AUTH-TOKEN", value = "로그인 성공 후 access_token", required = true, dataType = "String", paramType = "header")
    })
    @ApiOperation(value = "Buyer Order 상세 리스트 조회", notes = "Buyer Order 리스트 상세 조회한다.")
    @GetMapping("/order/{rowKey}")
    public ListResult orderDetail(@ApiParam(value = "발주 번호", required = true) @PathVariable String rowKey,
            @ApiParam(value = "조회 시작 일자 (YYYYmmdd)", required = true) @RequestParam String startDt,
            @ApiParam(value = "조회 시작 일자 (YYYYmmdd)", required = true) @RequestParam String endDt,
            HttpServletRequest request) throws Exception {

        Map<String, Object> paramMap = new HashMap<String, Object>();

        String compCd = jwtTokenProvider.getTokenBody(jwtTokenProvider.resolveToken(request));

        paramMap.put("ROW_KEY", rowKey);
        paramMap.put("COMP_CD", compCd);
        paramMap.put("START_DT", startDt);
        paramMap.put("END_DT", endDt);
        paramMap.put("queryId", "tomesMapper.selectPortalOrderDetailList");

        return responseService.getListResult(innodaleService.getList(paramMap));
    }

}
