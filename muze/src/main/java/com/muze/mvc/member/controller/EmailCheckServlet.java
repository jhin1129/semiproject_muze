package com.muze.mvc.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.member.model.service.MemberService;


@WebServlet("/member/emailCheck")
public class EmailCheckServlet extends HttpServlet {
	
	String fromEmail = "muze.com";
    String fromUsername = "muze";
	
	final String username = "projectmuze.kh@gmail.com";
	final String password = "mcpoyysclevxdpkf";
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
    
    public EmailCheckServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String email = request.getParameter("email");
    	
    	response.setContentType("application/json;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	//이메일 중복검사
    	int result = 0;
    	
    	result = memberService.selectEmail(email);
    	
    	if(result > 0) {
    		out.print("overlap");
    		
    		return;
    	}
    	
    	// 2. 업무로직 이메일 보내기(랜덤값 만들기)
		
    	// 5자리 랜덤번호 생성
    	int randomNumber = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
    	
    	Properties props = new Properties();
		
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.debug", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.EnableSSL.enable", "true");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail, fromUsername)); // 보낸 사람
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));//받는사람이메일 입력받는곳
			message.setSubject("[muze] 이메일 인증번호입니다.","utf-8");//제목
			message.setContent(new MimeMultipart());
			Multipart mp = (Multipart) message.getContent();
			mp.addBodyPart(
					getContents("<!DOCTYPE html>\r\n" + 
							"<html lang=\"ko\">\r\n" + 
							"  <head> </head>\r\n" + 
							"  <body>\r\n" + 
							"    <div\r\n" + 
							"      style=\"\r\n" + 
							"        margin: 0;\r\n" + 
							"        padding: 0;\r\n" + 
							"        padding-top: 100px;\r\n" + 
							"        padding-bottom: 100px;\r\n" + 
							"      \"\r\n" + 
							"    >\r\n" + 
							"      <div\r\n" + 
							"        style=\"\r\n" + 
							"          width: 600px;\r\n" + 
							"          height: 300px;\r\n" + 
							"          background: white;\r\n" + 
							"          margin: 0 auto;\r\n" + 
							"          padding: 30px;\r\n" + 
							"          font-size: 16px;\r\n" + 
							"        \"\r\n" + 
							"      >\r\n" + 
							"        <img\r\n" + // 로고 이미지 삽입
							"          style=\"width: 120px; height: 50px\"\r\n" + 
							"        />\r\n" + 
							"        <h2 style=\"text-align: center\">\r\n" + 
							"          안녕하세요! No1.미술품 거래 플랫폼\r\n" + 
							"          <u style=\"font-size: 30px; margin-top: 0\">muze</u>입니다!\r\n" + 
							"        </h2>\r\n" + 
							"        <div style=\"margin-bottom: 10px\">\r\n" + 
							"          <div></div>\r\n" + 
							"          <div style=\"margin-bottom: 5px\">\r\n" + 
							"            저희 muze과 함께 해주셔서 감사합니다~!\r\n" + 
							"          </div>\r\n" + 
							"          <div style=\"margin-bottom: 5px\">\r\n" + 
							"            회원가입 인증 코드는 아래와 같습니다.\r\n" + 
							"          </div>\r\n" + 
							"          <div style=\"margin-bottom: 5px; font-size: 20px; font-weight: bold\">\r\n" + 
							"            ["+randomNumber
							+ "]\r\n" + 
							"          </div>\r\n" + 
							"          <div style=\"margin-top: 30px; text-align: center\">\r\n" + 
							"            * 본 메일은 발신전용 메일입니다. *\r\n" + 
							"          </div>\r\n" + 
							"        </div>\r\n" + 
							"      </div>\r\n" + 
							"    </div>\r\n" + 
							"  </body>\r\n" + 
							"</html>\r\n" + 
							""));
			System.out.println("send!!!");
			
			MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
		      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
		      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
		      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
		      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
		      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
		      CommandMap.setDefaultCommandMap(MailcapCmdMap);
		
			Transport.send(message);
			System.out.println("SEND");

		} catch (Exception e) {
			e.printStackTrace();
		}

		//3. 응답처리
		//이메일보낸 random data 전달하기
		out.print(randomNumber);
	}
	
	private BodyPart getContents(String html) throws MessagingException {
		BodyPart mbp = new MimeBodyPart();
		// setText를 이용할 경우 일반 텍스트 내용으로 설정된다.
//		 mbp.setText(html);
		// html 형식으로 설정
		mbp.setContent(html, "text/html; charset=utf-8");
		return mbp;
	
	}

}
