package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.BarcodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class BarcodeController {

    @Autowired
    private BarcodeService barcodeService;

    /**
     *
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/barcodePrint")
    public String barcodePrint(Model model, HttpServletRequest request) throws Exception {

        model.addAttribute("result", "false");
        model.addAttribute("message", "바코드 프린트중 에러가 발생하였습니다.");

        Map<String, Object> map = CommonUtility.getParameterMap(request);
        barcodeService.print(map, model);

        return "jsonView";
    }

}
