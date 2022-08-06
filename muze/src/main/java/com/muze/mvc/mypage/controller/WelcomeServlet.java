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

@WebServlet("/mypage/welcome")
public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WelcomeServlet() {
    }

    @Override	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인 체크 & 본인 게시글 여부 확인 
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
    	if (loginMember != null) {
			Member member = new Member();
			member.setMemberName(loginMember.getMemberName());
    		int memNo = loginMember.getMemberNo();
    		
    		request.setAttribute("member", member);
	    	
	    	// 1st row
	    	Welcome welcomeRow = new WelcomeService().getMileage(memNo);
	    	Welcome welcomeRow2 = new WelcomeService().getReview(memNo);
	    	
//	    	System.out.println(welcomeRow);
//	    	System.out.println(welcomeRow2);
	    	
	    	request.setAttribute("welcomeRow", welcomeRow);
	    	request.setAttribute("welcomeRow2", welcomeRow2);
	    	
	    	// 2nd row
			List<MyOrder> status = null;
			status = new MyOrderService().getOrderStatus(memNo);
			
	    	// 3rd row 
			List<MyOrder> list = null;
			list = new MyOrderService().getOrderRec(memNo);
			
			System.out.println(list);
	
			request.setAttribute("status", status);
			request.setAttribute("list", list);
	    	request.getRequestDispatcher("/views/mypage/welcome.jsp").forward(request, response);
    	
    	} else {
    		request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("location", "/");		
    		
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}

	}
    
}