package com.catapp.action;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	
	public static Boolean sendEmail() {  
		final String senderEmail= "rusynLab@gmail.com";
		final String password = "rusynLab123#";
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.authentication", "plain");
		
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(senderEmail, password);
			}
		});
		
	
	try{
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress("liuduan8@gmail.com"));
		message.setRecipients(MimeMessage.RecipientType.TO,InternetAddress.parse("liuduan8@gmail.com"));
		message.setSubject("catappdata.com new user");
		message.setText("catappdata.com new user");
		
		Transport.send(message);
		
		System.out.println("Done");

	} catch(MessagingException e){
		throw new RuntimeException(e);
	}
	return null;
	
	}
	public static void main (String [] args){
		sendEmail();
	}
}
