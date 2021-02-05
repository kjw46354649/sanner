package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.ProductionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

@Service
public class ProductionServiceImpl implements ProductionService {

    @Autowired
    public InnodaleDao innodaleDao;

    @Override
    public void managerStartCamWork(Model model, Map<String, Object> map) throws Exception {

//        map.put("queryId", "machine.insertMctCamWork");
//        innodaleDao.update(map);
//
//        // parts 상태 업데이트 처리
//        map.put("queryId", "machine.createCamStartControlPartProgress");
//        innodaleDao.update(map);
//        map.put("queryId", "machine.updateCamStartControlPartStatus");
//        innodaleDao.update(map);

        boolean updateStatus = false;

        map.put("queryId", "machine.selectStartMctCamCheck");
        Map<String, Object> camInfo = innodaleDao.getInfo(map);

        if (camInfo == null) {
            map.put("queryId", "machine.insertMctCamWork");
            innodaleDao.create(map);
            updateStatus = true;
        } else if (camInfo != null && "N".equals(camInfo.get("ALREADY_STARTED"))) {
            map.put("CAM_SEQ", camInfo.get("CAM_SEQ"));
            map.put("queryId", "machine.updateCamWork");
            innodaleDao.update(map);
            updateStatus = true;
        }

        if(updateStatus){
            // parts 상태 업데이트 처리
            map.put("queryId", "machine.createCamStartControlPartProgress");
            innodaleDao.update(map);
            map.put("queryId", "machine.updateCamStartControlPartStatus");
            innodaleDao.update(map);
        }

    }

    @Override
    public void managerCancelCamWork(Model model, Map<String, Object> map) throws Exception {
        // actionType : temp: 임시저장, complete: 완료, cancel: 취소
        Set set = map.entrySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry entry = (Map.Entry) iterator.next();
            String key = (String) entry.getKey();

            if (key.contains("CAM_WORK_SEQ")) {
                String value = (String) entry.getValue();
                Map<String, Object> map1 = new HashMap<String, Object>();
                map1.putAll(map);
                map1.put("SEQ", value);
                map1.put("queryId", "machine.deleteMctCamDetailWork");
                innodaleDao.remove(map1);
            }
        }
        map.put("queryId", "machine.deleteMctCamWork");
        innodaleDao.update(map);
        // 현재 상태가 PRO006 이면 CONTROL PARTS 이전 상태로 변경
        // parts 상태 업데이트 처리
        map.put("queryId", "machine.beforeStatusControlPartProgress");
        innodaleDao.update(map);
        map.put("queryId", "machine.beforeStatusControlPart");
        innodaleDao.update(map);
    }

    @Override
    public void managerCamWork(Model model, Map<String, Object> map) throws Exception {

        // actionType : temp: 임시저장, complete: 완료, cancel: 취소
        String actionType = (String)map.get("actionType");

        switch(actionType){
            case "complete":
                map.put("queryId", "machine.updateMctCamWorkComplete");
                innodaleDao.update(map);
                break;
            case "temp":
                map.put("queryId", "machine.updateMctCamWork");
                innodaleDao.update(map);
                break;
        }

        /** 최신 정보로 업데이트 하고 5건 전체를 처리 한다. **/
        for(int i=1;i<=5;i++){
            HashMap<String, Object> camWorkInfo = new HashMap<String, Object>();
            String sIndexNum = "0" + i;
            if(map.containsKey("CAM_WORK_CHK_" + sIndexNum)){
                camWorkInfo.put("queryId", "machine.insertMctCamDetailWork");
                camWorkInfo.put("SEQ", i);
                camWorkInfo.put("CAM_SEQ", map.get("CAM_SEQ"));
                camWorkInfo.put("WORK_DIRECTION", map.get("CAM_WORK_DIRECTION_" + sIndexNum));
                camWorkInfo.put("WORK_DESC", map.get("CAM_WORK_DESC_" + sIndexNum));
                camWorkInfo.put("WORK_USER_ID", map.get("CAM_WORK_USER_ID_" + sIndexNum));
                camWorkInfo.put("DESIGN_QTY", map.get("CAM_WORK_DESIGN_QTY_" + sIndexNum));
                camWorkInfo.put("CAM_GFILE_SEQ", map.get("CAM_WORK_GFILE_SEQ_" + sIndexNum));
                camWorkInfo.put("LOGIN_USER_ID", map.get("LOGIN_USER_ID"));
                innodaleDao.update(camWorkInfo);
            }else{
                camWorkInfo.put("queryId", "machine.deleteMctCamDetailWork");
                camWorkInfo.put("CAM_SEQ", map.get("CAM_SEQ"));
                camWorkInfo.put("SEQ", i);
                innodaleDao.update(camWorkInfo);
            }
        }
    }

    @Override
    public void modifyMctPlan(Model model, Map<String, Object> map) throws Exception {
        String jsonArray = (String) map.get("data");
        String actionType = (String) map.get("actionType");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map1 = null;
        boolean flag = false;

        if (jsonArray != null && !jsonArray.equals(""))
            map1 = objectMapper.readValue(jsonArray, new TypeReference<Map<String, Object>>() {});

        try {
            switch (actionType) {
                case "add":
                    map1.put("queryId", "machine.insertMctPlan");
                    this.innodaleDao.create(map1);
                    break;
                case "update":
                    map1.put("queryId", "machine.updateMctPlan");
                    this.innodaleDao.update(map1);
                    break;
                case "delete":
                    map1.put("queryId", "machine.deleteMctPlan");
                    this.innodaleDao.remove(map1);
                    break;
            }
        } catch (Exception e) {
            flag = true;
        }

        model.addAttribute("flag", flag);
        model.addAttribute("data", map1);
    }
}
