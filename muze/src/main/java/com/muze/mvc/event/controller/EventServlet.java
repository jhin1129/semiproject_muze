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
import com.muze.mvc.event.model.dao.EventDao;
import com.muze.mvc.event.model.service.EventService;
import com.muze.mvc.event.model.vo.Event;
import com.muze.mvc.member.model.vo.Member;





@WebServlet("/event")
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EventServlet() {
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/event/eventpage8.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 체크
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		// 로그인된 회원만 이용할 수 있음
		if (loginMember != null ) {
			
			Member member = new Member();
			member.setMemberNo(loginMember.getMemberNo());
		
			// Ajax의 값이 넘어오는지 확인 
			String checkDate = request.getParameter("checkDate");
			System.out.println(checkDate);
			
			Event event = new Event();
			event.setMemberNo(loginMember.getMemberNo());
			event.setEvAttendDate(request.getParameter("checkDate"));
			
//			EventService eventService = new EventService(event);		
//			eventService.saveEvent();
			
			System.out.println(event);
			
			int result = new EventService().saveEvent(event);
			
			member.setMemberNo(loginMember.getMemberNo());			
			request.setAttribute("member", member);
			
			List<Event> list = null;
			
			list = new EventService().getAttendCheck(member);
			
			System.out.println(list);
			
			request.setAttribute("list", list);
			
			response.setContentType("application/json;charset=UTF-8");
	    	
	    	//new Gson().toJson(map, response.getWriter());   
			
			
			System.out.println(new Gson().toJson(list));
			
			String data = "{\"start\":\"2022-08-01\"}";
			
			/*"title": "Event 2",
		      "start": "2019-09-08",
		      "end": "2019-09-10"*/
			request.setAttribute("data", data);
			
			
			StringBuffer re = new StringBuffer("");
			
			re.append("events: ");
			re.append("[");
			for(int i = 0; i < list.size(); i++) {
				
				re.append("{\"title\": \"" + "출석정보" + "\",");
				//re.append("{\"start\": \"" + list.get(i).getEvAttendDate() + "");
				re.append(" \"start\": \"" + list.get(i).getEvAttendDate() + "\",");
				re.append(" \"end\": \"" + list.get(i).getEvAttendDate() + "\"},");
			}
			re.deleteCharAt(re.length() - 1);
			re.append("]");
			
			
			//re = substring(re,",");
			//re = re.substring(re.length()-1);    //str.length()-2 = str문자열 길이 -2
	      
		
			System.out.println(re);
			
			String res = re.toString();
			
//			request.setAttribute("re", re);
			
//			Gson gson = new Gson(); 
			String json = new Gson().toJson(res);
//			
			response.setContentType("application/json;charset=UTF-8");
//			
			request.setAttribute("json", json);
			
			System.out.println("json :" + json);
//			
		} else {
				request.setAttribute("location", "/member/login");
			}
		
//		event.setEvAttendDate(request.getParameter("checkDate"));
//		EventService eventService = new EventService(event);
//		eventService.saveEvent();
		
		
		
//		event.setEvAttendDate(request.getParameter("attDate"));

//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.US);
//		LocalDate checkDate = LocalDate.parse(checkDate, formatter);
//
//		System.out.println(checkDate);
//		System.out.println(formatter.format(checkDate));
		
//		event.setEvAttendDate(request.getParameter("checkDate1"));
		
		  
//		String checkDate = request.getParameter("checkDate");
//	    String str = checkDate;
//	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	    Date date = format.parse(str);
//	    System.out.println("Date : " + date);
	  
//		event.setEvAttendDate(request.getParameter("checkDate"));
		
	    }


	private StringBuffer removeEnd(StringBuffer re, String string) {
		// TODO Auto-generated method stub
		return null;
	}
	}


