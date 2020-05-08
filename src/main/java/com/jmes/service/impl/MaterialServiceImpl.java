package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class MaterialServiceImpl implements MaterialService {

    @Autowired
    public InnodaleDao innodaleDao;

    /**
     * 재고관리 그리드 관리(I,U,D)
     *
     * @param map
     * @throws Exception
     */
    @Override
    public void managerInsideStock(Model model, Map<String, Object> map) throws Exception {

       //1. 재고관리 마스터 정보 저장 I,U,D
       String jsonObject = (String) map.get("stockGrid");
       ObjectMapper objectMapper = new ObjectMapper();
       Map<String, Object> jsonMap = null;

       if (jsonObject != null){
           jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});

           ArrayList<HashMap<String, Object>> addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
           ArrayList<HashMap<String, Object>> updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
           //ArrayList<HashMap<String, Object>> deleteList = (ArrayList<HashMap<String, Object>>) jsonMap.get("deleteList");

           if (addList.size() > 0) {
               for (HashMap<String, Object> hashMap : addList) {

                   hashMap.put("queryId", "material.selectInsideStockAbbrNm");
                   Map<String, Object> selMap1 = this.innodaleDao.getInfo(hashMap);

                   String ABBR_NM = (String)selMap1.get("ABBR_NM");
                   if(ABBR_NM == null || "".equals(ABBR_NM)){//디비 값 체크
                       model.addAttribute("result",		"fail");
                       throw new Exception("managerEquip addList Error ABBR_NM NULL");
                   }

                   String ORDER_COMP_CD = (String)hashMap.get("ORDER_COMP_CD");
                   if(ORDER_COMP_CD == null || "".equals(ORDER_COMP_CD)){//그리드 값 체크
                       model.addAttribute("result",		"fail");
                       throw new Exception("managerEquip addList Error ORDER_COMP_CD NULL");
                   }

                   hashMap.put("queryId", "material.selectInsideStockSeq");
                   hashMap.put("ABBR_NM", ABBR_NM);
                   Map<String, Object> selMap2 = this.innodaleDao.getInfo(hashMap);
                   String INSIDE_STOCK_NUM = (String)selMap2.get("INSIDE_STOCK_NUM");

                   hashMap.put("INSIDE_STOCK_NUM", INSIDE_STOCK_NUM);
                   hashMap.put("queryId", "material.insertInsideStock");
                   this.innodaleDao.insertGrid(hashMap);

                   hashMap.put("queryId", "material.insertInsideStockIn");
                   this.innodaleDao.insertGrid(hashMap);
               }
           }
           if (updateList.size() > 0) {
               for (HashMap<String, Object> hashMap : updateList) {
                   hashMap.put("queryId", "machine.updateInsideStock");
                   this.innodaleDao.updateGrid(hashMap);

                   hashMap.put("queryId", "material.insertInsideStockIn");
                   this.innodaleDao.insertGrid(hashMap);
               }
           }
        /*   if (deleteList.size() > 0) {
               for (HashMap<String, Object> hashMap : deleteList) {
                   hashMap.put("queryId", "machine.deleteMachineMasterHistory");
                   hashMap.put("EQUIP_ID", EQUIP_ID);
                   this.innodaleDao.deleteGrid(hashMap);
               }
           }*/
        }
        model.addAttribute("result",		"success");
    }



}
