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

@WebServlet("/mypage/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1st row
    	int mileageNow = new WelcomeService().getMileageN();
    	int reviewCount = new WelcomeService().getReviewC();
    	Welcome welcome = new Welcome(mileageNow, reviewCount);
		
		// 1st row name
    	MyOrder myOrder = null;
		myOrder = new MyOrderService().getOrderInfo();
		
		// 검색
		List<MyOrder> list = null;
		
		// 매개 값 (검색 날짜) 가져오기 
		String dateFrom = request.getParameter("dateFrom");
		String dateTo = request.getParameter("dateTo");
		
		// 잘 가져오는지 확인
		System.out.println(dateFrom + " "+ dateTo);
		
		// 넘기기
		list = new MyOrderService().orderByDate(dateFrom, dateTo);
		
		// 성공적으로 받아옴.
//		System.out.println(list.isEmpty());
		list.forEach(System.out::println);

    	request.setAttribute("myOrder", myOrder);
		request.setAttribute("welcome", welcome);    
		request.setAttribute("list", list);
    	request.getRequestDispatcher("/views/mypage/order_list.jsp").forward(request, response);
    	
	}


}
