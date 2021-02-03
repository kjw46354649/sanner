package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.MaterialService;
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
       ObjectMapper objectMapper = new ObjectMapper();
       Map<String, Object> jsonMap = null;

       if (jsonObject != null){
           jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

           ArrayList<HashMap<String, Object>> addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
           ArrayList<HashMap<String, Object>> updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
           //ArrayList<HashMap<String, Object>> deleteList = (ArrayList<HashMap<String, Object>>) jsonMap.get("deleteList");

           if (addList.size() > 0) {
               for (HashMap<String, Object> hashMap : addList) {

                   hashMap.put("queryId", "material.selectInsideStockAbbrNm");
                   Map<String, Object> selMap1 = this.innodaleDao.getInfo(hashMap);

                   String ABBR_NM = (String)selMap1.get("ABBR_NM");
                   if(ABBR_NM == null || "".equals(ABBR_NM)){//디비 값 체크
                       model.addAttribute("result",		"fail");
                       throw new Exception("managerEquip addList Error ABBR_NM NULL");
                   }

                   String ORDER_COMP_CD = (String)hashMap.get("ORDER_COMP_CD");
                   if(ORDER_COMP_CD == null || "".equals(ORDER_COMP_CD)){//그리드 값 체크
                       model.addAttribute("result",		"fail");
                       throw new Exception("managerEquip addList Error ORDER_COMP_CD NULL");
                   }

                   hashMap.put("queryId", "material.selectInsideStockSeq");
                   hashMap.put("ABBR_NM", ABBR_NM);
                   Map<String, Object> selMap2 = this.innodaleDao.getInfo(hashMap);
                   String INSIDE_STOCK_NUM = (String)selMap2.get("INSIDE_STOCK_NUM");

                   hashMap.put("INSIDE_STOCK_NUM", INSIDE_STOCK_NUM);
                   hashMap.put("queryId", "material.insertInsideStock");
                   this.innodaleDao.insertGrid(hashMap);

                   hashMap.put("queryId", "material.insertInsideStockIn");
                   this.innodaleDao.insertGrid(hashMap);
               }
           }
           if (updateList.size() > 0) {
               for (HashMap<String, Object> hashMap : updateList) {
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
        model.addAttribute("result",		"success");
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
        if("GRID_IN".equals(POP_TYPE)){

            map.put("queryId", "material.updateInsideStockPop");
            this.innodaleDao.update(map);

            map.put("queryId", "material.insertInsideStockIn");
            this.innodaleDao.create(map);

        }else if("GRID_OUT".equals(POP_TYPE)){

            map.put("queryId", "material.insertInsideStockOut");
            this.innodaleDao.create(map);

        }else if("BARCODE".equals(POP_TYPE)){
            String INSIDE_STOCK_NUM = (String) map.get("INSIDE_STOCK_NUM");

            if("".equals(INSIDE_STOCK_NUM)){

                map.put("queryId", "material.selectInsideStockAbbrNm");
                Map<String, Object> selMap1 = this.innodaleDao.getInfo(map);

                String ABBR_NM = (String)selMap1.get("ABBR_NM");
                if(ABBR_NM == null || "".equals(ABBR_NM)){//디비 값 체크
                    model.addAttribute("result",		"fail");
                    throw new Exception("managerEquip addList Error ABBR_NM NULL");
                }

                String ORDER_COMP_CD = (String)map.get("ORDER_COMP_CD");
                if(ORDER_COMP_CD == null || "".equals(ORDER_COMP_CD)){//그리드 값 체크
                    model.addAttribute("result",		"fail");
                    throw new Exception("managerEquip addList Error ORDER_COMP_CD NULL");
                }

                map.put("queryId", "material.selectInsideStockSeq");
                map.put("ABBR_NM", ABBR_NM);
                Map<String, Object> selMap2 = this.innodaleDao.getInfo(map);
                String V_INSIDE_STOCK_NUM = (String)selMap2.get("INSIDE_STOCK_NUM");

                map.put("INSIDE_STOCK_NUM", V_INSIDE_STOCK_NUM);
                map.put("queryId", "material.insertInsideStock");
                this.innodaleDao.create(map);
                model.addAttribute("INSIDE_STOCK_NUM",		V_INSIDE_STOCK_NUM);
            }else{
                map.put("queryId", "material.updateInsideStockPop");
                this.innodaleDao.update(map);
            }

            map.put("queryId", "material.insertInsideStockIn");
            this.innodaleDao.create(map);

        }

        model.addAttribute("result",		"success");
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

}
