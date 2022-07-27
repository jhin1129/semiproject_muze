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

@WebServlet("/mypage/order_list")
public class MyOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyOrderServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1st row
    	int mileageNow = 0;
    	int reviewCount = 0;
    	Welcome welcome = null;
    	
    	// DB에 저장된 마일리지 값 
    	mileageNow = new WelcomeService().getMileageN();
    	
    	// DB에 저장된 리뷰의 갯수
    	reviewCount = new WelcomeService().getReviewC();
    	
//		System.out.println(mileageNow); // 100 제대로 가져옴.
//		System.out.println(reviewCount); // 6 제대로 가져옴.
		
		welcome = new Welcome(mileageNow, reviewCount);
		
    	MyOrder myOrder = null;
		myOrder = new MyOrderService().getOrderInfo();

    	request.setAttribute("myOrder", myOrder);
    	request.setAttribute("welcome", welcome);    	
    	request.getRequestDispatcher("/views/mypage/order_list.jsp").forward(request, response);

	}
	

}
