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

            String beforeControlNum = "";
            String currentControlNum = "";

            String queryCommonId = "";

            for (HashMap<String, Object> hashMap : addList) {
                for (int i = 0, queryCount = queryId.size(); i < queryCount; i++) {

                    queryCommonId = queryId.get(0);

                    // 주문 도면의 경우만 아래 Order 처리 한다.
                    if("drawingUploadMapper.manageControlCadFiles".equals(queryId.get(0))){
                        // 일반 도면 업로드
                        if(null != hashMap.get("ORDER_SEQ") && !"".equals(hashMap.get("ORDER_SEQ"))) {
                            // order 업로드
                            currentControlNum = (String)hashMap.get("CONTROL_NUM");
                            hashMap.put("queryId", queryCommonId + "_order");
                            this.innodaleDao.insertGrid(hashMap);
                        }else{
                            // part 업로드
                            hashMap.put("queryId", queryCommonId);
                            this.innodaleDao.insertGrid(hashMap);
                        }
                    } else if("drawingUploadMapper.manageControlCadRevFiles".equals(queryId.get(0))) {

                        currentControlNum = (String) hashMap.get("CONTROL_NUM");

                        // 발주 도면 리버전 처리
                        if (null != hashMap.get("ORDER_SEQ") && !"".equals(hashMap.get("ORDER_SEQ"))) {

                            hashMap.put("queryId", queryCommonId + "_order");
                            this.innodaleDao.insertGrid(hashMap);

                            if (!beforeControlNum.equals(currentControlNum)) {
                                // 업로드 및 리비전 처리
                                hashMap.put("queryId", queryCommonId);
                                this.innodaleDao.insertGrid(hashMap);

                                hashMap.put("queryId", queryCommonId + "_revDelete");     // 데이터 저장 파일 등록
                                innodaleDao.create(hashMap);

                                hashMap.put("queryId", queryCommonId + "_revInsert");     // 데이터 저장 파일 등록
                                innodaleDao.create(hashMap);
                            }
                        }else{
                            // Part 업로드
                            hashMap.put("queryId", queryCommonId);
                            this.innodaleDao.insertGrid(hashMap);

                            hashMap.put("queryId", queryCommonId + "_revDelete");     // 데이터 저장 파일 등록
                            innodaleDao.create(hashMap);

                            hashMap.put("queryId", queryCommonId + "_revInsert");     // 데이터 저장 파일 등록
                            innodaleDao.create(hashMap);
                        }

                        beforeControlNum = currentControlNum;
                    }else{
                        // 견적 & 재고 업로드
                        hashMap.put("queryId", queryCommonId);
                        this.innodaleDao.insertGrid(hashMap);
                    }
                }
            }
        }
    }

}
