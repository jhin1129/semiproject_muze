package com.muze.mvc.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.service.ArtOrderService;
import com.muze.mvc.mypage.model.service.MyOrderService;
import com.muze.mvc.mypage.model.vo.MyOrder;

@WebServlet("/mypage/artist_status")
public class ArtistStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ArtistStatusServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
    	if (loginMember != null) {
    		String status = request.getParameter("status"); // ok
    		String[] orderNoS = request.getParameterValues("orderNo"); // ok
    		// int 배열로 형변환 
    		int[] orderNo = new int[orderNoS.length];
    		
    		for (int i = 0; i < orderNoS.length; i++) {
    			orderNo[i] = Integer.parseInt(orderNoS[i]);
    		}
    		
    		MyOrder orderDetail = null;
    		int buyMemMil = 0;
    		int buyMemNo = 0;
    		int orderAmount = 0;
    		int proNo = 0;
    		
    		// 오더 넘버로 오더 디테일 가죠오기
    		for (int i = 0; i < orderNo.length; i++) {
    			orderDetail = new MyOrderService().getOrderDetail(orderNo[i]);
    			// 구매자 넘버와 마일리지 값 가져오기 
    			buyMemMil = orderDetail.getMileagePoint();
    			buyMemNo =  orderDetail.getMemNo();
    			orderAmount = orderDetail.getOrderAmount();
    			proNo = orderDetail.getProNo();
    			result = new ArtOrderService().updateStatus(orderNo[i], status, buyMemNo, buyMemMil, orderAmount, proNo);
			}
    		
    		request.setAttribute("orderDetail", orderDetail);
			
        	if (result > 0) {
        		request.setAttribute("msg", "주문 상태가 변경되었습니다.");
    			request.setAttribute("location", "/mypage/artist");	
			}else {
	    		request.setAttribute("msg", "주문 상태를 변경하는데 실패하였습니다. 관리자에게 문의하세요.");
				request.setAttribute("location", "/");	
			}
    	
    	} else {
    		request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("location", "/");		
    	}
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}
