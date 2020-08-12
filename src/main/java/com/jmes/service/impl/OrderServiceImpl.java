package com.jmes.service.impl;

import java.sql.SQLException;
import java.util.UUID;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.dao.OrderDao;
import com.jmes.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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

        hashMap.put("queryId", "orderMapper.createControlExcel");
        this.innodaleDao.create(hashMap);
        hashMap.put("queryId", "procedure.SP_CONTROL_EXCEL_BATCH");
        this.innodaleDao.create(hashMap);
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

        hashMap.put("queryId", "orderMapper.createControlExcel");
        this.innodaleDao.create(hashMap);
        hashMap.put("queryId", "procedure.SP_CONTROL_EXCEL_BATCH");
        this.innodaleDao.create(hashMap);
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
                hashMap.put("queryId", "orderMapper.updateControlStatus");
                this.innodaleDao.update(hashMap);
                hashMap.put("queryId", "orderMapper.createControlProgress");
                this.innodaleDao.create(hashMap);
                hashMap.put("queryId", "orderMapper.createMonthClose");
                this.innodaleDao.create(hashMap);
                hashMap.put("queryId", "orderMapper.createMonthCloseDetail");
                this.innodaleDao.create(hashMap);
            }
        }

        if (infoData != null && infoData.size() > 0) {
            for (HashMap<String, Object> hashMap : infoData) {
                hashMap.put("queryId", "orderMapper.updateMonthCloseFinalNego");
                this.innodaleDao.update(hashMap);
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
                hashMap.put("queryId", "orderMapper.deleteMonthCloseDetail");
                this.innodaleDao.remove(hashMap);
                hashMap.put("queryId", "orderMapper.deleteMonthClose");
                this.innodaleDao.remove(hashMap);
                hashMap.put("queryId", "orderMapper.updateControlStatus");
                this.innodaleDao.update(hashMap);
                hashMap.put("queryId", "orderMapper.createControlProgress");
                this.innodaleDao.create(hashMap);
            }
        }

        if (infoData != null && infoData.size() > 0) {
            for (HashMap<String, Object> hashMap : infoData) {
                hashMap.put("queryId", "orderMapper.updateMonthCloseFinalNego");
                this.innodaleDao.update(hashMap);
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

                if (invoiceNum.equals("")) {
                    invoiceNum = this.orderDao.createInvoiceNum(hashMap);
                    hashMap.put("INVOICE_NUM", invoiceNum);
                }
                hashMap.put("queryId", "orderMapper.createInvoice");
                this.innodaleDao.create(hashMap);
            }
        }

        if (listData != null && listData.size() > 0) {
            for (HashMap<String, Object> hashMap : listData) {
                hashMap.put("INVOICE_NUM", invoiceNum);
                hashMap.put("queryId", "orderMapper.createInvoiceDetail");
                this.innodaleDao.create(hashMap);
                hashMap.put("queryId", "inspection.updateControlPartOrderPackingCnt1");
                this.innodaleDao.update(hashMap);
                hashMap.put("queryId", "inspection.updateControlPartOrderPackingCnt2");
                this.innodaleDao.update(hashMap);
                hashMap.put("queryId", "inspection.insertControlPartOrderPackingCnt3");
                this.innodaleDao.create(hashMap);
            }
        }

        return invoiceNum;
    }

    @Override
    public void removeInvoice(Map<String, Object> map) throws Exception {
        map.put("queryId", "orderMapper.removeInvoiceDetail");
        this.innodaleDao.remove(map);
        map.put("queryId", "orderMapper.removeInvoice");
        this.innodaleDao.remove(map);
    }

    @Override
    public void processConfirmBarcodeInfo(Model model, Map<String, Object> map) throws SQLException {
        String barcodeNum = (String) map.get("BARCODE_NUM");
        String type = (String) map.get("TYPE");
        boolean flag = false;
        String message = "";

        if (barcodeNum != null) {
            // 유효한 바코드인지 확인
            map.put("queryId", "orderMapper.selectIsbarcodeValid");
            if (this.orderDao.getFlag(map)) {
                flag = true;
                message = "최신 도면이 아닙니다.";
            }
            // 주문상태가 확정인지 확인
            map.put("queryId", "orderMapper.selectHasControlStatusConfirm");
            if (this.orderDao.getFlag(map) && !flag) {
                flag = true;
                message = "먼저 가공확정을 해주세요.";
            }

            if (type.equals("confirm")) {
                // 이미 가공확정 됐는지 확인
                map.put("queryId", "orderMapper.selectHasPartStatusConfirm");
                if (this.orderDao.getFlag(map) && !flag) {
                    flag = true;
                    message = "이미 확정된 도면입니다.";
                }
                // 외주인지 확인
                map.put("queryId", "orderMapper.selectHasInOutside");
                if (this.orderDao.getFlag(map) && !flag) {
                    flag = true;
                    message = "외주 관리번호는 가공확정을 할수 없습니다.";
                }
            } else if (type.equals("conversion")) {
                // 이미 가공확정 됐는지 확인
                map.put("queryId", "orderMapper.selectHasPartStatusConfirm");
                if (this.orderDao.getFlag(map) && !flag) {
                    flag = true;
                    message = "주문 확정 상태로 변경해주세요.";
                }
                // 이미 외주전환 됐는지 확인
                map.put("queryId", "orderMapper.selectHasPartStatusConversion");
                if (this.orderDao.getFlag(map) && !flag) {
                    flag = true;
                    message = "이미 외주전환 된 도면입니다.";
                }
                // 소재입고 확인
                map.put("queryId", "orderMapper.selectHasInStockFromBarcode");
                if (this.orderDao.getFlag(map) && !flag) {
                    flag = true;
                    message = "소재 주문완료된 대상입니다.";
                }
                // 출고 확인
                map.put("queryId", "orderMapper.selectHasOut");
                if (this.orderDao.getFlag(map) && !flag) {
                    flag = true;
                    message = "이미 출고된 대상입니다.";
                }
            }

            model.addAttribute("flag", flag);
            model.addAttribute("message", message);
        }
    }
}
