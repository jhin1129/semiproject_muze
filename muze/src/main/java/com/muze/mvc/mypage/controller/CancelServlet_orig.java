package com.muze.mvc.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.mypage.model.service.MyOrderService;
import com.muze.mvc.mypage.model.service.WelcomeService;
import com.muze.mvc.mypage.model.vo.MyOrder;
import com.muze.mvc.mypage.model.vo.Welcome;

@WebServlet("/mypage/cancel111")
public class CancelServlet_orig extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CancelServlet_orig() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1st row
    	Welcome welcomeRow = null;   	
    	welcomeRow = new WelcomeService().getWelcomeRow();
		System.out.println(welcomeRow);
		request.setAttribute("welcomeRow", welcomeRow);
    	
    	request.getRequestDispatcher("/views/mypage/welcome.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
    	result = new MyOrderService().orderCancel();

		// 쿼리가 정상적으로 실행되어 정수값을 반환하면,
    	if (result > 0) {
		    // 주문 취소 성공 
    		request.setAttribute("msg", "주문이 정상적으로 취소되었습니다.");
			request.setAttribute("location", "/mypage/orderdetail");	
    	}else {
    		// 주문 취소 실패 
			request.setAttribute("msg", "회원 정보 수정 실패");
			request.setAttribute("location", "/mypage/welcome");	
		}
		
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}
