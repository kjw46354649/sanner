package com.framework.innodale.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.component.ImageUtil;
import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.service.FileUploadService;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.nio.file.Files;

@Service
public class FileUploadServiceImpl implements FileUploadService {

    @Autowired
    public Environment environment;

    @Autowired
    public InnodaleDao innodaleDao;


    private List<String> CAD_UPLOAD_EXT = new ArrayList<>(Arrays.asList(new String[]{ "pdf", "dxf"}));
    private List<String> CAD_CONVERT_TYPE = new ArrayList<>(Arrays.asList(new String[]{ "pdf", "png"}));

    @Override
    public void createFileUpload(MultipartHttpServletRequest request, Model model) throws Exception {
        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        String userId = (String)hashMap.get("LOGIN_USER_ID");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS", new Locale("ko", "KR"));
        String uploadFilePath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.upload.main.path") + File.separator + formatter.format(new Date()).substring(0, 8);

        ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
        Iterator<String> itr = (Iterator<String>)request.getFileNames();

        String fileSeq = String.valueOf(hashMap.get("GFILE_SEQ"));
        if(fileSeq == null || "null".equals(fileSeq)){
            fileSeq = "";
        }

        if(itr.hasNext()) {

            List<MultipartFile> fileList = request.getFiles(itr.next());

            for(MultipartFile multipartFile:fileList) {

                String serverFileName = "file-" + CommonUtility.getUUIDString();

                HashMap<String, Object> fileMap = new HashMap<String, Object>();
                CommonUtility.createFileDirectory(new File(uploadFilePath));
                fileMap.put("LOGIN_USER_ID",userId);

                multipartFile.transferTo(new File(uploadFilePath + File.separator + serverFileName));

                //String fileName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
                String fileName = multipartFile.getOriginalFilename();
                String extName = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();

                fileMap.put("FILE_NM", serverFileName);
                fileMap.put("FILE_PATH", uploadFilePath + File.separator + serverFileName);
                fileMap.put("ORGINAL_FILE_NM", fileName);
                fileMap.put("FILE_TYPE", multipartFile.getContentType());
                fileMap.put("FILE_EXT", extName);
                fileMap.put("FILE_SIZE", multipartFile.getSize());

                //if(!fileSeq.equals("")) {
                if(!"".equals(fileSeq)) {
                    fileMap.put("GFILE_SEQ", fileSeq);
                }else {
                    //if ("".equals(String.valueOf(hashMap.get("GFILE_SEQ")))) {
                    if("".equals(fileSeq)) {
                        fileMap.put("GFILE_SEQ", "");                   // GFILE 신규 등록
                        fileMap.put("queryId", "common.insertFileGroup");
                        innodaleDao.update(fileMap);

                        fileSeq = Integer.toString((int) fileMap.get("GFILE_SEQ"));
                    }/* else {
                        fileMap.put("GFILE_SEQ", hashMap.get("GFILE_SEQ"));                 // 기존 파일 삭제
                        fileMap.put("queryId", "common.deleteGFileKey");
                        innodaleDao.create(fileMap);
                    }*/
                }

                fileMap.put("FILE_SEQ", "");
                fileMap.put("queryId", "common.insertFile");    // 신규 파일 등록
                innodaleDao.create(fileMap);

                resultList.add(fileMap);
            }
        }

        model.addAttribute("result",       "success");
        model.addAttribute("message",      "업로드를 완료 하였습니다.");

        model.addAttribute("fileUploadList", resultList);
        model.addAttribute("GFILE_SEQ", fileSeq);
    }

    /** 주문 파일 리버전 처리전에 먼저 work key와 주문정보를 업로드 처리 한다. **/
    @Override
    public String controlCadRevPrev(Map<String, Object> hashMap) throws Exception{

        String workKey = "";

        String jsonObject = (String) hashMap.get("gridData");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        ArrayList<HashMap<String, Object>> orderList = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<HashMap<String, Object>>() {});

