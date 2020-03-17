package com.jmes.service.impl;

import com.jmes.dao.SystemDao;
import com.jmes.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SystemServiceImpl implements SystemService {

    @Autowired
    public SystemDao systemDao;

    @Override
    public List<Map<String, Object>> getCommonCodeList(Map<String, Object> hashMap) throws Exception {
        System.out.println(hashMap);
        Map<String, Object> commonLangList = this.systemDao.getCommonLangList(hashMap);
        return null;
    }
}
