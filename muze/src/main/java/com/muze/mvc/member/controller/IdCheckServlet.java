package com.muze.mvc.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.muze.mvc.member.service.MemberService;

@WebServlet("/member/idCheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IdCheckServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ID 값을 가져와서 DB에 있는 값인지 확인하고 결과(JSON)를 전달한다.
    	Map<String, Boolean> map = new HashMap<>();
    	String loginId = request.getParameter("loginId");
    	    	
    	map.put("duplicate", new MemberService().isDuplicateID(loginId));
    	
    	response.setContentType("application/json;charset=UTF-8");
    	
    	new Gson().toJson(map, response.getWriter());    	
	}
    
    
    
    
    
    

}