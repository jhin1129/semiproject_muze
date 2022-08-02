package com.muze.mvc.event.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.event.model.service.EventService;
import com.muze.mvc.event.model.service.MileageService;
import com.muze.mvc.member.model.vo.Member;

@WebServlet("/MileageServlet")
public class MileageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MileageServlet() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		new MileageService().insertMileage(loginMember.getMemberNo());
	}
}
