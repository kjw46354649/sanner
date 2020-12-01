package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.entity.MessageType;
import com.framework.innodale.entity.NotificationMessage;
import com.jmes.dao.OrderDao;
import com.jmes.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private InnodaleDao innodaleDao;
    @Autowired
    public OrderDao orderDao;
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @Override
    public void createNewOrder(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> hashMap = new HashMap<String, Object>();
        String uuid = UUID.randomUUID().toString();
        List<Map<String, Object>> duplicationList;

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }

        hashMap.put("list", jsonMap);
        hashMap.put("IN_UID", uuid);

        hashMap.put("queryId", "orderMapper.createControlExcel");
        this.innodaleDao.create(hashMap);
        hashMap.put("queryId", "orderMapper.selectBeforeInsertDuplicationControlList");
        duplicationList = this.innodaleDao.getList(hashMap);
        if (duplicationList.size() > 0) {
            model.addAttribute("list", duplicationList);
        } else {
            hashMap.put("queryId", "procedure.SP_CONTROL_EXCEL_BATCH");
            this.innodaleDao.create(hashMap);
        }

        hashMap.put("queryId", "orderMapper.deleteControlExcel");
        this.innodaleDao.remove(hashMap);
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
            hashMap.put("queryId", "orderMapper.updateOutsideConfirmDt");
            this.innodaleDao.update(hashMap);

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
                hashMap.put("CONTROL_STATUS", "ORD001");
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
//                hashMap.put("queryId", "inspection.updateControlPartOrderPackingCnt1");
//                this.innodaleDao.update(hashMap);
//                hashMap.put("queryId", "inspection.updateControlPartOrderPackingCnt2");
//                this.innodaleDao.update(hashMap);
//                hashMap.put("queryId", "inspection.insertControlPartOrderPackingCnt3");
//                this.innodaleDao.create(hashMap);
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
    public void processConfirmBarcodeInfo(Model model, Map<String, Object> map) throws Exception {
        String barcodeNum = (String) map.get("BARCODE_NUM");
        String type = (String) map.get("TYPE");
        boolean flag = false;
        String message = "";

        if (barcodeNum != null) {
            // 유효한 바코드인지 확인
            map.put("queryId", "orderMapper.selectIsBarcodeValid");
            if (this.orderDao.getFlag(map)) {
                flag = true;
                message = "최신 도면이 아닙니다.";
            }
            // 주문상태가 확정인지 확인
            map.put("queryId", "orderMapper.selectHasControlStatusConfirmFromBarcode");
            if (this.orderDao.getFlag(map) && !flag) {
                flag = true;
                message = "먼저 주문확정을 해주세요.";
            }

            if (type.equals("confirm")) {
                // 이미 가공확정 됐는지 확인
                map.put("queryId", "orderMapper.selectHasPartStatusConfirm");
                if (this.orderDao.getFlag(map) && !flag) {
                    flag = true;
                    message = "이미 가공 확정된 도면입니다.";
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

    @Override
    public void updateControlConfirmProcess(Map<String, Object> map) throws Exception {

        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        HashMap<String, Object> queryIdList = null;

        ArrayList<HashMap<String, Object>> updateList = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("updateList"))
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

        if (jsonMap.containsKey("queryIdList"))
            queryIdList = (HashMap<String, Object>) jsonMap.get("queryIdList");

        if (updateList != null && updateList.size() > 0) {
            ArrayList<String> queryId = (ArrayList<String>) queryIdList.get("updateQueryId");

            for (HashMap<String, Object> hashMap : updateList) {
                for (int i = 0, queryCount = queryId.size(); i < queryCount; i++) {
                    hashMap.put("queryId", queryId.get(i));
                    this.innodaleDao.updateGrid(hashMap);
                }

                if("PRO002".equals(hashMap.get("PART_STATUS"))) {
                    /** 관리번호 가공 확정인 경우 알람 처리 한다. **/
                    hashMap.put("queryId", "common.selectAlarmControlInformation");
                    Map<String, Object> alarmInfo = this.innodaleDao.getInfo(hashMap);

                    NotificationMessage notificationMessage = new NotificationMessage();

                    notificationMessage.setType(MessageType.POP);
                    notificationMessage.setContent01((String) alarmInfo.get("CONTEXT01"));
                    notificationMessage.setContent02((String) alarmInfo.get("CONTEXT02"));
                    notificationMessage.setContent03("가공확정");

                    simpMessagingTemplate.convertAndSend("/topic/alarm", notificationMessage);
                }
            }
        }
    }

    @Override
    public void mergeControl(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> controlPartList = null;

        Integer standardControlSeq = null;
        Integer standardControlDetailSeq = null;
        boolean flag = false;
        String message = "";

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("STANDARD_CONTROL_SEQ"))
            standardControlSeq = (int) jsonMap.get("STANDARD_CONTROL_SEQ");

        if (jsonMap.containsKey("STANDARD_CONTROL_DETAIL_SEQ"))
            standardControlDetailSeq = (int) jsonMap.get("STANDARD_CONTROL_DETAIL_SEQ");

        if (jsonMap.containsKey("list"))
            controlPartList = (ArrayList<HashMap<String, Object>>) jsonMap.get("list");

        // 주문관리 Part 저장
        if (controlPartList != null && controlPartList.size() > 0) {
            for (HashMap<String, Object> hashMap : controlPartList) {
                hashMap.put("STANDARD_CONTROL_SEQ", standardControlSeq);
                hashMap.put("STANDARD_CONTROL_DETAIL_SEQ", standardControlDetailSeq);

                // 주문상태가 대기 또는 취소가 아닌지 확인
                hashMap.put("queryId", "orderMapper.selectHasControlStatusConfirm");
                if (this.orderDao.getFlag(hashMap)) {
                    flag = true;
                    message = "주문상태를 대기 또는 취소 상태로 변경해주세요";
                    break;
                }
                // 외주
                hashMap.put("queryId", "orderMapper.selectHasOutsideConfirmDt");
                if (this.orderDao.getFlag(hashMap)) {
                    flag = true;
                    message = "이미 외주확정된 대상입니다";
                    break;
                }
                // 소재주문
                hashMap.put("queryId", "orderMapper.selectHasInStock");
                if (this.orderDao.getFlag(hashMap)) {
                    flag = true;
                    message = "소재 주문완료된 대상입니다";
                    break;
                }
                // mct
                hashMap.put("queryId", "orderMapper.selectHasMctWork");
                if (this.orderDao.getFlag(hashMap)) {
                    flag = true;
                    message = "MCT 작업이력이 있습니다";
                    break;
                }
                // CAM
                hashMap.put("queryId", "orderMapper.selectHasCam");
                if (this.orderDao.getFlag(hashMap)) {
                    flag = true;
                    message = "CAM 작업이력이 있습니다";
                    break;
                }
                // inspect
                hashMap.put("queryId", "orderMapper.selectHasInspect");
                if (this.orderDao.getFlag(hashMap)) {
                    flag = true;
                    message = "검사이력이 있습니다";
                    break;
                }

                if (standardControlSeq != (int) hashMap.get("CONTROL_SEQ") && standardControlDetailSeq != (int) hashMap.get("CONTROL_DETAIL_SEQ")) {
                    hashMap.put("queryId", "orderMapper.createPartOrderToMerge");
                    this.innodaleDao.create(hashMap);
                    hashMap.put("queryId", "orderMapper.removeControl");
                    this.innodaleDao.remove(hashMap);
                }
            }
        }

        model.addAttribute("flag", flag);
        model.addAttribute("message", message);
    }
}
