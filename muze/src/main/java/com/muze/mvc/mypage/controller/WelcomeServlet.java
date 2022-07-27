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

@WebServlet("/mypage/welcome")
public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WelcomeServlet() {
    }

    @Override	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1st row
    	int mileageNow = 0;
    	int reviewCount = 0;
    	Welcome welcome = null;   	
    	MyOrder myOrder = null;
    	
    	// 이름 얻어오기 
		myOrder = new MyOrderService().getOrderInfo();
		
    	// DB에 저장된 마일리지 값 
    	mileageNow = new WelcomeService().getMileageN();
    	
    	// DB에 저장된 리뷰의 갯수
    	reviewCount = new WelcomeService().getReviewC();
    	
//		System.out.println(mileageNow); // 100 제대로 가져옴.
//		System.out.println(reviewCount); // 6 제대로 가져옴.
		
		welcome = new Welcome(mileageNow, reviewCount);

    	// 2nd row
		List<MyOrder> status = null;
		status = new MyOrderService().getOrderStatus();
		status.forEach(System.out::println);
		
//		System.out.println(status.get(status.size() - 1).getOrderStatus()); // 상품준비중 가져와짐 
//		System.out.println(status.get(0).getOrderStatus()); // 상품준비중 가져와짐 
//		System.out.println(status.get(0).getPro3()); // 테스트 ok 
//		System.out.println(status.get(status.size() - 1).getPro3()); // 테스트 ok 
//		System.out.println(status.get(status.size() - 1).getPro2()); // 테스트 ok 
		
    	// 3rd row 
		List<MyOrder> list = null;
		list = new MyOrderService().getOrderRec();

		// 받아왔는지 확인 
//		list.forEach(System.out::println);

		request.setAttribute("status", status);
		request.setAttribute("list", list);
    	request.setAttribute("welcome", welcome);    	
    	request.setAttribute("myOrder", myOrder);
    	request.getRequestDispatcher("/views/mypage/welcome.jsp").forward(request, response);
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
    
    
}
