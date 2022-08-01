package com.muze.mvc.event.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.muze.mvc.event.model.service.EventService;
import com.muze.mvc.event.model.vo.Event;
import com.muze.mvc.member.model.vo.Member;


@WebServlet("/event/view")
public class EventViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EventViewServlet() {
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		List<Event> list = null;
		if(loginMember != null) {
			list = new EventService().getEventListByMemberNo(loginMember.getMemberNo());
		}
		
		System.out.println(list);
		request.getRequestDispatcher("/views/event/eventpage8.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
				
		Member member = new Member();
		member.setMemberNo(loginMember.getMemberNo());			
		request.setAttribute("member", member);
		

//		Event event = new Event();
//		event.setMemberNo(loginMember.getMemberNo());
	
		List<Event> list = null;
		
		list = new EventService().getAttendCheck(member);
		
		System.out.println(list);
			
//		request.getRequestDispatcher("/views/event/eventpage8.jsp").forward(request, response);
	
//		response.setCharacterEncoding("utf-8");
//	    response.setContentType("application/json");
	
//      JsonObject obj = new JsonObject();        
//		obj.addProperty("title", "출석 정보");        
//		obj.addProperty("date", "22-07-31"); 

//		Member member = new Member();
//		member.setMemberNo(loginMember.getMemberNo());	

//		int result;

//		result = new EventService().getAttendCheck(member);
	}
}

