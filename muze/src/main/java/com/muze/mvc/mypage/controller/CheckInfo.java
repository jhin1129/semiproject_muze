package com.muze.mvc.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/checkinfo")
public class CheckInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckInfo() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
    	request.getRequestDispatcher("/views/mypage/pwd_info.jsp").forward(request, response);
	}



}
