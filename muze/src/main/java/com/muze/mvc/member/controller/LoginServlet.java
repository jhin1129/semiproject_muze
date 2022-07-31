package com.muze.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Member;

@WebServlet(name = "login", urlPatterns = "/member/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/login.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String saveId = request.getParameter("saveId");
		
		System.out.println(memId + memPw);
		
		Member loginMember = new MemberService().login(memId, memPw);
		
		if(loginMember != null) {
			session = request.getSession();
			
			if (saveId != null) {
				Cookie cookie = new Cookie("saveId", memId);
				
				cookie.setMaxAge(259200); // 3일 동안 유지
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("saveId", "");
				
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			session.setAttribute("loginMember", loginMember);
			response.sendRedirect(request.getContextPath() + "/");
		} else {
			request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			request.setAttribute("location", "/member/login");
			
			request.getRequestDispatcher("/views/member/msg.jsp").forward(request, response);
			
		}
		
	}
}
