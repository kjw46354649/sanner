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

    /**
     * 업체정보 관리(I,U,D)
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void managerEquip(Model model, Map<String, Object> map) throws Exception {

       String EQUIP_ID = (String) map.get("EQUIP_ID");

       //1. insert update 유무 확인
       if("".equals(EQUIP_ID)){
           //2-1 seq 가져오기
           map.put("queryId", "machine.selectMachineSeq");
           Map<String, Object> seqMap = innodaleDao.getInfo(map);

           //2-2. 마스터 insert
           EQUIP_ID = (String)seqMap.get("SEQ");
           map.put("EQUIP_ID", EQUIP_ID);
           map.put("queryId", "machine.insertMachineMaster");
           innodaleDao.create(map);

       }else{
           //2. 마스터 update
           map.put("queryId", "machine.updateMachineMaster");
           innodaleDao.create(map);

           //3. 히스토리 정보 저장 I,U,D
           String jsonObject = (String) map.get("historyGrid");
           ObjectMapper objectMapper = new ObjectMapper();
           Map<String, Object> jsonMap1 = null;

           if (jsonObject != null){
               jsonMap1 = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

               ArrayList<HashMap<String, Object>> addList = (ArrayList<HashMap<String, Object>>) jsonMap1.get("addList");
               ArrayList<HashMap<String, Object>> updateList = (ArrayList<HashMap<String, Object>>) jsonMap1.get("updateList");
               ArrayList<HashMap<String, Object>> deleteList = (ArrayList<HashMap<String, Object>>) jsonMap1.get("deleteList");

               if (addList.size() > 0) {
                   for (HashMap<String, Object> hashMap : addList) {
                       hashMap.put("queryId", "machine.insertMachineMasterHistory");
                       hashMap.put("EQUIP_ID", EQUIP_ID);
                       this.innodaleDao.insertGrid(hashMap);
                   }
               }
               if (updateList.size() > 0) {
                   for (HashMap<String, Object> hashMap : updateList) {
                       hashMap.put("queryId", "machine.updateMachineMasterHistory");
                       hashMap.put("EQUIP_ID", EQUIP_ID);
                       this.innodaleDao.updateGrid(hashMap);
                   }
               }
               if (deleteList.size() > 0) {
                   for (HashMap<String, Object> hashMap : deleteList) {
                       hashMap.put("queryId", "machine.deleteMachineMasterHistory");
                       hashMap.put("EQUIP_ID", EQUIP_ID);
                       this.innodaleDao.deleteGrid(hashMap);
                   }
               }
           }
       }



        model.addAttribute("result",		"success");
    }



}
