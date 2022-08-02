package com.muze.mvc.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

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

import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.member.util.MvcUtils;

public class SendFindEmailServlet {
	
	String fromEmail = "muze.com";
    String fromUsername = "muze";
	
	final String username = "projectmuze.kh@gmail.com";
	final String password = "mcpoyysclevxdpkf";
	
	MemberService memberService = new MemberService();
	
	private static final long serialVersionUID = 1L;
	int result = 0;
	
	public Member sendEmailPassword(Member member) {
		String id = member.getMemberId();
		String email = member.getMemberEmail();
		
		// 랜덤값 부여
		String randomString = MvcUtils.randomAlphaWord(8);
		
		// db에 저장
			Map<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("randomString", randomString);
			int result = 0;
			result = memberService.insertCertification(map);
			if (result > 0) {
				System.out.println("인증코드 테이블 저장 성공");
			} else {
				System.out.println("인증코드 테이블 저장 실패");
			}
		
		// 메일용 api
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
			message.setSubject("[muze] 임시 비밀번호 전송 메일입니다!","utf-8");//제목
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
							"        <h2 style='text-align:center;'>\r\n" + 
							"          안녕하세요! "
									+  id + "님, No1.미술품 거래 플랫폼 <u style=\"font-size: 30px; margin-top: 0;\">muze</u>입니다!\r\n" + 
							"        </h2>\r\n" + 
							"        <div style=\"margin-bottom: 10px\">\r\n" + 
							"          <div></div>\r\n" + 
							"          <div style=\"margin-bottom: 5px\">muze에 돌아오신걸 환영합니다.</div>\r\n" + 
							"          <div style=\"margin-bottom: 5px\">\r\n" + 
							"            임시 비밀번호는 아래와 같습니다.\r\n" + 
							"          </div>\r\n" + 
							"          <div style=\"margin-bottom: 5px; font-size: 20px; font-weight: bold\">\r\n" + 
							"            [" + randomString + "]\r\n" + 
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
			Transport.send(message);
			System.out.println("SEND");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return member;
	}

	public Member sendEmailId(Member member) {
		String id = member.getMemberId();
		String email = member.getMemberEmail();

		// 메일용 api
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
			message.setSubject("[muze] 아이디 찾기 메일입니다.","utf-8");// 제목
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
							"        <img\r\n" + // src=\"로고 이미지" + 
							"          style=\"width: 120px; height: 50px\"\r\n" + 
							"        />\r\n" + 
							"        <h2 style=\"text-align: center\">\r\n" + 
							"          안녕하세요! No1.미술품 거래 플랫폼\r\n" + 
							"          <u style=\"font-size: 30px; margin-top: 0\">muze</u>입니다!\r\n" + 
							"        </h2>\r\n" + 
							"        <div style=\"margin-bottom: 10px\">\r\n" + 
							"          <div></div>\r\n" + 
							"          <div style=\"margin-bottom: 5px\">muze에 돌아오신걸 환영합니다.</div>\r\n" + 
							"          <div style=\"margin-bottom: 5px\">\r\n" + 
							"            아이디를 깜박하셨다고 도움을 요청하셨군요!\r\n" + 
							"          </div>\r\n" + 
							"          <div style=\"margin-bottom: 5px\">\r\n" + 
							"            회원님께서 사용중이신 아이디는 아래와 같습니다.\r\n" + 
							"          </div>\r\n" + 
							"          <div style=\"margin-bottom: 5px; font-size: 20px; font-weight: bold\">\r\n" + 
							"            ["
							+ 			id
							+ 			"]\r\n" + 
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
			Transport.send(message);
			System.out.println("SEND");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	private BodyPart getContents(String html) throws MessagingException {
		BodyPart mbp = new MimeBodyPart();
		// setText를 이용할 경우 일반 텍스트 내용으로 설정된다.

		// html 형식으로 설정
		mbp.setContent(html, "text/html; charset=utf-8");
		return mbp;
	}
}