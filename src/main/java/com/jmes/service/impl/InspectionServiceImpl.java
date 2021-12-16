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
            jsonMap.put("LOGIN_USER_ID",userId);
            jsonMap.put("queryId","inspection.selectInspectionResultExistCheck");
            HashMap<String,Object> inspectInfo = (HashMap<String, Object>) this.innodaleDao.getInfo(jsonMap);
            String inspectResultSeq = null;
            if(inspectInfo != null && inspectInfo.get("INSPECT_RESULT_SEQ") != null && !inspectInfo.get("INSPECT_RESULT_SEQ").equals("")) {
                inspectResultSeq = (String) inspectInfo.get("INSPECT_RESULT_SEQ");
            }else {
                jsonMap.put("queryId","inspection.selectInspectionResultSeq");
                HashMap<String,Object> seqData = (HashMap<String, Object>) this.innodaleDao.getInfo(jsonMap);
                inspectResultSeq = (String) seqData.get("INSPECT_RESULT_SEQ");

                jsonMap.put("INSPECT_RESULT_SEQ",inspectResultSeq);
                jsonMap.put("queryId","inspection.insertInspectionResult");
                innodaleDao.create(jsonMap);
            }


            for(HashMap<String,Object> hashMap : addList) {
                hashMap.put("LOGIN_USER_ID", userId);
                hashMap.put("PRODUCT_NUM",jsonMap.get("PRODUCT_NUM"));
                hashMap.put("CONTROL_SEQ",jsonMap.get("CONTROL_SEQ"));
                hashMap.put("CONTROL_DETAIL_SEQ",jsonMap.get("CONTROL_DETAIL_SEQ"));
                hashMap.put("LAYER_AREA_NAME",jsonMap.get("LAYER_AREA_NAME"));
                hashMap.put("INSPECT_RESULT_SEQ",inspectResultSeq);

                hashMap.put("queryId","inspection.insertInspectionResultPoint");
                innodaleDao.create(hashMap);

                hashMap.put("queryId","inspection.insertInspectionResultValue");
                innodaleDao.create(hashMap);
            }
        }

        if(updateList != null && updateList.size() > 0) {
            for(int i = 0; i < updateList.size(); i++) {
                HashMap<String,Object> tempMap = updateList.get(i);
                tempMap.put("LOGIN_USER_ID",userId);
//                tempMap.put("PRODUCT_NUM",jsonMap.get("PRODUCT_NUM"));
                tempMap.put("CONTROL_SEQ",jsonMap.get("CONTROL_SEQ"));
                tempMap.put("CONTROL_DETAIL_SEQ",jsonMap.get("CONTROL_DETAIL_SEQ"));
                tempMap.put("LAYER_AREA_NAME",jsonMap.get("LAYER_AREA_NAME"));

                if(tempMap.containsKey("INSPECT_RESULT_SEQ")) {
                    tempMap.put("queryId","inspection.updateInspectionResult");
                    innodaleDao.update(tempMap);

                    if(tempMap.containsKey("POINT_SEQ")) {
                        tempMap.put("queryId","inspection.updateInspectionResultPoint");
                        innodaleDao.update(tempMap);

                        if(tempMap.containsKey("INSPECT_RESULT_VALUE_SEQ")) {
                            tempMap.put("queryId","inspection.updateInspectionResultValue");
                            innodaleDao.update(tempMap);
                        }else {
                            tempMap.put("PRODUCT_NUM",jsonMap.get("PRODUCT_NUM"));

                            tempMap.put("queryId","inspection.insertInspectionResultValue");
                            innodaleDao.create(tempMap);
                        }
                    }
                }
            }
        }

        if(deleteList != null && deleteList.size() > 0) {
            for(HashMap<String,Object> hashMap : deleteList) {
                hashMap.put("LOGIN_USER_ID", userId);

                if(hashMap.containsKey("INSPECT_RESULT_SEQ") && hashMap.containsKey("POINT_SEQ")){

                    hashMap.put("queryId","inspection.deleteInspectionResultValue");
                    innodaleDao.remove(hashMap);

                    hashMap.put("queryId","inspection.deleteInspectionResultPoint");
                    innodaleDao.remove(hashMap);
                }
            }
        }

        jsonMap.put("queryId","inspection.selectInspectionResultControlInfo");
        HashMap<String,Object> result = (HashMap<String, Object>) innodaleDao.getInfo(jsonMap);
        model.addAttribute("result",result);
    }

    @Override
    public void selectInspectResult(Map<String, Object> hashMap, Model model) throws Exception {
        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});
        }
        jsonMap.put("queryId","inspection.selectInspectionResultValueList");
        System.out.println(jsonMap.toString());
        ArrayList<Map<String,Object>> list = (ArrayList<Map<String, Object>>) innodaleDao.getList(jsonMap);
        System.out.println("list >>>>>>>>>>>>>>>>>>>>>>>>>> " +list.toString());
        model.addAttribute("data",list);

    }
}
