package com.tomes.controller;

import com.framework.innodale.service.InnodaleService;
import com.tomes.domain.ListResult;
import com.tomes.service.ResponseService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Api(tags = {"03. Company"})
@RequiredArgsConstructor
@RestController
@RequestMapping("/tomes")
@CrossOrigin
public class TomesCompanyController {

    private final ResponseService responseService;

    private final InnodaleService innodaleService;

    @ApiImplicitParams({
        @ApiImplicitParam(name = "X-AUTH-TOKEN", value = "로그인 성공 후 access_token", required = true, dataType = "String", paramType = "header")
    })
    @ApiOperation(value = "시스템 업체 정보 조회", notes = "ToMES Portal 시스템에서 사용가능한 업체 정보 리스트를 보여준다..")
    @GetMapping("/company/order")
    public ListResult<Map<String, Object>> company() throws Exception {

      HashMap<String, Object> paramMap = new HashMap<String, Object>();

      paramMap.put("queryId", "tomesMapper.selectOrderCompanyList");

      return responseService.getListResult(innodaleService.getList(paramMap));
    }

}
