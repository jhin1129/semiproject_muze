package com.muze.mvc.event.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.event.model.vo.Event;


@WebServlet("/event")
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EventServlet() {
    
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/event/eventpage8.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String checkDate = request.getParameter("checkDate");
		
		System.out.println(checkDate);
		
		Event event = new Event();
		//Date date = parse("checkDate");
		  
		
//		event.setEvAttendDate(request.getParameter("checkDate"));
//		event.setEvAttendDate(request.getParameter("attDate"));

//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.US);
//		LocalDate checkDate = LocalDate.parse(checkDate, formatter);
//
//		System.out.println(checkDate);
//		System.out.println(formatter.format(checkDate));
		
//		event.setEvAttendDate(request.getParameter("checkDate1"));
		
		  
//			  String checkDate = request.getParameter("checkDate");
//	            String str = checkDate;
//	            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	            Date date = format.parse(str);
//	            System.out.println("Date : " + date);
	     
	        
		  
//		  event.setEvAttendDate(request.getParameter("checkDate"));
		
	    }
	}


