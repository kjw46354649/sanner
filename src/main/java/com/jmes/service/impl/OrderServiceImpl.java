package com.jmes.service.impl;

import java.util.UUID;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.dao.OrderDao;
import com.jmes.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private InnodaleDao innodaleDao;
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
    public void removeControl(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("queryId", "orderMapper.removeControl");
            this.innodaleDao.remove(hashMap);
        }
    }

    @Override
    public void managerControlStatus(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("queryId", "orderMapper.updateControlRevision");
            this.innodaleDao.update(hashMap);
            hashMap.put("queryId", "orderMapper.updateControlBarcodeRevision");
            this.innodaleDao.update(hashMap);
            hashMap.put("queryId", "orderMapper.insertControlBarcodeRevision");
            this.innodaleDao.create(hashMap);
            hashMap.put("queryId", "orderMapper.updateControlStatus");
            this.innodaleDao.update(hashMap);
            hashMap.put("queryId", "orderMapper.createControlProgress");
            this.innodaleDao.create(hashMap);
            // 주문상태가 확정이고 외주이면 상태 변경
            if (hashMap.get("CONTROL_STATUS").equals("ORD001")) {
                String rules = "AND OUTSIDE_YN = 'Y'";
                hashMap.put("PART_STATUS", "PRO001");
                hashMap.put("_search", "true");
                hashMap.put("rules", rules);
                hashMap.put("queryId", "orderMapper.updateControlPartStatusAll");
                this.innodaleDao.update(hashMap);
            }
        }
    }

    @Override
    public void createMonthClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        ArrayList<HashMap<String, Object>> listData = null;
        ArrayList<HashMap<String, Object>> infoData = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<HashMap<String, Object>>() {});

        if (jsonMap.containsKey("list-data"))
            listData = (ArrayList<HashMap<String, Object>>) jsonMap.get("list-data");

        if (jsonMap.containsKey("info-data"))
            infoData = (ArrayList<HashMap<String, Object>>) jsonMap.get("info-data");

        if (listData != null && listData.size() > 0) {
            for (HashMap<String, Object> hashMap : listData) {
                hashMap.put("CONTROL_STATUS", "ORD003");
                this.orderDao.updateControlStatus(hashMap);
                this.orderDao.createControlProgress(hashMap);
                this.orderDao.createMonthClose(hashMap);
                this.orderDao.createMonthCloseDetail(hashMap);
            }
        }

        if (infoData != null && infoData.size() > 0) {
            for (HashMap<String, Object> hashMap : infoData) {
                this.orderDao.updateMonthCloseFinalNego(hashMap);
            }
        }
    }

    @Override
    public void removeMonthClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        ArrayList<HashMap<String, Object>> listData = null;
        ArrayList<HashMap<String, Object>> infoData = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<HashMap<String, Object>>() {});

        if (jsonMap.containsKey("list-data"))
            listData = (ArrayList<HashMap<String, Object>>) jsonMap.get("list-data");

        if (jsonMap.containsKey("info-data"))
            infoData = (ArrayList<HashMap<String, Object>>) jsonMap.get("info-data");

        if (listData != null && listData.size() > 0) {
            for (HashMap<String, Object> hashMap : listData) {
                hashMap.put("CONTROL_STATUS", null);
                this.orderDao.deleteMonthCloseDetail(hashMap);
                this.orderDao.deleteMonthClose(hashMap);
                this.orderDao.updateControlStatus(hashMap);
                this.orderDao.createControlProgress(hashMap);
            }
        }

        if (infoData != null && infoData.size() > 0) {
            for (HashMap<String, Object> hashMap : infoData) {
                this.orderDao.updateMonthCloseFinalNego(hashMap);
            }
        }
    }

    @Override
    public String createInvoice(Map<String, Object> map) throws Exception {
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

                if (invoiceNum == "") {
                    hashMap.put("queryId", "outMapper.createInvoiceNum");
                    invoiceNum = this.orderDao.createInvoiceNum(hashMap);
                    hashMap.put("INVOICE_NUM", invoiceNum);
                }
                this.orderDao.createInvoice(hashMap);
            }
        }

        if (listData != null && listData.size() > 0) {
            for (HashMap<String, Object> hashMap : listData) {
                hashMap.put("INVOICE_NUM", invoiceNum);
                this.orderDao.createInvoiceDetail(hashMap);
            }
        }

        return invoiceNum;
    }

    @Override
    public void removeInvoice(Map<String, Object> map) throws Exception {
        this.orderDao.removeInvoiceDetail(map);
        this.orderDao.removeInvoice(map);
    }
}
