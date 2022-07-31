package com.muze.mvc.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.vo.Member;
import com.muze.mvc.mypage.model.service.MyOrderService;
import com.muze.mvc.mypage.model.service.WelcomeService;
import com.muze.mvc.mypage.model.vo.MyOrder;
import com.muze.mvc.mypage.model.vo.Welcome;

@WebServlet("/mypage/orderdetail")
public class MyOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyOrderDetailServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인 체크 & 본인 게시글 여부 확인 
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
    	if (loginMember != null) {
    		// 로그인 객체의 PK값을 넘기기 위한 객체 생성 
			Member member = new Member();
			member.setMemberNo(loginMember.getMemberNo());			
			member.setMemberName(loginMember.getMemberName());
			request.setAttribute("member", member);
			
			// 1st row
	    	Welcome welcomeRow = null;   	
	    	welcomeRow = new WelcomeService().getWelcomeRow(member);
			request.setAttribute("welcomeRow", welcomeRow);
			
			// 상세 (오더 넘버(pk)로 가져옴  
			MyOrder orderDetail = null;
			int no = Integer.parseInt(request.getParameter("no"));
			
			System.out.println("오더넘버 " + no);
					
			orderDetail = new MyOrderService().getOrderDetail(no);
	
			// 오더 디테일의 값들은 myorder객체로 가져오게 된다!!
			
	//		String value = request.getParameter("value");
			System.out.println(orderDetail);
	
			request.setAttribute("orderDetail", orderDetail);
	    	request.getRequestDispatcher("/views/mypage/my_order_detail.jsp").forward(request, response);
    	
    	} else {
    		request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("location", "/");		
    		
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
		
	}

}
