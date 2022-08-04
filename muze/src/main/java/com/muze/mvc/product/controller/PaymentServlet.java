package com.muze.mvc.product.controller;

import java.io.IOException;
import java.sql.Date;
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/product/payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		if(!loginMember.getMemberRole().equals("MEMBER_ROLE_USER")) {
			request.setAttribute("msg", "일반 계정으로 로그인 해 주세요");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		} else {
			List<Product> list = new ArrayList<Product>();
			if(request.getParameter("proNo") != null) {
				int proNo = Integer.parseInt(request.getParameter("proNo"));
				int payQuantity = Integer.parseInt(request.getParameter("payQuantity"));
				Product product = new BoardService().getProductByProNo(proNo);
				product.setPayQuantity(payQuantity);
				list.add(product);
			} else {
				String[] proNoStrList = request.getParameterValues("list");
				List<Integer> proNoList = new ArrayList<Integer>();
				
				String[] splitProNo = proNoStrList[0].split(",");
				for(String str : splitProNo) {
					proNoList.add(Integer.parseInt(str));
				}
				list = new BoardService().getProductListByproNoList(proNoList);
				
				String[] payQuantityStrList = request.getParameterValues("quantity");
				List<Integer> payQuantityList = new ArrayList<Integer>();
				
				String[] splitPayQuantity = payQuantityStrList[0].split(",");
				for(String str : splitPayQuantity) {
					payQuantityList.add(Integer.parseInt(str));
				}
				
				for(int i = 0; i < list.size(); i++) {
					list.get(i).setPayQuantity(payQuantityList.get(i));
				}
				
			}
			int totalPrice = new BoardService().getTotalPrice(list);
			int mileage = new MileageService().getCurrentMileage(loginMember.getMemberNo());
			
			System.out.println(mileage);
			request.setAttribute("mileage", mileage);
			request.setAttribute("list", list);
			request.setAttribute("totalPrice", totalPrice);
			request.getRequestDispatcher("/views/product/Payment_.jsp").forward(request, response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
