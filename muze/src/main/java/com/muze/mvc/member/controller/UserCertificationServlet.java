package com.muze.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Member;


@WebServlet("/member/user_certification")
public class UserCertificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SendFindEmailServlet sendEmail = new SendFindEmailServlet();
 
    public UserCertificationServlet() {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/user_certification.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberEmail = request.getParameter("authTypeEmail");
		
		Member member = new MemberService().findPassword(memberEmail);
		
		if (member != null) {
			// 비밀번호 보내주기
			member = sendEmail.sendEmailPassword(member);
			
			request.getSession().setAttribute("msg", "이메일로 임시비밀번호가 발급되었습니다.");
			request.setAttribute("location", "/member/user_certification_confirm");
			
	
		} else {
			request.getSession().setAttribute("msg", "비밀번호 찾기에 실패하였습니다.");
			request.setAttribute("location", "/member/user_certification");
			
		};
		request.getRequestDispatcher("/views/member/msg.jsp").forward(request, response);
	}

}
