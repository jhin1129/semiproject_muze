package com.muze.mvc.event.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.event.model.dao.EventDao;
import com.muze.mvc.event.model.service.EventService;
import com.muze.mvc.event.model.service.MileageService;
import com.muze.mvc.event.model.vo.Event;
import com.muze.mvc.event.model.vo.Mileage;
import com.muze.mvc.member.model.vo.Member;

@WebServlet("/event")
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EventServlet() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		List<Event> list = null;
		
		if(loginMember != null) {
			list = new EventService().getEventListByMemberNo(loginMember.getMemberNo());
		}
		
		System.out.println(list);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/event/eventpage.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		int insertresult = 0;
		boolean isAlreadyEvent = false;
		// 로그인 체크
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		// 로그인된 회원만 이용할 수 있음
		if (loginMember != null ) {
			isAlreadyEvent = new EventService().isAlreadyEvent(loginMember.getMemberNo());
			
			if(isAlreadyEvent == false) {
				new EventService().insertEvent(loginMember.getMemberNo());
				response.setContentType("application/json;charset=UTF-8");
				new Gson().toJson(isAlreadyEvent, response.getWriter());
				insertresult = new MileageService().insertATTMileage(loginMember.getMemberNo());

			} else {
				response.setContentType("application/json;charset=UTF-8");
				new Gson().toJson(isAlreadyEvent, response.getWriter());
			}
			
		}
			
		else {
			request.setAttribute("msg", "로그인 후 이용해주세요");
			request.setAttribute("location", "/member/login");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}


}


