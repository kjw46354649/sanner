package com.framework.innodale.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.service.InnodaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InnodaleServiceImpl implements InnodaleService {

    @Autowired
    private InnodaleDao innodaleDao;

    @Override
    public int createKeyReturn(Map<String, Object> hashMap) throws Exception {
        return this.innodaleDao.createKeyReturn(hashMap);
    }

    @Override
    public void create(Map<String, Object> hashMap) throws Exception {
        this.innodaleDao.create(hashMap);
    }

    @Override
    public void update(Map<String, Object> hashMap) throws Exception {
        this.innodaleDao.update(hashMap);
    }

    @Override
    public void remove(Map<String, Object> hashMap) throws Exception {
        this.innodaleDao.remove(hashMap);
    }

    @Override
    public Map<String, Object> getInfo(Map<String, Object> hashMap) throws Exception {
        return this.innodaleDao.getInfo(hashMap);
    }

    /*@Override
    public int getPageTotalCount() throws Exception{
        return this.yframeDao.getPageTotalCount();
    }*/

    @Override
    public List<Map<String, Object>> getList(Map<String, Object> hashMap) throws Exception {
        return this.innodaleDao.getList(hashMap);
    }

    @Override
    public void getPageList(Map<String, Object> hashMap) throws Exception {
        this.innodaleDao.getPageList(hashMap);
    }

    /**
     * 그리드 삽입/갱신
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void modifyGrid(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        HashMap<String, Object> queryIdList = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("addList"))
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");

        if (jsonMap.containsKey("updateList"))
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

        if (jsonMap.containsKey("queryIdList"))
            queryIdList = (HashMap<String, Object>) jsonMap.get("queryIdList");

        if (addList != null && addList.size() > 0) {
            ArrayList<String> queryId = (ArrayList<String>) queryIdList.get("insertQueryId");
            for (HashMap<String, Object> hashMap : addList) {
                for (int i = 0, queryCount = queryId.size(); i < queryCount; i++) {
                    hashMap.put("queryId", queryId.get(i));
                    this.innodaleDao.insertGrid(hashMap);
                }
            }
        }
        if (updateList != null && updateList.size() > 0) {
            ArrayList<String> queryId = (ArrayList<String>) queryIdList.get("updateQueryId");

            for (HashMap<String, Object> hashMap : updateList) {
                for (int i = 0, queryCount = queryId.size(); i < queryCount; i++) {
                    hashMap.put("queryId", queryId.get(i));
                    this.innodaleDao.updateGrid(hashMap);
                }
            }
        }
    }

    /**
     * 그리드 삭제
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void deleteGrid(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {});

        for (Map<String, Object> hashMap : jsonMap) {
            this.innodaleDao.deleteGrid(hashMap);
        }
    }

    /**
     * 그리드 삽입/갱신/삭제
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void CRUDGrid(Map<String, Object> map) throws Exception {
        modifyGrid(map);

        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> deleteList = null;
        HashMap<String, Object> queryIdList = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

        if (jsonMap.containsKey("deleteList"))
            deleteList = (ArrayList<HashMap<String, Object>>) jsonMap.get("deleteList");

        if (jsonMap.containsKey("queryIdList"))
            queryIdList = (HashMap<String, Object>) jsonMap.get("queryIdList");

        if (deleteList != null && deleteList.size() > 0) {
            ArrayList<String> queryId = (ArrayList<String>) queryIdList.get("deleteQueryId");
            for (HashMap<String, Object> hashMap : deleteList) {
                for (int i = 0, queryCount = queryId.size(); i < queryCount; i++) {
                    hashMap.put("queryId", queryId.get(i));
                    this.innodaleDao.deleteGrid(hashMap);
                }
            }
        }
    }

    /**
     * 여러 SQL 삽입/갱신/삭제
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void managerJson(Map<String, Object> map) throws Exception {

        String queryIdList[]  = ((String)map.get("queryId")).split("\\,");

        if (queryIdList != null && queryIdList.length > 0)
        {
            for (int i = 0; i < queryIdList.length; i++)
            {
                String queryId = (String) queryIdList[i];
                String queryIdArr[] = queryId.split("\\.");
                System.out.println(queryIdArr[0]);
                System.out.println(queryIdArr[1]);
                if(queryIdArr[1].startsWith("insert") || queryIdArr[1].startsWith("create")){
                    map.put("queryId",queryId);
                    this.innodaleDao.create(map);
                }
                if(queryIdArr[1].startsWith("update") || queryIdArr[1].startsWith("modify")){
                    map.put("queryId",queryId);
                    this.innodaleDao.update(map);
                }
                if(queryIdArr[1].startsWith("delete") || queryIdArr[1].startsWith("remove")){
                    map.put("queryId",queryId);
                    this.innodaleDao.remove(map);
                }
            }
        }

    }

}
