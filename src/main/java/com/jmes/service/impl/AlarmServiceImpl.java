package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.AlarmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AlarmServiceImpl implements AlarmService {

    @Autowired
    public InnodaleDao innodaleDao;

    public void insertNewStopAlarm(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<HashMap<String, Object>>() {});
            jsonMap.put("queryId", "alarmMapper.insertAlarmList");
            innodaleDao.create(jsonMap);
        }
    }

    public void updateHandleStopAlarm(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<HashMap<String, Object>>() {});
            jsonMap.put("queryId", "alarmMapper.updateHandleAlarm");
            innodaleDao.create(jsonMap);
        }
    }

}
