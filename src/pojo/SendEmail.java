package pojo;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
public String sendEmail(String to) {
		
		String message=  Double.toString(Math.random()).substring(2, 8);
		String from = "studying.purpose0@gmail.com"; 
		String subject="verification code";
		
		//host properties
		String host="smtp.gmail.com";
		Properties properties=System.getProperties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");
		
		//session object
		Session session=Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication("studying.purpose0@gmail.com", "gig_economy");
			}
		});
		session.setDebug(true);
		
		//compose message
		MimeMessage mimeMessage = new MimeMessage(session);
		try {
			mimeMessage.setFrom(from);
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(message); 
			
			Transport.send(mimeMessage);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return message;
		
	}  
}
