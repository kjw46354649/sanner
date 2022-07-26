package com.jmes.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
import java.util.*;

@Controller
public class TvController {

    private static final Logger logger = LoggerFactory.getLogger(TvController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @RequestMapping(value="/tv/test")
    public String messageTest(Model model, HttpServletRequest request, Locale locale) throws Exception {
        return "tv/message";
    }

    @RequestMapping(value="/tv/pop")
    public String popAction(Model model, HttpServletRequest request, Locale locale) throws Exception {
        return "tv/tv_pop";
    }

    @RequestMapping(value = "/tv/pop/data", method = RequestMethod.POST)
    public String popData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        hashMap.put("queryId","tvMapper.selectTvPopList");//POP INFO
        List<Map<String, Object>> pop_list1 = this.innodaleService.getList(hashMap);
        model.addAttribute("pop_list1", pop_list1);

        List<Map<String, Object>> pop_list2 = getPopStatusList(hashMap);
        model.addAttribute("pop_list2", pop_list2);

        hashMap.put("queryId","tvMapper.selectTvMachineList");//장비
        List<Map<String, Object>> m_list = this.innodaleService.getList(hashMap);
        model.addAttribute("m_list", m_list);

        return "jsonView";
    }

    @RequestMapping(value = "/tv/pop/schedulerPopDrawingData", method = RequestMethod.POST)
    public String schedulerPopDrawingData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        hashMap.put("queryId","tvMapper.selectTvMachineList");//장비
        List<Map<String, Object>> m_list = this.innodaleService.getList(hashMap);
        model.addAttribute("m_list", m_list);

        List<Map<String, Object>> pop_list2 = getPopStatusList(hashMap);
        model.addAttribute("pop_list2", pop_list2);

        return "jsonView";
    }

    @RequestMapping(value = "/tv/pop/popLocationData", method = RequestMethod.POST)
    public String popLocationData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        hashMap.put("queryId","tvMapper.selectTvPopList");//장비
        List<Map<String, Object>> m_list = this.innodaleService.getList(hashMap);
        model.addAttribute("pop_list", m_list);

        return "jsonView";
    }

    @RequestMapping(value = "/tv/pop/statusData", method = RequestMethod.POST)
    public String statusData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        List<Map<String, Object>> pop_list2 = getPopStatusList(hashMap);
        model.addAttribute("pop_list2", pop_list2);

        return "jsonView";
    }

    @RequestMapping(value="/tv/mct")
       public String mctAction(Model model, HttpServletRequest request, Locale locale) throws Exception {
           return "tv/tv_mct";
       }

   @RequestMapping(value = "/tv/mct/data", method = RequestMethod.POST)
   public String mctData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
       Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
//       System.out.println("12312312312 mctData");

       hashMap.put("queryId","tvMapper.selectMctAreInfoList");//mct info
       List<Map<String, Object>> mct_info_list = this.innodaleService.getList(hashMap);
       model.addAttribute("mct_info_list", mct_info_list);

       hashMap.put("queryId","tvMapper.selectMctAreList");//mct info
       List<Map<String, Object>> mct_list = this.innodaleService.getList(hashMap);
       model.addAttribute("mct_list", mct_list);

        hashMap.put("queryId","tvMapper.selectMctGridList");//불량/반품
        List<Map<String, Object>> grid_list1 = this.innodaleService.getList(hashMap);
        model.addAttribute("grid_list1", grid_list1);

//       hashMap.put("queryId","tvMapper.selectMctGrid2List");//긴급주문
//       List<Map<String, Object>> grid_list2 = this.innodaleService.getList(hashMap);
//       model.addAttribute("grid_list2", grid_list2);
//
//       hashMap.put("queryId","tvMapper.selectMctGrid3List");//납기지연 목록
//       List<Map<String, Object>> grid_list3 = this.innodaleService.getList(hashMap);
//       model.addAttribute("grid_list3", grid_list3);


       String jsonObject = (String) hashMap.get("data");
       ObjectMapper objectMapper = new ObjectMapper();
       Map<String, Object> jsonMap = null;

       if (jsonObject != null) {
           jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});
       }
       hashMap.put("FACTORY_TYPE", jsonMap.get("FACTORY_TYPE"));
       hashMap.put("queryId","tvMapper.selectMctInfo");//mct가동률 및 기타.
       Map<String, Object> mct_info = this.innodaleService.getInfo(hashMap);
       model.addAttribute("mct_rate", mct_info);

       return "jsonView";
   }

    @RequestMapping(value = "/tv/mct/mctAreInfo", method = RequestMethod.POST)
    public String mctAreInfo(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

        hashMap.put("queryId","tvMapper.selectMctAreInfoList");//mct info
        List<Map<String, Object>> mct_info_list = this.innodaleService.getList(hashMap);
        model.addAttribute("mct_info_list", mct_info_list);

        hashMap.put("queryId","tvMapper.selectMctAreList");//mct info
        List<Map<String, Object>> mct_list = this.innodaleService.getList(hashMap);
        model.addAttribute("mct_list", mct_list);

        return "jsonView";
    }

   @RequestMapping(value = "/tv/mct/gridDataList", method = RequestMethod.POST)
   public String gridDataList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
       Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

