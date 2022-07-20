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
        String userId = (String) hashMap.get("LOGIN_USER_ID");
        String jsonDetail = (String) hashMap.get("ESTIMATE_DETAIL_DATA");
        String jsonReceive = (String) hashMap.get("ESTIMATE_RECEIVER_DATA");
        String EST_SEQ = (String) hashMap.get("EST_SEQ");

        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("LOGIN_USER_ID", userId);

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
    public void saveFromControlToEstimate(HashMap<String, Object> hashMap) throws Exception {
        String userId = (String) hashMap.get("LOGIN_USER_ID");
        String jsonDetail = (String) hashMap.get("ESTIMATE_DETAIL_DATA");
        String jsonReceive = (String) hashMap.get("ESTIMATE_RECEIVER_DATA");
        String EST_SEQ = (String) hashMap.get("EST_SEQ");

        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("LOGIN_USER_ID", userId);

        // Estimate Master Insert
        estimateDao.insertEstimateMaster(hashMap);

        if (jsonDetail != null) {
            jsonMap = objectMapper.readValue(jsonDetail, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }

        for (int i = 0; i < jsonMap.size(); i++) {
            data = jsonMap.get(i);
            data.put("EST_SEQ", EST_SEQ);
            estimateDao.insertEstimateDetail(data);
//            data.put("queryId", "estimate.insertEstimateDetailProcessFromControl");
            data.put("queryId", "estimate.insertEstimateDetailProcessFromOrder");
            this.innodaleDao.create(data);
            data.put("queryId", "estimate.updateEstimateAutomaticQuote");
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
        String userId = (String) hashMap.get("LOGIN_USER_ID");
        String jsonObject = (String) hashMap.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        Map<String, Object> data = new HashMap<String, Object>();
        Map<String, ArrayList<Map<String, Object>>> map = new HashMap<String,ArrayList<Map<String, Object>>>();
        data.put("LOGIN_USER_ID", userId);

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }

        for (int i = 0; i < jsonMap.size(); i++) {
            data = jsonMap.get(i);

            ArrayList<Map<String, Object>> tempArr = new ArrayList<Map<String, Object>>();
            if(map.get((String) data.get("DRAWING_NUM")) != null) {
                tempArr = map.get((String) data.get("DRAWING_NUM"));
            }
            tempArr.add(data);
            map.put((String) data.get("DRAWING_NUM"),tempArr);
        }

        for (int i = 0; i < jsonMap.size(); i++) {
            data = jsonMap.get(i);
            data.put("LOGIN_USER_ID", userId);
            String workType = (String) data.get("WORK_TYPE");
            if(!workType.equals("WTP050")) {
//                estimateDao.insertEstimateOrderControlMaster(data);
//                estimateDao.insertEstimateOrderControlDetail(data);
//                estimateDao.insertEstimateOrderControlOrder(data);
//                estimateDao.insertEstimateOrderControlBarcode(data);
//                estimateDao.insertEstimateOrderOutBarcode(data);
                data.put("queryId","estimate.insertEstimateOrderMaster");
                this.innodaleDao.create(data);

                data.put("queryId", "orderMapper.insertOutBarcode");
                this.innodaleDao.create(data);

//                data.put("queryId", "estimate.insertEstimateOrderPartProcess");
//                this.innodaleDao.create(data);

//                if(workType.equals("WTP020") && map.get((String) data.get("DRAWING_NUM")) != null) {
//                    ArrayList<Map<String, Object>> tempArr = map.get((String) data.get("DRAWING_NUM"));
//                    int count = 1;
//                    for(Map<String, Object> temp : tempArr) {
//                        if(temp.get("WORK_TYPE").equals("WTP050")) {
//                            temp.put("CONTROL_SEQ",data.get("CONTROL_SEQ"));
//                            temp.put("PART_NUM",count);
//                            temp.put("LOGIN_USER_ID", userId);
//                            estimateDao.insertEstimateOrderControlDetail(temp);
//                            estimateDao.insertEstimateOrderControlBarcode(data);
//                            data.put("queryId", "estimate.insertEstimateOrderPartProcess");
//                            this.innodaleDao.create(data);
//                            count++;
//                        }
//                    }
//                }
            }
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
                if (!(str == null || str.equals(""))) {
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
        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        boolean flag = false;
        String seq1 = null;
        String seq2 = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("addList"))
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");

        if (jsonMap.containsKey("updateList"))
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

        if (jsonMap.containsKey("SEQ1"))
            seq1 = String.valueOf(jsonMap.get("SEQ1"));

        if (jsonMap.containsKey("SEQ2"))
            seq2 = String.valueOf(jsonMap.get("SEQ2"));


        try {
            if (addList != null && addList.size() > 0) {
                for (HashMap<String, Object> hashMap : addList) {
                    hashMap.put("EST_SEQ", seq1);
                    hashMap.put("SEQ", seq2);
                    hashMap.put("queryId", "estimate.insertEstimateDetailProcess");
                    this.innodaleDao.insertGrid(hashMap);
                    hashMap.put("queryId", "estimate.updateEstimateAutomaticQuote");
                    this.innodaleDao.updateGrid(hashMap);
                }
            }
            if (updateList != null && updateList.size() > 0) {
                for (HashMap<String, Object> hashMap : updateList) {
                    hashMap.put("EST_SEQ", seq1);
                    hashMap.put("SEQ", seq2);
                    hashMap.put("queryId", "estimate.insertEstimateDetailProcess");
                    this.innodaleDao.insertGrid(hashMap);
                    hashMap.put("queryId", "estimate.updateEstimateAutomaticQuote");
                    this.innodaleDao.updateGrid(hashMap);
                }
            }
        } catch (Exception e) {
            flag = true;
            e.printStackTrace();
        }

        model.addAttribute("flag", flag);
    }

    @Override
    public void processingRequirementsEstimateEtcSave(Model model, Map<String, Object> map) throws Exception {
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

            seq1 = String.valueOf(jsonMap.get("SEQ1"));
            seq2 = String.valueOf(jsonMap.get("SEQ2"));
        }

        try {
            if (updateList != null && updateList.size() > 0) {
                for (HashMap<String, Object> hashMap : updateList) {
                    hashMap.put("LOGIN_USER_ID",userId);
                    hashMap.put("SEQ1", seq1);
                    hashMap.put("SEQ2", seq2);
                    hashMap.put("queryId", "estimate.updateEstimateEtcProcess");
                    this.innodaleDao.updateGrid(hashMap);
                }
            }
        } catch (Exception e) {
            flag = true;
            e.printStackTrace();
        }

        model.addAttribute("flag", flag);

    }
}
