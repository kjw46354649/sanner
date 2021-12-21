package com.jmes.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.dao.InnodaleDao;
import com.jmes.dao.OrderDao;
import com.jmes.service.InspectionService;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class InspectionServiceImpl implements InspectionService {
    @Autowired
    public InnodaleDao innodaleDao;
    @Autowired
    public Environment environment;

    @Override
    public void saveLayer(Map<String, Object> map, Model model) throws Exception {
        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<Map<String, Object>> jsonMap = null;
        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<ArrayList<Map<String, Object>>>() {});
        }
        String layerName = (String) jsonMap.get(0).get("LAYER_AREA_NAME");
        HashMap<String,Object> tempMap = new HashMap<>();
        tempMap.put("queryId","inspection.selectLayerInfo");
        tempMap.put("LAYER_AREA_NAME",layerName);

        List<Map<String,Object>> arrList = innodaleDao.getList(tempMap);

        for(int i=0;i<arrList.size();i++) {
            boolean flag = false;
            Map<String,Object> org = arrList.get(i);
            for(Map<String,Object> temp : jsonMap) {
                String id = org.get("LAYER_AREA_NAME")+"_"+org.get("AREA_TYPE")+"_"+org.get("MARK_TYPE")+"_"+org.get("AREA_NAME");
                String targetId = temp.get("LAYER_AREA_NAME")+"_"+temp.get("AREA_TYPE")+"_"+temp.get("MARK_TYPE")+"_"+temp.get("AREA_NAME");
                if(id.equals(targetId)) {
                    flag = true;
                }
            }
            if(!flag) {
                org.put("queryId","inspection.deleteLayerInfo");
                innodaleDao.remove(org);
            }
        }

        for (Map<String, Object> hashMap : jsonMap) {
            hashMap.put("queryId","inspection.insertLayerInfo");
            innodaleDao.create(hashMap);
        }
    }

    @Override
    public void modifyInspectResult(Map<String, Object> map, Model model) throws Exception {
        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> oldList = null;
        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
        ArrayList<HashMap<String, Object>> deleteList = null;

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});
        }


        if(jsonMap.containsKey("oldList")) {
            oldList = (ArrayList<HashMap<String, Object>>) jsonMap.get("oldList");
        }
        if(jsonMap.containsKey("addList")) {
            addList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
        }
        if(jsonMap.containsKey("updateList")) {
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
        }
        if(jsonMap.containsKey("deleteList")) {
            deleteList = (ArrayList<HashMap<String, Object>>) jsonMap.get("deleteList");
        }

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", new Locale("ko", "KR"));
        String uploadDatePath = formatter.format(new Date()).substring(0, 8) + File.separator + formatter.format(new Date());
        String uploadTimePath = File.separator + formatter.format(new Date());
        String uploadFilePath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.upload.inspect.path") + File.separator + uploadDatePath;
//
        CommonUtility.createFileDirectory(new File(uploadFilePath));
