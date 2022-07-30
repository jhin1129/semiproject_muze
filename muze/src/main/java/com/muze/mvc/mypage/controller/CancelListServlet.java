package com.muze.mvc.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.service.MyOrderService;
import com.muze.mvc.mypage.model.service.WelcomeService;
import com.muze.mvc.mypage.model.vo.MyOrder;
import com.muze.mvc.mypage.model.vo.Welcome;

@WebServlet("/mypage/cancel_list")
public class CancelListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CancelListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
    	if (loginMember != null) {
			Member member = new Member();
			member.setMemberNo(loginMember.getMemberNo());			
			member.setMemberName(loginMember.getMemberName());
			request.setAttribute("member", member);
			
			// 1st row
	    	Welcome welcomeRow = null;   	
	    	welcomeRow = new WelcomeService().getWelcomeRow(member);
			request.setAttribute("welcomeRow", welcomeRow);
			
			// 2. 검색
			List<MyOrder> list = null;
			
			// 매개 값 (검색 날짜) 가져오기 
			String dateFrom = request.getParameter("dateFrom");
			String dateTo = request.getParameter("dateTo");
	
			// 처리 결과 
			list = new MyOrderService().cancelByDate(dateFrom, dateTo, member);
			
			request.setAttribute("list", list);
	    	request.getRequestDispatcher("/views/mypage/cancel_list.jsp").forward(request, response);
    	} else {
    		request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("location", "/");		
    		
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}

	}

}
