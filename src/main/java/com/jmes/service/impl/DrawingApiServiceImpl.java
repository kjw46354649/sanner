package com.jmes.service.impl;

import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.entity.ActionType;
import com.framework.innodale.entity.NotificationMessage;
import com.jmes.service.DrawingApiService;
import com.tomes.exception.ParameterException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DrawingApiServiceImpl implements DrawingApiService {


    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    private InnodaleDao innodaleDao;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @Override
    public void managerMctIfData(Map<String, Object> map) throws Exception {

        if(map.containsKey("dataList")) {
            List<Map<String,Object>> dataList = (List<Map<String, Object>>) map.get("dataList");

            if(dataList.size() > 0) {
                HashMap<String,Object> dataMap = new HashMap<>();
                for(int i=0;i<dataList.size();i++) {
                    Map<String,Object> data = dataList.get(i);

                    data.put("queryId","drawingAPI.insertNcIfWorkData");
                    innodaleDao.create(data);

                    data.put("queryId","drawingAPI.updateEquipStatus");
                    innodaleDao.update(data);

                    dataList.set(i,data);

                    String equipName = (String) data.get("equip_name");
                    dataMap.put(equipName, data);
                }

                map.put("queryId", "drawingAPI.updateIfWorkingTime");
                innodaleDao.update(map);

                if(!dataMap.isEmpty()) {
                    map.put("queryId", "drawingAPI.selectCurrentMctInfo");
                    List<Map<String,Object>> currList = innodaleDao.getList(map);

                    if(currList.size() > 0) {
                        NotificationMessage notificationMessage = new NotificationMessage();
                        notificationMessage.setActionType(ActionType.NC_IF);
                        notificationMessage.setList(currList);
                        notificationMessage.setEquipNm(dataMap.keySet().toString());

                        simpMessagingTemplate.convertAndSend("/topic/notice", notificationMessage);
                    }
                }
            }
        }

    }
}
