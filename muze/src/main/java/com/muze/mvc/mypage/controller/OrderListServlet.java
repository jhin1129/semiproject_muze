package com.muze.mvc.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.service.MyOrderService;
import com.muze.mvc.mypage.model.service.WelcomeService;
import com.muze.mvc.mypage.model.vo.MyOrder;
import com.muze.mvc.mypage.model.vo.Welcome;

@WebServlet("/mypage/list")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		Artist loginArtist = new MemberService().getArtistByNo(loginMember.getMemberNo());
		int artNo = 0; 
		
    	if (loginMember != null) {
    		if(loginArtist!= null) {
    			artNo = loginArtist.getArtistNo();
    		}
    		
    		int memNo = loginMember.getMemberNo();
			
	    	// 1st row
	    	Welcome welcomeRow = new WelcomeService().getMileage(memNo);
	    	Welcome welcomeRow2 = new WelcomeService().getReview(memNo);
	    	
	    	request.setAttribute("welcomeRow", welcomeRow);
	    	request.setAttribute("welcomeRow2", welcomeRow2);
	    	
			Member member = new Member();
			member.setMemberName(loginMember.getMemberName());
    		request.setAttribute("member", member);
			
			// 검색
			List<MyOrder> list = null;
			
			// 매개 값 (검색 날짜) 가져오기 
			String dateFrom = request.getParameter("dateFrom");
			String dateTo = request.getParameter("dateTo");
			
			// 검색 타입 가져오기 
			String type = request.getParameter("type");
			String path = null;
			
			if(type.equals("ORDER")) {
				path = "/views/mypage/list_order.jsp";
			} else if(type.equals("CANCEL")) {
				path = "/views/mypage/list_cancel.jsp";
			} 
	
			list = new MyOrderService().orderByDate(dateFrom, dateTo, memNo, type, artNo);

			request.setAttribute("list", list);
			request.setAttribute("type", type);
			request.getRequestDispatcher(path).forward(request, response);	
    	} else {
    		request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("location", "/");		
    		
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
    	
	}

}