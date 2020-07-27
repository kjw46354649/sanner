package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jmes.dao.EstimateDao;
import com.jmes.service.EstimateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class EstimateServiceImpl implements EstimateService {

    @Autowired
    public EstimateDao estimateDao;

    @Override
    public void registerEstimateSave(HashMap<String, Object> hashMap) throws Exception {
        String jsonDetail = (String) hashMap.get("ESTIMATE_DETAIL_DATA");
        String jsonReceive = (String) hashMap.get("ESTIMATE_RECEIVER_DATA");
        String EST_SEQ = (String) hashMap.get("EST_SEQ");

        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> data = new HashMap<String, Object>();

        // Estimate Master Insert
        estimateDao.insertEstimateMaster(hashMap);

        if (jsonDetail != null) {
            jsonMap = objectMapper.readValue(jsonDetail, new TypeReference<ArrayList<Map<String, Object>>>() {
            });
        }

        for(int i=0; i<jsonMap.size(); i++) {
            data = jsonMap.get(i);
            //if(data.get("DRAWING_NUM") != null && !"".equals(data.get("DRAWING_NUM")) && data.containsValue("DRAWING_NUM")){
                data.put("EST_SEQ",EST_SEQ);
                estimateDao.insertEstimateDetail(data);
            //}
        }

        if (jsonReceive != null) {
            jsonMap = objectMapper.readValue(jsonReceive, new TypeReference<ArrayList<Map<String, Object>>>() {
            });
        }

        for(int i=0; i<jsonMap.size(); i++) {
            data = jsonMap.get(i);
            data.put("EST_SEQ",EST_SEQ);

            estimateDao.insertEstimateReceiver(data);
        }
    }

    @Override
    public void registerEstimateOrder(HashMap<String, Object> hashMap) throws Exception {
        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> data = new HashMap<String, Object>();

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {
            });
        }

        for(int i=0; i<jsonMap.size(); i++) {
            data = jsonMap.get(i);

            //System.out.println(" ################################## ");
            //System.out.println(data);
            //System.out.println(" ################################## ");

            estimateDao.insertEstimateOrderControlMaster(data);
            estimateDao.insertEstimateOrderControlDetail(data);
            estimateDao.insertEstimateOrderControlOrder(data);
            estimateDao.insertEstimateOrderControlBarcode(data);

        }

        estimateDao.updateEstimateMasterFinish(data);

    }
}