//        hashMap.put("queryId","tvMapper.selectMctGrid1List");//불량/반품
//        List<Map<String, Object>> grid_list1 = this.innodaleService.getList(hashMap);
//        model.addAttribute("grid_list1", grid_list1);
//
//       hashMap.put("queryId","tvMapper.selectMctGrid2List");//긴급주문
//       List<Map<String, Object>> grid_list2 = this.innodaleService.getList(hashMap);
//       model.addAttribute("grid_list2", grid_list2);
//
//       hashMap.put("queryId","tvMapper.selectMctGrid3List");//납기지연 목록
//       List<Map<String, Object>> grid_list3 = this.innodaleService.getList(hashMap);
//       model.addAttribute("grid_list3", grid_list3);


       String jsonObject = (String) hashMap.get("data");
       ObjectMapper objectMapper = new ObjectMapper();
       Map<String, Object> jsonMap = null;

       if (jsonObject != null) {
           jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});
       }

       hashMap.put("FACTORY_TYPE", jsonMap.get("FACTORY_TYPE"));
       hashMap.put("queryId","tvMapper.selectMctInfo");//mct가동률 및 기타.
       Map<String, Object> mct_info = this.innodaleService.getInfo(hashMap);
       model.addAttribute("mct_rate", mct_info);

       return "jsonView";
   }

   @RequestMapping(value = "/tv/mct/machineDrawingData", method = RequestMethod.POST)
   public String machineDrawingData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
       Map<String, Object> hashMap = CommonUtility.getParameterMap(request);

       hashMap.put("queryId","tvMapper.selectMctAreInfoList");//mct info
       List<Map<String, Object>> mct_drawing_list = this.innodaleService.getList(hashMap);
       model.addAttribute("mct_drawing_list", mct_drawing_list);

       return "jsonView";
   }
   @RequestMapping(value = "/tv/json-info",  method=RequestMethod.POST)
   public String jsonInfo(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        model.addAttribute("info", this.innodaleService.getInfo(hashMap));
        return "jsonView";
   }
    @RequestMapping(value = "/tv/json-list",  method=RequestMethod.POST)
    public String jsonList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        model.addAttribute("list", this.innodaleService.getList(hashMap));
        return "jsonView";
    }

    @RequestMapping(value = "/tv/paramQueryGridSelect",  method=RequestMethod.POST)
    public String dHtmlGridList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        List<Map<String, Object>> list = this.innodaleService.getList(hashMap);
        model.addAttribute("data", list);
        return "jsonView";
    }

    public List<Map<String, Object>> getPopStatusList(Map<String, Object> hashMap) throws Exception {
        Map<String,Object> copyMap = hashMap;

        copyMap.put("queryId","tvMapper.selectTvPopStatusList");// 소재대기(PRO004), 가공대기(PRO002), 가공중(PRO007), 가공완료(PRO009), 표면/후가공(PRO012,PRO014)
        List<Map<String, Object>> tempList = this.innodaleService.getList(copyMap);

        int sumCnt = 0;
        int sumCnt2 = 0;
        int sumQty = 0;
        int sumQty2 = 0;
        for(Map<String, Object> temp : tempList) {
            if(temp.get("PART_STATUS") != null) {
                String partStatus = (String) temp.get("PART_STATUS");
                if("PRO012".equals(partStatus) || "PRO014".equals(partStatus)) {
                    sumCnt += Integer.parseInt(String.valueOf(temp.get("TOTAL_CNT")));
                    sumQty += Integer.parseInt(String.valueOf(temp.get("TOTAL_QTY")));
                }
                if("PRO013".equals(partStatus) || "PRO015".equals(partStatus)) {
                    sumCnt2 += Integer.parseInt(String.valueOf(temp.get("TOTAL_CNT")));
                    sumQty2 += Integer.parseInt(String.valueOf(temp.get("TOTAL_QTY")));
                }
            }
        }
        Map<String, Object> tempMap = new HashMap<>();
        tempMap.put("PART_STATUS","PRO01214");
        tempMap.put("TOTAL_QTY",sumQty);
        tempMap.put("TOTAL_CNT",sumCnt);

        Map<String, Object> tempMap2 = new HashMap<>();
        tempMap2.put("PART_STATUS","PRO01315");
        tempMap2.put("TOTAL_QTY",sumQty2);
        tempMap2.put("TOTAL_CNT",sumCnt2);

        tempList.add(tempMap);
        tempList.add(tempMap2);

        hashMap.put("queryId","tvMapper.selectTvPopReturn");// 반품
        List<Map<String, Object>> tempList1 = this.innodaleService.getList(hashMap);
        tempList.addAll(tempList1);

        hashMap.put("queryId","tvMapper.selectTvPopPending");// 보류
        tempList1 = this.innodaleService.getList(hashMap);
        tempList.addAll(tempList1);

        return tempList;
    }

}
