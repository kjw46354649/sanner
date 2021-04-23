package com.jmes.service.impl;

import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.service.FileUploadService;
import com.jmes.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    public InnodaleDao innodaleDao;

    @Override
    public void registNewBoard(Map<String, Object> map) throws Exception {
        if(map.get("IS_REPLY").equals("Y")) {
            map.put("queryId","main.selectGroupInNo");
            Map<String, Object> tempMap =  innodaleDao.getInfo(map);
            map.put("GROUP_IN_NO",tempMap.get("GROUP_IN_NO"));
            map.put("DEPTH",tempMap.get("DEPTH"));
        }

        map.put("queryId", "main.insertNewBoard");
        innodaleDao.create(map);
    }
}
