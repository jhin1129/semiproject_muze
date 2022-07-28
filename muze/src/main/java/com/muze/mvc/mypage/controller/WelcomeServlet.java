package com.muze.mvc.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.service.MemberService;
import com.muze.mvc.member.vo.Member;
import com.muze.mvc.mypage.model.service.MyOrderService;
import com.muze.mvc.mypage.model.service.WelcomeService;
import com.muze.mvc.mypage.model.vo.MyOrder;
import com.muze.mvc.mypage.model.vo.Welcome;

@WebServlet("/mypage/welcome")
public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WelcomeServlet() {
    }

    @Override	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인 체크 & 본인 게시글 여부 확인 (직접 적용해 보세요) 
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
    	
//    	if (loginMember != null) {
    
    	// 1st row
    	Welcome welcomeRow = null;   	
    	welcomeRow = new WelcomeService().getWelcomeRow();
		request.setAttribute("welcomeRow", welcomeRow);

    	// 2nd row
		List<MyOrder> status = null;
		status = new MyOrderService().getOrderStatus();
		
    	// 3rd row 
		List<MyOrder> list = null;
		list = new MyOrderService().getOrderRec();

		request.setAttribute("status", status);
		request.setAttribute("list", list);
    	request.getRequestDispatcher("/views/mypage/welcome.jsp").forward(request, response);
    	
//    	} else {
//    		
//    		request.getRequestDispatcher("/views/member/login.jsp").forward(request, response);
//    		
//    	}
    	
	}
    
}
