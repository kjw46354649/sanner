package com.jmes.service.impl;

import java.util.UUID;
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
    public void createNewOrder(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> hashMap = new HashMap<String, Object>();
        String uuid = UUID.randomUUID().toString();

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }

        hashMap.put("list", jsonMap);
        hashMap.put("IN_UID", uuid);

        this.orderDao.createControlExcel(hashMap);
        this.orderDao.createControlExcelBatch(hashMap);
    }

    @Override
    public void createNewOrderConfirm(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> hashMap = new HashMap<String, Object>();
        String uuid = UUID.randomUUID().toString();

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }

        for (Map<String, Object> tempMap : jsonMap) {
            tempMap.put("CONTROL_STATUS", "ORD001");
        }

        hashMap.put("list", jsonMap);
        hashMap.put("IN_UID", uuid);

        this.orderDao.createControlExcel(hashMap);
        this.orderDao.createControlExcelBatch(hashMap);
    }

    @Override
    public void createMonthFinishClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        HashMap<String, Object> infoData = null;
        ArrayList<HashMap<String, Object>> listData = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<HashMap<String, Object>>() {});

        if (jsonMap.containsKey("info-data"))
            infoData = (HashMap<String, Object>) jsonMap.get("info-data");

        if (jsonMap.containsKey("list-data"))
            listData = (ArrayList<HashMap<String, Object>>) jsonMap.get("list-data");

        if (listData != null && listData.size() > 0) {
            for (HashMap<String, Object> hashMap : listData) {
                hashMap.put("CONTROL_STATUS", "ORD003");
                this.orderDao.updateControlStatus(hashMap);
                this.orderDao.createControlProgress(hashMap);
                this.orderDao.createMonthFinishClose(hashMap);
                this.orderDao.createMonthFinishCloseHistory(hashMap);
            }
        }

        if (infoData != null && infoData.size() > 0) {
            this.orderDao.updateMonthCloseFinalNego(infoData);
        }
    }

    @Override
    public void removeMonthClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("CONTROL_STATUS", null);
            this.orderDao.deleteMonthCloseDetail(hashMap);
            this.orderDao.deleteMonthClose(hashMap);
            this.orderDao.updateControlStatus(hashMap);
            this.orderDao.createControlProgress(hashMap);
        }
    }

    @Override
    public void createInvoice(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        ArrayList<HashMap<String, Object>> infoData = null;
        ArrayList<HashMap<String, Object>> listData = null;
        String invoiceNum = "";

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<HashMap<String, Object>>() {});

        if (jsonMap.containsKey("info-data"))
            infoData = (ArrayList<HashMap<String, Object>>) jsonMap.get("info-data");

        if (jsonMap.containsKey("list-data"))
            listData = (ArrayList<HashMap<String, Object>>) jsonMap.get("list-data");

        if (infoData != null && infoData.size() > 0) {
            for (HashMap<String, Object> hashMap : infoData) {
                invoiceNum = (String) hashMap.get("INVOICE_NUM");
                this.orderDao.createInvoice(hashMap);
            }
        }

        if (listData != null && listData.size() > 0) {
            for (HashMap<String, Object> hashMap : listData) {
                hashMap.put("INVOICE_NUM", invoiceNum);
                this.orderDao.createInvoiceDetail(hashMap);
            }
        }
    }

    @Override
    public void removeInvoice(Map<String, Object> map) throws Exception {
        this.orderDao.removeInvoiceDetail(map);
        this.orderDao.removeInvoice(map);
    }
}
