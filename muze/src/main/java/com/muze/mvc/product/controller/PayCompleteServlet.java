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

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.event.model.service.MileageService;
import com.muze.mvc.event.model.vo.Mileage;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.product.model.service.OrderService;
import com.muze.mvc.product.model.vo.Orders;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/product/complete")
public class PayCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PayCompleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		List<Product> list = new ArrayList<Product>();
//		
//		if(request.getParameter("proNo") != null) {
//			int proNo = Integer.parseInt(request.getParameter("proNo"));
//			int payQuantity = Integer.parseInt(request.getParameter("payQuantity"));
//			Product product = new BoardService().getProductByProNo(proNo);
//			product.setPayQuantity(payQuantity);
//			list.add(product);
//		} else {
//			
//		}
//		int totalPrice = new BoardService().getTotalPrice(list);
//		
//		request.setAttribute("list", list);
//		request.setAttribute("totalPrice", totalPrice);
//		request.getRequestDispatcher("/views/product/Payment_complete.jsp").forward(request, response);
//		
//		HttpSession session = request.getSession(false);
//		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
//		Product productNumber = (session == null) ? null : (Product) session.getAttribute("productNumber");
//		Mileage mileageNumber = (session == null) ? null : (Mileage) session.getAttribute("mileageNumber");
//		int result = 0;
//		Payment pay = null;
//		String encoding = "UTF-8";
//
//		pay = new Payment();
//		
////		pay.setOrderNo(Integer.parseInt(request.getParameter("OrderNo"))); //주문코드
////		pay.setProNo(Integer.parseInt(request.getParameter("productNumber.getProNo()"))); //작품코드
//		//orderdate sysdate
//		pay.setOrderAmount(1);
////		pay.setMemberNo(Integer.parseInt(request.getParameter("loginMember.getMemberNo()")));
//		pay.setBuyName("receiverName");
//		pay.setBuyAdress("receiverAddressSub");
//		pay.setBuyPhone("receiverCellPhone");
////		pay.setBuyAcc(Integer.parseInt(request.getParameter("bankSender")));//계좌번호
////		pay.setAdminAcc(Integer.parseInt(request.getParameter("adminAcc")));//대표계좌
////		pay.setPointNo(Integer.parseInt(request.getParameter("mileageNumber.getPointNo()"))); //포인트번호
//		
//		result = new OrderService().save(pay);
//		
//		
//		request.getRequestDispatcher("/views/product/Payment_complete.jsp").forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] parameterValues = request.getParameterValues("list");
		HttpSession session = request.getSession(false);
        Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
//		System.out.println(request.getParameter("totalPrice"));
        System.out.println(parameterValues[0]);
        System.out.println(loginMember.getMemberNo());
        
        int pointNo = 0;
        pointNo = new MileageService().insertOrderMileage(loginMember.getMemberNo(), Integer.parseInt(request.getParameter("totalPrice")));
		Orders order = null;
		String encoding = "UTF-8";
		
		System.out.println(pointNo);
		
		order = new Orders();
		
		order.setOrderName(request.getParameter("orderName"));
		order.setOrderAdress(request.getParameter("orderAddress"));
		order.setOrderPhone(request.getParameter("orderCellPhone"));
		order.setOrderEmail(request.getParameter("orderEmail"));
		order.setBuyName(request.getParameter("receiverName"));
		order.setBuyAdress(request.getParameter("receiverAddressSub"));
		order.setBuyPhone(request.getParameter("receiverCellPhone"));
		
		System.out.println(order);
		
	}

}
