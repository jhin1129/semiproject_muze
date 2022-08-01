package com.muze.mvc.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.mypage.model.service.MyOrderService;

@WebServlet("/mypage/cancel")
public class MyCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyCancelServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		int no = Integer.parseInt(request.getParameter("no"));
		
//		System.out.println("넘버값 " + no);
		
    	result = new MyOrderService().orderCancel(no);

		// 쿼리가 정상적으로 실행되어 정수값을 반환하면,
    	if (result > 0) {
		    // 주문 취소 성공 
    		request.setAttribute("msg", "주문이 정상적으로 취소되었습니다.");
			request.setAttribute("location", "/mypage/welcome");	
    	} else {
    		// 주문 취소 실패 
			request.setAttribute("msg", "취소에 실패하였습니다. 관리자에게 문의해주세요.");
			request.setAttribute("location", "/mypage/welcome");	
		}

    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

	}
}