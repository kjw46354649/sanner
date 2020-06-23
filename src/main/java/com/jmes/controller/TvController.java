package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.PopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
public class TvController {

    private static final Logger logger = LoggerFactory.getLogger(TvController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @RequestMapping(value="/tv/pop")
    public String popAction(Model model, HttpServletRequest request, Locale locale) throws Exception {

        System.out.println("12312312312 pop page submit");

        return "tv/tv_pop";
    }

    @RequestMapping(value = "/tv/pop/data", method = RequestMethod.POST)
    public String popData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        System.out.println("12312312312 popData");
        hashMap.put("queryId","tvMapper.selectTvPopList");//POP INFO
        List<Map<String, Object>> pop_list1 = this.innodaleService.getList(hashMap);
        model.addAttribute("pop_list1", pop_list1);

        hashMap.put("queryId","tvMapper.selectTvPopList2");//소재대기
        List<Map<String, Object>> pop_list2 = this.innodaleService.getList(hashMap);
        model.addAttribute("pop_list2", pop_list2);

        hashMap.put("queryId","tvMapper.selectTvPopList3");//외주진행
        List<Map<String, Object>> pop_list3 = this.innodaleService.getList(hashMap);
        model.addAttribute("pop_list3", pop_list3);

        hashMap.put("queryId","tvMapper.selectTvMachineList");//장비
        List<Map<String, Object>> m_list = this.innodaleService.getList(hashMap);
        model.addAttribute("m_list", m_list);


        return "jsonView";
    }

    @RequestMapping(value = "/tv/pop/alarm", method = RequestMethod.POST)
    public String alarmData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        System.out.println("12312312312 alarm");

        hashMap.put("queryId","tvMapper.selectTvAlarmList");
        List<Map<String, Object>> alarm_list = this.innodaleService.getList(hashMap);
        model.addAttribute("alarm_list", alarm_list);

        return "jsonView";
    }

    @RequestMapping(value="/tv/mct")
       public String mctAction(Model model, HttpServletRequest request, Locale locale) throws Exception {

           System.out.println("12312312312 mct page submit");

           return "tv/tv_mct";
       }

   @RequestMapping(value = "/tv/mct/data", method = RequestMethod.POST)
   public String mctData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
       Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
       System.out.println("12312312312 mctData");

       return "jsonView";
   }
}