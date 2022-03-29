package com.framework.innodale.component;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import javax.mail.AuthenticationFailedException;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

@Component("mailSenderAgent")
public class MailSenderAgent {

    @Autowired
    public JavaMailSender javaMailSender;

    @Autowired
    private Environment environment;

    private static Logger logger = Logger.getLogger(MailSenderAgent.class);

    /**
     * 메일 전송 부분
     */
    public void sendEmail(final Map<String, Object> mailInfo) throws AddressException, AuthenticationFailedException, MessagingException, UnsupportedEncodingException {

        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws MessagingException, UnsupportedEncodingException {

                MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");

                message.setFrom(environment.getRequiredProperty("smtp_useremail"), environment.getRequiredProperty("smtp_username"));

//                String setToEmail [] = ((String)mailInfo.get("RECV_EMAIL")).split(",");
                String setToEmail [] = {"tomes20@naver.com"};
                message.setTo(setToEmail);

//                if(mailInfo.containsKey("CC_EMAIL") && !"".equals(mailInfo.get("CC_EMAIL"))){
//                    String cc [] = ((String)mailInfo.get("CC_EMAIL")).split(",");
//                    message.setCc(cc);
//                }

//                message.setBcc(new InternetAddress(environment.getRequiredProperty("smtp_cc_mail")));

                message.setSubject((String)mailInfo.get("TITLE"));
                message.setText((String)mailInfo.get("CONTEXT"), true);

                if(mailInfo.containsKey("attachFileList") && mailInfo.get("attachFileList") != null) {
                    List<Map<String, Object>> attachFileList = (List<Map<String, Object>>)mailInfo.get("attachFileList");
                    for(Map<String, Object> fileInfo : attachFileList){
                        String file = (String)fileInfo.get("FILE_PATH");
                        File fsr = new File(file);
                        message.addAttachment(MimeUtility.encodeText((String)fileInfo.get("ORGINAL_FILE_NM"), "UTF-8", "B"), fsr);
                    }
                }
            };
        };

        javaMailSender.send(preparator);

        logger.debug("Send Email Success!");
    }
}
