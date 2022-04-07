package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.component.CommonUtility;
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
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        ArrayList<Map<String, Object>> listMap = new ArrayList<>();
        ArrayList<String> registList = new ArrayList<>();

        Map<String, Object> hashMap = new HashMap<String, Object>();

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }

        for(int i=0; i<jsonMap.size();i++) {
            Map<String,Object> tempMap = jsonMap.get(i);
            if(tempMap.get("REGIST_NUM") != null && !"".equals(tempMap.get("REGIST_NUM"))) {
                listMap.add(tempMap);
                registList.add((String) tempMap.get("REGIST_NUM"));
            }
        }

        hashMap.put("list", listMap);
        hashMap.put("registList", registList);

        hashMap.put("queryId", "orderMapper.selectBeforeInsertDuplicationRegistList_NEW");
        List<Map<String, Object>> duplicateRegistList = this.innodaleDao.getList(hashMap);
        if(duplicateRegistList.size() > 0) {
            model.addAttribute("registList", duplicateRegistList);
        }else {
            for(Map<String,Object> tempMap : listMap) {
                tempMap.put("LOGIN_USER_ID",userId);

                tempMap.put("queryId", "orderMapper.createOrder");
                this.innodaleDao.create(tempMap);

                // 21.09.16 단가계산은 작업연계 이후에 수행
//                tempMap.put("queryId", "orderMapper.updateOrderAutomaticQuote");
//                this.innodaleDao.update(tempMap);

                tempMap.put("queryId", "orderMapper.insertOutBarcode");
                this.innodaleDao.create(tempMap);
            }
        }
    }

    @Override
    public void createNewStockControl(Model model, Map<String, Object> map) throws Exception {
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

        hashMap.put("queryId", "orderMapper.createControlExcel_stock");
        this.innodaleDao.create(hashMap);
        hashMap.put("queryId", "orderMapper.selectBeforeInsertDuplicationControlList");
        duplicationList = this.innodaleDao.getList(hashMap);

        if (duplicationList.size() > 0) {
            model.addAttribute("list", duplicationList);
        }else {
            hashMap.put("queryId", "procedure.SP_CONTROL_EXCEL_BATCH");
            this.innodaleDao.create(hashMap);
        }

        hashMap.put("queryId", "orderMapper.deleteControlExcel");
        this.innodaleDao.remove(hashMap);
    }

    @Override
    public void removeControl(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("LOGIN_USER_ID",userId);

            hashMap.put("queryId", "orderMapper.removeControl");
            this.innodaleDao.remove(hashMap);

            hashMap.put("queryId", "orderMapper.deleteControlRequestStock");
            this.innodaleDao.remove(hashMap);
        }
    }

    @Override
    public void managerControlStatus(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;
        Boolean flag = false;
        String msg = "";

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            String controlStatus = (String) hashMap.get("CONTROL_STATUS");
            String controlStatusNm = "";
            String workType = (String) hashMap.get("WORK_TYPE");
            switch (controlStatus) {
                case "ORD002":
                    controlStatusNm = "확정취소";
                    break;
                case "ORD005":
                    controlStatusNm = "보류";
                    break;
            }
            if("WTP020".equals(workType) || "WTP050".equals(workType)) {
                hashMap.put("queryId", "orderMapper.selectCheckOutsideStatus");
                HashMap<String,Object> checktemp = (HashMap<String, Object>) this.innodaleDao.getInfo(hashMap);
                String outside_check_cnt = String.valueOf(checktemp.get("OUTSIDE_CHECK_CNT")) ;

                if(checktemp != null) {
                    if(!("0".equals(outside_check_cnt))) {
                        flag = true;
                        msg = "외주 요청 발송 건이 존재하여 상태 변경이 불가합니다.";
                    }
                }
            }
            if(controlStatus != null && ("ORD002".equals(controlStatus) || "ORD005".equals(controlStatus))) {
                hashMap.put("queryId", "orderMapper.selectCheckControlStatus");
                HashMap<String,Object> temp = (HashMap<String, Object>) this.innodaleDao.getInfo(hashMap);

                if(temp != null) {
                    if (temp.get("MCT_WORK_SEQ") != null) {
                        flag = true;
                        msg = "가공 진행중인 작업건은 " + controlStatusNm + "가 불가합니다.";
                    }else if(temp.get("MATERIAL_ORDER_NUM") != null) {
                        flag = true;
                        msg = "소재 주문중인 작업건은 " + controlStatusNm + "가 불가합니다.";
                    }else if(temp.get("OUTSIDE_STATUS") != null && "OST001".equals((String) temp.get("OUTSIDE_STATUS"))) {
                        flag = true;
                        msg = "외주 가공중인 작업은 " + controlStatusNm + "가 불가합니다.";
                    }
                }
            }

            if(!flag) {
                hashMap.put("LOGIN_USER_ID",userId);

                hashMap.put("queryId", "orderMapper.updateControlStatus");
                this.innodaleDao.update(hashMap);
                hashMap.put("queryId", "orderMapper.createControlProgress");
                this.innodaleDao.create(hashMap);
                hashMap.put("queryId", "orderMapper.updateOutsideConfirmDt");
                this.innodaleDao.update(hashMap);
            }
        }
        if(flag) {
            model.addAttribute("message",msg);
        }
        model.addAttribute("flag",flag);
    }


    // 21.12.14 속도이슈로 처리 방식 변경 고려
    @Override
    public void createMonthClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        String uuid = UUID.randomUUID().toString();
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
                hashMap.put("ORDER_STATUS", "REG003");
                hashMap.put("GROUP_KEY", uuid);
                hashMap.put("PROCESS_TYPE", "C");

                if(jsonMap.get("TYPE") != null && "Y".equals((String) jsonMap.get("TYPE"))) {
                    hashMap.put("queryId", "orderMapper.createBeforeMonthClose");
                    this.innodaleDao.create(hashMap);
                }else {
                    hashMap.put("queryId", "orderMapper.createMonthClose");
                    this.innodaleDao.create(hashMap);
                    hashMap.put("queryId", "orderMapper.deleteMonthCloseOrder");
                    this.innodaleDao.remove(hashMap);
                    hashMap.put("queryId", "orderMapper.createMonthCloseOrder");
                    this.innodaleDao.create(hashMap);

                    hashMap.put("queryId", "orderMapper.updateOrderStatusFromMonthClose");
                    this.innodaleDao.update(hashMap);
                    hashMap.put("queryId", "orderMapper.createOrderProgressFromMonthClose");
                    this.innodaleDao.create(hashMap);
                }
            }
        }
