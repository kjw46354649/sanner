package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jmes.dao.OrderDao;
import com.jmes.dao.OutDao;
import com.jmes.service.OutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class OutServiceImpl implements OutService {
    @Autowired
    public OrderDao orderDao;

    @Autowired
    public OutDao outDao;

    @Override
    public void insertOutsideClose(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<HashMap<String, Object>> jsonArray = null;

        if (jsonObject != null)
            jsonArray = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<HashMap<String, Object>>>() {});

        for (HashMap<String, Object> hashMap : jsonArray) {
            hashMap.put("PART_STATUS", "OST004");
            this.orderDao.updateControlPartStatus(hashMap);
            this.outDao.insertOutsideClose(hashMap);
            this.outDao.insertOutsideCloseHistory(hashMap);
        }
    }
}
