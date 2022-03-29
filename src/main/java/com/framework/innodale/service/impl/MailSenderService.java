package com.framework.innodale.service.impl;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.component.MailSenderAgent;
import com.framework.innodale.dao.InnodaleDao;
import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Service
public class MailSenderService {

    protected final Log log = LogFactory.getLog(getClass());

    @Autowired
    public InnodaleDao innodaleDao;

    @Autowired
    MailSenderAgent mailSenderAgent;

    @Autowired
    private Environment environment;

    /** 비동기 방식으로 20초 간격을 두고서 실행 처리 **/
   	// @Async
	@Scheduled(fixedRate=120000)  // 30 secound,	1000 = 1sec
    public void manageMailSenderActionService(){

        log.info("manageMailSenderActionService start");

        HashMap<String, Object> hashMap = new HashMap<String, Object>();

        try{
            String dbUrl = environment.getRequiredProperty("base.jdbc.url");
            // 운영 서버인 경우만 메일 발송 처리 된다.
            if(CommonUtility.isScheduleRunning() && dbUrl.indexOf("106.240.243.250") >= 0){

                // Demon Key 생성, 자동화 발신 이메일 정보만 UPDATE 한다.
                hashMap.put("SKEY", CommonUtility.getUUIDString("mail"));

                // 발송일이 현재 시간보다 적은것은 모두 처리 한다.
                hashMap.put("queryId", "mail.setSendEmailSessionKey");
                innodaleDao.update(hashMap);

                hashMap.put("queryId", "mail.selectSendMailList");
                List<Map<String, Object>> sendMailData = innodaleDao.getList(hashMap);

                if(sendMailData.size() > 0){
                    log.info("update automaticMessage count=[" + sendMailData.size() + "]");
                }

                if(sendMailData != null && sendMailData.size() > 0) {
                    for (Map<String, Object> mailInfo : sendMailData) {
                        // 첨부 파일이 있을 경우 처리
                        if (mailInfo.get("GFILE_SEQ") != null) {
                            mailInfo.put("queryId", "common.selectGfileFileListInfo");
                            List<Map<String, Object>> mailAttachFiles = innodaleDao.getList(mailInfo);
                            if (mailAttachFiles.size() > 0) {
                                Map<String, Object> fileInfo = mailAttachFiles.get(0);
                                int fileTotalSize = Integer.parseInt(String.valueOf(fileInfo.get("TOTAL_FILE_SIZE")));
                                if (fileTotalSize > 30){    // 30M byte 이상인 경우 압축 처리하고 그 이하 인 경우는 그대로 발송한다.
                                    // 0. 디렉토리 및 임시 정자 파일명을 저장한다.
                                    List<Map<String, Object>> newZipAttachFile = new ArrayList<Map<String, Object>>();
                                    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", new Locale("ko", "KR"));
                                    String zipDirectoryPath = environment.getRequiredProperty(CommonUtility.getServerType() + ".base.upload.zip.path") + File.separator + formatter.format(new Date()).substring(0, 8);
                                    String zipDirectoryTempPath = zipDirectoryPath + File.separator + formatter.format(new Date());
                                    String targetFileName = CommonUtility.getUUIDString("key");
                                    String targetFileFullPath = zipDirectoryPath + File.separator + targetFileName + ".zip";
                                    // 1. 압축 파일 저장 경로를 생성한다.
                                    CommonUtility.createFileDirectory(new File(zipDirectoryTempPath));
                                    // 2. 각각의 압축 파일을 zip 폴더에 복사 한다.
                                    for(Map<String, Object> files : mailAttachFiles){
                                        String sSourcePath = (String)files.get("FILE_PATH");
                                        String sTargetPath = zipDirectoryTempPath + File.separatorChar + (String)files.get("ORGINAL_FILE_NM");
                                        CommonUtility.copyTransferFile(new File(sSourcePath), new File(sTargetPath));
                                    }
                                    // 3. 압축 처리 한다.
                                    String serverFileName = CommonUtility.getUUIDString("key");
                                    File compressFile = new File(zipDirectoryPath + File.separatorChar + serverFileName + ".zip");
                                    compressZipfile(zipDirectoryTempPath, new FileOutputStream(compressFile));

                                    // 4. 임시 파일을 삭제 처리 한다.
                                    CommonUtility.deleteFolder(zipDirectoryTempPath);

                                    Map<String, Object> bean = new HashMap<String, Object>();

                                    fileInfo.put("FILE_NM", serverFileName + ".zip");
                                    fileInfo.put("TIME_PATH", fileInfo.get("GFILE_SEQ"));
                                    fileInfo.put("FILE_PATH", compressFile.getAbsolutePath());
                                    fileInfo.put("ORGINAL_FILE_NM", mailInfo.get("TITLE") + ".zip");
                                    fileInfo.put("FILE_TYPE", "application/zip");
                                    fileInfo.put("FILE_EXT", "zip");
                                    fileInfo.put("FILE_SIZE", compressFile.length());

                                    fileInfo.put("GFILE_SEQ", "");// GFILE 신규 등록
                                    fileInfo.put("queryId", "common.insertFileGroup");
                                    innodaleDao.update(fileInfo);

                                    fileInfo.put("queryId", "common.insertFile");    // 신규 파일 등록
                                    innodaleDao.create(fileInfo);

                                    // 압축 메일 발송 첨부 파일에 포함 한다.
                                    newZipAttachFile.add(fileInfo);
                                    mailInfo.put("attachFileList", newZipAttachFile);

                                }else{
                                    mailInfo.put("attachFileList", innodaleDao.getList(mailInfo));
                                }
                            }
                        }
                        updateEmailSendConditsion(mailInfo, hashMap);
                        // 2 second Next Mail Send
                        Thread.sleep(2000);
                    }
                    // 5 second Next Mail Group 조회
                    Thread.sleep(5000);
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
            log.error("Exception in manageMailSenderActionService Service: " + e.toString());
        }
    }

    /**
     * 메일 발송을 처리하고 처리한 상태를 저장한다.
     * @param mailInfo
     * @param bean
     */
    private void updateEmailSendConditsion(Map<String, Object> mailInfo, HashMap<String, Object> bean){

        try{

            // 실시간 발송은 사용자수신 상태와 상관없이 메일을 무조건 발송한다.
            mailInfo.put("STATUS", "EMSTS999");
            mailSenderAgent.sendEmail(mailInfo);

        } catch(Exception exception){
            exception.printStackTrace();
            log.error(exception.getMessage(), exception.getCause());
            mailInfo.put("STATUS", "EMSTS010");
            mailInfo.put("ERROR_NOTE", exception.getMessage());
        }finally{
            try{
                // 메일 전송 완료 처리 (성공, 실패, 실패내용, 오류 코드로 처리 한다.)
                mailInfo.put("SKEY",    bean.get("SKEY"));
                mailInfo.put("queryId", "mail.updateEmailCondi");
                innodaleDao.update(mailInfo);

            }catch(Exception exception){
                exception.printStackTrace();
                log.error(exception.getMessage(), exception.getCause());
            }
        }
    }

    private void compressZipfile(String sourceDir, OutputStream os) throws IOException {
        ZipOutputStream zos = null;
        try{
            zos = new ZipOutputStream(os);
            compressDirectoryToZipfile(sourceDir, sourceDir, zos);
            IOUtils.closeQuietly(zos);
        }catch(IOException ioException){
            IOUtils.closeQuietly(zos);
            throw ioException;
        }
    }

    /**
     * 압축 파일 생성
     * @param rootDir
     * @param sourceDir
     * @param out
     * @throws IOException
     * @throws FileNotFoundException
     */
    private void compressDirectoryToZipfile(String rootDir, String sourceDir, ZipOutputStream out) throws IOException, FileNotFoundException {

        FileInputStream in = null;

        try{

            File[] fileList = new File(sourceDir).listFiles();
            if (fileList.length == 0) { // empty directory / empty folder
                ZipEntry entry = new ZipEntry(sourceDir.replace(rootDir, "") + "/");
                out.putNextEntry(entry);
                out.closeEntry();
            } else {
                for (File file : fileList) {
                    if (file.isDirectory()) {
                        compressDirectoryToZipfile(rootDir, sourceDir + File.separator + file.getName(), out);
                    } else {
                        ZipEntry entry = new ZipEntry(sourceDir.replace(rootDir, "") + File.separator + file.getName());
                        out.putNextEntry(entry);

                        in = new FileInputStream(sourceDir + File.separator + file.getName());
                        IOUtils.copy(in, out);
                        IOUtils.closeQuietly(in);
                    }
                }
            }
        }catch(IOException ioException){
            IOUtils.closeQuietly(in);
            IOUtils.closeQuietly(out);
            throw ioException;
        }
    }

}
