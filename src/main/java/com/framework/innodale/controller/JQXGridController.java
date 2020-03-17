package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.component.Pagging;
import com.framework.innodale.service.InnodaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class JQXGridController {

    @Autowired
    public InnodaleService innodaleService;

    @Autowired
    @Qualifier("pagging")
    public Pagging pagging;


    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/jqxGridSelect")
    public String dHtmlGridList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        List<Map<String, Object>> list = this.innodaleService.getList(hashMap);

        //System.out.println("list=[" + list.toString() + "]");

        model.addAttribute("data", list);

        return "jsonView";
    }

    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/jqxGridPageSelect")
    public String dHtmlGridPageList(Model model, @RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum,
                                    @RequestParam(value="pagesize", required=false, defaultValue="10") int pagesize,
                                    HttpServletRequest request, HttpSession session) throws Exception {

        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        pagging.setCurrPage(pagenum + 1);
        pagging.setMaxPage(pagesize);

        hashMap.put("LIMIT_START", pagging.getStartCount());
        hashMap.put("LIMIT_END", pagging.getMaxPage());

        this.innodaleService.getPageList(hashMap);

        @SuppressWarnings("unchecked")
        List<Map<String, Object>> dataList = (List<Map<String, Object>>)hashMap.get("pageList");

        model.addAttribute("data", dataList);
        model.addAttribute("totalRecords", (int)hashMap.get("totalRecords"));

        /*if(dataList.size() > 0)
        	model.addAttribute("totalRecords", this.yframeService.getPageTotalCount());
        else
        	model.addAttribute("totalRecords", 0);*/

        return "jsonView";
    }

}