        if (jsonMap.containsKey("orderList")) {
            orderList = (ArrayList<HashMap<String, Object>>) jsonMap.get("orderList");

            workKey = CommonUtility.getUUIDString("drawing");

            hashMap.put("WORK_KEY", workKey);
            hashMap.put("orderList", orderList);
            hashMap.put("queryId", "drawingUploadMapper.manageControlCadRevPrevDataInsert");
            innodaleDao.create(hashMap);
        }
        return workKey;
    }

    @Override
    public String controlCadPartPrev(Map<String, Object> hashMap) throws Exception{

        String workKey = "";

        String jsonObject = (String) hashMap.get("gridData");
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> jsonMap = null;
        ArrayList<HashMap<String, Object>> controlDetailList = null;

        if (jsonObject != null)
            jsonMap = objectMapper.readValue(jsonObject, new TypeReference<HashMap<String, Object>>() {});

        if (jsonMap.containsKey("controlDetailList")) {
            controlDetailList = (ArrayList<HashMap<String, Object>>) jsonMap.get("controlDetailList");

            workKey = CommonUtility.getUUIDString("drawing");

            hashMap.put("WORK_KEY", workKey);
            hashMap.put("controlDetailList", controlDetailList);
            hashMap.put("queryId", "drawingUploadMapper.manageControlCadPartPrevDataInsert");
            innodaleDao.create(hashMap);
        }
        return workKey;
    }

    /** 주문 파일 업로드 처리 **/
    @Override
    public void uploadDxfAndPdfCadFilesControlOrder(MultipartHttpServletRequest request, Model model) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        String userId = (String)hashMap.get("LOGIN_USER_ID");

        // Demon Key 생성
        if(StringUtils.isEmpty(hashMap.get("WORK_KEY"))){
            hashMap.put("WORK_KEY", CommonUtility.getUUIDString("drawing"));
        }

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", new Locale("ko", "KR"));
        String uploadDatePath = formatter.format(new Date()).substring(0, 8) + File.separator + formatter.format(new Date());
        String uploadTimePath = File.separator + formatter.format(new Date());
        String uploadFilePath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.upload.cad.path") + File.separator + uploadDatePath;

        ArrayList<HashMap<String, Object>> fileUploadList = new ArrayList<HashMap<String, Object>>();
        ArrayList<HashMap<String, Object>> fileUploadDataList = new ArrayList<HashMap<String, Object>>();
        Iterator<String> itr = (Iterator<String>)request.getFileNames();

        String actionType = (String)hashMap.get("actionType");

        if(itr.hasNext()) {

            List<MultipartFile> fileList = request.getFiles(itr.next());

            /**
             * PDF 파일을 Image 파일로 변환하고 먼저 저장하여 정보를 가지고 있는다.
             */
            for (MultipartFile multipartFile : fileList) {

                String serverFileName = CommonUtility.getUUIDString();
                String serverFullFileName = "file-" + serverFileName;

                HashMap<String, Object> fileInfo = new HashMap<String, Object>();
                fileInfo.put("LOGIN_USER_ID",userId);

                // String originalFullName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
                String originalFullName = multipartFile.getOriginalFilename();
                String mappingDrawingNum = originalFullName.substring(0, originalFullName.lastIndexOf(".")).toUpperCase();
                if (mappingDrawingNum.indexOf("_") > 0)
                    mappingDrawingNum = mappingDrawingNum.substring(0, mappingDrawingNum.indexOf("_")).toUpperCase();

                String originalExtName = originalFullName.substring(originalFullName.lastIndexOf(".") + 1).toLowerCase();

                if ("PDF".equalsIgnoreCase(originalExtName) || "DXF".equalsIgnoreCase(originalExtName)) {
                    // 업로드 파일 경로
                    String targetFilePath = uploadFilePath + File.separator + serverFullFileName + "." + originalExtName;

                    CommonUtility.createFileDirectory(new File(uploadFilePath));

                    fileInfo.put("FILE_NM", serverFullFileName + "." + originalExtName);
                    fileInfo.put("MAPPING_STR", mappingDrawingNum);
                    fileInfo.put("FILE_PATH", targetFilePath);
                    fileInfo.put("TIME_PATH", uploadTimePath);
                    fileInfo.put("UPLOAD_FILE_NM", originalFullName);
                    fileInfo.put("ORGINAL_FILE_NM", originalFullName);
                    fileInfo.put("FILE_TYPE", multipartFile.getContentType());
                    fileInfo.put("FILE_EXT", originalExtName);
                    fileInfo.put("FILE_SIZE", multipartFile.getSize());

                    // 원본 파일 DB 저장 처리
                    managerFileInformationInsert(fileInfo);
                    // 확장자에 따른 컬럼 정의
                    settingFileInfoColumn(fileInfo, multipartFile.getSize(), originalExtName);
                    // 파일 업로드 원본 파일
                    multipartFile.transferTo(new File(targetFilePath));

                    // 업로드 파일 정보를 저장한다.

                    if ("PDF".equalsIgnoreCase(originalExtName)) {

                        hashMap.put("FILE_TYPE", "PDF_GFILE_SEQ");
                        hashMap.put("GFILE_SEQ", fileInfo.get("PDF_GFILE_SEQ"));
                        hashMap.put("PDF_GFILE_SEQ", fileInfo.get("PDF_GFILE_SEQ"));

                        // 이미지 처리
                        String targetImageFullpath = uploadFilePath + File.separator + serverFullFileName + ".png";
                        int convertResult = MakePDFImageConvert(targetFilePath, targetImageFullpath);

                        if (convertResult == 1) {

                            File ImageFile = new File(targetImageFullpath);
                            HashMap<String, Object> imageFileInfo = new HashMap<String, Object>();
                            imageFileInfo.put("LOGIN_USER_ID",userId);
                            imageFileInfo.put("FILE_NM", serverFullFileName + ".png");
                            imageFileInfo.put("MAPPING_STR", mappingDrawingNum);
                            imageFileInfo.put("FILE_PATH", targetImageFullpath);
                            imageFileInfo.put("TIME_PATH", uploadTimePath);
                            imageFileInfo.put("UPLOAD_FILE_NM", originalFullName);
                            imageFileInfo.put("ORGINAL_FILE_NM", originalFullName);
                            imageFileInfo.put("FILE_TYPE", "image");
                            imageFileInfo.put("FILE_EXT", "png");
                            imageFileInfo.put("FILE_SIZE", ImageFile.length());
                            // 원본 파일 DB 저장 처리
                            managerFileInformationInsert(imageFileInfo);
                            // 확장자에 따른 컬럼 정의
                            settingFileInfoColumn(imageFileInfo, ImageFile.length(), "png");

                            fileInfo.put("SUCCESS", "Y");
                            fileInfo.put("MESSAGE", "");

                            hashMap.put("SUCCESS", fileInfo.get("SUCCESS"));
                            hashMap.put("MESSAGE", fileInfo.get("MESSAGE"));
                            hashMap.put("IMG_GFILE_SEQ", imageFileInfo.get("IMG_GFILE_SEQ"));

                        } else {
                            fileInfo.put("SUCCESS", "N");
                            fileInfo.put("MESSAGE", "PDF 이미지 변환 오류");

                            hashMap.put("SUCCESS", fileInfo.get("SUCCESS"));
                            hashMap.put("MESSAGE", fileInfo.get("MESSAGE"));
                            hashMap.put("IMG_GFILE_SEQ", "");
                        }

                    } else {

                        hashMap.put("FILE_TYPE", "DXF_GFILE_SEQ");
                        hashMap.put("SUCCESS", "Y");
                        hashMap.put("GFILE_SEQ", fileInfo.get("DXF_GFILE_SEQ"));
                        hashMap.put("DXF_GFILE_SEQ", fileInfo.get("DXF_GFILE_SEQ"));
                    }

                    hashMap.put("MAPPING_STR", mappingDrawingNum);

                } else {

                    fileInfo.put("FILE_NM", serverFullFileName + "." + originalExtName);
                    fileInfo.put("TIME_PATH", uploadTimePath);
                    fileInfo.put("MAPPING_STR", mappingDrawingNum);
                    fileInfo.put("UPLOAD_FILE_NM", originalFullName);
                    fileInfo.put("ORGINAL_FILE_NM", originalFullName);
                    fileInfo.put("FILE_TYPE", multipartFile.getContentType());
                    fileInfo.put("FILE_EXT", originalExtName);
                    fileInfo.put("FILE_SIZE", multipartFile.getSize());
                    fileInfo.put("MESSAGE", "업로드 확장자 불가");
                    fileInfo.put("SUCCESS", "N");

                    // 원본 파일 DB 저장 처리
                    managerFileInformationInsert(fileInfo);

                    hashMap.put("GFILE_SEQ", fileInfo.get("GFILE_SEQ"));
                    hashMap.put("MAPPING_STR", mappingDrawingNum);
                    hashMap.put("SUCCESS", "N");
                    hashMap.put("MESSAGE", "파일 형식이 맞지 않습니다.");

                }

                // 업로드 도면 기준 프로시저 적용 대상 작업 처리
                hashMap.put("queryId", "drawingUploadMapper.insertDrawingUpload");
                innodaleDao.create(hashMap);

                hashMap.remove("SUCCESS");
                hashMap.remove("MAPPING_STR");
                hashMap.remove("MESSAGE");
                hashMap.remove("GFILE_SEQ");
                hashMap.remove("DXF_GFILE_SEQ");
                hashMap.remove("PDF_GFILE_SEQ");
                hashMap.remove("IMG_GFILE_SEQ");

            }
            if("order".equals(actionType)){
                // 도면 대상 업로드 리스트 및 적둉 대상 작업 리스트 조회
                hashMap.put("queryId", "procedure.SP_CONTROL_DRAWING_UPLOAD");
            }else if("controlPart".equals(actionType)) {
                hashMap.put("queryId", "procedure.SP_CONTROL_DRAWING_UPLOAD_PART");
            }else if("inside".equals(actionType)) {
                hashMap.put("queryId", "procedure.SP_CONTROL_DRAWING_UPLOAD_STOCK");
            }else {
                // 도면 대사 관리 번호 저장 처리
                // 도면 대상 업로드 리스트 및 적둉 대상 작업 리스트 조회
                hashMap.put("queryId", "procedure.SP_CONTROL_DRAWING_UPLOAD_REV_NEW");
            }
            innodaleDao.callProcedureMethod(hashMap);
        }
        model.addAttribute("result",       "success");
        model.addAttribute("message",      "업로드를 완료 하였습니다.");

        // 업로드 정보
        hashMap.put("queryId", "drawingUploadMapper.selectDrawingUploadFileList");
        model.addAttribute("fileUploadList",     innodaleDao.getList(hashMap));

        // 주문 정보
        if("controlRev".equals(actionType)) {
            hashMap.put("queryId", "drawingUploadMapper.selectDrawingUploadControlRevList");
        }else {
            hashMap.put("queryId", "drawingUploadMapper.selectDrawingUploadControlDataList");
        }
        model.addAttribute("fileUploadDataList", innodaleDao.getList(hashMap));
    }

    /** 견적 & 재고 도면 업로드 **/
    @Override
    public void uploadDxfAndPdfCadFiles(MultipartHttpServletRequest request, Model model) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        String userId = (String)hashMap.get("LOGIN_USER_ID");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", new Locale("ko", "KR"));
        String uploadDatePath = formatter.format(new Date()).substring(0, 8) + File.separator + formatter.format(new Date());
        String uploadTimePath = File.separator + formatter.format(new Date());
        String uploadFilePath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.upload.cad.path") + File.separator + uploadDatePath;

        ArrayList<HashMap<String, Object>> fileUploadList = new ArrayList<HashMap<String, Object>>();
        ArrayList<HashMap<String, Object>> fileUploadDataList = new ArrayList<HashMap<String, Object>>();
        Iterator<String> itr = (Iterator<String>)request.getFileNames();

        if(itr.hasNext()) {

            String paramQueryId = (String)hashMap.get("queryId");
            List<MultipartFile> fileList = request.getFiles(itr.next());

            HashMap<String, Object> dxfGfileKeyHashMap = new HashMap();
            HashMap<String, Object> pdfGfileKeyHashMap = new HashMap();
            HashMap<String, Object> pngGfileKeyHashMap = new HashMap();
            ArrayList<String> mappingNumList = new ArrayList();

            /**
             * PDF 파일을 Image 파일로 변환하고 먼저 저장하여 정보를 가지고 있는다.
             */
            for(MultipartFile multipartFile:fileList) {

                String serverFileName = CommonUtility.getUUIDString();
                String serverFullFileName = "file-" + serverFileName;

                HashMap<String, Object> fileInfo = new HashMap<String, Object>();
                fileInfo.put("LOGIN_USER_ID",userId);

                // String originalFullName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
                String originalFullName = multipartFile.getOriginalFilename();
                String mappingDrawingNum = originalFullName.substring(0, originalFullName.lastIndexOf(".")).toUpperCase();
                if(mappingDrawingNum.indexOf("_") > 0)
                    mappingDrawingNum = mappingDrawingNum.substring(0, mappingDrawingNum.indexOf("_")).toUpperCase();
                String originalExtName = originalFullName.substring(originalFullName.lastIndexOf(".") + 1).toLowerCase();

                if ("PDF".equalsIgnoreCase(originalExtName) || "DXF".equalsIgnoreCase(originalExtName)) {
                    // 업로드 파일 경로
                    String targetFilePath = uploadFilePath + File.separator + serverFullFileName + "." + originalExtName;

                    CommonUtility.createFileDirectory(new File(uploadFilePath));

                    fileInfo.put("FILE_NM", serverFullFileName + "." + originalExtName);
                    fileInfo.put("MAPPING_STR", mappingDrawingNum);
                    fileInfo.put("FILE_PATH", targetFilePath);
                    fileInfo.put("TIME_PATH", uploadTimePath);
                    fileInfo.put("UPLOAD_FILE_NM", originalFullName);
                    fileInfo.put("ORGINAL_FILE_NM", originalFullName);
                    fileInfo.put("FILE_TYPE", multipartFile.getContentType());
                    fileInfo.put("FILE_EXT", originalExtName);
                    fileInfo.put("FILE_SIZE", multipartFile.getSize());

                    // 원본 파일 DB 저장 처리
                    managerFileInformationInsert(fileInfo);
                    // 확장자에 따른 컬럼 정의
                    settingFileInfoColumn(fileInfo, multipartFile.getSize(), originalExtName);
                    // 파일 업로드 원본 파일
                    multipartFile.transferTo(new File(targetFilePath));

                    if("PDF".equalsIgnoreCase(originalExtName)) {

                        pdfGfileKeyHashMap.put(mappingDrawingNum, fileInfo.get("PDF_GFILE_SEQ"));

                        // 이미지 처리
                        String targetImageFullpath = uploadFilePath + File.separator + serverFullFileName + ".png";
                        int convertResult = MakePDFImageConvert(targetFilePath, targetImageFullpath);

                        if (convertResult == 1) {

                            File ImageFile = new File(targetImageFullpath);
                            HashMap<String, Object> imageFileInfo = new HashMap<String, Object>();
                            imageFileInfo.put("LOGIN_USER_ID",userId);
                            imageFileInfo.put("FILE_NM", serverFullFileName + ".png");
                            imageFileInfo.put("MAPPING_STR", mappingDrawingNum);
                            imageFileInfo.put("FILE_PATH", targetImageFullpath);
                            imageFileInfo.put("TIME_PATH", uploadTimePath);
                            imageFileInfo.put("UPLOAD_FILE_NM", originalFullName);
                            imageFileInfo.put("ORGINAL_FILE_NM", originalFullName);
                            imageFileInfo.put("FILE_TYPE", "image");
                            imageFileInfo.put("FILE_EXT", "png");
                            imageFileInfo.put("FILE_SIZE", ImageFile.length());
                            // 원본 파일 DB 저장 처리
                            managerFileInformationInsert(imageFileInfo);
                            // 확장자에 따른 컬럼 정의
                            settingFileInfoColumn(imageFileInfo, ImageFile.length(), "png");

                            // 각 파일의 GKEY 값을 셋팅한다.
                            pngGfileKeyHashMap.put(mappingDrawingNum, imageFileInfo.get("IMG_GFILE_SEQ"));

                            fileInfo.put("SUCCESS", "Y");
                            fileInfo.put("MESSAGE", "");

                        } else {
                            fileInfo.put("SUCCESS", "N");
                            fileInfo.put("MESSAGE", "PDF 페이지 오류");
                        }

                    }else{

                        dxfGfileKeyHashMap.put(mappingDrawingNum, fileInfo.get("DXF_GFILE_SEQ"));

                        fileInfo.put("SUCCESS", "Y");
                        fileInfo.put("MESSAGE", "");
                    }

                    if(!mappingNumList.contains(mappingDrawingNum))
                        mappingNumList.add(mappingDrawingNum);

                    fileUploadList.add(fileInfo);

                } else {

                    fileInfo.put("FILE_NM", serverFullFileName + "." + originalExtName);
                    fileInfo.put("TIME_PATH", uploadTimePath);
                    fileInfo.put("MAPPING_STR", mappingDrawingNum);
                    fileInfo.put("UPLOAD_FILE_NM", originalFullName);
                    fileInfo.put("ORGINAL_FILE_NM", originalFullName);
                    fileInfo.put("FILE_TYPE", multipartFile.getContentType());
                    fileInfo.put("FILE_EXT", originalExtName);
                    fileInfo.put("FILE_SIZE", multipartFile.getSize());
                    fileInfo.put("MESSAGE", "업로드 확장자 불가");
                    fileInfo.put("SUCCESS", "N");

                    fileUploadList.add(fileInfo);
                }
            }
            for(String mappingDrawingNum : mappingNumList){

                HashMap<String, Object> fileInfo = new HashMap<String, Object>();
                boolean isMapperCheck = false;

                if(dxfGfileKeyHashMap.containsKey(mappingDrawingNum))
                    fileInfo.put("DXF_GFILE_SEQ", dxfGfileKeyHashMap.get(mappingDrawingNum));
                if(pdfGfileKeyHashMap.containsKey(mappingDrawingNum))
                    fileInfo.put("PDF_GFILE_SEQ", pdfGfileKeyHashMap.get(mappingDrawingNum));
                if(pngGfileKeyHashMap.containsKey(mappingDrawingNum))
                    fileInfo.put("IMG_GFILE_SEQ", pngGfileKeyHashMap.get(mappingDrawingNum));

                fileInfo.put("INSIDE_STOCK_SEQ", (String)hashMap.get("INSIDE_STOCK_SEQ"));
                fileInfo.put("queryId", paramQueryId);    // 연결 주문 정보 조회
                List<Map<String, Object>> controlList = innodaleDao.getList(fileInfo);

                // 파일 번호 정보가 있는 경우 Map에 파일 정보를 추가 한다.
                Iterator controlIterator = controlList.iterator();
                if(controlIterator.hasNext()) {
                    while (controlIterator.hasNext()) {
                       HashMap<String, Object> map = (HashMap<String, Object>) controlIterator.next();
                       fileUploadDataList.add(map);
                    }
                    isMapperCheck = true;
                }

                // 매핑 정보가 없을 경우 업로드 파일 정보의 메시지 처리 한다.
                if(!isMapperCheck) {
                    for (int i=0;i<fileUploadList.size();i++) {
                        HashMap<String, Object> uploadFile = fileUploadList.get(i);
                        String uploadFileMappingStr = (String)uploadFile.get("MAPPING_STR");
                        if(uploadFileMappingStr.equals(mappingDrawingNum)) {
                            uploadFile.put("MESSAGE", "대상을 찾을 수 없습니다.");
                            uploadFile.put("SUCCESS", "N");
                            fileUploadList.set(i, uploadFile);
                        }
                    }
                }
            }
        }

        // 업로드 이후 매핑 자료의 정렬 처리
        Collections.sort(fileUploadDataList, new Comparator<HashMap<String, Object >>() {
            @Override
            public int compare(HashMap<String, Object> firstMappingStr, HashMap<String, Object> secondMappingStr) {
                String fMapStr = String.valueOf(firstMappingStr.get("SORTKEY"));
                String sMapStr = String.valueOf(secondMappingStr.get("SORTKEY"));
                return fMapStr.compareTo(sMapStr);
            }
        });

        // 업로드 이후 파일 이름의 정렬 처리
        Collections.sort(fileUploadList, new Comparator<HashMap<String, Object >>() {
            @Override
            public int compare(HashMap<String, Object> firstMappingStr, HashMap<String, Object> secondMappingStr) {
                String fMapStr = String.valueOf(firstMappingStr.get("ORGINAL_FILE_NM"));
                String sMapStr = String.valueOf(secondMappingStr.get("ORGINAL_FILE_NM"));
                return fMapStr.compareTo(sMapStr);
            }
        });

        model.addAttribute("result",       "success");
        model.addAttribute("message",      "업로드를 완료 하였습니다.");
        model.addAttribute("fileUploadList", fileUploadList);
        model.addAttribute("fileUploadDataList", fileUploadDataList);
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

        fileConvertMap.put("GFILE_SEQ",     "");                            // GFILE 신규 등록
        fileConvertMap.put("queryId",       "common.insertFileGroup");
        innodaleDao.update(fileConvertMap);

        fileConvertMap.put("queryId",       "common.insertFile");             // 신규 파일 등록
        innodaleDao.create(fileConvertMap);

    }


    /**
     * 0 인 경우 1페이지 변환 처리 , 1이 아닌 경우는 잘못된 페이징 변환이다
     * @param inPDFFullPath
     * @param outImageFullPath
     * @return
     * @throws Exception
     */
    private int MakePDFImageConvert(String inPDFFullPath, String outImageFullPath) throws Exception{

        PDDocument document = PDDocument.load(new File(inPDFFullPath));
        PDFRenderer pdfRenderer = new PDFRenderer(document);
        int pageCount = document.getNumberOfPages();
        if(pageCount != 1) return pageCount;

        PDPage page = document.getPage(0);
        PDRectangle pageSize = page.getMediaBox();

        //DPI 설정
        BufferedImage bim = pdfRenderer.renderImageWithDPI(0, 300, ImageType.RGB);
        ImageIOUtil.writeImage(bim, outImageFullPath , 300);

        bim = pdfRenderer.renderImageWithDPI(0, 130, ImageType.RGB);
        ImageIOUtil.writeImage(bim, outImageFullPath + ".thumbnail.png" , 130);

        bim = pdfRenderer.renderImageWithDPI(0, 30, ImageType.RGB);
        ImageIOUtil.writeImage(bim, outImageFullPath + ".mini.png" , 30);

        document.close(); //모두 사용한 PDF 문서는 닫는다.

        File tempImagefile = new File(outImageFullPath);
        File targetfile = new File(outImageFullPath + ".print.png");
        BufferedImage image = ImageIO.read(tempImagefile);
        int imageWidth = image.getWidth();
        int imageHeight = image.getHeight();
        if(imageWidth > imageHeight){
            ImageUtil.rotate90(tempImagefile, targetfile);
        }else{
            Files.copy(tempImagefile.toPath(), targetfile.toPath());
        }
        return 1;
    }

}