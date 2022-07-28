package com.muze.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.member.vo.Member;

@WebServlet(name = "joinMethod", urlPatterns = "/member/join_method")
public class JoinMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinMethodServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/join_method.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Member member = new Member();
    	
    	member.setMember_id(request.getParameter("userId"));
    	member.setMember_password(request.getParameter("userPwd"));
    	member.setMember_name(request.getParameter("userName"));
    	member.setMember_phone_number(request.getParameter("phone"));
    	member.setMember_email(request.getParameter("email"));
    	member.setMember_address(request.getParameter("address"));
	}

}
