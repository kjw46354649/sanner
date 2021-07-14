package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.MaterialService;
import com.jmes.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MaterialServiceImpl implements MaterialService {

    @Autowired
    public InnodaleDao innodaleDao;

    @Override
    public void itemOrderRegisterPopSave(Model model, Map<String, Object> map) throws Exception {
        String jsonArray = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String, Object>> list = null;
        boolean flag = false;

        if (jsonArray != null)
            list = objectMapper.readValue(jsonArray, new TypeReference<List<Map<String, Object>>>() {});

        try {
            for (Map<String, Object> hashMap : list) {
                hashMap.put("LOGIN_USER_ID", map.get("LOGIN_USER_ID"));
                if (hashMap.get("MATERIAL_ORDER_SEQ") == null) {
                    hashMap.put("queryId", "material.insertItemOrderRegisterPopSave");
                    this.innodaleDao.create(hashMap);
                } else {
                    hashMap.put("queryId", "material.updateItemOrderRegisterPopSave");
                    this.innodaleDao.update(hashMap);
                }
                hashMap.put("queryId", "material.updateMaterialOrderUnitMaterialAutoAmt");
                this.innodaleDao.update(hashMap);
                hashMap.put("queryId", "material.updateControlPartMaterial");
                this.innodaleDao.update(hashMap);
                hashMap.put("queryId", "orderMapper.updateControlAutomaticQuote");
                this.innodaleDao.update(hashMap);
            }
        } catch (Exception e) {
            flag = true;
        }

        model.addAttribute("flag", flag);
    }

    /**
     * 재고관리 그리드 관리(I,U,D)
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void managerInsideStock(Model model, Map<String, Object> map) throws Exception {

        //1. 재고관리 마스터 정보 저장 I,U,D
        String jsonObject = (String) map.get("stockGrid");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        Boolean flag = false;
        String message = "";

        if (jsonObject != null){
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

            ArrayList<HashMap<String, Object>> addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
            ArrayList<HashMap<String, Object>> updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
            //ArrayList<HashMap<String, Object>> deleteList = (ArrayList<HashMap<String, Object>>) jsonMap.get("deleteList");

            if (addList.size() > 0) {
                for (HashMap<String, Object> hashMap : addList) {
                    if(!flag) {
                        hashMap.put("queryId", "material.selectInsideStockAbbrNmUseType");
                        Map<String, Object> selMap1 = this.innodaleDao.getInfo(hashMap);

                        if(selMap1 == null || selMap1.get("ABBR_NM") == null || "".equals(selMap1.get("ABBR_NM"))){//디비 값 체크
                            model.addAttribute("result",		"fail");
                            flag = true;
                            message = "업체 약어명을 등록해주세요.";
//                       throw new Exception("managerEquip addList Error ABBR_NM NULL");
                        }else {
                            String ABBR_NM = (String)selMap1.get("ABBR_NM");

                            String ORDER_COMP_CD = (String)hashMap.get("ORDER_COMP_CD");
                            if(ORDER_COMP_CD == null || "".equals(ORDER_COMP_CD)){//그리드 값 체크
                                model.addAttribute("result",		"fail");
                                flag = true;
                                message = "발주처를 입력해주세요.";
//                       throw new Exception("managerEquip addList Error ORDER_COMP_CD NULL");
                            }else {
                                hashMap.put("queryId", "material.selectInsideStockSeq");
                                hashMap.put("ABBR_NM", ABBR_NM);
                                Map<String, Object> selMap2 = this.innodaleDao.getInfo(hashMap);
                                String INSIDE_STOCK_NUM = (String)selMap2.get("INSIDE_STOCK_NUM");

                                hashMap.put("LOGIN_USER_ID", userId);

                                hashMap.put("INSIDE_STOCK_NUM", INSIDE_STOCK_NUM);
                                hashMap.put("queryId", "material.insertInsideStock");
                                this.innodaleDao.insertGrid(hashMap);

                                // 21.04.12 추가버튼으로 저장한 경우 재고수량 입력가능
                                hashMap.put("IN_OUT_QTY", hashMap.get("INSIDE_STOCK_CURR_QTY"));

                                hashMap.put("queryId", "material.insertInsideStockIn");
                                this.innodaleDao.insertGrid(hashMap);
                            }

                        }
                    }
               }
           }
           if (updateList.size() > 0) {
               for (HashMap<String, Object> hashMap : updateList) {
                   hashMap.put("LOGIN_USER_ID", userId);

                   hashMap.put("queryId", "material.updateInsideStock");
                   this.innodaleDao.updateGrid(hashMap);

                   hashMap.put("queryId", "material.insertInsideStockIn");
                   this.innodaleDao.insertGrid(hashMap);
               }
           }
        /*   if (deleteList.size() > 0) {
               for (HashMap<String, Object> hashMap : deleteList) {
                   hashMap.put("queryId", "material.deleteMachineMasterHistory");
                   hashMap.put("EQUIP_ID", EQUIP_ID);
                   this.innodaleDao.deleteGrid(hashMap);
               }
           }*/
        }
        model.addAttribute("flag",flag);
        model.addAttribute("message",message);
    }

    /**
     * 재고관리 팝업 관리(I,U,D)
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void managerInsideStockPop(Model model, Map<String, Object> map) throws Exception {
        //popType : 그리드입출고 GRID_IN, GRID_OUT, 바코드 BARCODE
        String POP_TYPE = (String) map.get("POP_TYPE");
        String USE_BARCODE = (String)map.get("USE_BARCODE"); // 바코드 사용여부
        String CONTROL_SEQ = (String)map.get("CONTROL_SEQ"); // 바코드 사용여부
        String INSIDE_OUT_SEQ = (String)map.get("INSIDE_OUT_SEQ"); // 바코드 사용여부
        Boolean flag = false;
        String message = "";
        if("GRID_IN".equals(POP_TYPE)){

            map.put("queryId", "material.updateInsideStockPop");
            this.innodaleDao.update(map);

            map.put("queryId", "material.insertInsideStockIn");
            this.innodaleDao.create(map);

        }else if("GRID_OUT".equals(POP_TYPE) || "BARCODE_OUT".equals(POP_TYPE)){

            if(!"".equals(INSIDE_OUT_SEQ)) {
                map.put("queryId", "material.updateInsideStockOut");
                this.innodaleDao.update(map);
            }else {
                map.put("queryId", "material.insertInsideStockOut");
                this.innodaleDao.create(map);
            }

        }else if("BARCODE".equals(POP_TYPE)){
            String INSIDE_STOCK_NUM = (String) map.get("INSIDE_STOCK_NUM");

            if("".equals(INSIDE_STOCK_NUM)){ // 새로 등록하는 케이스
                String TEMP_INSIDE_STOCK_NUM = (String) map.get("TEMP_INSIDE_STOCK_NUM");
                if(!"".equals(TEMP_INSIDE_STOCK_NUM)) {
                    map.put("queryId", "material.selectTempInsideStockNum");
                    Map<String, Object> tempInfo = this.innodaleDao.getInfo(map);

                    if(tempInfo != null) {
                        flag = true;
                        message = "이미 등록된 재고번호입니다.";
                    }
                }
                if(!flag) {
                    map.put("queryId", "material.selectInsideStockAbbrNmUseType");
                    Map<String, Object> selMap1 = this.innodaleDao.getInfo(map);

                    if(selMap1 == null || selMap1.get("ABBR_NM") == null || "".equals(selMap1.get("ABBR_NM"))){//디비 값 체크
                        flag = true;
                        message = "업체 약어명을 등록해주세요.";
                    }else {
                        String ABBR_NM = (String)selMap1.get("ABBR_NM");

                        String ORDER_COMP_CD = (String)map.get("ORDER_COMP_CD");
                        if(ORDER_COMP_CD == null || "".equals(ORDER_COMP_CD)){//그리드 값 체크
                            flag = true;
                            message = "발주처를 입력해주세요.";
                        }else {
                            map.put("queryId", "material.selectInsideStockSeq");
                            map.put("ABBR_NM", ABBR_NM);
                            Map<String, Object> selMap2 = this.innodaleDao.getInfo(map);
                            String V_INSIDE_STOCK_NUM = (String)selMap2.get("INSIDE_STOCK_NUM");

                            map.put("INSIDE_STOCK_NUM", V_INSIDE_STOCK_NUM);
                            map.put("queryId", "material.insertInsideStock");
                            this.innodaleDao.create(map);
                            model.addAttribute("INSIDE_STOCK_NUM",		V_INSIDE_STOCK_NUM);
                        }
                    }
                }
            }else{
                map.put("queryId", "material.updateInsideStockPop");
                this.innodaleDao.update(map);
            }
            if(!flag) {
                map.put("queryId", "material.insertInsideStockIn");
                this.innodaleDao.create(map);
            }

            if("Y".equals(USE_BARCODE)) { // 바코드로 재고입고시 출고프로세스 제거 (21/07/05)
//                outGoingProcessForBarcodeIn(model,map);
            }
        }

        model.addAttribute("flag",flag);
        model.addAttribute("message",message);
    }

    @Override // 바코드로 재고입고시, 출고까지 진행 (단, 해당 작업지시건의 주문중 재고가 Y인것만 출고처리)
    public void outGoingProcessForBarcodeIn(Model model, Map<String, Object> map) throws Exception {
        map.put("queryId", "material.insertOutgoingInStockManage1");
        this.innodaleDao.create(map);

        map.put("queryId", "material.updateOutgoingOutInStockManage1");
        this.innodaleDao.update(map);

        map.put("queryId", "inspection.updateOutgoingOutType1After2");
        this.innodaleDao.update(map);

        map.put("queryId", "inspection.updateOutgoingOutType1After3");
        this.innodaleDao.update(map);

        map.put("queryId", "inspection.updateOutFinishStatus");
        this.innodaleDao.update(map);

    }

    /**
     * 보유 소재 관리(I,U)
     *
     * @param hashMap
     * @throws Exception
     */
    @Override
    public void inWarehouseManageSave(Model model, HashMap<String, Object> hashMap) throws Exception {
        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        HashMap<String, Object> queryIdList = null;

        boolean checkYn = true;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("addList"))
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");

        if (jsonMap.containsKey("updateList"))
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

        if (jsonMap.containsKey("queryIdList"))
            queryIdList = (HashMap<String, Object>) jsonMap.get("queryIdList");

        ArrayList<String> selectQueryId = (ArrayList<String>) queryIdList.get("selectQueryId");

        for (HashMap<String, Object> dataList : addList) {
            dataList.put("queryId", selectQueryId.get(0));
            Map<String, Object> resultMap = this.innodaleDao.getInfo(dataList);
            Long cnt = (Long) resultMap.get("CNT");
            if (cnt > 0) {
                checkYn = false;
                break;
            }
        }

        /*if(checkYn) {
            for (HashMap<String, Object> dataList : updateList) {
                dataList.put("queryId", selectQueryId.get(0));
                Map<String, Object> resultMap = this.innodaleDao.getInfo(dataList);
                Long cnt = (Long) resultMap.get("CNT");
                if (cnt > 1) {
                    checkYn = false;
                    break;
                }
            }
        }*/

        if(checkYn) {
            if (addList != null && addList.size() > 0) {
                ArrayList<String> queryId = (ArrayList<String>) queryIdList.get("insertQueryId");
                for (HashMap<String, Object> dataList : addList) {
                    for (int i = 0, queryCount = queryId.size(); i < queryCount; i++) {
                        dataList.put("queryId", queryId.get(i));
                        this.innodaleDao.insertGrid(dataList);
                    }
                }
            }
            if (updateList != null && updateList.size() > 0) {
                ArrayList<String> queryId = (ArrayList<String>) queryIdList.get("updateQueryId");
                for (HashMap<String, Object> dataList : updateList) {
                    for (int i = 0, queryCount = queryId.size(); i < queryCount; i++) {
                        dataList.put("queryId", queryId.get(i));
                        this.innodaleDao.updateGrid(dataList);
                    }
                }
            }

            model.addAttribute("result",		"success");

        }else{
            model.addAttribute("result",		"fail");
        }
    }

    @Override
    public void providePossessionMaterialSave(Model model, HashMap<String, Object> hashMap) throws Exception {
        String userId = (String) hashMap.get("LOGIN_USER_ID");
        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        ArrayList<HashMap<String, Object>> updateList = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("updateList"))
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

        if (updateList != null && updateList.size() > 0) {
            for (HashMap<String, Object> dataList : updateList) {
                dataList.put("LOGIN_USER_ID", userId);
                dataList.put("queryId", "material.selectItemOrderRegisterNextMaterialOrderNum");
                Map<String, Object> selMap1 =  this.innodaleDao.getInfo(dataList);
                dataList.put("MATERIAL_ORDER_NUM", selMap1.get("MATERIAL_ORDER_NUM"));
                dataList.put("queryId", "material.insertItemOrderRegisterOut1");
                this.innodaleDao.create(dataList);
                dataList.put("queryId", "material.insertItemOrderRegisterOut2");
                this.innodaleDao.create(dataList);
                dataList.put("queryId", "material.updateItemOrderRegisterOut3");
                this.innodaleDao.update(dataList);

            }
        }
    }

    @Override
    public void cancelInsideStock(Model model, Map<String, Object> map) throws Exception {
        String CONTROL_SEQ = (String)map.get("CONTROL_SEQ"); // 바코드 사용여부
        String TYPE_CODE = (String)map.get("TYPE_CODE"); // 타입
        Boolean flag = false;
        String message = "";

        try {
            if("OUT".equals(TYPE_CODE)) { //todo INSIDE_OUT에서 제거
                map.put("queryId", "material.deleteInsideStockOut");
                this.innodaleDao.remove(map);
            }else if("IN".equals(TYPE_CODE)) { //

                map.put("queryId", "material.deleteInsideStockIn");
                this.innodaleDao.remove(map);

//                if(!"".equals(CONTROL_SEQ)) { //바코드로 재고입고시 출고프로세스 제거로 해당 로직도 제거 (21/07/05)
//                    map.put("queryId", "material.deleteInsideStockOutgoing");
//                    this.innodaleDao.remove(map);
//
//                    map.put("queryId", "material.updateInsideStockOutgoingPartOrder");
//                    this.innodaleDao.update(map);
//
//                    map.put("queryId", "material.updateInsideStockOutgoingControl1");
//                    this.innodaleDao.update(map);
//
//                    map.put("queryId", "material.updateInsideStockOutgoingPart");
//                    this.innodaleDao.update(map);
//
//                    map.put("queryId", "material.updateInsideStockOutgoingControl2");
//                    this.innodaleDao.update(map);
//                }
            }
        }catch (Exception e) {
            flag = true;
        }

        model.addAttribute("flag",flag);
        model.addAttribute("message",message);
    }


}