//

        if(jsonMap.get("TYPE") != null && "Y".equals((String) jsonMap.get("TYPE"))) {
            jsonMap.put("GROUP_KEY", uuid);
            jsonMap.put("queryId", "procedure.SP_MONTH_CLOSE");
            this.innodaleDao.callProcedureMethod(jsonMap);
        }

        if (infoData != null && infoData.size() > 0) {
            for (HashMap<String, Object> hashMap : infoData) {
                hashMap.put("LOGIN_USER_ID", userId);
                hashMap.put("queryId", "orderMapper.updateMonthCloseFinalNego");
                this.innodaleDao.update(hashMap);
            }
        }
    }

    @Override
    public void removeMonthClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        String uuid = UUID.randomUUID().toString();
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
                hashMap.put("ORDER_STATUS", "REG001");
                hashMap.put("GROUP_KEY", uuid);
                hashMap.put("PROCESS_TYPE", "D");

                if(jsonMap.get("TYPE") != null && "Y".equals((String) jsonMap.get("TYPE"))) {
                    hashMap.put("queryId", "orderMapper.createBeforeMonthClose");
                    this.innodaleDao.create(hashMap);
                }else {
                    hashMap.put("queryId", "orderMapper.deleteMonthCloseOrder");
                    this.innodaleDao.remove(hashMap);
                    hashMap.put("queryId", "orderMapper.deleteMonthClose");
                    this.innodaleDao.remove(hashMap);
                    hashMap.put("queryId", "orderMapper.updateOrderStatusFromMonthCloseCancel");
                    this.innodaleDao.update(hashMap);
                    hashMap.put("queryId", "orderMapper.createOrderProgressFromMonthCloseCancel");
                    this.innodaleDao.create(hashMap);
                }
            }
        }

        if(jsonMap.get("TYPE") != null && "Y".equals((String) jsonMap.get("TYPE"))) {
            jsonMap.put("GROUP_KEY", uuid);
            jsonMap.put("queryId", "procedure.SP_REMOVE_MONTH_CLOSE");
            this.innodaleDao.callProcedureMethod(jsonMap);
        }

        if (infoData != null && infoData.size() > 0) {
            for (HashMap<String, Object> hashMap : infoData) {
                hashMap.put("LOGIN_USER_ID",userId);
                hashMap.put("queryId", "orderMapper.updateMonthCloseFinalNego");
                this.innodaleDao.update(hashMap);
            }
        }
    }

    @Override
    public String createInvoice(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
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

                if ("".equals(invoiceNum)) {
                    invoiceNum = this.orderDao.createInvoiceNum(hashMap);
                    hashMap.put("INVOICE_NUM", invoiceNum);
                }
                hashMap.put("LOGIN_USER_ID", userId);
                hashMap.put("queryId", "orderMapper.createInvoice");
                this.innodaleDao.create(hashMap);
            }
        }

        if (listData != null && listData.size() > 0) {
            for (HashMap<String, Object> hashMap : listData) {
                hashMap.put("LOGIN_USER_ID", userId);
                hashMap.put("INVOICE_NUM", invoiceNum);
                hashMap.put("queryId", "orderMapper.selectInvoiceDetailDuplicateCheck");
                if (this.orderDao.getFlag(hashMap)) {
                    throw new Exception("duplicate invoice number");
                }

                hashMap.put("queryId", "orderMapper.createInvoiceDetail");
                this.innodaleDao.create(hashMap);

                hashMap.put("queryId", "orderMapper.updatePackingCnt");
                this.innodaleDao.update(hashMap);
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

            if ("confirm".equals(type)) {
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
                    message = "외주 작업지시번호는 가공확정을 할수 없습니다.";
                }
            } else if ("conversion".equals(type)) {
                // 이미 가공확정 됐는지 확인
//                map.put("queryId", "orderMapper.selectHasPartStatusConfirm");
//                if (this.orderDao.getFlag(map) && !flag) {
//                    flag = true;
//                    message = "주문 확정 상태로 변경해주세요.";
//                }
                // 이미 외주전환 됐는지 확인
                map.put("queryId", "orderMapper.selectHasPartStatusConversion");
                if (this.orderDao.getFlag(map) && !flag) {
                    flag = true;
                    message = "이미 외주전환 된 도면입니다.";
                }
                // 출고 확인
//                map.put("queryId", "orderMapper.selectHasOut");
//                if (this.orderDao.getFlag(map) && !flag) {
//                    flag = true;
//                    message = "이미 출고된 대상입니다.";
//                }
            }

            model.addAttribute("flag", flag);
            model.addAttribute("message", message);
        }
    }

    @Override
    public void updateControlConfirmProcess(Map<String, Object> map) throws Exception {

        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
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
                    hashMap.put("LOGIN_USER_ID",userId);
                    hashMap.put("queryId", queryId.get(i));
                    this.innodaleDao.updateGrid(hashMap);
                }

                if("PRO002".equals(hashMap.get("PART_STATUS"))) {
                    /** 작업지시번호 가공 확정인 경우 알람 처리 한다. **/
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
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> controlPartList = null;

        Integer standardControlSeq = null;
        Integer standardControlDetailSeq = null;
        boolean flag = false;
        String message = "";
        String action = "";

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("STANDARD_CONTROL_SEQ"))
            standardControlSeq = (int) jsonMap.get("STANDARD_CONTROL_SEQ");

        if (jsonMap.containsKey("STANDARD_CONTROL_DETAIL_SEQ"))
            standardControlDetailSeq = (int) jsonMap.get("STANDARD_CONTROL_DETAIL_SEQ");

        if (jsonMap.containsKey("ACTION"))
            action = (String) jsonMap.get("ACTION");

        if (jsonMap.containsKey("list"))
            controlPartList = (ArrayList<HashMap<String, Object>>) jsonMap.get("list");

        // 주문관리 Part 저장
        if (controlPartList != null && controlPartList.size() > 0) {
            for (HashMap<String, Object> hashMap : controlPartList) {
                hashMap.put("LOGIN_USER_ID",userId);
                if ("CHECK".equals(action)) {
                    // 주문상태가 대기 또는 취소가 아닌지 확인
                    hashMap.put("queryId", "orderMapper.selectHasControlStatusConfirm");
                    if (this.orderDao.getFlag(hashMap)) {
                        flag = true;
                        message = "확정상태에서는 Merge 가 불가합니다.";
                        break;
                    }
                    // 외주
                    hashMap.put("queryId", "orderMapper.selectHasOutsideConfirmDt");
                    if (this.orderDao.getFlag(hashMap)) {
                        flag = true;
                        message = "확정상태에서는 Merge 가 불가합니다.";
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
                } else {
                    hashMap.put("STANDARD_CONTROL_SEQ", standardControlSeq);
                    hashMap.put("STANDARD_CONTROL_DETAIL_SEQ", standardControlDetailSeq);

                    if (standardControlSeq != (int) hashMap.get("CONTROL_SEQ") && standardControlDetailSeq != (int) hashMap.get("CONTROL_DETAIL_SEQ")) {
                        hashMap.put("queryId", "orderMapper.createPartOrderToMerge");
                        this.innodaleDao.create(hashMap);
                        hashMap.put("queryId", "inspection.updateControlPartOrderPackingCnt2");
                        this.innodaleDao.remove(hashMap);
                        hashMap.put("queryId", "orderMapper.createOutBarcodeToMerge");
                        this.innodaleDao.create(hashMap);
                        hashMap.put("queryId", "orderMapper.removeControl");
                        this.innodaleDao.remove(hashMap);
                    }
                }
            }
        }

        model.addAttribute("flag", flag);
        model.addAttribute("message", message);
    }

    @Override
    public void validationCheckBeforeSaveFromControl(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> oldList = null;
        ArrayList<HashMap<String, Object>> updateList = null;

        boolean flag = false;
        String message = "";

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if(jsonMap != null) {
            oldList = (ArrayList<HashMap<String, Object>>) jsonMap.get("oldList");
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
        }

        if (updateList != null && updateList.size() > 0 && !flag) {
            for(int i = 0; i < updateList.size(); i++) {
                HashMap<String, Object> hashMap = updateList.get(i);

                if (oldList.get(i).containsKey("CONTROL_NUM")) {
                    hashMap.put("queryId", "orderMapper.selectCheckControlDuplicate");
                    if (this.orderDao.getFlag(hashMap)) {
                        flag = true;
                        message = "기존에 존재하는 작업지시번호입니다.";
                        break;
                    }
                }
//                if (oldList.get(i).containsKey("REGIST_NUM")) {
//                    hashMap.put("queryId", "orderMapper.selectCheckRegistNumDuplicate");
//                    if (this.orderDao.getFlag(hashMap)) {
//                        flag = true;
//                        message = "이미 등록된 접수번호 입니다.";
//                        break;
//                    }
//                }

            }
        }

        model.addAttribute("flag", flag);
        model.addAttribute("message", message);
    }

    @Override
    public void saveFromControlManage(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");

        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        ArrayList<HashMap<String, Object>> oldList = null;

        Boolean flag = false;
        String message = "";

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if(jsonMap != null) {
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
            oldList = (ArrayList<HashMap<String, Object>>) jsonMap.get("oldList");
        }

        if (addList != null && addList.size() > 0) { // 21.10.29 addList인 경우는 사실상 조립에 파트추가하는 경우만 존재.
            for (HashMap<String, Object> hashMap : addList) {
                hashMap.put("LOGIN_USER_ID",userId);
                try {
                    hashMap.put("queryId", "orderMapper.createControlPart");
                    this.innodaleDao.insertGrid(hashMap);
                    hashMap.put("queryId", "orderMapper.updateControlAutomaticQuote");
                    this.innodaleDao.updateGrid(hashMap);
                    if(hashMap.get("ORDER_QTY") != null) {
                        hashMap.put("queryId", "orderMapper.createControlPartOrder");
                        this.innodaleDao.insertGrid(hashMap);
                    }
                    hashMap.put("queryId", "orderMapper.createControlBarcode");
                    this.innodaleDao.insertGrid(hashMap);
                    hashMap.put("queryId", "orderMapper.createOutBarcode");
                    this.innodaleDao.insertGrid(hashMap);
                } catch (Exception e) {
                    flag = true;
                    message = "에러가 발생하였습니다";
                }
            }
        }
        if (updateList != null && updateList.size() > 0) {
            for(int i = 0; i < updateList.size(); i++) {
                HashMap<String, Object> hashMap = updateList.get(i);
                HashMap<String, Object> oldMap = oldList.get(i);
                HashMap<String, Object> tempMap = new HashMap<>();
                tempMap.put("LOGIN_USER_ID",userId);

                Set<String> keys = oldMap.keySet();
                Iterator iterator = keys.iterator();
                // 수정한 값만 업데이트 하도록 키값 추출
                while (iterator.hasNext()) {
                    String key = (String)iterator.next();
                    if(hashMap.get(key) == null) {
                        tempMap.put(key,"");
                    }else {
                        tempMap.put(key,hashMap.get(key));
                    }
                }
                tempMap.put("CONTROL_SEQ",hashMap.get("CONTROL_SEQ"));
                tempMap.put("CONTROL_DETAIL_SEQ",hashMap.get("CONTROL_DETAIL_SEQ"));
                tempMap.put("PART_NUM",hashMap.get("PART_NUM"));
                tempMap.put("ORDER_SEQ",hashMap.get("ORDER_SEQ"));
                if(hashMap.get("CONTROL_STATUS") != null) {
                    tempMap.put("CONTROL_STATUS",hashMap.get("CONTROL_STATUS"));
                }

                try {
                    tempMap.put("queryId", "orderMapper.updateControlFromControlManage");
                    this.innodaleDao.updateGrid(tempMap);

                    tempMap.put("queryId", "orderMapper.updateControlPartFromControlManage");
                    this.innodaleDao.updateGrid(tempMap);

                    tempMap.put("queryId", "orderMapper.updateControlAutomaticQuote");
                    this.innodaleDao.updateGrid(tempMap);

                    tempMap.put("queryId", "orderMapper.updateControlPartOrderFromControlManage");
                    this.innodaleDao.updateGrid(tempMap);

//                hashMap.put("queryId", "procedure.SP_CONTROL_EXCEL_BATCH");
//                this.innodaleDao.create(hashMap);
                } catch (Exception e) {
                    flag = true;
                    message = "에러가 발생하였습니다";
                }
            }
        }

        model.addAttribute("flag", flag);
        model.addAttribute("message", message);
    }

    @Override
    public void processingRequirementsControlSave(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        boolean flag = false;
        String seq1 = null;
        String seq2 = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if(jsonMap != null) {
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

            seq1 = (String) jsonMap.get("SEQ1");
            seq2 = (String) jsonMap.get("SEQ2");
        }

        try {
            if (addList != null && addList.size() > 0) {
                for (HashMap<String, Object> hashMap : addList) {
                    hashMap.put("LOGIN_USER_ID",userId);
                    hashMap.put("CONTROL_SEQ", seq1);
                    hashMap.put("CONTROL_DETAIL_SEQ", seq2);
                    hashMap.put("queryId", "orderMapper.insertControlPartProcess");
                    this.innodaleDao.insertGrid(hashMap);
                    hashMap.put("queryId", "orderMapper.updateControlAutomaticQuote");
                    this.innodaleDao.updateGrid(hashMap);
                }
            }
            if (updateList != null && updateList.size() > 0) {
                for (HashMap<String, Object> hashMap : updateList) {
                    hashMap.put("LOGIN_USER_ID",userId);
                    hashMap.put("CONTROL_SEQ", seq1);
                    hashMap.put("CONTROL_DETAIL_SEQ", seq2);
                    hashMap.put("queryId", "orderMapper.insertControlPartProcess");
                    this.innodaleDao.insertGrid(hashMap);
                    hashMap.put("queryId", "orderMapper.updateControlAutomaticQuote");
                    this.innodaleDao.updateGrid(hashMap);
                }
            }
        } catch (Exception e) {
            flag = true;
        }

        model.addAttribute("flag", flag);
    }

    @Override
    public void processingRequirementsEtcControlSave(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        boolean flag = false;
        String seq1 = null;
        String seq2 = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if(jsonMap != null) {
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

            seq1 = (String) jsonMap.get("SEQ1");
            seq2 = (String) jsonMap.get("SEQ2");
        }

        try {
            if (updateList != null && updateList.size() > 0) {
                for (HashMap<String, Object> hashMap : updateList) {
                    hashMap.put("LOGIN_USER_ID",userId);
                    hashMap.put("SEQ1", seq1);
                    hashMap.put("SEQ2", seq2);
                    hashMap.put("queryId", "orderMapper.updateControlPartEtcProcess");
                    this.innodaleDao.updateGrid(hashMap);
//                    hashMap.put("queryId", "orderMapper.updateControlPartEtcAutomaticQuote");
//                    this.innodaleDao.updateGrid(hashMap);
                }
            }
        } catch (Exception e) {
            flag = true;
        }

        model.addAttribute("flag", flag);
    }

    @Override
    public void matchStockSave(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;

        Boolean flag = false;
        String message = "";

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if(jsonMap != null) {
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
        }

        if (addList != null && addList.size() > 0) {
            for (HashMap<String, Object> hashMap : addList) {
                try {
                    Boolean checkBox = (Boolean)hashMap.get("CHECK_BOX");
                    String rnum = (String)hashMap.get("RNUM");
                    hashMap.put("LOGIN_USER_ID",userId);
                    if("".equals(rnum) && checkBox) {
                        if(hashMap.get("INSIDE_OUT_SEQ") == null || "".equals(hashMap.get("INSIDE_OUT_SEQ"))) {
                            hashMap.put("queryId", "orderMapper.insertRequestStock");
                            this.innodaleDao.insertGrid(hashMap);
                        }else {
                            hashMap.put("queryId", "orderMapper.updateRequestStock");
                            this.innodaleDao.updateGrid(hashMap);
                        }
                    }
                } catch (Exception e) {
                    flag = true;
                    message = "에러가 발생하였습니다";
                }
            }
        }
        if (updateList != null && updateList.size() > 0) {
            for (HashMap<String, Object> hashMap : updateList) {
                try {
                    String insideOutSeq = (String)hashMap.get("INSIDE_OUT_SEQ");
                    Boolean checkBox = (Boolean)hashMap.get("CHECK_BOX");
                    hashMap.put("LOGIN_USER_ID",userId);
                    if(checkBox) {
                        if("".equals(insideOutSeq) || insideOutSeq == null){
                            hashMap.put("queryId", "orderMapper.insertRequestStock");
                            this.innodaleDao.insertGrid(hashMap);
                        }else {
                            hashMap.put("queryId", "orderMapper.updateRequestStock");
                            this.innodaleDao.updateGrid(hashMap);
                        }
                    }else {
                        if(!"".equals(insideOutSeq)) {
                            hashMap.put("queryId", "orderMapper.selectRequestStockStatus");
                            Map<String,Object> tempData = this.innodaleDao.getInfo(hashMap);
                            if("OUT002".equals(tempData.get("OUT_STATUS"))) {
                                flag = true;
                                message = "불출 완료된 건은 취소 불가합니다.";
                            }else {
                                hashMap.put("queryId", "orderMapper.deleteRequestStock");
                                this.innodaleDao.remove(hashMap);
                            }
                        }
                    }
                } catch (Exception e) {
                    flag = true;
                    message = "에러가 발생하였습니다";
                }
            }
        }

        model.addAttribute("flag", flag);
        model.addAttribute("message", message);
    }


    @Override
    public void validationCheckBeforeSaveFromOrder(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> oldList = null;
        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;

        boolean flag = false;
        String message = "";

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if(jsonMap != null) {
            oldList = (ArrayList<HashMap<String, Object>>) jsonMap.get("oldList");
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

        }

        if (addList != null && addList.size() > 0) {
            for (HashMap<String, Object> hashMap : addList) {
                if(hashMap.containsKey("REGIST_NUM") && !flag) {
                    hashMap.put("queryId", "orderMapper.selectCheckRegistNumDuplicateOrder");

                    if (this.orderDao.getFlag(hashMap)) {
                        flag = true;
                        message = "이미 등록된 접수번호 입니다.";
                    }
                }
            }
        }

        if (updateList != null && updateList.size() > 0 && !flag) {
            for(int i = 0; i < updateList.size(); i++) {
                HashMap<String, Object> hashMap = updateList.get(i);

                if (oldList.get(i).containsKey("REGIST_NUM") && !flag) {
                    hashMap.put("queryId", "orderMapper.selectCheckRegistNumDuplicateOrder");
                    if (this.orderDao.getFlag(hashMap)) {
                        flag = true;
                        message = "이미 등록된 접수번호 입니다.";
                    }
                }

            }
        }

        model.addAttribute("flag", flag);
        model.addAttribute("message", message);
    }

    @Override
    public void saveFromOrderManage(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");

        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        ArrayList<HashMap<String, Object>> oldList = null;

        Boolean flag = false;
        String message = "";

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if(jsonMap != null) {
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
            oldList = (ArrayList<HashMap<String, Object>>) jsonMap.get("oldList");
        }

        if (addList != null && addList.size() > 0) {
            for (HashMap<String, Object> hashMap : addList) {
                hashMap.put("LOGIN_USER_ID",userId);

                if(hashMap.get("REGIST_NUM") != null && !"".equals(hashMap.get("REGIST_NUM"))) {
                    hashMap.put("queryId", "orderMapper.createOrder");
                    this.innodaleDao.create(hashMap);

                    hashMap.put("queryId", "orderMapper.insertOutBarcode");
                    this.innodaleDao.create(hashMap);
                }

            }
        }

        if (updateList != null && updateList.size() > 0) {
            for(int i = 0; i < updateList.size(); i++) {
                HashMap<String, Object> hashMap = updateList.get(i);
                HashMap<String, Object> oldMap = oldList.get(i);
                HashMap<String, Object> tempMap = new HashMap<>();
                tempMap.put("LOGIN_USER_ID",userId);

                Set<String> keys = oldMap.keySet();
                Iterator iterator = keys.iterator();
                // 수정한 값만 업데이트 하도록 키값 추출
                while (iterator.hasNext()) {
                    String key = (String)iterator.next();
                    tempMap.put(key,hashMap.get(key));
                    if(hashMap.get(key) == null) {
                        tempMap.put(key,"");
                    }
                }
                tempMap.put("ORDER_SEQ",hashMap.get("ORDER_SEQ"));
                tempMap.put("ORIGINAL_SIDE_QTY",hashMap.get("ORIGINAL_SIDE_QTY"));
                tempMap.put("OTHER_SIDE_QTY",hashMap.get("OTHER_SIDE_QTY"));
                if(hashMap.get("CONTROL_STATUS") != null) {
                    tempMap.put("ORDER_STATUS",hashMap.get("ORDER_STATUS"));
                }

                try {

                    tempMap.put("queryId", "orderMapper.updateOrderFromOrderManage");
                    this.innodaleDao.update(tempMap);

                    if(oldMap.containsKey("ORDER_DUE_DT")) {
                        tempMap.put("queryId", "orderMapper.updateControlPartOrderFromOrderManage");
                        this.innodaleDao.update(tempMap);
                    }

                    // 21.09.16 단가계산은 작업연계이후 수행
//                    tempMap.put("queryId", "orderMapper.updateOrderAutomaticQuote");
//                    this.innodaleDao.update(tempMap);

                } catch (Exception e) {
                    flag = true;
                    message = "에러가 발생하였습니다";
                }
            }
        }

        model.addAttribute("flag", flag);
        model.addAttribute("message", message);
    }
    @Override
    public void removeOrder(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        boolean flag = false;
        String message = "";
        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("LOGIN_USER_ID",userId);
            if(!flag) {
                hashMap.put("queryId", "orderMapper.selectBeforeRemoveOrder1");
                List<Map<String, Object>> orderStatusList = this.innodaleDao.getList(hashMap);
                if(orderStatusList.size() > 0) {
                    flag = true;
                    message = "확정상태가 빈칸(임시저장)이나 확정취소인 경우에만 가능합니다";
                }else {
                    hashMap.put("queryId", "orderMapper.selectBeforeRemoveOrder2");
                    List<Map<String, Object>> controlList = this.innodaleDao.getList(hashMap);

                    if(controlList.size() > 0) {
                        flag = true;
                        message = "작업이 연계된 접수건은 삭제가 불가합니다.";
                    }else {
                        hashMap.put("queryId", "orderMapper.removeOrder");
                        this.innodaleDao.remove(hashMap);
                    }
                }
            }
        }
        model.addAttribute("flag",flag);
        model.addAttribute("message",message);
    }

    @Override
    public void managerOrderStatus(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("queryId", "orderMapper.selectCheckOrderStatus");
            Map<String,Object> checkMap = innodaleDao.getInfo(hashMap);

            if(checkMap != null) {
                model.addAttribute("resCode", "CONTROL_EXISTS");
            }else {
                hashMap.put("LOGIN_USER_ID",userId);

                hashMap.put("queryId", "orderMapper.updateOrderStatus");
                this.innodaleDao.update(hashMap);

//            hashMap.put("queryId", "orderMapper.updateControlBarcodeRevision");
//            this.innodaleDao.update(hashMap);
//            hashMap.put("queryId", "orderMapper.insertControlBarcodeRevision");
//            this.innodaleDao.create(hashMap);

                hashMap.put("queryId", "orderMapper.createOrderProgress");
                this.innodaleDao.create(hashMap);

//            hashMap.put("queryId", "orderMapper.updateOutsideConfirmDt");
//            this.innodaleDao.update(hashMap);
                model.addAttribute("resCode", "SUCCESS");
            }
        }
    }

    @Override
    public void orderConfirmFromDrawing(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> addList = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if(jsonMap != null) {
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
        }

        boolean flag = false;
        String message = "";

        if(addList != null && addList.size() > 0) {
            for (HashMap<String, Object> hashMap : addList) {
                hashMap.put("LOGIN_USER_ID",userId);

                hashMap.put("queryId", "orderMapper.selectOrderInfo");
                HashMap<String,Object> tempMap = (HashMap<String, Object>) this.innodaleDao.getInfo(hashMap);

                if(tempMap != null) {
                    message = "주문 확정이 불가능한 대상이 있습니다.";
                    if(!tempMap.containsKey("PDF_GFILE_SEQ") || !tempMap.containsKey("DRAWING_NUM") || !tempMap.containsKey("ORDER_QTY")) {
                        flag = true;
                    }else if(tempMap.get("ORDER_STATUS") != null && "REG003".equals(tempMap.get("ORDER_STATUS"))) {
                        flag = true;
                    }else {
                        message = "";
                        tempMap.put("ORDER_STATUS", "REG001");

                        tempMap.put("queryId", "orderMapper.updateOrderStatus");
                        this.innodaleDao.update(tempMap);

                        tempMap.put("queryId", "orderMapper.createOrderProgress");
                        this.innodaleDao.create(tempMap);
                    }
                }else {
                    flag = true;
                    message = "주문 정보를 확인해주세요.";
                }

            }
        }
        model.addAttribute("flag",flag);
        model.addAttribute("message",message);
    }

    // 작업건 생성시 케이스
    // 1. 신규 생성
    // 2. 기존 작업번호에 merge (단, 기존 작업의 상태가 확정,보류가 아니어야함)
    // * 접수와 작업건은 N:M의 관계 가능. 접수1개에 작업N / 접수N: 작업1 등등
    // 하나의 작업번호로 묶이기 위해서는 하기 항목 모두 동일해야함
    // 작업형태, 소재사급여부, 주요검사, 대칭여부, 규격, 소재형태, 소재종류, 표면처리, 특수처리, 가공납기, 파트개수

    @Override
    public void validationCheckBeforeCreateControl(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> updateList = null;
        ArrayList<HashMap<String, Object>> controlNumArr = null;
        ArrayList<HashMap<String, Object>> resultList = new ArrayList<>();
        HashMap<String, Object> groupMap = new HashMap<>();

        boolean flag = false;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("updateList")) {
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
            controlNumArr = (ArrayList<HashMap<String, Object>>) jsonMap.get("controlNumArr");
        }

        for(int i=0;i<updateList.size();i++) {
            String controlNum = (String) updateList.get(i).get("CONTROL_NUM");
            ArrayList<HashMap<String, Object>> groupList = new ArrayList<>();
            if(groupMap.containsKey(controlNum)) {
                groupList = (ArrayList<HashMap<String, Object>>) groupMap.get(controlNum);
            }
            groupList.add(updateList.get(i));
            groupMap.put(controlNum,groupList);
        }

        if (updateList != null && updateList.size() > 0) {
            HashMap<String, Object> duplMap = new HashMap<>();
            duplMap.put("queryId", "orderMapper.selectCheckControlDuplicateVer2");
            duplMap.put("controlNumArr",controlNumArr);
            List<Map<String, Object>> checkControlList = this.innodaleDao.getList(duplMap);

            for(int j=0;j<updateList.size();j++) {
                HashMap<String, Object> hashMap = updateList.get(j);
                String validationResult = "SUCCESS";
                String controlNum = (String) hashMap.get("CONTROL_NUM");

                if (hashMap.containsKey("REGIST_NUM") && hashMap.containsKey("CONTROL_NUM")) {
                    HashMap<String, Object> controlMap = null;
                    if(checkControlList.size() > 0) {
                        for(Map<String, Object> tempControl : checkControlList) {
                            if(controlNum.equals(tempControl.get("CONTROL_NUM"+""))) {
                                controlMap = (HashMap<String, Object>) tempControl;
                            }
                        }
                    }

                    if(controlMap != null && controlMap.get("CONTROL_SEQ") != null && !"".equals(controlMap.get("CONTROL_SEQ"))) {
                        String controlStatus = String.valueOf(controlMap.get("CONTROL_STATUS"));
                        if("ORD001".equals(controlStatus) || "ORD005".equals(controlStatus)) {
                            flag = true;
                            validationResult = "RS_EXISTS";
                        }else {
                            hashMap.put("MERGE_CONTROL_SEQ",controlMap.get("CONTROL_SEQ"));
                            hashMap.put("MERGE_CONTROL_DETAIL_SEQ",controlMap.get("CONTROL_DETAIL_SEQ"));
                            hashMap.put("MERGE_CONTROL_STATUS",controlStatus);
                        }

                        String partNum = (String) controlMap.get("PART_NUM");
                        if(partNum == null || partNum == "" || Integer.parseInt(partNum) <= 0) {
                            controlMap.put("PART_NUM","");
                        }
                    }

                    String[] checkColumn = {"WORK_TYPE", "MATERIAL_SUPPLY_YN","MAIN_INSPECTION","SAME_SIDE_YN","SIZE_TXT","MATERIAL_DETAIL","MATERIAL_KIND","SURFACE_TREAT","SPECIAL_TREATMENT","PART_NUM","INNER_DUE_DT"};
                    if(hashMap.get("MERGE_CONTROL_SEQ") != null) {
                        if("SUCCESS".equals(validationResult)) {
                            Boolean mergeFlag = false;

                            for(String column : checkColumn) {
                                if(controlMap.get(column) == null) {
                                    controlMap.put(column,"");
                                }
                                if(hashMap.get(column) == null) {
                                    hashMap.put(column,"");
                                }

                                if(!controlMap.get(column).equals(hashMap.get(column)) && !mergeFlag) {
                                    mergeFlag = true;
                                }
                            }

                            if(mergeFlag) {
                                flag = true;
                                validationResult = "RS_EXISTS2";
                                hashMap.remove("MERGE_CONTROL_SEQ");
                                hashMap.remove("MERGE_CONTROL_DETAIL_SEQ");
                                hashMap.remove("MERGE_CONTROL_STATUS");
                            }else {
                                validationResult = "RS_MERGE";
                            }
                        }
                    }else {
                        ArrayList<HashMap<String, Object>> mergeList = (ArrayList<HashMap<String, Object>>) groupMap.get(controlNum);
                        if(mergeList.size() >= 2) {
                            for(int i=0;i<mergeList.size();i++) {
                                HashMap<String, Object> temp = mergeList.get(i);
                                if(temp.get("ROW_NUM") != hashMap.get("ROW_NUM") && "SUCCESS".equals(validationResult)) {
                                    Boolean mergeFlag = false;

                                    for(String column : checkColumn) {
                                        if(temp.get(column) == null) {
                                            temp.put(column,"");
                                        }
                                        if(hashMap.get(column) == null) {
                                            hashMap.put(column,"");
                                        }
                                        if(!temp.get(column).equals(hashMap.get(column)) && !mergeFlag) {
                                            mergeFlag = true;
                                        }
                                    }

                                    if(mergeFlag) {
                                        flag = true;
                                        validationResult = "RS_EXISTS2";
                                    }else {
                                        validationResult = "RS_MERGE";
                                    }
                                }
                            }
                        }
                    }
                }
                hashMap.put("VALIDATION_RESULT", validationResult);
                resultList.add(hashMap);
            }
        }

        if(resultList != null && resultList.size() > 0) {
            model.addAttribute("resultList",resultList);
        }

        model.addAttribute("flag", flag);
    }

    @Override
    public void createNewControl(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String) map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        String uuid = UUID.randomUUID().toString();
        Map<String, Object> tempMap = new HashMap<String, Object>();
        tempMap.put("IN_UID", uuid);

        ArrayList<HashMap<String, Object>> updateList = null;

        boolean flag = false;
        String message = "";


        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if(jsonMap != null) {
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
        }

        if (updateList != null && updateList.size() > 0 && !flag) {
            for (HashMap<String, Object> hashMap : updateList) {
                hashMap.put("LOGIN_USER_ID", userId);
                hashMap.put("IN_UID",uuid);

                if (hashMap.containsKey("REGIST_NUM") && hashMap.containsKey("CONTROL_NUM")) {
//                    hashMap.put("queryId", "orderMapper.selectCheckControlDuplicate");
                    hashMap.put("queryId", "orderMapper.selectCheckControlDuplicateVer3");
                    if(this.orderDao.getFlag(hashMap)) {
                        flag = true;
                        message = "이미 존재하는 작업지시번호입니다.";
                    }

                    if(hashMap.get("MERGE_CONTROL_SEQ") != null && hashMap.get("MERGE_CONTROL_DETAIL_SEQ") != null) {

                        hashMap.put("queryId", "orderMapper.createPartOrderToMergeVer2");
                        this.innodaleDao.create(hashMap);
                        hashMap.put("queryId", "orderMapper.createOutBarcodeToMergeVer2");
                        this.innodaleDao.create(hashMap);
                    }else {
                        hashMap.put("queryId", "orderMapper.createControlExcel");
                        this.innodaleDao.create(hashMap);
                    }

                }
            }
        }

        if(!flag) {
            tempMap.put("queryId", "procedure.SP_CONTROL_EXCEL_BATCH");
            this.innodaleDao.create(tempMap);
        }

        tempMap.put("queryId", "orderMapper.deleteControlExcel");
        this.innodaleDao.remove(tempMap);

        model.addAttribute("flag", flag);
        model.addAttribute("message", message);
    }

}