//
        String serverFileName = CommonUtility.getUUIDString();
        String serverFullFileName = "file-" + serverFileName;

        String binaryData = (String) jsonMap.get("imgSrc");
        binaryData = binaryData.replaceAll("data:image/png;base64,", "");

        byte[] file = Base64.decodeBase64(binaryData);

        FileOutputStream stream = null;
        File newFile = new File(uploadFilePath + File.separator + serverFullFileName + ".png");
        stream = new FileOutputStream(newFile);
        stream.write(file);
        stream.close();

        HashMap<String, Object> fileMap = new HashMap<String, Object>();
        fileMap.put("FILE_NM", serverFullFileName + ".png");
        fileMap.put("FILE_PATH", uploadFilePath + File.separator + serverFullFileName + ".png");
        fileMap.put("TIME_PATH", uploadTimePath);
        fileMap.put("ORGINAL_FILE_NM", serverFullFileName + ".png");
        fileMap.put("FILE_TYPE", "image");
        fileMap.put("FILE_EXT", "png");
        fileMap.put("FILE_SIZE", newFile.length());

        fileMap.put("queryId","common.insertFileGroup");
        innodaleDao.create(fileMap);

        fileMap.put("queryId","common.insertFile");
        innodaleDao.create(fileMap);

        if(addList != null && addList.size() > 0) {
            jsonMap.put("LOGIN_USER_ID",userId);
            jsonMap.put("queryId","inspection.selectInspectionResultExistCheck");
            HashMap<String,Object> inspectInfo = (HashMap<String, Object>) this.innodaleDao.getInfo(jsonMap);
            String inspectResultSeq = null;
            if(inspectInfo != null && inspectInfo.get("INSPECT_RESULT_SEQ") != null && !inspectInfo.get("INSPECT_RESULT_SEQ").equals("")) {
                inspectResultSeq = (String) inspectInfo.get("INSPECT_RESULT_SEQ");
            }else {
                jsonMap.put("queryId","inspection.selectInspectionResultSeq");
                HashMap<String,Object> seqData = (HashMap<String, Object>) this.innodaleDao.getInfo(jsonMap);
                inspectResultSeq = (String) seqData.get("INSPECT_RESULT_SEQ");

                jsonMap.put("INSPECT_RESULT_SEQ",inspectResultSeq);
                jsonMap.put("queryId","inspection.insertInspectionResult");
                innodaleDao.create(jsonMap);
            }


            for(HashMap<String,Object> hashMap : addList) {
                hashMap.put("LOGIN_USER_ID", userId);
                hashMap.put("PRODUCT_NUM",jsonMap.get("PRODUCT_NUM"));
                hashMap.put("CONTROL_SEQ",jsonMap.get("CONTROL_SEQ"));
                hashMap.put("CONTROL_DETAIL_SEQ",jsonMap.get("CONTROL_DETAIL_SEQ"));
                hashMap.put("LAYER_AREA_NAME",jsonMap.get("LAYER_AREA_NAME"));
                hashMap.put("INSPECT_RESULT_SEQ",inspectResultSeq);
                hashMap.put("IMG_GFILE_SEQ",fileMap.get("GFILE_SEQ"));

                hashMap.put("queryId","inspection.insertInspectionResultPoint");
                innodaleDao.create(hashMap);

                hashMap.put("queryId","inspection.insertInspectionResultValue");
                innodaleDao.create(hashMap);

                hashMap.put("queryId","inspection.updateInspectionResult");
                innodaleDao.update(hashMap);

            }
        }

        if(updateList != null && updateList.size() > 0) {
            for(int i = 0; i < updateList.size(); i++) {
                HashMap<String,Object> tempMap = updateList.get(i);
                tempMap.put("LOGIN_USER_ID",userId);
//                tempMap.put("PRODUCT_NUM",jsonMap.get("PRODUCT_NUM"));
                tempMap.put("CONTROL_SEQ",jsonMap.get("CONTROL_SEQ"));
                tempMap.put("CONTROL_DETAIL_SEQ",jsonMap.get("CONTROL_DETAIL_SEQ"));
                tempMap.put("LAYER_AREA_NAME",jsonMap.get("LAYER_AREA_NAME"));

                if(tempMap.containsKey("INSPECT_RESULT_SEQ")) {
                    tempMap.put("queryId","inspection.updateInspectionResult");
                    innodaleDao.update(tempMap);

                    if(tempMap.containsKey("POINT_SEQ")) {
                        tempMap.put("queryId","inspection.updateInspectionResultPoint");
                        innodaleDao.update(tempMap);

                        if(tempMap.containsKey("INSPECT_RESULT_VALUE_SEQ")) {
                            tempMap.put("queryId","inspection.updateInspectionResultValue");
                            innodaleDao.update(tempMap);
                        }else {
                            tempMap.put("PRODUCT_NUM",jsonMap.get("PRODUCT_NUM"));

                            tempMap.put("queryId","inspection.insertInspectionResultValue");
                            innodaleDao.create(tempMap);
                        }
                    }

                    tempMap.put("IMG_GFILE_SEQ",fileMap.get("GFILE_SEQ"));
                    tempMap.put("queryId","inspection.updateInspectionResult");
                    innodaleDao.update(tempMap);
                }
            }
        }

        if(deleteList != null && deleteList.size() > 0) {
            for(HashMap<String,Object> hashMap : deleteList) {
                hashMap.put("LOGIN_USER_ID", userId);

                if(hashMap.containsKey("INSPECT_RESULT_SEQ") && hashMap.containsKey("POINT_SEQ")){

                    hashMap.put("queryId","inspection.deleteInspectionResultValue");
                    innodaleDao.remove(hashMap);

                    hashMap.put("queryId","inspection.deleteInspectionResultPoint");
                    innodaleDao.remove(hashMap);

                    hashMap.put("IMG_GFILE_SEQ",fileMap.get("GFILE_SEQ"));
                    hashMap.put("queryId","inspection.updateInspectionResult");
                    innodaleDao.update(hashMap);
                }
            }
        }

        if(jsonMap.get("POINT_IMG_GFILE_SEQ") != null && !jsonMap.get("POINT_IMG_GFILE_SEQ").equals("")) {
            jsonMap.put("queryId","common.selectGfileFileListInfo");
            jsonMap.put("GFILE_SEQ",jsonMap.get("POINT_IMG_GFILE_SEQ"));
            HashMap<String,Object> temp = (HashMap<String, Object>) innodaleDao.getInfo(jsonMap);
            String filePath = (String) temp.get("FILE_PATH");
            File orgFile = new File(filePath);

            if(orgFile.exists()) {
                orgFile.delete();

                temp.put("queryId","common.deleteFileKey");
                innodaleDao.remove(temp);
            }
        }

        jsonMap.put("queryId","inspection.selectInspectionResultControlInfo");
        HashMap<String,Object> result = (HashMap<String, Object>) innodaleDao.getInfo(jsonMap);
        model.addAttribute("result",result);
    }

    @Override
    public void saveInspectResult(Map<String, Object> map, Model model) throws Exception {

        String jsonObject = (String) map.get("data");
        String userId = (String)map.get("LOGIN_USER_ID");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> oldList = null;
//        ArrayList<HashMap<String, Object>> addList = null;
        ArrayList<HashMap<String, Object>> updateList = null;
//        ArrayList<HashMap<String, Object>> deleteList = null;

        if (jsonObject != null) {
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});
        }

        if(jsonMap.containsKey("oldList")) {
            oldList = (ArrayList<HashMap<String, Object>>) jsonMap.get("oldList");
        }
        if(jsonMap.containsKey("updateList")) {
            updateList = (ArrayList<HashMap<String, Object>>) jsonMap.get("updateList");
        }

        Integer orderQty = Integer.parseInt(jsonMap.get("ORDER_QTY")+"");

        if(updateList != null && updateList.size() > 0) {
            for(int i=0;i<updateList.size();i++) {
                HashMap<String,Object> hashMap = updateList.get(i);
                HashMap<String,Object> oldMap = oldList.get(i);
                if(oldMap.containsKey("POINT_POSITION")) { //updateInspectionResultPoint
                    oldMap.put("POINT_SEQ",hashMap.get("POINT_SEQ"));
                    oldMap.put("INSPECT_RESULT_SEQ",hashMap.get("INSPECT_RESULT_SEQ"));
                    oldMap.put("POINT_POSITION",hashMap.get("POINT_POSITION"));
                    oldMap.put("queryId", "inspection.updateInspectionResultPoint");
                    innodaleDao.update(oldMap);
                }

                for(int j=1;j<=orderQty;j++) {
                    String prodNum = String.valueOf(j);

                    if(oldMap.containsKey("RESULT_VALUE_"+prodNum)) {
                        hashMap.put("queryId", "inspection.selectExistsValue");
                        hashMap.put("PRODUCT_NUM",prodNum);

                        HashMap<String,Object> temp = (HashMap<String, Object>) innodaleDao.getInfo(hashMap);
                        if (temp != null && temp.containsKey("INSPECT_RESULT_VALUE_SEQ")) {
                            // updateInspectionResultValue
                            if(hashMap.containsKey("RESULT_VALUE_"+prodNum)) {
                                temp.put("LOGIN_USER_ID",userId);
                                temp.put("RESULT_VALUE",hashMap.get("RESULT_VALUE_"+prodNum));

                                temp.put("queryId", "inspection.updateInspectionResultValue");
                                innodaleDao.update(temp);
                            }
                        }else {
                            if(hashMap.containsKey("RESULT_VALUE_"+prodNum)) {
                                temp = new HashMap<>();

                                temp.put("PRODUCT_NUM",prodNum);
                                temp.put("POINT_SEQ",hashMap.get("POINT_SEQ"));
                                temp.put("INSPECT_RESULT_SEQ",hashMap.get("INSPECT_RESULT_SEQ"));
                                temp.put("RESULT_VALUE",hashMap.get("RESULT_VALUE_"+prodNum));
                                temp.put("LOGIN_USER_ID",userId);

                                temp.put("queryId", "inspection.insertInspectionResultValue");
                                innodaleDao.create(temp);
                            }
                        }
                    }
                }
            }
        }
    }
}
