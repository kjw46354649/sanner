package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ReportServiceImpl implements ReportService {

    @Autowired
    private InnodaleDao innodaleDao;

    @Override
    public void updateWorkingTime(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> oldList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        String[] weekDayArray = {"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"};

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("oldList"))
            oldList = (ArrayList<HashMap<String, Object>>) jsonMap.get("oldList");

        if (jsonMap.containsKey("updateList"))
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

        if (oldList.size() > 0) {
            for(int i = 0; i < oldList.size(); i++) {
                Set set = oldList.get(i).entrySet();
                Iterator iterator = set.iterator();

                while (iterator.hasNext()) {
                    HashMap<String, Object> hashMap = new HashMap<String, Object>();
                    Map.Entry entry = (Map.Entry) iterator.next();
                    String key = (String) entry.getKey();

                    hashMap.put("queryId", "reportMapper.updateWorkingWeekTime");
                    hashMap.put("WORKING_TIME", updateList.get(i).get(key));
                    hashMap.put("WORK_FACTORY", updateList.get(i).get("WORK_FACTORY"));
                    hashMap.put("WEEK_DAY", Arrays.asList(weekDayArray).indexOf(key));
                    this.innodaleDao.updateGrid(hashMap);
                }
            }
        }
    }
}
