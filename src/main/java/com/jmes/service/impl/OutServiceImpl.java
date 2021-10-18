package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.dao.OrderDao;
import com.jmes.service.OutService;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OutServiceImpl implements OutService {

    @Autowired
    private InnodaleDao innodaleDao;
    @Autowired
    private OrderDao orderDao;

    @Override
    public void removeOutsideOrder(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("LOGIN_USER_ID",userId);

            hashMap.put("queryId", "outMapper.removeOutside");
            this.innodaleDao.update(hashMap);
            hashMap.put("queryId", "outMapper.updateOutsideRequestDetailDelete");
            this.innodaleDao.update(hashMap);
//            hashMap.put("queryId", "orderMapper.updateOutsideConfirmDt");
//            this.innodaleDao.update(hashMap);
        }
    }

    @Override
    public void createOutsideClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
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
                hashMap.put("LOGIN_USER_ID",userId);

                hashMap.put("OUTSIDE_STATUS", "OST004");
                hashMap.put("queryId", "orderMapper.updateControlPart");
                this.innodaleDao.update(hashMap);
                hashMap.put("queryId", "outMapper.createOutsideClose");
                this.innodaleDao.create(hashMap);
                hashMap.put("queryId", "outMapper.createOutsideCloseHistory");
                this.innodaleDao.create(hashMap);
            }
        }

        if (infoData != null && infoData.size() > 0) {
            for (HashMap<String, Object> hashMap : infoData) {
                hashMap.put("queryId", "outMapper.createOutsideCloseNote");
                this.innodaleDao.create(hashMap);
            }
        }
    }

    @Override
    public void managerRequestOutside(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        int outsideRequestSeq = 0;
        String status = null;
        boolean flag = false;
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

        String mailAttachGfileSeq = "";
        if (requestMailForm.get("GFILE_SEQ") != null && !"".equals(requestMailForm.get("GFILE_SEQ"))) {
            mailAttachGfileSeq = (String) requestMailForm.get("GFILE_SEQ");
        } else {
            requestMailForm.put("GFILE_SEQ", "");                   // GFILE 신규 등록
            requestMailForm.put("queryId", "common.insertFileGroup");
            innodaleDao.update(requestMailForm);

            mailAttachGfileSeq = Integer.toString((int) requestMailForm.get("GFILE_SEQ"));
        }

        if (requestMailForm != null && requestMailForm.size() > 0) {

            if (controlPartList != null && controlPartList.size() > 0) {

                for (int i = 0, SIZE = controlPartList.size(); i < SIZE; i++) {
                    HashMap<String, Object> hashMap = new HashMap<String, Object>();
                    hashMap.put("LOGIN_USER_ID", userId);
                    hashMap.putAll(controlPartList.get(i));

                    if (status.equals("request")) {
                        hashMap.put("PART_STATUS", "PRO001");
                        hashMap.put("OUTSIDE_STATUS", "OST001");
                    } else {
                        hashMap.put("PART_STATUS", "null");
                        hashMap.put("OUTSIDE_STATUS", "OST002");
                    }

                    hashMap.put("queryId", "outMapper.selectOutsideStatusCheck");
                    flag = this.orderDao.getFlag(hashMap);

                    if (flag) {
                        if (i == 0) {
                            requestMailForm.put("queryId", "outMapper.createOutsideRequest");
                            this.innodaleDao.create(requestMailForm);
                            outsideRequestSeq = (int) requestMailForm.get("OUTSIDE_REQUEST_SEQ");
                        }
                        // 기존 요청이 있으면 삭제한다.
                        hashMap.put("queryId", "outMapper.updateOutsideRequestDetailDelete");
                        this.innodaleDao.update(hashMap);
                        hashMap.put("OUTSIDE_REQUEST_SEQ", outsideRequestSeq);
                        hashMap.put("queryId", "outMapper.createOutsideRequestDetail");
                        this.innodaleDao.create(hashMap);
                        if (status.equals("request")) {
                            // 첨부 파일을 하나의 Gfile로 추가 한다.
                            hashMap.put("GFILE_SEQ", mailAttachGfileSeq);
                            hashMap.put("queryId", "outMapper.createMailAttachCadFilePlus");
                            this.innodaleDao.create(hashMap);
                        }

                        hashMap.put("queryId", "orderMapper.updateControlPart");
                        this.innodaleDao.update(hashMap);

                        hashMap.put("queryId", "orderMapper.createControlPartProgress");
                        this.innodaleDao.create(hashMap);
                    } else {
                        model.addAttribute("result", "error");
                        throw new Exception();
                    }
                }
                // 외주가공 요청 수신자 저장
                if (flag) {
                    if (mailReceiverList != null && mailReceiverList.size() > 0) {
                        String reception = (String) requestMailForm.get("RECEIVE_EMAIL");
                        String reference = (String) requestMailForm.get("CC_EMAIL");

                        if(!"".equals(reception)) { //메일 수신처 정보가 없는 경우, 메일발송X
                            for (HashMap<String, Object> hashMap : mailReceiverList) {
                                hashMap.put("OUTSIDE_REQUEST_SEQ", outsideRequestSeq);
                                hashMap.put("queryId", "outMapper.createOutsideRequestReceiver");
                                this.innodaleDao.create(hashMap);
                            }
                            // 메일 발송
                            requestMailForm.put("RECEPTION", reception);
                            requestMailForm.put("REFERENCE", reference);
                            requestMailForm.put("queryId", "mail.insertOutsideRequestSubmitMail");
                            this.innodaleDao.create(requestMailForm);
                        }
                    }
                }
            }
        }

        model.addAttribute("result", "success");
    }

    @Override
    public void removeOutsideClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
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
                hashMap.put("LOGIN_USER_ID", userId);
                hashMap.put("OUTSIDE_STATUS", null);
                hashMap.put("queryId", "orderMapper.updateControlPart");
                this.innodaleDao.update(hashMap);
                hashMap.put("queryId", "outMapper.deleteOutsideClose");
                this.innodaleDao.remove(hashMap);
                hashMap.put("queryId", "outMapper.deleteOutsideCloseNote");
                this.innodaleDao.remove(hashMap);
            }
        }

        if (infoData != null && infoData.size() > 0) {
            for (HashMap<String, Object> hashMap : infoData) {
                hashMap.put("queryId", "outMapper.updateOutsideCloseFinalNego");
                this.innodaleDao.update(hashMap);
            }
        }
    }
    @Override
    public void createOutGoing(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String) map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
