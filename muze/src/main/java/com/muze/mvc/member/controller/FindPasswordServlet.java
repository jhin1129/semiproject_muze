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


@WebServlet("/member/find_password")
public class FindPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindPasswordServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/find_password.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		String loginId = request.getParameter("memberId");
		
		Member member = new MemberService().findPasswordById(loginId);
		
		if(member != null) {
			session = request.getSession();
			
			session.setAttribute("member", member);
			response.sendRedirect(request.getContextPath() + "/member/user_certification");
		} else {
			request.setAttribute("msg", "존재하지 않는 아이디입니다.");
			request.setAttribute("location", "/member/find_password");
			
			request.getRequestDispatcher("/views/member/msg.jsp").forward(request, response);
			
		}
	}
}
