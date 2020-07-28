package com.framework.innodale.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.service.CadFileConvertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class CadFileConvertServiceImpl implements CadFileConvertService {

    @Autowired
    public InnodaleDao innodaleDao;

    @Override
    public void createCadFileUpload(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");

        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> addList = null;
        HashMap<String, Object> queryIdList = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("addList"))
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");

        if (jsonMap.containsKey("queryIdList"))
            queryIdList = (HashMap<String, Object>) jsonMap.get("queryIdList");

        if (addList != null && addList.size() > 0) {
            ArrayList<String> queryId = (ArrayList<String>) queryIdList.get("insertQueryId");
            for (HashMap<String, Object> hashMap : addList) {
                for (int i = 0, queryCount = queryId.size(); i < queryCount; i++) {
                    hashMap.put("queryId", queryId.get(i));
                    this.innodaleDao.insertGrid(hashMap);
                    // CAD 파일이 확정이후 출고 이전에 CAD 도면 파일을 수정하는 경우 도면 파일의 REV 버젼을 업로드 한다.
                    if("orderMapper.manageControlCadRevFiles".equals(queryId.get(0))){
                        hashMap.put("queryId", queryId.get(0) + "_revDelete");     // 데이터 저장 파일 등록
                        innodaleDao.create(hashMap);

                        hashMap.put("queryId", queryId.get(0) + "_revInsert");     // 데이터 저장 파일 등록
                        innodaleDao.create(hashMap);
                    }
                }
            }


        }
    }

}
