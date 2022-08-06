package com.muze.mvc.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.event.model.service.MileageService;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.product.model.service.OrderService;
import com.muze.mvc.product.model.service.ProductService;
import com.muze.mvc.product.model.vo.OrderStatus;
import com.muze.mvc.product.model.vo.Orders;

@WebServlet("/product/complete")
public class PayCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PayCompleteServlet() {
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//리스트 불러오기
		String[] parameterValues = request.getParameterValues("list");
		//loginMember에서 memberNo 가져오기

		HttpSession session = request.getSession(false);
        Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
        
        if(!loginMember.getMemberRole().equals("MEMBER_ROLE_USER")) {
			request.setAttribute("msg", "일반 계정으로 로그인 해 주세요");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		} else {
			
			//마일리지 테이블에 넣는 작업
			int pointNo = 0;
			pointNo = new MileageService().insertOrderMileage(loginMember.getMemberNo(), Integer.parseInt(request.getParameter("totalPrice")));
			
			
			//orders테이블에 넣는 작업
			String proNoStrList = request.getParameter("proNoList");
			String[] proNoSplit = proNoStrList.split(",");
			String payQuantityStrList = request.getParameter("payQuantityList");
			String[] payQuantitySplit = payQuantityStrList.split(",");
			
			List<Orders> orderList = new ArrayList<Orders>();
			for(int i = 0; i < proNoSplit.length; i++) {
				Orders order = new Orders();
				order.setProNo(Integer.parseInt(proNoSplit[i]));
				order.setOrderAmount(Integer.parseInt(payQuantitySplit[i]));
				order.setMemberNo(loginMember.getMemberNo());
//			order.setOrderName(request.getParameter("orderName"));
//			order.setOrderAdress(request.getParameter("orderAddress"));
//			order.setOrderPhone(request.getParameter("orderCellPhone"));
//			order.setOrderEmail(request.getParameter("orderEmail"));
				order.setBuyName(request.getParameter("receiverName"));
				order.setBuyAdress(request.getParameter("address"));
				order.setBuyPhone(request.getParameter("receiverCellPhone"));
				order.setPointNo(pointNo);
				System.out.println(order);
				orderList.add(order);
			}
			int orderNo = new OrderService().insertOrder(orderList);
			
			//OrderStatus테이블에 넣는 작업
			List<OrderStatus> orderStatusList = new ArrayList<OrderStatus>();
			for(int i = 0; i < proNoSplit.length; i++) {
				OrderStatus orderStatus = new OrderStatus();
				orderStatus.setOrderNo(orderNo);
				orderStatus.setOrderStatus("결제완료");
				orderStatus.setMemberNo(loginMember.getMemberNo());
				orderStatus.setProNo(Integer.parseInt(proNoSplit[i]));
				
				orderStatusList.add(orderStatus);
			}
			new OrderService().insertOrderStatus(orderStatusList);
			
			//Product 테이블에 작품 수량 감소
			new ProductService().reduceProQuantity(proNoSplit, payQuantitySplit);
			
			
			request.getRequestDispatcher("/views/product/Payment_complete.jsp").forward(request, response);
		}
        
	}

}
