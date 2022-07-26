package com.muze.mvc.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.mypage.model.service.WelcomeService;
import com.muze.mvc.mypage.model.vo.Delivery;
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
    	Delivery orderStatus = null;    	
    	
    	// DB에 저장된 마일리지 값 
    	mileageNow = new WelcomeService().getMileageN();
    	
    	// DB에 저장된 리뷰의 갯수 (지금은 자유게시판 게시글 수로)
    	reviewCount = new WelcomeService().getReviewC();
    	
//		System.out.println(mileageNow); // 100 제대로 가져옴.
//		System.out.println(reviewCount); // 6 제대로 가져옴.
		
		welcome = new Welcome(mileageNow, reviewCount);

    	// 2nd row
    	orderStatus = new WelcomeService().getOrderStatus();
    	
//    	System.out.println(orderStatus); // 제대로 가져옴.
    	
    	
    	// 3rd row 
    	
    	
    	
		request.setAttribute("orderStatus", orderStatus);
    	request.setAttribute("welcome", welcome);    	
    	request.getRequestDispatcher("/views/mypage/welcome.jsp").forward(request, response);
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		
	}
    
    
}
