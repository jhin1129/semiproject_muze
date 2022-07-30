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


@WebServlet("/member/user_certification_confirm")
public class CertificationConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CertificationConfirmServlet() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/user_certification_confirm.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		String passwordCheck = request.getParameter("inputCertify");
		
		Member member = new MemberService().checkPassword(passwordCheck);
		
		
		if(member != null) {			
			session = request.getSession();
			
			session.setAttribute("member", member);
			response.sendRedirect(request.getContextPath() + "/member/find_password_reset");
		} else {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("location", "/member/user_certification_confirm");
			
			request.getRequestDispatcher("/views/member/msg.jsp").forward(request, response);
		}
	}
}
