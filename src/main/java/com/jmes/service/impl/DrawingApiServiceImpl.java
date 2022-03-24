package com.jmes.service.impl;

import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.DrawingApiService;
import com.tomes.exception.ParameterException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
                for(Map<String,Object> data : dataList) {
                    System.out.println("data >>>>>>>>>>>>>>>>>>>> " + data);
                    data.put("queryId","drawingMapper.insertNcIfWorkData");
                    innodaleDao.create(data);

                    data.put("queryId", "drawingMapper.updateIfWorkingTime");
                    innodaleDao.update(data);


                    String equipName = (String) data.get("equip_name");
                    dataMap.put(equipName, data);
                }

//                Iterator<String> keys = dataMap.keySet().iterator();
//                while (keys.hasNext()) {
//                    String key = keys.next();
//
//                    Map<String,Object> leadMap = (Map<String, Object>) dataMap.get(key);
//                    leadMap.put("queryId","drawingMapper.selectCurrentMctInfo");
//                    Map<String,Object> noticeMap = innodaleDao.getInfo(leadMap);
//
//                    if(noticeMap != null) {
//                        leadMap.putAll(noticeMap);
//                        dataMap.put(key, leadMap);
//                    }
//                    System.out.println("leadMap >>>>>>>>>>>>>>>>>>>> " + leadMap);
//                }
                if(!dataMap.isEmpty()) {
                    simpMessagingTemplate.convertAndSend("/topic/notice", dataMap);
                }

            }
        }

    }
}
