package com.framework.innodale.service.impl;

import com.framework.innodale.component.MailSenderAgent;
import com.framework.innodale.dao.InnodaleDao;
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class MailSenderService {

    protected final Log log = LogFactory.getLog(getClass());

    @Autowired
    public InnodaleDao innodaleDao;

    @Autowired
    MailSenderAgent mailSenderAgent;

    //	@Async
//	@Scheduled(fixedRate=60000)  // 30 secound,	1000 = 1sec
    public void updateEmailSend(){

        log.info("updateEmailSend start");

        HashMap<String, String> hashMap = new HashMap<String, String>();

        try{

//            if(AjaxUtil.isScheduleRunning()) {
//
//                // Demon Key 생성, 자동화 발신 이메일 정보만 UPDATE 한다.
//                hashMap.put("SKEY", VelocityUtil.getUUIDString("mail"));
//
//                // 발송일이 현재 시간보다 적은것은 모두 처리 한다.
//                innodaleDao.sampleMaterialUpdateKey(session, "mail", "setSendEmailSessionKey", hashMap);
//
//                ArrayList<HashMap<String, String>> sendMailData = innodaleDao.commonSelectList(session, "mail.selectSendMailList", hashMap);
//
//                if(sendMailData.size() > 0){
//                    log.info("update automaticMessage count=[" + sendMailData.size() + "]");
//                }
//
//                if(sendMailData != null && sendMailData.size() > 0){
//                    for(HashMap<String, String> mailInfo : sendMailData){
//                        updateEmailSendConditsion(session, mailInfo, hashMap);
//                        // 2 second Next Mail Send
//                        Thread.sleep(2000);
//                    }
//                    // 5 second Next Mail Group 조회
//                    Thread.sleep(5000);
//                }
//            }
        } catch(Exception e) {
            log.error("Exception in Service: " + e.toString());
        }
    }

    /**
     * 메일 발송을 처리하고 처리한 상태를 저장한다.
     * @param mailInfo
     * @param bean
     */
    private void updateEmailSendConditsion(SqlSession session, HashMap<String, String> mailInfo, HashMap<String, String> bean){

        try{

            // 실시간 발송은 사용자수신 상태와 상관없이 메일을 무조건 발송한다.
            mailInfo.put("STATUS", "EMSTS999");
            mailSenderAgent.sendEmail(mailInfo);

            String mailType = (String)mailInfo.get("MAIL_TYPE");
            /* 메일 발송 오류로 실제 메일 발송 이후에 메일 발송 일자를 셋팅한다. */
            /* MAIL TYPE
             * 01 : 일반메일(NORMAL, EXTRA, ADD)
             * 02 : 취소메일(CANCEL)
             */
            if(mailType != null && ("01".equals(mailType) || "02".equals(mailType)) ){
                // innodaleDao.sampleMaterialUpdateKey(session, "mail", "updatePOSendemailCondi", mailInfo);
            }


        } catch(Exception exception){
            log.error(exception.getMessage(), exception.getCause());
            mailInfo.put("STATUS", "EMSTS010");
            mailInfo.put("ERROR_NOTE", exception.getMessage());
        }finally{
            try{
                // 메일 전송 완료 처리 (성공, 실패, 실패내용, 오류 코드로 처리 한다.)
                mailInfo.put("SKEY", bean.get("SKEY"));
                //innodaleDao.sampleMaterialUpdateKey(session, "mail", "updateEmailCondi", mailInfo);

            }catch(Exception exception){
                exception.printStackTrace();
                log.error(exception.getMessage(), exception.getCause());
            }
        }
    }

}
