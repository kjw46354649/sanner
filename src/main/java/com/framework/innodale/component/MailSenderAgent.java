package com.framework.innodale.component;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

@Component("mailSenderAgent")
public class MailSenderAgent {

    @Autowired
    private Environment environment;

    @Autowired
    public JavaMailSender javaMailSender;

    private static Logger logger = Logger.getLogger(MailSenderAgent.class);

    /**
     * 메일 전송 부분
     */
    public void sendEmail(final HashMap<String, String> mailInfo) throws AddressException, AuthenticationFailedException, MessagingException, UnsupportedEncodingException {

        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws MessagingException, UnsupportedEncodingException {

                MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");

                message.setReplyTo(new InternetAddress((String)mailInfo.get("SEND_EMAIL")));
                message.setFrom((String)mailInfo.get("SEND_EMAIL"), (String)mailInfo.get("SEND_NAME"));

                String setToEmail [] = mailInfo.get("RECV_EMAIL").split(",");
                message.setTo(setToEmail);

                if(mailInfo.containsKey("HCC_EMAIL") && !"".equals(mailInfo.get("HCC_EMAIL"))){
                    // 숨은 참조
                    message.setBcc(new InternetAddress((String)mailInfo.get("HCC_EMAIL")));
                }
                if(mailInfo.containsKey("CC_EMAIL") && !"".equals(mailInfo.get("CC_EMAIL"))){
                    // 참조
                    //message.setCc(new InternetAddress((String)mailInfo.get("CC_EMAIL")));
                    String cc [] = mailInfo.get("CC_EMAIL").split(",");
                    message.setCc(cc);
                }

                message.setBcc(new InternetAddress("yesplus@sedovina.com"));

                message.setSubject((String)mailInfo.get("TITLE"));
                message.setText((String)mailInfo.get("CONTEXT"), true);

                if(mailInfo.containsKey("FILE_SEQ") && !"".equals(mailInfo.get("FILE_SEQ"))) {
                    String file = root+mailInfo.get("FILE_PATH")+ File.separator +mailInfo.get("FILE_NM");
                    FileSystemResource fsr = new FileSystemResource(file);
                    message.addAttachment(mailInfo.get("ORIGINAL_FILE_NM"), fsr);
                }

            };
        };

        javaMailSender.send(preparator);

        logger.debug("Send Email Success!");
    }


//    private JavaMailSender javaMailSender(String email, String password) {
//        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//
//        Properties mailProperties = new Properties();
//        mailProperties.put("mail.smtp.auth", smtpAuth);
//        mailProperties.put("mail.smtp.starttls.enable", smtpSsl);
////	    mailProperties.put("mail.smtp.starttls.required", startlls_required);
//        mailProperties.put("mail.smtp.socketFactory.port", smtpPort);
//        mailProperties.put("mail.smtp.debug", true);
//        mailProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        mailProperties.put("mail.smtp.socketFactory.fallback", true);
//
//        mailSender.setJavaMailProperties(mailProperties);
//        mailSender.setHost(smtpHost);
//        mailSender.setPort(Integer.parseInt(smtpPort));
//        mailSender.setProtocol(smtpProtocol);
//        mailSender.setUsername(email);
//        mailSender.setPassword(password);
//
//        return mailSender;
//    }
}
