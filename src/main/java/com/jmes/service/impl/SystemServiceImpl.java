package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jmes.dao.SystemDao;
import com.jmes.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SystemServiceImpl implements SystemService {

    @Autowired
    public SystemDao systemDao;

    @Override
    public List<Map<String, Object>> getCommonCodeList(Map<String, Object> hashMap) throws Exception {
        List<Map<String, Object>> commonLangList = this.systemDao.selectCommonLangList(hashMap);
        String[] temp = new String[commonLangList.size()];

        for (int i = 0; i < commonLangList.size(); i++) {
            temp[i] = (String) commonLangList.get(i).get("LANG_CD");
        }
        hashMap.put("LANG_CD", temp);

        return this.systemDao.selectCommonCodeList(hashMap);
    }

    //TODO: 리팩토링 필요
    @Override
    public void commonCodeModifyGrid(Map<String, Object> map) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {
            });

        ArrayList<HashMap<String, Object>> addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
        ArrayList<HashMap<String, Object>> updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");

        if (addList.size() > 0) {
            for (HashMap<String, Object> hashMap : addList) {
                int dynamicColumCount = 0;
                List<String> langCD = new ArrayList<String>();
                List<String> codeNm = new ArrayList<String>();
                Set set = hashMap.entrySet();
                Iterator iterator = set.iterator();

                while (iterator.hasNext()) {
                    Map.Entry entry = (Map.Entry) iterator.next();
                    String key = (String) entry.getKey();
                    String value = (String) entry.getValue();

                    if (key.contains("CODE_NM")) {
                        dynamicColumCount++;
                        langCD.add(key.substring(8));
                        codeNm.add(value);
                    }
                }

                this.systemDao.insertCommonCode(hashMap);

                for (int i = 0; i < dynamicColumCount; i++) {
                    hashMap.put("LANG_CD", langCD.get(i));
                    hashMap.put("CODE_NM", codeNm.get(i));
                    this.systemDao.insertCommonLangCode(hashMap);
                }
            }
        }
        if (updateList.size() > 0) {
            for (HashMap<String, Object> hashMap : updateList) {
                int dynamicColumCount = 0;
                List<String> langCD = new ArrayList<String>();
                List<String> codeNm = new ArrayList<String>();
                Set set = hashMap.entrySet();
                Iterator iterator = set.iterator();

                while (iterator.hasNext()) {
                    Map.Entry entry = (Map.Entry) iterator.next();
                    String key = entry.getKey().toString();
                    String value = entry.getValue().toString();
                    if (key.contains("CODE_NM")) {
                        dynamicColumCount++;
                        langCD.add(key.substring(8));
                        codeNm.add(value);
                    }
                }

                this.systemDao.updateCommonCode(hashMap);

                for (int i = 0; i < dynamicColumCount; i++) {
                    hashMap.put("LANG_CD", langCD.get(i));
                    hashMap.put("CODE_NM", codeNm.get(i));
                    this.systemDao.updateCommonLangCode(hashMap);
                }
            }
        }
    }
}
