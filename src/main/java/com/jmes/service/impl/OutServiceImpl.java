package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
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
    private InnodaleDao innodaleDao;
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
            hashMap.put("OUTSIDE_STATUS_DT", null);
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

        int outsideRequestSeq;
        String status = null;
        ArrayList<HashMap<String, Object>> controlPartList = null;
        ArrayList<HashMap<String, Object>> mailReceiverList = null;
        HashMap<String, Object> requestMailForm = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("status"))
            status = (String) jsonMap.get("status");

        if (jsonMap.containsKey("requestMailForm"))
            requestMailForm = (HashMap<String, Object>) jsonMap.get("requestMailForm");

        if (jsonMap.containsKey("controlPartList"))
            controlPartList = (ArrayList<HashMap<String, Object>>) jsonMap.get("controlPartList");

        if (jsonMap.containsKey("mailReceiverList"))
            mailReceiverList = (ArrayList<HashMap<String, Object>>) jsonMap.get("mailReceiverList");

        // 주문관리 Part 저장
        if (controlPartList != null && controlPartList.size() > 0) {
            for (HashMap<String, Object> hashMap : controlPartList) {
                hashMap.put("queryId", "outMapper.updateOutsideRequestDetailDelete");
                this.innodaleDao.update(hashMap);

                if (status.equals("request")) {
                    hashMap.put("PART_STATUS", "PRO001");
                    hashMap.put("OUTSIDE_STATUS", "OST001");
                    hashMap.put("queryId", "orderMapper.createControlPartProgress");
                    this.innodaleDao.create(hashMap);
                } else {
                    hashMap.put("PART_STATUS", null);
                    hashMap.put("OUTSIDE_STATUS", "OST002");
                }

                hashMap.put("queryId", "orderMapper.updateControlPart");
                this.innodaleDao.update(hashMap);
            }
        }

        // 외주 가공 요청
        if (requestMailForm != null && requestMailForm.size() > 0) {
            requestMailForm.put("queryId", "outMapper.createOutsideRequest");
            this.innodaleDao.create(requestMailForm);
        }
        outsideRequestSeq = (int) requestMailForm.get("OUTSIDE_REQUEST_SEQ");

        // 외주가공요청 상세 저장
        if (controlPartList != null && controlPartList.size() > 0) {
            for (HashMap<String, Object> hashMap : controlPartList) {
                hashMap.put("OUTSIDE_REQUEST_SEQ", outsideRequestSeq);
                hashMap.put("queryId", "outMapper.createOutsideRequestDetail");
                this.innodaleDao.create(hashMap);
            }
        }

        // 외주가공 요청 수신자 저장
        if (mailReceiverList != null && mailReceiverList.size() > 0) {
            for (HashMap<String, Object> hashMap : mailReceiverList) {
                hashMap.put("OUTSIDE_REQUEST_SEQ", outsideRequestSeq);
                hashMap.put("queryId", "outMapper.createOutsideRequestReceiver");
                this.innodaleDao.create(hashMap);
            }
        }

        // 메일 발송
        if (requestMailForm != null && requestMailForm.size() > 0) {
            requestMailForm.put("queryId", "mail.insertOutsideRequestSubmitMail");
            this.innodaleDao.create(requestMailForm);
        }
    }

    @Override
    public void removeOutsideClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("queryId", "outMapper.updateCancelOutsideRequestStatus");
            this.innodaleDao.update(hashMap);
            hashMap.put("queryId", "outMapper.deleteOutsideClose");
            this.innodaleDao.remove(hashMap);
            hashMap.put("queryId", "outMapper.deleteOutsideCloseHistory");
            this.innodaleDao.remove(hashMap);
            //TODO: CLOSSE NOTE 삭제
        }
    }
}
