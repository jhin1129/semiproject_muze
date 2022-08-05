package com.muze.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Member;


@WebServlet(name="KakaoLoginServlet", urlPatterns="/member/kakaoLogin")
public class kakaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public kakaoLoginServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("kakaoId");
		String token = request.getParameter("token");
		
		// 테스트
		System.out.println(userId + "/" + userName + "/" + userPwd);
		
		HttpSession session = request.getSession();
		
		// 카카오 계정으로 이미 가입된 회원이 있는지 조회
		Member member = new MemberService().loginMember(userId);
		
		
		// 가입된 정보 없으면 가입시켜주기
		if( member == null ) {
			
			Member joinMember = new Member();
			joinMember.setMemberId(userId);
			joinMember.setMemberName(userName);
			joinMember.setMemberPhonenumber("정보없음");
			
			//카카오계정 고유ID를 암호화해서 비밀번호로 생성
//			String salt = SHA256Util.generateSalt();
//	        String newPassword = SHA256Util.getEncrypt(userPwd, salt);
	        joinMember.setMemberPassword(userPwd);
			
			//카카오 자동 회원가입 로직 실행
			int kakaoJoin = new MemberService().kakaoJoin(joinMember, userId);
			
			// 카카오 자동가입 성공 후 세션에 저장하고 비동기식 전송
			if(kakaoJoin > 0) {
				Member kakaoLoginUser = new MemberService().loginMember(userId);
				
				session.setAttribute("loginMember", kakaoLoginUser);
				session.setAttribute("token", token);
				response.sendRedirect(request.getContextPath() + "/");
			}else {
				request.setAttribute("msg", "카카오 회원 가입 실패.");
				
				request.getRequestDispatcher("/views/member/msg.jsp").forward(request, response);
			}
			
		}else {
			session.setAttribute("loginMember", member);
			session.setAttribute("token", token);
			
			response.sendRedirect(request.getContextPath() + "/");
		}
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
