package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.component.Pagging;
import com.framework.innodale.service.InnodaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class DhtmlxGridController {

    @Autowired
    public InnodaleService innodaleService;

    @Autowired
    @Qualifier("pagging")
    public Pagging pagging;


    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/dHtmlGrid-list")
    public String dHtmlGridList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        List<Map<String, Object>> list = this.innodaleService.getList(hashMap);

        model.addAttribute("data", list);
        model.addAttribute("total_count", list.size());
        model.addAttribute("pos", 0);
        return "jsonView";
    }
}
