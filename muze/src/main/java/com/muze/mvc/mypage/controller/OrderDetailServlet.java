package com.muze.mvc.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.mypage.model.service.MyOrderService;
import com.muze.mvc.mypage.model.service.WelcomeService;
import com.muze.mvc.mypage.model.vo.MyOrder;
import com.muze.mvc.mypage.model.vo.Welcome;

@WebServlet("/mypage/orderdetail")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderDetailServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1st row
    	Welcome welcomeRow = null;   	
    	welcomeRow = new WelcomeService().getWelcomeRow();
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
    	request.getRequestDispatcher("/views/mypage/order_detail.jsp").forward(request, response);
		
	}

}
