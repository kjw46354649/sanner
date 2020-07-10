package com.framework.innodale.service.impl;

import com.framework.innodale.component.CadFileConverter;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
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


    private List<String> CAD_UPLOAD_EXT = new ArrayList<>(Arrays.asList(new String[]{ "pdf", "dxf"}));
    private List<String> CAD_CONVERT_TYPE = new ArrayList<>(Arrays.asList(new String[]{ "pdf", "png"}));

    @Override
    public void createFileUpload(MultipartHttpServletRequest request, Model model) throws Exception {
        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS", new Locale("ko", "KR"));
        String serverFileName = "file-" + CommonUtility.getUUIDString();
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

                HashMap<String, Object> fileMap = new HashMap<String, Object>();
                CommonUtility.createFileDirectory(new File(uploadFilePath));

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

    /** 임시로 PDF 파일 업로드 하여 이미지 처리 하는 부분 적용 **/
    @Override
    public void uploadDxfAndPdfCadFiles(MultipartHttpServletRequest request, Model model) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", new Locale("ko", "KR"));
        String uploadDatePath = formatter.format(new Date()).substring(0, 8) + File.separator + formatter.format(new Date());
        String uploadTimePath = File.separator + formatter.format(new Date());
        String uploadFilePath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.upload.cad.path") + File.separator + uploadDatePath;

        ArrayList<HashMap<String, Object>> fileUploadList = new ArrayList<HashMap<String, Object>>();
        ArrayList<HashMap<String, Object>> fileUploadDataList = new ArrayList<HashMap<String, Object>>();
        Iterator<String> itr = (Iterator<String>)request.getFileNames();

        if(itr.hasNext()) {

            int iSuccessCount = 0;
            int iErrorCount = 0;
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

                // String originalFullName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
                String originalFullName = multipartFile.getOriginalFilename();
                String mappingDrawingNum = originalFullName.substring(0, originalFullName.lastIndexOf(".")).toUpperCase();
                if(mappingDrawingNum.indexOf("_") > 0)
                mappingDrawingNum = mappingDrawingNum.substring(0, mappingDrawingNum.lastIndexOf("_")).toUpperCase();
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
                    fileInfo.put("ROWNUM", iSuccessCount++);

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
                    fileInfo.put("ROWNUM", iSuccessCount++);
                    fileInfo.put("MESSAGE", "업로드 확장자 불가");
                    fileInfo.put("SUCCESS", "N");

                    fileUploadList.add(fileInfo);
                }
            }

            for(String mappingDrawingNum : mappingNumList){

                HashMap<String, Object> fileInfo = new HashMap<String, Object>();

                if(dxfGfileKeyHashMap.containsKey(mappingDrawingNum))
                    fileInfo.put("DXF_GFILE_SEQ", dxfGfileKeyHashMap.get("DXF_GFILE_SEQ"));
                if(pdfGfileKeyHashMap.containsKey(mappingDrawingNum))
                    fileInfo.put("PDF_GFILE_SEQ", pdfGfileKeyHashMap.get("PDF_GFILE_SEQ"));
                if(pngGfileKeyHashMap.containsKey(mappingDrawingNum))
                    fileInfo.put("IMG_GFILE_SEQ", dxfGfileKeyHashMap.get("IMG_GFILE_SEQ"));

                fileInfo.put("MAPPING_STR", mappingDrawingNum);
                fileInfo.put("queryId", paramQueryId);    // 연결 주문 정보 조회
                List<Map<String, Object>> controlList = innodaleDao.getList(fileInfo);

                // 파일 번호 정보가 있는 경우 Map에 파일 정보를 추가 한다.
                Iterator controlIterator = controlList.iterator();
                if(controlIterator.hasNext()) {
                    while (controlIterator.hasNext()) {
                       HashMap<String, Object> map = (HashMap<String, Object>) controlIterator.next();
                       fileUploadDataList.add(map);
                    }
                }
            }
        }
        model.addAttribute("result",       "success");
        model.addAttribute("message",      "업로드를 완료 하였습니다.");
        model.addAttribute("fileUploadList", fileUploadList);
        model.addAttribute("fileUploadDataList", fileUploadDataList);
    }

    private boolean checkUploadDXF(List<MultipartFile> fileList, String pdfMappingDrawingNum){
        for(MultipartFile multipartFile:fileList) {
            String originalFullName = multipartFile.getOriginalFilename();
            String originalExtName = originalFullName.substring(originalFullName.lastIndexOf(".") + 1).toLowerCase();
            if("DXF".equalsIgnoreCase(originalExtName)){
                String mappingDrawingNum = originalFullName.substring(0, originalFullName.lastIndexOf(".")).toUpperCase();
                if(mappingDrawingNum.indexOf("_") > 0)
                mappingDrawingNum = mappingDrawingNum.substring(0, mappingDrawingNum.lastIndexOf("_")).toUpperCase();
                if(mappingDrawingNum.equalsIgnoreCase(pdfMappingDrawingNum)){
                    return true;
                }
            }
        }
        return false;
    }

    /** CAD 파일(DXF) 업로드 이후 처리 **/
    @Override
    public void uploadDxfCadFiles(MultipartHttpServletRequest request, Model model) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", new Locale("ko", "KR"));
        String uploadDatePath = formatter.format(new Date()).substring(0, 8) + File.separator + formatter.format(new Date());
        String uploadTimePath = File.separator + formatter.format(new Date());
        String uploadFilePath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.upload.cad.path") + File.separator + uploadDatePath;

        ArrayList<HashMap<String, Object>> fileUploadList = new ArrayList<HashMap<String, Object>>();
        ArrayList<HashMap<String, Object>> fileUploadDataList = new ArrayList<HashMap<String, Object>>();
        Iterator<String> itr = (Iterator<String>)request.getFileNames();

        if(itr.hasNext()) {

            int iSuccessCount = 0;
            int iErrorCount = 0;

            String paramQueryId = (String)hashMap.get("queryId");
            List<MultipartFile> fileList = request.getFiles(itr.next());

            for(MultipartFile multipartFile:fileList) {

                String serverFileName = CommonUtility.getUUIDString();
                String serverFullFileName = "file-" + serverFileName;

                HashMap<String, Object> fileInfo = new HashMap<String, Object>();

                // String originalFullName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
                String originalFullName = multipartFile.getOriginalFilename();
                String originalFileName = originalFullName.substring(0, originalFullName.lastIndexOf(".")).toLowerCase();
                String originalExtName = originalFullName.substring(originalFullName.lastIndexOf(".") + 1).toLowerCase();
                // 업로드 파일 경로
                String targetFilePath = uploadFilePath + File.separator + serverFullFileName + "." + originalExtName;
                CommonUtility.createFileDirectory(new File(uploadFilePath));

                fileInfo.put("FILE_NM", serverFullFileName + "." + originalExtName);
                fileInfo.put("NEW_DRAWING_NUM", originalFileName);
                fileInfo.put("FILE_PATH", targetFilePath);
                fileInfo.put("TIME_PATH", uploadTimePath);
                fileInfo.put("UPLOAD_FILE_NM", originalFullName);
                fileInfo.put("ORGINAL_FILE_NM", originalFullName);
                fileInfo.put("FILE_TYPE", multipartFile.getContentType());
                fileInfo.put("FILE_EXT", originalExtName);
                fileInfo.put("FILE_SIZE", multipartFile.getSize());
                fileInfo.put("ROWNUM", iSuccessCount++);

                // 원본 파일 DB 저장 처리
                managerFileInformationInsert(fileInfo);
                // 확장자에 따른 컬럼 정의
                settingFileInfoColumn(fileInfo, multipartFile.getSize(), originalExtName);
                // 업로드 파일 Server 저장
                multipartFile.transferTo(new File(targetFilePath));   // 원본 파일 저장

                // 파일 명으로 주문 번호의 파일 번호가 있는지 확인하여 처리 한다.
                fileInfo.put("queryId", paramQueryId);    // 연결 주문 정보 조회
                List<Map<String, Object>> controlList = innodaleDao.getList(fileInfo);

                // 파일 번호 정보가 있는 경우 Map에 파일 정보를 추가 한다.
                Iterator controlIterator = controlList.iterator();
                if(controlIterator.hasNext()) {
                    while (controlIterator.hasNext()) {
                        HashMap<String, Object> map = (HashMap<String, Object>) controlIterator.next();
                        fileUploadDataList.add(map);
                    }
                    fileUploadList.add(fileInfo);
                }else{
                    iErrorCount++;
                }
            }

            model.addAttribute("successCount",  iSuccessCount);
            model.addAttribute("errorCount",    iErrorCount);

        }
        model.addAttribute("result",       "success");
        model.addAttribute("message",      "업로드를 완료 하였습니다.");
        model.addAttribute("fileUploadList", fileUploadList);
        model.addAttribute("fileUploadDataList", fileUploadDataList);
    }

    @Override
    public void uploadControlCadFilesTesting(MultipartHttpServletRequest request, Model model) throws Exception {

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS", new Locale("ko", "KR"));
        // linux.base.upload.cad.path=D:/Project/workspace-jmes/upload/cad
        String uploadFilePath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.upload.cad.path") + File.separator + formatter.format(new Date()).substring(0, 8);

        ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
        Iterator<String> itr = (Iterator<String>)request.getFileNames();

        if(itr.hasNext()) {

            List<MultipartFile> fileList = request.getFiles(itr.next());

            for(MultipartFile multipartFile:fileList) {

                String serverFileName = CommonUtility.getUUIDString();
                String serverFullFileName = "file-" + serverFileName;

                HashMap<String, Object> fileInfo = new HashMap<String, Object>();

//                String originalFullName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
                String originalFullName = multipartFile.getOriginalFilename();
                String originalFileName = originalFullName.substring(0, originalFullName.lastIndexOf(".")).toLowerCase();
                String originalExtName = originalFullName.substring(originalFullName.lastIndexOf(".") + 1).toLowerCase();


                System.out.println("originalFullName=[" + originalFullName + "]");
                // String convertFilePath = uploadFilePath + File.separator + serverFileName;    // 임시 작업 디렉토리
                // 업로드 파일 경로
                String targetFilePath = uploadFilePath + File.separator + serverFullFileName + "." + originalExtName;

                CommonUtility.createFileDirectory(new File(uploadFilePath));
                CommonUtility.createFileDirectory(new File(uploadFilePath + File.separator + serverFileName));

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

                String message = CadFileConverter.cadfile_converter(originalFile, serverFileName);    // convert 처리
                // String message = CadFileConverter.cadfile_converter(originalFile, serverFileName);    // convert 처리
                fileInfo.put("MESSAGE", message);

                File[] dxfFileList = new File(uploadFilePath + File.separator + serverFileName).listFiles();

                for (File convertToFile : dxfFileList) {
                    String mimeType = Files.probeContentType(Paths.get(convertToFile.getAbsolutePath()));
                    // String convertFullName = new String(convertToFile.getName().getBytes("8859_1"), "utf-8");
                    String convertFullName = convertToFile.getName();
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
        if (pageSize.getWidth() > pageSize.getHeight()) {
            page.setRotation(90); //Rotate Portrait
        }
        //DPI 설정
        BufferedImage bim = pdfRenderer.renderImageWithDPI(0, 300, ImageType.RGB);
        // 이미지로 만든다.
        ImageIOUtil.writeImage(bim, inPDFFullPath + "temp.png" , 300);
        document.close(); //모두 사용한 PDF 문서는 닫는다.

        File tempImagefile = new File(inPDFFullPath + "temp.png");
        File targetfile = new File(inPDFFullPath + ".png");
        File sourceFile = null;

        BufferedImage image = ImageIO.read(tempImagefile);
        int imageWidth = image.getWidth();
        int imageHeight = image.getHeight();

        if(imageWidth > imageHeight){
            sourceFile = new File(inPDFFullPath + "_soruce.png");
            ImageUtil.rotate90(tempImagefile, sourceFile);
        }else{
            sourceFile = tempImagefile;
        }
        ImageUtil.resizeFix(sourceFile, targetfile, (int)PDRectangle.A4.getWidth(), (int)PDRectangle.A4.getHeight());

        return 1;
    }


//    @Override
//    public void uploadDxfCadFiles(MultipartHttpServletRequest request, Model model) throws Exception {
//
//        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
//
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS", new Locale("ko", "KR"));
//        // linux.base.upload.cad.path=D:/Project/workspace-jmes/upload/cad
//        String uploadFilePath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.upload.cad.path") + File.separator + formatter.format(new Date()).substring(0, 8);
//
//        ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
//        Iterator<String> itr = (Iterator<String>)request.getFileNames();
//
//        if(itr.hasNext()) {
//
//            List<MultipartFile> fileList = request.getFiles(itr.next());
//
//            for(MultipartFile multipartFile:fileList) {
//
//                String serverFileName = CommonUtility.getUUIDString();
//                String serverFullFileName = "file-" + serverFileName;
//
//                HashMap<String, Object> fileInfo = new HashMap<String, Object>();
//
//                String originalFullName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "utf-8");
//                String originalFileName = originalFullName.substring(0, originalFullName.lastIndexOf(".")).toLowerCase();
//                String originalExtName = originalFullName.substring(originalFullName.lastIndexOf(".") + 1).toLowerCase();
//
//                // String convertFilePath = uploadFilePath + File.separator + serverFileName;    // 임시 작업 디렉토리
//                // 업로드 파일 경로
//                String targetFilePath = uploadFilePath + File.separator + serverFullFileName + "." + originalExtName;
//
//                CommonUtility.createFileDirectory(new File(uploadFilePath));
//                CommonUtility.createFileDirectory(new File(uploadFilePath + File.separator + serverFileName));
//
//                fileInfo.put("FILE_NM", serverFullFileName + "." + originalExtName);
//                fileInfo.put("FILE_PATH", targetFilePath);
//                fileInfo.put("UPLOAD_FILE_NM", originalFullName);
//                fileInfo.put("ORGINAL_FILE_NM", originalFullName);
//                fileInfo.put("FILE_TYPE", multipartFile.getContentType());
//                fileInfo.put("FILE_EXT", originalExtName);
//                fileInfo.put("FILE_SIZE", multipartFile.getSize());
//                fileInfo.put("ROWNUM", 1);
//
//                // 원본 파일 저장 처리
//                managerFileInformationInsert(fileInfo);
//                // 확장자에 따른 컬럼 정의
//                settingFileInfoColumn(fileInfo, multipartFile.getSize(), originalExtName);
//
//                // 파일 업로드 원본 파일
//                File originalFile = new File(targetFilePath);
//
//                // File convertFile = new File(convertFilePath + File.separator + serverFileName + "." + originalExtName);
//
//                multipartFile.transferTo(originalFile);   // 원본 파일 저장
//                // Files.copy(new File(originalFile.getAbsolutePath()).toPath(), new File(convertFile.getAbsolutePath()).toPath());
//                CadFileConverter.cadfile_converter(originalFile, serverFileName);    // convert 처리
//                // CadFileConverter.cadfile_converter(convertFile);    // convert 처리
//
//                File[] dxfFileList = new File(uploadFilePath + File.separator + serverFileName).listFiles();
//
//                int count = 2;
//
//                for (File convertToFile : dxfFileList) {
//                    String mimeType = Files.probeContentType(Paths.get(convertToFile.getAbsolutePath()));
//                    String convertFullName = new String(convertToFile.getName().getBytes("8859_1"), "utf-8");
//                    String convertExtName = convertFullName.substring(convertFullName.lastIndexOf(".") + 1).toLowerCase();
//
//                    if (CAD_CONVERT_TYPE.contains(convertExtName)) {
//                        fileInfo.put("FILE_PATH", convertToFile.getAbsolutePath());
//                        fileInfo.put("ORGINAL_FILE_NM", originalFileName + "." + convertExtName);
//                        fileInfo.put("FILE_TYPE", mimeType);
//                        fileInfo.put("FILE_EXT", convertExtName);
//                        fileInfo.put("FILE_SIZE", convertToFile.length());
//                        fileInfo.put("ROWNUM", count++);
//
//                        // 파일 저장 처리
//                        managerFileInformationInsert(fileInfo);
//                        // 확장자에 따른 컬럼 정의
//                        settingFileInfoColumn(fileInfo, convertToFile.length(), convertExtName);
//                    }
//                }
//
//                // 파일 명으로 주문 번호의 파일 번호가 있는지 확인하여 처리 한다.
//                fileInfo.put("queryId", "orderMapper.selectControlCadFiles");    // 연결 주문 정보 조회
//                List<Map<String, Object>> controlList = innodaleDao.getList(fileInfo);
//
//                // 파일 번호 정보가 있는 경우 Map에 파일 정보를 추가 한다.
//                Iterator controlIterator = controlList.iterator();
//                while (controlIterator.hasNext()) {
//                    HashMap<String, Object> map = (HashMap<String, Object>) controlIterator.next();
//                    resultList.add(map);
//                }
//            }
//        }
//        model.addAttribute("result",       "success");
//        model.addAttribute("message",      "업로드를 완료 하였습니다.");
//        model.addAttribute("fileUploadList", resultList);
//    }
}