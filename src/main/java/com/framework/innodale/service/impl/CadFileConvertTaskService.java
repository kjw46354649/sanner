package com.framework.innodale.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.component.CadFileConverter;
import com.framework.innodale.dao.InnodaleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FilenameFilter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

@Service
public class CadFileConvertTaskService {

    @Autowired
    public InnodaleDao innodaleDao;

    @Async
    public void jobRunningInBackground(Map<String, Object> map) throws Exception {
        System.out.println("######################################   Thread Start");

        List<String> CAD_CONVERT_TYPE = new ArrayList<>(Arrays.asList(new String[]{ "pdf", "png"}));

        String jsonObject = (String)map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;

        ArrayList<HashMap<String, Object>> dataList = null;
        HashMap<String, Object> queryIdList = null;
        HashSet<String> hashSet = new HashSet<>();

        if (jsonObject != null) jsonMap = objectMapper.readValue(jsonObject, new TypeReference<Map<String, Object>>() {});
        if (jsonMap.containsKey("addList")) dataList = (ArrayList<HashMap<String, Object>>) jsonMap.get("addList");
        if (jsonMap.containsKey("queryIdList")) queryIdList = (HashMap<String, Object>) jsonMap.get("queryIdList");
        // 변환 파일 정보를 조회한다.
        if (dataList != null && dataList.size() > 0) {
            for (HashMap<String, Object> hashMap : dataList) {
                hashSet.add(hashMap.get("DXF_GFILE_SEQ"));
            }
        }
        ArrayList<String> dxfGfileSeqList = new ArrayList<String>(hashSet);     // DXF_GFILE_SEQ 값
        HashMap<String, Object> fileInfo = new HashMap<String, Object>();

        // DBMS 에서 FILE 정보를 조회하여 변환 리스트를 구한다.
        fileInfo.put("dxfGfileSeqList", dxfGfileSeqList);
        fileInfo.put("queryId", "common.selectGfileFileList");
        List<Map<String, Object>> convertTargetList = innodaleDao.getList(fileInfo);

        for(Map<String, Object> convertTargetInfo : convertTargetList) {

            ArrayList<String> queryId = (ArrayList<String>) queryIdList.get("insertQueryId");

            File originalFile = new File((String)convertTargetInfo.get("FILE_PATH"));
            String timePath = ((String)convertTargetInfo.get("TIME_PATH"));
            String serverFileName = ((String)convertTargetInfo.get("FILE_NM"));

            // 변환 작업 처리
            CadFileConverter.convertODAFileDirectoryConvert(originalFile, timePath);    // DXF -> 2013 버전으로 디렉토리 convert 처리
            CadFileConverter.convertAsposeCadTOJava(originalFile);

            File[] dxfFileList = new File(originalFile.getParent() + File.separator + timePath).listFiles(new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                    return name.startsWith(serverFileName);
                }
            });

            for (File convertToFile : dxfFileList) {
                String mimeType = Files.probeContentType(Paths.get(convertToFile.getAbsolutePath()));
                String convertFullName = new String(convertToFile.getName().getBytes("8859_1"), "utf-8");
                String convertExtName = convertFullName.substring(convertFullName.lastIndexOf(".") + 1).toLowerCase();

                if (CAD_CONVERT_TYPE.contains(convertExtName)) {
                    fileInfo.put("FILE_PATH", convertToFile.getAbsolutePath());
                    fileInfo.put("ORGINAL_FILE_NM", serverFileName + "." + convertExtName);
                    fileInfo.put("FILE_TYPE", mimeType);
                    fileInfo.put("FILE_EXT", convertExtName);
                    fileInfo.put("FILE_SIZE", convertToFile.length());

                    // DB 파일 INSERT (PNG, PDF)
                    fileInfo.put("GFILE_SEQ",     "");                      // GFILE 신규 등록
                    fileInfo.put("queryId",       "common.insertFileGroup");
                    innodaleDao.update(fileInfo);

                    fileInfo.put("queryId",       "common.insertFile");     // 신규 파일 등록
                    innodaleDao.create(fileInfo);

                    // 변환 정보 견적, 주문, 소재에서 각각 UPDATE 한다.
                    fileInfo.put("queryId",       queryId.get(0) + "_mapping");     // 신규 파일 등록
                    innodaleDao.create(fileInfo);
                }
            }
        }
        System.out.println("######################################### Thread End");
    }
}
