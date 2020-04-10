package com.framework.innodale.service.impl;

import com.framework.innodale.component.CadFileConverter;
import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class FileUploadServiceImpl implements FileUploadService {

    @Autowired
    public Environment environment;

    @Autowired
    public InnodaleDao innodaleDao;

    private List<String> CAD_CONVERT_TYPE = new ArrayList<>(Arrays.asList(new String[]{ "pdf", "png"}));

    @Override
    public void createFileUpload(MultipartHttpServletRequest request, Model model) throws Exception {
        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS", new Locale("ko", "KR"));
        String serverFileName = "file-" + CommonUtility.getUUIDString();
        String uploadFilePath = environment.getRequiredProperty("base.upload.main.path") + File.separator + formatter.format(new Date()).substring(0, 8);

        ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
        Iterator<String> itr = (Iterator<String>)request.getFileNames();

        if(itr.hasNext()) {

            List<MultipartFile> fileList = request.getFiles(itr.next());

            for(MultipartFile multipartFile:fileList) {

                HashMap<String, Object> fileMap = new HashMap<String, Object>();
                CommonUtility.createFileDirectory(new File(uploadFilePath));

                multipartFile.transferTo(new File(uploadFilePath + File.separator + serverFileName));

                String fileName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
                String extName = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();

                fileMap.put("FILE_NM", serverFileName);
                fileMap.put("FILE_PATH", uploadFilePath + File.separator + serverFileName);
                fileMap.put("ORGINAL_FILE_NM", fileName);
                fileMap.put("FILE_TYPE", multipartFile.getContentType());
                fileMap.put("FILE_EXT", extName);
                fileMap.put("FILE_SIZE", multipartFile.getSize());

                if (!hashMap.containsKey("GFILE_SEQ") || "".equals(String.valueOf(hashMap.get("GFILE_SEQ")))) {
                    fileMap.put("GFILE_SEQ", "");                   // GFILE 신규 등록
                    fileMap.put("queryId", "common.insertFileGroup");
                    innodaleDao.update(fileMap);
                } else {
                    fileMap.put("GFILE_SEQ", hashMap.get("GFILE_SEQ"));                 // 기존 파일 삭제
                    fileMap.put("queryId", "common.deleteGFileKey");
                    innodaleDao.create(fileMap);
                }

                fileMap.put("queryId", "common.insertFile");    // 신규 파일 등록
                innodaleDao.create(fileMap);

                resultList.add(fileMap);
            }
        }

        model.addAttribute("result",       "success");
        model.addAttribute("message",      "업로드를 완료 하였습니다.");

        model.addAttribute("fileUploadList", resultList);
    }

    @Override
    public void createControlCadFiles(MultipartHttpServletRequest request, Model model) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS", new Locale("ko", "KR"));
        // base.upload.cad.path=D:/Project/workspace-jmes/upload/cad
        String uploadFilePath = environment.getRequiredProperty("base.upload.cad.path") + File.separator + formatter.format(new Date()).substring(0, 8);

        ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
        Iterator<String> itr = (Iterator<String>)request.getFileNames();

        if(itr.hasNext()) {

            List<MultipartFile> fileList = request.getFiles(itr.next());

            for(MultipartFile multipartFile:fileList) {

                String serverFileName = CommonUtility.getUUIDString();
                String serverFullFileName = "file-" + serverFileName;

                HashMap<String, Object> fileInfo = new HashMap<String, Object>();

                String originalFullName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
                String originalFileName = originalFullName.substring(0, originalFullName.lastIndexOf(".")).toLowerCase();
                String originalExtName = originalFullName.substring(originalFullName.lastIndexOf(".") + 1).toLowerCase();

                // String convertFilePath = uploadFilePath + File.separator + serverFileName;    // 임시 작업 디렉토리
                // 업로드 파일 경로
                String targetFilePath = uploadFilePath + File.separator + serverFullFileName + "." + originalExtName;

                CommonUtility.createFileDirectory(new File(uploadFilePath));

                fileInfo.put("FILE_NM", serverFullFileName + "." + originalExtName);
                fileInfo.put("FILE_PATH", targetFilePath);
                fileInfo.put("UPLOAD_FILE_NM", originalFullName);
                fileInfo.put("ORGINAL_FILE_NM", originalFullName);
                fileInfo.put("FILE_TYPE", multipartFile.getContentType());
                fileInfo.put("FILE_EXT", originalExtName);
                fileInfo.put("FILE_SIZE", multipartFile.getSize());
                fileInfo.put("ROWNUM", 1);

                // 원본 파일 저장 처리
                managerFileInformationInsert(fileInfo);
                // 확장자에 따른 컬럼 정의
                settingFileInfoColumn(fileInfo, multipartFile.getSize(), originalExtName);

                // 파일 업로드 원본 파일
                File originalFile = new File(targetFilePath);

                // File convertFile = new File(convertFilePath + File.separator + serverFileName + "." + originalExtName);

                multipartFile.transferTo(originalFile);   // 원본 파일 저장
                // Files.copy(new File(originalFile.getAbsolutePath()).toPath(), new File(convertFile.getAbsolutePath()).toPath());
                CadFileConverter.cadfile_converter(originalFile, serverFileName);    // convert 처리
                // CadFileConverter.cadfile_converter(convertFile);    // convert 처리

                File[] dxfFileList = new File(uploadFilePath + File.separator + serverFileName).listFiles();

                int count = 2;

                for (File convertToFile : dxfFileList) {
                    String mimeType = Files.probeContentType(Paths.get(convertToFile.getAbsolutePath()));
                    String convertFullName = new String(convertToFile.getName().getBytes("8859_1"), "utf-8");
                    String convertExtName = convertFullName.substring(convertFullName.lastIndexOf(".") + 1).toLowerCase();

                    if (CAD_CONVERT_TYPE.contains(convertExtName)) {
                        fileInfo.put("FILE_PATH", convertToFile.getAbsolutePath());
                        fileInfo.put("ORGINAL_FILE_NM", originalFileName + "." + convertExtName);
                        fileInfo.put("FILE_TYPE", mimeType);
                        fileInfo.put("FILE_EXT", convertExtName);
                        fileInfo.put("FILE_SIZE", convertToFile.length());
                        fileInfo.put("ROWNUM", count++);

                        // 파일 저장 처리
                        managerFileInformationInsert(fileInfo);
                        // 확장자에 따른 컬럼 정의
                        settingFileInfoColumn(fileInfo, convertToFile.length(), convertExtName);
                    }
                }

                // 파일 명으로 주문 번호의 파일 번호가 있는지 확인하여 처리 한다.
                fileInfo.put("queryId", "orderMapper.selectControlCadFiles");    // 연결 주문 정보 조회
                List<Map<String, Object>> controlList = innodaleDao.getList(fileInfo);

                // 파일 번호 정보가 있는 경우 Map에 파일 정보를 추가 한다.
                Iterator controlIterator = controlList.iterator();
                while (controlIterator.hasNext()) {
                    HashMap<String, Object> map = (HashMap<String, Object>) controlIterator.next();
                    resultList.add(map);
                }
            }
        }
        model.addAttribute("result",       "success");
        model.addAttribute("message",      "업로드를 완료 하였습니다.");
        model.addAttribute("fileUploadList", resultList);
    }

    @Override
    public void uploadControlCadFilesTesting(MultipartHttpServletRequest request, Model model) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS", new Locale("ko", "KR"));
        // base.upload.cad.path=D:/Project/workspace-jmes/upload/cad
        String uploadFilePath = environment.getRequiredProperty("base.upload.cad.path") + File.separator + formatter.format(new Date()).substring(0, 8);

        ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
        Iterator<String> itr = (Iterator<String>)request.getFileNames();

        if(itr.hasNext()) {

            List<MultipartFile> fileList = request.getFiles(itr.next());

            for(MultipartFile multipartFile:fileList) {

                String serverFileName = CommonUtility.getUUIDString();
                String serverFullFileName = "file-" + serverFileName;

                HashMap<String, Object> fileInfo = new HashMap<String, Object>();

                String originalFullName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
                String originalFileName = originalFullName.substring(0, originalFullName.lastIndexOf(".")).toLowerCase();
                String originalExtName = originalFullName.substring(originalFullName.lastIndexOf(".") + 1).toLowerCase();

                // String convertFilePath = uploadFilePath + File.separator + serverFileName;    // 임시 작업 디렉토리
                // 업로드 파일 경로
                String targetFilePath = uploadFilePath + File.separator + serverFullFileName + "." + originalExtName;

                CommonUtility.createFileDirectory(new File(uploadFilePath));

                fileInfo.put("FILE_NM", serverFullFileName + "." + originalExtName);
                fileInfo.put("FILE_PATH", targetFilePath);
                fileInfo.put("UPLOAD_FILE_NM", originalFullName);
                fileInfo.put("ORGINAL_FILE_NM", originalFullName);
                fileInfo.put("FILE_TYPE", multipartFile.getContentType());
                fileInfo.put("FILE_EXT", originalExtName);
                fileInfo.put("FILE_SIZE", multipartFile.getSize());

                // 원본 파일 저장 처리
                managerFileInformationInsert(fileInfo);
                // 확장자에 따른 컬럼 정의
                settingFileInfoColumn(fileInfo, multipartFile.getSize(), originalExtName);

                // 파일 업로드 원본 파일
                File originalFile = new File(targetFilePath);

                multipartFile.transferTo(originalFile);   // 원본 파일 저장
                CadFileConverter.cadfile_converter(originalFile, serverFileName);    // convert 처리

                File[] dxfFileList = new File(uploadFilePath + File.separator + serverFileName).listFiles();

                for (File convertToFile : dxfFileList) {
                    String mimeType = Files.probeContentType(Paths.get(convertToFile.getAbsolutePath()));
                    String convertFullName = new String(convertToFile.getName().getBytes("8859_1"), "utf-8");
                    String convertExtName = convertFullName.substring(convertFullName.lastIndexOf(".") + 1).toLowerCase();

                    if (CAD_CONVERT_TYPE.contains(convertExtName)) {
                        fileInfo.put("FILE_PATH", convertToFile.getAbsolutePath());
                        fileInfo.put("ORGINAL_FILE_NM", originalFileName + "." + convertExtName);
                        fileInfo.put("FILE_TYPE", mimeType);
                        fileInfo.put("FILE_EXT", convertExtName);
                        fileInfo.put("FILE_SIZE", convertToFile.length());

                        // 파일 저장 처리
                        managerFileInformationInsert(fileInfo);
                        // 확장자에 따른 컬럼 정의
                        settingFileInfoColumn(fileInfo, convertToFile.length(), convertExtName);
                    }
                }
                resultList.add(fileInfo);
            }
        }
        model.addAttribute("result",       "success");
        model.addAttribute("message",      "업로드를 완료 하였습니다.");
        model.addAttribute("fileUploadList", resultList);
    }

    /**
     * 파일 확장자에 따른 컬럼 & 값 셋팅
     * @param fileInfo
     * @param fileSize
     * @param fileExtName
     */
    private void settingFileInfoColumn(HashMap<String, Object> fileInfo, long fileSize, String fileExtName){

        String fixColumnName = "DWG_GFILE";

        switch(fileExtName.toLowerCase()){
            case "dwg":
                fixColumnName = "DWG_GFILE_";
                break;
            case "dxf":
                fixColumnName = "DXF_GFILE_";
                break;
            case "pdf":
                fixColumnName = "PDF_GFILE_";
                break;
            case "png":
                fixColumnName = "IMG_GFILE_";
                break;
        }

        fileInfo.put(fixColumnName + "SEQ",  fileInfo.get("GFILE_SEQ"));
        fileInfo.put(fixColumnName + "SIZE", fileSize);

    }

    /**
     * 첨부 파일 Insert 처리
     * @param fileConvertMap
     * @throws UnsupportedEncodingException
     * @throws SQLException
     */
    private void managerFileInformationInsert(HashMap<String, Object> fileConvertMap) throws UnsupportedEncodingException, SQLException {

        fileConvertMap.put("GFILE_SEQ",         "");                   // GFILE 신규 등록
        fileConvertMap.put("queryId",           "common.insertFileGroup");
        innodaleDao.update(fileConvertMap);

        fileConvertMap.put("queryId", "common.insertFile");             // 신규 파일 등록
        innodaleDao.create(fileConvertMap);

    }
}