package com.muze.mvc.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.mypage.model.service.MyOrderService;
import com.muze.mvc.mypage.model.service.WelcomeService;
import com.muze.mvc.mypage.model.vo.MyOrder;
import com.muze.mvc.mypage.model.vo.Welcome;

@WebServlet("/mypage/refund_list")
public class RefundListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RefundListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1st row
    	Welcome welcomeRow = null;   	
    	welcomeRow = new WelcomeService().getWelcomeRow();
		request.setAttribute("welcomeRow", welcomeRow);
		
		// 검색
		List<MyOrder> list = null;
		
		// 매개 값 (검색 날짜) 가져오기 
		String dateFrom = request.getParameter("dateFrom");
		String dateTo = request.getParameter("dateTo");
		
		// 처리 결과 
		list = new MyOrderService().refundByDate(dateFrom, dateTo);
		
		request.setAttribute("list", list);
    	request.getRequestDispatcher("/views/mypage/refund_list.jsp").forward(request, response);
	}

}
