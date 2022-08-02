package com.muze.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Member;

@WebServlet("/member/find_id")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SendFindEmailServlet sendEmail = new SendFindEmailServlet();

    public FindIdServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/find_id.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberName = request.getParameter("userName");
		String memberEmail = request.getParameter("userEmail");
		
		Member member = new MemberService().findId(memberName, memberEmail);
		
		
		if (member != null) {
			// 아이디 보내주기
			member = sendEmail.sendEmailId(member);
			
			request.getSession().setAttribute("msg", "아이디가 이메일로 발송되었습니다.");
			request.setAttribute("location", "/");
		} else {
			request.getSession().setAttribute("msg", "존재하지 않는 아이디입니다.");
			request.setAttribute("location", "/member/find_id");
		}
		request.getRequestDispatcher("/views/member/msg.jsp").forward(request, response);
	}

}