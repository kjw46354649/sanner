package com.framework.innodale.service.impl;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.component.MailSenderAgent;
import com.framework.innodale.dao.InnodaleDao;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MailSenderService {

    protected final Log log = LogFactory.getLog(getClass());

    @Autowired
    public InnodaleDao innodaleDao;

    @Autowired
    MailSenderAgent mailSenderAgent;

   	@Async
//	@Scheduled(fixedRate=30000)  // 30 secound,	1000 = 1sec
    public void manageMailSenderActionService(){

        log.info("manageMailSenderActionService start");

        HashMap<String, Object> hashMap = new HashMap<String, Object>();

        try{

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

            if(sendMailData != null && sendMailData.size() > 0){
                for(Map<String, Object> mailInfo : sendMailData){

                    // 첨부 파일이 있을 경우 처리
                    if(mailInfo.containsValue("GFILE_SEQ") && mailInfo.get("GFILE_SEQ") != null){
                        mailInfo.put("queryId", "common.selectGfileFileList");
                        mailInfo.put("attachFileList", innodaleDao.getList(mailInfo));
                    }

                    updateEmailSendConditsion(mailInfo, hashMap);
                    // 2 second Next Mail Send
                    Thread.sleep(2000);
                }
                // 5 second Next Mail Group 조회
                Thread.sleep(5000);
            }
        } catch(Exception e) {
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

}
