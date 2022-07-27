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

@WebServlet("/mypage/orderdetail")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderDetailServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1st row
    	int mileageNow = 0;
    	int reviewCount = 0;
    	Welcome welcome = null;   	
    	MyOrder myOrder1 = null;
    	MyOrder myOrder2 = null;
    	
		myOrder1 = new MyOrderService().getOrderInfo();
		
    	mileageNow = new WelcomeService().getMileageN();
    	
    	reviewCount = new WelcomeService().getReviewC();
		
		welcome = new Welcome(mileageNow, reviewCount);
		
		// 상세 
		MyOrder orderDetail = null;
		
		orderDetail = new MyOrderService().getOrderDetail();
		myOrder2 = new MyOrderService().getOrderInfo();

    	request.setAttribute("welcome", welcome);  
    	request.setAttribute("myOrder", myOrder1);
    	request.setAttribute("myOrder", myOrder2);
		request.setAttribute("orderDetail", orderDetail);
		
    	request.getRequestDispatcher("/views/mypage/order_detail.jsp").forward(request, response);
		
	}

}
