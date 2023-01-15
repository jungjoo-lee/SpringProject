package com.spring.project.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {   
	@Autowired
	private JavaMailSender mailSender;
    
    @Async
    public void sendAuthMail(String to, String subject, String body)  throws MessagingException{
        MimeMessage mailMessage = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage, true, "UTF-8");
		
		messageHelper.setFrom("briniclel@gamil.com");
		messageHelper.setTo(to);
		messageHelper.setSubject(subject);
		messageHelper.setText(body, true);
		
		mailSender.send(mailMessage);
    }
    
    public String makeRandomNumber() {
		Random r = new Random();
		
		return String.valueOf(r.nextInt(888888) + 111111);
	}
}