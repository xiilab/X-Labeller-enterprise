package com.xlabeller.common.module;

import com.xlabeller.models.EmailVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.internet.MimeMessage;

@Component
public class EmailSender {
	@Autowired
	protected JavaMailSender  mailSender;
	
	public void SendEmail(EmailVO email) throws Exception {
	    MimeMessage mime = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(mime, true);
	    helper.setFrom(email.getFrom());
	    helper.setTo(email.getTo());
	    helper.setSubject(email.getSubject());
	    helper.setText(email.getContent(),true);
	    
	    if(email.getCcs() != null && email.getCcs().length > 0){
	    	helper.setCc(email.getCcs());
	    }
	    mailSender.send(mime);
	    
	     
		 
	}

    
}