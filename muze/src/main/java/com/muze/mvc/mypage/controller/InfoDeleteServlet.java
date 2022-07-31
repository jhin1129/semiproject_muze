package com.muze.mvc.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.service.MyInfoService;

@WebServlet("/mypage/deleteinfo")
public class InfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InfoDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;

    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
	    
			if (loginMember != null) {
				
	    		result = new MyInfoService().delete(loginMember.getMemberNo());
	    		
	        	if (result > 0) {
	        		request.setAttribute("msg", "탈퇴가 정상적으로 이루어졌습니다.");
	    			request.setAttribute("location", "/member/logout");	
				}else {
		    		request.setAttribute("msg", "관리자에게 문의해주세요.");
					request.setAttribute("location", "/mypage/welcome");	
				}
        	
		    } else {
	    		request.setAttribute("msg", "로그인 후 가능합니다.");
				request.setAttribute("location", "/");			
		    }
		    request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
