package com.muze.mvc.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Product;

@WebServlet("/product/payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> list = new ArrayList<Product>();
		if(request.getParameter("proNo") != null) {
			int proNo = Integer.parseInt(request.getParameter("proNo"));
			int payQuantity = Integer.parseInt(request.getParameter("payQuantity"));
			Product product = new BoardService().getProductByProNo(proNo);
			product.setPayQuantity(payQuantity);
			list.add(product);
		} else {
			
		}
		int totalPrice = new BoardService().getTotalPrice(list);
		
		request.setAttribute("list", list);
		request.setAttribute("totalPrice", totalPrice);
		request.getRequestDispatcher("/views/product/Payment_.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
