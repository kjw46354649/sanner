package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jmes.dao.OrderDao;
import com.jmes.dao.OutDao;
import com.jmes.service.OutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class OutServiceImpl implements OutService {
    @Autowired
    public OrderDao orderDao;

    @Autowired
    public OutDao outDao;

    @Override
    public void modifyOutsideOrder(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
//            hashMap.put("CONTROL_STATUS", "ORD001");
            hashMap.put("OUTSIDE_YN", "N");
//            this.orderDao.updateControlMaster(hashMap);
            this.orderDao.updateControlPart(hashMap);
        }
    }

    @Override
    public void createOutsideClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("OUTSIDE_STATUS", "OST004");
            this.outDao.updateOutsideCloseRequest(hashMap);
            this.outDao.createOutsideClose(hashMap);
            this.outDao.createOutsideCloseHistory(hashMap);
        }
    }

    @Override
    public void managerRequestOutside(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<HashMap<String, Object>>() {});

//            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

//        if (jsonSendObject != null)
//            jsonMap = objectMapper.readValue(jsonSaveObject, new TypeReference<Map<String, Object>>() {});
        System.out.println(jsonMap);

//        for (HashMap<String, Object> hashMap : jsonArray) {
//            hashMap.put("OUTSIDE_STATUS", "OST004");
//            this.outDao.updateOutsideCloseRequest(hashMap);
//            this.outDao.createOutsideClose(hashMap);
//            this.outDao.createOutsideCloseHistory(hashMap);
//        }
    }
}
