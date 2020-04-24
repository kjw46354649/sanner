package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jmes.dao.OrderDao;
import com.jmes.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    public OrderDao orderDao;

    @Override
    public void registerNewOrder(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> hashMap = new HashMap<String, Object>();

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {
            });
        }
        hashMap.put("list", jsonMap);

        this.orderDao.insertControlMaster(hashMap);
        this.orderDao.insertControlPart(hashMap);
        this.orderDao.insertControlPartOrder(hashMap);
    }

    @Override
    public void registerNewOrderConfirm(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> hashMap = new HashMap<String, Object>();

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {
            });
        }
        hashMap.put("list", jsonMap);

        this.orderDao.insertControlMaster(hashMap);
        this.orderDao.insertControlPart(hashMap);
        this.orderDao.insertControlPartOrder(hashMap);
        this.orderDao.insertControlProgressList(hashMap);
    }

    @Override
    public List<Map<String, Object>> selectControlCloseRightList(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) jsonMap.get("list");

        return this.orderDao.selectControlCloseRightList(jsonMap);
    }

    @Override
    public void insertMonthFinishClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("CONTROL_STATUS", "ORD003");
            this.orderDao.updateControlStatus(hashMap);
            this.orderDao.insertControlProgress(hashMap);
            this.orderDao.insertMonthFinishClose(hashMap);
            this.orderDao.insertMonthFinishCloseHistory(hashMap);
        }
    }
}
