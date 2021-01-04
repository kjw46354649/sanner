package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.dao.EstimateDao;
import com.jmes.service.EstimateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Service
public class EstimateServiceImpl implements EstimateService {

    @Autowired
    public EstimateDao estimateDao;
    @Autowired
    private InnodaleDao innodaleDao;

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
            jsonMap = objectMapper.readValue(jsonDetail, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }

        for (int i = 0; i < jsonMap.size(); i++) {
            data = jsonMap.get(i);
            //if(data.get("DRAWING_NUM") != null && !"".equals(data.get("DRAWING_NUM")) && data.containsValue("DRAWING_NUM")){
            data.put("EST_SEQ", EST_SEQ);
            estimateDao.insertEstimateDetail(data);
            data.put("queryId", "estimate.updateEstimateAutomaticQuote");
            this.innodaleDao.update(data);
            //}
        }

        if (jsonReceive != null) {
            jsonMap = objectMapper.readValue(jsonReceive, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }

        for (int i = 0; i < jsonMap.size(); i++) {
            data = jsonMap.get(i);
            data.put("EST_SEQ", EST_SEQ);

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

    @Override
    public void insertMaterialCost(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("addList"))
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");

        if (jsonMap.containsKey("updateList"))
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");


        if (addList != null && addList.size() > 0) {
            Integer seq = null;
            for (int i = 0; i < addList.size(); i++) {
                HashMap<String, Object> hashMap = addList.get(i);

                if ((i + 1) % 5 == 1) {
                    hashMap.put("queryId", "common.selectDummyNextSequence");
                    seq = this.innodaleDao.createKeyReturn(hashMap);

                    hashMap.put("CALC_SEQ", seq);
                    hashMap.put("queryId", "estimate.insertMaterialCost");
                    this.innodaleDao.insertGrid(hashMap);
                } else {
                    hashMap.put("CALC_SEQ", seq);
                }

                hashMap.put("queryId", "estimate.insertMaterialCostRange");
                this.innodaleDao.insertGrid(hashMap);
                hashMap.put("queryId", "estimate.deleteMaterialCostRangeSizeIntoType");
                this.innodaleDao.deleteGrid(hashMap);
                String str = (String) hashMap.get("SIZE_NUM");
                String[] arr;
                if (str != null) {
                    arr = str.split(",");

                    for (String value : arr) {
                        hashMap.put("queryId", "estimate.insertMaterialCostRangeSize");
                        hashMap.put("SIZE_NUM", value);
                        this.innodaleDao.insertGrid(hashMap);
                    }
                }
            }
        }
        if (updateList != null && updateList.size() > 0) {
            for (int i = 0; i < updateList.size(); i++) {
                HashMap<String, Object> hashMap = updateList.get(i);

                if ((i + 1) % 5 == 1) {
                    hashMap.put("queryId", "estimate.insertMaterialCost");
                    this.innodaleDao.updateGrid(hashMap);
                }

                hashMap.put("queryId", "estimate.insertMaterialCostRange");
                this.innodaleDao.insertGrid(hashMap);
                hashMap.put("queryId", "estimate.deleteMaterialCostRangeSizeIntoType");
                this.innodaleDao.deleteGrid(hashMap);
                String str = (String) hashMap.get("SIZE_NUM");
                String[] arr;
                if (str != null) {
                    arr = str.split(",");

                    for (String value : arr) {
                        hashMap.put("queryId", "estimate.insertMaterialCostRangeSize");
                        hashMap.put("SIZE_NUM", value);
                        this.innodaleDao.insertGrid(hashMap);
                    }
                }
            }
        }
    }

    @Override
    public void deleteMaterialCost(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {});

        for (Map<String, Object> hashMap : jsonMap) {
            hashMap.put("queryId", "estimate.deleteMaterialCostRangeSize");
            this.innodaleDao.deleteGrid(hashMap);
            hashMap.put("queryId", "estimate.deleteMaterialCostRange");
            this.innodaleDao.deleteGrid(hashMap);
            hashMap.put("queryId", "estimate.deleteMaterialCost");
            this.innodaleDao.deleteGrid(hashMap);
        }
    }

    @Override
    public void processingRequirementsEstimateSave(Model model, Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        boolean flag = false;


        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        Set set = jsonMap.entrySet();
        Iterator iterator = set.iterator();

        try {
            while (iterator.hasNext()) {
                Map.Entry entry = (Map.Entry) iterator.next();
                String key = (String) entry.getKey();
                String value = (String) entry.getValue();

                if (key.contains("PROCESS_CNT")) {
                    HashMap<String, Object> hashMap = new HashMap<String, Object>();
                    String factorCd = key.substring(key.length() - 6, key.length());
                    hashMap.put("TYPE", jsonMap.get("TYPE"));
                    hashMap.put("EST_SEQ", jsonMap.get("SEQ1"));
                    hashMap.put("SEQ", jsonMap.get("SEQ2"));
                    hashMap.put("FACTOR_CD", factorCd);
                    hashMap.put("PROCESS_CNT", value);
                    hashMap.put("queryId", "estimate.insertEstimateDetailProcess");
                    this.innodaleDao.create(hashMap);
                    hashMap.put("queryId", "estimate.updateEstimateAutomaticQuote");
                    this.innodaleDao.update(hashMap);
                }
            }
        } catch (Exception e) {
            flag = true;
        }

        model.addAttribute("flag", flag);
    }
}
