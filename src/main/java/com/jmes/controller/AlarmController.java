package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.AlarmService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
public class AlarmController {

    private static final Logger logger = LoggerFactory.getLogger(AlarmController.class);

    @Autowired
    public AlarmService alarmService;

    @Autowired
    public InnodaleService innodaleService;

    @RequestMapping("/Alarm/{ARM_CD}")
    public String alarmDashboard(@PathVariable String ARM_CD, Model model, HttpServletRequest request, Locale locale) throws Exception {
        logger.info(String.format("ARM_CD: {0}", ARM_CD));
        model.addAttribute("ARM_CD", ARM_CD);
        return "alarm/alarm_dashboard";
    }

    @RequestMapping(value = "/Alarm/stopAlarmData", method = RequestMethod.POST)
    public String insertStopAlarmData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        alarmService.insertNewStopAlarm(hashMap);
        model.addAttribute("data", hashMap.get("data"));
        return "jsonView";
    }

    @RequestMapping(value = "/Alarm/handleStopAlarm", method = RequestMethod.POST)
    public String updateStopAlarmData(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        alarmService.updateHandleStopAlarm(hashMap);
        model.addAttribute("data", hashMap.get("data"));
        return "jsonView";
    }

    @RequestMapping(value = "/Alarm/paramQueryGridSelect",  method=RequestMethod.POST)
    public String stopAlarmGridList(Model model, HttpServletRequest request, HttpSession session) throws Exception {
        Map<String, Object> hashMap = CommonUtility.getParameterMap(request);
        List<Map<String, Object>> list = this.innodaleService.getList(hashMap);
        model.addAttribute("data", list);
        return "jsonView";
    }
}
