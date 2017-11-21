package email;


import java.io.UnsupportedEncodingException;
import static java.lang.Math.random;
import static java.lang.StrictMath.random;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Email {

    public static boolean send(String to, String subject,String content,String user) {
        boolean h=true;
String username="s.p.airplane@gmail.com";
String password="AIRPLANEMAN";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("s.p.airplane@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText("Dear User,\n"+content+"\n\n-----------------------------------------------------------\n\nYours Sincerely,\nAdmin : "+user+"\nSP AIRLINES\nServing You One By One\n");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            System.out.println(e);
            h=false;
        }
        return h;
    }
    
}

