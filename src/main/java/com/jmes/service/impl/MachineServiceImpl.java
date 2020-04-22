package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.dao.MachineDao;
import com.jmes.service.MachineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Service
public class MachineServiceImpl implements MachineService {

    @Autowired
    public MachineDao machineDao;

    @Autowired
    public InnodaleDao innodaleDao;

//    @Override
//    public List<Map<String, Object>> getCommonCodeList(Map<String, Object> hashMap) throws Exception {
//        List<Map<String, Object>> commonLangList = this.systemDao.selectCommonLangList(hashMap);
//        String[] temp = new String[commonLangList.size()];
//
//        for (int i = 0; i < commonLangList.size(); i++) {
//            temp[i] = (String) commonLangList.get(i).get("LANG_CD");
//        }
//        hashMap.put("LANG_CD", temp);
//
//        return this.systemDao.selectCommonCodeList(hashMap);
//    }
//
//    //TODO: 리팩토링 필요
//    @Override
//    public void commonCodeModifyGrid(Map<String, Object> map) throws Exception {
//        String jsonObject = (String) map.get("data");
//        ObjectMapper objectMapper = new ObjectMapper();
//        Map<String, Object> jsonMap = null;
//
//        if (jsonObject != null)
//            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {
//            });
//
//        ArrayList<HashMap<String, Object>> addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
//        ArrayList<HashMap<String, Object>> updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
//
//        if (addList.size() > 0) {
//            for (HashMap<String, Object> hashMap : addList) {
//                int dynamicColumCount = 0;
//                List<String> langCD = new ArrayList<String>();
//                List<String> codeNm = new ArrayList<String>();
//                Set set = hashMap.entrySet();
//                Iterator iterator = set.iterator();
//
//                while (iterator.hasNext()) {
//                    Map.Entry entry = (Map.Entry) iterator.next();
//                    String key = (String) entry.getKey();
//                    String value = (String) entry.getValue();
//
//                    if (key.contains("CODE_NM")) {
//                        dynamicColumCount++;
//                        langCD.add(key.substring(8));
//                        codeNm.add(value);
//                    }
//                }
//
//                this.systemDao.insertCommonCode(hashMap);
//
//                for (int i = 0; i < dynamicColumCount; i++) {
//                    hashMap.put("LANG_CD", langCD.get(i));
//                    hashMap.put("CODE_NM", codeNm.get(i));
//                    this.systemDao.insertCommonLangCode(hashMap);
//                }
//            }
//        }
//        if (updateList.size() > 0) {
//            for (HashMap<String, Object> hashMap : updateList) {
//                int dynamicColumCount = 0;
//                List<String> langCD = new ArrayList<String>();
//                List<String> codeNm = new ArrayList<String>();
//                Set set = hashMap.entrySet();
//                Iterator iterator = set.iterator();
//
//                while (iterator.hasNext()) {
//                    Map.Entry entry = (Map.Entry) iterator.next();
//                    String key = entry.getKey().toString();
//                    String value = entry.getValue().toString();
//                    if (key.contains("CODE_NM")) {
//                        dynamicColumCount++;
//                        langCD.add(key.substring(8));
//                        codeNm.add(value);
//                    }
//                }
//
//                this.systemDao.updateCommonCode(hashMap);
//
//                for (int i = 0; i < dynamicColumCount; i++) {
//                    hashMap.put("LANG_CD", langCD.get(i));
//                    hashMap.put("CODE_NM", codeNm.get(i));
//                    this.systemDao.updateCommonLangCode(hashMap);
//                }
//            }
//        }
//    }
//
//    /**
//     * 업체정보 관리(I,U,D)
//     *
//     * @param map
//     * @throws Exception
//     */
//    @Override
//    public void managerSystemCompany(Model model, Map<String, Object> map) throws Exception {
//
//       String COMP_CD = (String) map.get("COMP_CD");
//
//       //1. insert update 유무 확인
//       if("".equals(COMP_CD)){
//           //2-1 seq 가져오기
//           map.put("queryId", "systemMapper.selectCompanySeq");
//           Map<String, Object> seqMap = innodaleDao.getInfo(map);
//
//           //2-2. 마스터 insert
//           COMP_CD = (String)seqMap.get("SEQ");
//           map.put("COMP_CD", COMP_CD);
//           map.put("queryId", "systemMapper.insertCompanyMaster");
//           innodaleDao.create(map);
//
//       }else{
//           //2. 마스터 update
//           map.put("queryId", "systemMapper.updateCompanyMaster");
//           innodaleDao.create(map);
//       }
//
//       //3. 담당자정보 저장 I,U,D
//        String jsonObject_staff = (String) map.get("staffGrid");
//        ObjectMapper objectMapper = new ObjectMapper();
//        Map<String, Object> jsonMap1 = null;
//
//        if (jsonObject_staff != null){
//            jsonMap1 = objectMapper.readValue(jsonObject_staff, new TypeReference<Map<String, Object>>() {});
//
//            ArrayList<HashMap<String, Object>> addList = (ArrayList<HashMap<String, Object>>) jsonMap1.get("addList");
//            ArrayList<HashMap<String, Object>> updateList = (ArrayList<HashMap<String, Object>>) jsonMap1.get("updateList");
//            ArrayList<HashMap<String, Object>> deleteList = (ArrayList<HashMap<String, Object>>) jsonMap1.get("deleteList");
//
//            if (addList.size() > 0) {
//                for (HashMap<String, Object> hashMap : addList) {
//                        hashMap.put("queryId", "systemMapper.insertCompanyStaff");
//                        hashMap.put("COMP_CD", COMP_CD);
//                        this.innodaleDao.insertGrid(hashMap);
//                }
//            }
//            if (updateList.size() > 0) {
//                for (HashMap<String, Object> hashMap : updateList) {
//                    hashMap.put("queryId", "systemMapper.updateCompanyStaff");
//                    hashMap.put("COMP_CD", COMP_CD);
//                    this.innodaleDao.updateGrid(hashMap);
//                }
//            }
//            if (deleteList.size() > 0) {
//                for (HashMap<String, Object> hashMap : deleteList) {
//                    hashMap.put("queryId", "systemMapper.deleteCompanyStaff");
//                    hashMap.put("COMP_CD", COMP_CD);
//                    this.innodaleDao.deleteGrid(hashMap);
//                }
//            }
//        }
//
//        //4. 업체종류및 종목 모두 삭제
//        map.put("queryId", "systemMapper.deleteCompanyAllType");
//        innodaleDao.remove(map);
//
//
//        //5. 업체종류및 종목 모두 저장
//        String resultType = (String) map.get("compType");
//        if (!"".equals(resultType)) {
//            String[] resultTypeArr = resultType.split(",");
//            System.out.println("resultTypeArr.length==" + resultTypeArr.length);
//            if (resultTypeArr.length > 0) {
//                for(int i = 0; i <= resultTypeArr.length-1; i++){
//                    Map<String, Object> hashMap = new HashMap<String, Object>();
//                    System.out.println(i+ "/resultTypeArr[i]==" + resultTypeArr[i]);
//                    String[] smap = resultTypeArr[i].split("\\|");
//                    hashMap.put("COMP_CD",COMP_CD);
//                    hashMap.put("COMP_TYPE",smap[0]+"");
//                    hashMap.put("HIGH_TYPE",smap[1]+"");
//                    hashMap.put("queryId", "systemMapper.insertCompanyType");
//
//                    this.innodaleDao.create(hashMap);
//                }
//            }
//        }
//
//
//       //6. 마스터 업체종류및 종목 UPDATE(발주업체)
//        map.put("queryId", "systemMapper.updateCompanyMasterStatus1");
//        this.innodaleDao.create(map);
//
//        //7. 마스터 업체종류및 종목 UPDATE(협력업체)
//        map.put("queryId", "systemMapper.updateCompanyMasterStatus2");
//        this.innodaleDao.create(map);
//
//        model.addAttribute("result",		"success");
//    }



}