//        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> createOutGoing");
//        System.out.println(map.toString());

        String type = String.valueOf(map.get("TYPE"));

        if("disposal".equals(type.toLowerCase())) {
            map.put("queryId", "inspection.deleteOutgoingDisposalOrderVer");
            this.innodaleDao.remove(map);

            map.put("queryId", "inspection.updateOutgoingDisposalOrderVer1");
            this.innodaleDao.create(map);

            map.put("queryId", "inspection.updateOutgoingOutType1After2");
            this.innodaleDao.create(map);

            map.put("queryId", "inspection.updateOutgoingDisposalOrderVer2");
            this.innodaleDao.create(map);

            map.put("queryId", "inspection.updateOutFinishStatusUseOrderSeq");
            this.innodaleDao.create(map);

            map.put("queryId", "inspection.updateOrderOutFinishStatus");
            this.innodaleDao.create(map);

            map.put("queryId", "machine.deleteMctPlanAllUseOrderSeq");
            this.innodaleDao.remove(map);

        }else {
            Integer newOutQty = Integer.parseInt(map.get("NEW_OUT_QTY")+""); // 출고입력 수량
            Integer orderQty = Integer.parseInt(map.get("ORDER_QTY")+""); // 발주수량
            Integer outQty = Integer.parseInt(map.get("OUT_QTY")+"");  // 이미 출고나간 수량

            if(newOutQty >= orderQty) { // 발주수량 모두 출고인 경우
                map.put("queryId", "inspection.insertOutgoingOutType1UseOrderSeq");
                this.innodaleDao.create(map);

                map.put("queryId", "inspection.updateOutgoingOutType1After1UseOrderSeq");
                this.innodaleDao.update(map);

                map.put("queryId", "inspection.updateOutFinishDt");
                this.innodaleDao.update(map);

                map.put("queryId", "inspection.updateOutFinishStatusUseOrderSeq");
                this.innodaleDao.update(map);

                map.put("queryId", "inspection.updateOrderOutFinishStatus");
                this.innodaleDao.update(map);

                map.put("queryId", "machine.deleteMctPlanAllUseOrderSeq");
                this.innodaleDao.update(map);

                if(newOutQty > orderQty) { // 수량이 많은경우 . 추가 출하데이터

                }

            }else {
                map.put("queryId", "outMapper.selectControlListUseOrderSeq");
                List<Map<String, Object>> controlList = this.innodaleDao.getList(map);

                boolean flag = false;
                Integer newOutQtyCopy = new Integer(newOutQty);
                for(Map<String, Object> tempMap : controlList) {
                    if(newOutQtyCopy > 0) {
                        Integer controlOrderQty = Integer.parseInt(tempMap.get("CONTROL_ORDER_QTY")+"");
                        Integer controlOutQty = Integer.parseInt(tempMap.get("OUT_QTY")+"");
//                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> controlList");
//                        System.out.println(tempMap.toString());
                        if(newOutQtyCopy <= (controlOrderQty - controlOutQty)) {
                            controlOrderQty = newOutQtyCopy;
                            tempMap.put("NEW_OUT_QTY", newOutQtyCopy);
                        }else {
                            controlOrderQty = controlOrderQty - controlOutQty;
                            tempMap.put("NEW_OUT_QTY", (controlOrderQty));
                        }
                        tempMap.put("queryId", "inspection.insertOutgoingOutType1");
                        this.innodaleDao.create(tempMap);

                        tempMap.put("queryId", "inspection.updateOutgoingOutType1After1");
                        this.innodaleDao.update(tempMap);

                        tempMap.put("queryId", "inspection.updateOutgoingOutType1After2");
                        this.innodaleDao.update(tempMap);

                        tempMap.put("queryId", "inspection.updateOutgoingOutType1After3");
                        this.innodaleDao.update(tempMap);

                        tempMap.put("queryId", "inspection.updateOutFinishStatus");
                        this.innodaleDao.update(tempMap);

                        tempMap.put("queryId", "inspection.updateOutFinishDt");
                        this.innodaleDao.update(tempMap);

                        tempMap.put("queryId", "inspection.updateOrderOutFinishStatus");
                        this.innodaleDao.update(tempMap);

                        tempMap.put("queryId", "machine.deleteMctPlanAll");
                        this.innodaleDao.update(tempMap);

                        newOutQtyCopy = newOutQtyCopy - controlOrderQty;

//                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> newOutQtyCopy" + newOutQtyCopy);
//                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> controlOrderQty" + controlOrderQty);
//                        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> controlOutQty" + controlOutQty);
                    }
                }
            }
        }
    }
}
