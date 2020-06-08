package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.ProductionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class ProductionServiceImpl implements ProductionService {

    @Autowired
    public InnodaleDao innodaleDao;

    @Override
    public void managerCamWork(Model model, Map<String, Object> map) throws Exception {

        // actionType : temp: 임시저장, complete: 완료, cancel: 취소
        String actionType = (String)map.get("actionType");

        switch(actionType){
            case "cancel":
                map.put("queryId", "machine.deleteMctCamDetailWork");
                innodaleDao.update(map);

                map.put("queryId", "machine.deleteMctCamWork");
                innodaleDao.update(map);

                // parts 이전 상태로 변경

                break;
            case "start":
                map.put("queryId", "machine.insertMctCamWork");
                innodaleDao.update(map);

                // parts 상태 업데이트 처리

            case "complete":
                map.put("queryId", "machine.updateMctCamWorkComplete");
                innodaleDao.update(map);
            case "temp":
                map.put("queryId", "machine.updateMctCamWork");
                innodaleDao.update(map);
            default:
                // 작업 리스트 업데이트 및 생성
                String camWorkGrid = (String) map.get("camWorkGrid");
                ObjectMapper objectMapper = new ObjectMapper();
                Map<String, Object> jsonMap1 = null;

                if (camWorkGrid != null){
                    jsonMap1 = objectMapper.readValue(camWorkGrid, new TypeReference<Map<String, Object>>() {});

                    ArrayList<HashMap<String, Object>> addList = (ArrayList<HashMap<String, Object>>) jsonMap1.get("addList");
                    ArrayList<HashMap<String, Object>> updateList = (ArrayList<HashMap<String, Object>>) jsonMap1.get("updateList");
                    ArrayList<HashMap<String, Object>> deleteList = (ArrayList<HashMap<String, Object>>) jsonMap1.get("deleteList");

                    if (addList.size() > 0) {
                        for (HashMap<String, Object> hashMap : addList) {
                            hashMap.put("queryId", "machine.insertMctCamDetailWork");
                            this.innodaleDao.insertGrid(hashMap);
                        }
                    }
                    if (updateList.size() > 0) {
                        for (HashMap<String, Object> hashMap : updateList) {
                            hashMap.put("queryId", "machine.updateMctCamDetailWork");
                            this.innodaleDao.updateGrid(hashMap);
                        }
                    }
                    if (deleteList.size() > 0) {
                        for (HashMap<String, Object> hashMap : deleteList) {
                            hashMap.put("queryId", "machine.deleteMctCamDetailWork");
                            this.innodaleDao.deleteGrid(hashMap);
                        }
                    }
                }
                break;
        }
    }
}
