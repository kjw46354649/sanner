package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.InspectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InspectionServiceImpl implements InspectionService {
    @Autowired
    public InnodaleDao innodaleDao;

    @Override
    public void saveLayer(Map<String, Object> map, Model model) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }
        String layerName = (String) jsonMap.get(0).get("LAYER_AREA_NAME");
        HashMap<String,Object> tempMap = new HashMap<>();
        tempMap.put("queryId","inspection.selectLayerInfo");
        tempMap.put("LAYER_AREA_NAME",layerName);

        List<Map<String,Object>> arrList = innodaleDao.getList(tempMap);

        for(int i=0;i<arrList.size();i++) {
            boolean flag = false;
            Map<String,Object> org = arrList.get(i);
            for(Map<String,Object> temp : jsonMap) {
                String id = org.get("LAYER_AREA_NAME")+"_"+org.get("AREA_TYPE")+"_"+org.get("MARK_TYPE")+"_"+org.get("AREA_NAME");
                String targetId = temp.get("LAYER_AREA_NAME")+"_"+temp.get("AREA_TYPE")+"_"+temp.get("MARK_TYPE")+"_"+temp.get("AREA_NAME");
                if(id.equals(targetId)) {
                    flag = true;
                }
            }
            if(!flag) {
                org.put("queryId","inspection.deleteLayerInfo");
                innodaleDao.remove(org);
            }
        }



        for (Map<String, Object> hashMap : jsonMap) {
            hashMap.put("queryId","inspection.insertLayerInfo");
            innodaleDao.create(hashMap);
        }
    }

    @Override
    public void modifyInspectResult(Map<String, Object> map, Model model) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> oldList = null;
        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        ArrayList<HashMap<String, Object>> deleteList = null;

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});
        }


        if(jsonMap.containsKey("oldList")) {
            oldList = (ArrayList<HashMap<String, Object>>) jsonMap.get("oldList");
        }
        if(jsonMap.containsKey("addList")) {
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
        }
        if(jsonMap.containsKey("updateList")) {
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
        }
        if(jsonMap.containsKey("deleteList")) {
            deleteList = (ArrayList<HashMap<String, Object>>) jsonMap.get("deleteList");
        }

        if(addList != null && addList.size() > 0) {
            for(HashMap<String,Object> hashMap : addList) {
                hashMap.put("LOGIN_USER_ID", userId);
                hashMap.put("PRODUCT_NUM",jsonMap.get("PRODUCT_NUM"));
                hashMap.put("CONTROL_SEQ",jsonMap.get("CONTROL_SEQ"));
                hashMap.put("CONTROL_DETAIL_SEQ",jsonMap.get("CONTROL_DETAIL_SEQ"));
                hashMap.put("LAYER_AREA_NAME",jsonMap.get("LAYER_AREA_NAME"));

                hashMap.put("queryId","inspection.insertInspectionResult");
                innodaleDao.create(hashMap);
            }
        }

        if(updateList != null && updateList.size() > 0) {
            for(int i = 0; i < updateList.size(); i++) {
                HashMap<String,Object> tempMap = updateList.get(i);
                tempMap.put("LOGIN_USER_ID",userId);
                tempMap.put("PRODUCT_NUM",jsonMap.get("PRODUCT_NUM"));
                tempMap.put("CONTROL_SEQ",jsonMap.get("CONTROL_SEQ"));
                tempMap.put("CONTROL_DETAIL_SEQ",jsonMap.get("CONTROL_DETAIL_SEQ"));
                tempMap.put("LAYER_AREA_NAME",jsonMap.get("LAYER_AREA_NAME"));

                if(tempMap.containsKey("INSPECT_RESULT_SEQ")) {
                    tempMap.put("queryId","inspection.updateInspectionResult");
                    innodaleDao.update(tempMap);
                }
            }
        }

        if(deleteList != null && deleteList.size() > 0) {
            for(HashMap<String,Object> hashMap : deleteList) {
                hashMap.put("LOGIN_USER_ID", userId);

                if(hashMap.containsKey("INSPECT_RESULT_SEQ")){
                    hashMap.put("queryId","inspection.deleteInspectionResult");
                    innodaleDao.remove(hashMap);
                }
            }
        }
    }
}