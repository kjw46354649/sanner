package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jmes.dao.DrawingBoardDao;
import com.jmes.service.DrawingBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class DrawingBoardServiceImpl implements DrawingBoardService {

    @Autowired
    public DrawingBoardDao drawingBoardeDao;

    @Override
    public void drawingBoardSave(HashMap<String, Object> hashMap) throws Exception {
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

            drawingBoardeDao.insertEstimateOrderControlMaster(data);
            drawingBoardeDao.insertEstimateOrderControlDetail(data);
            drawingBoardeDao.insertEstimateOrderControlOrder(data);
        }

        drawingBoardeDao.updateEstimateMasterFinish(data);

    }
}
