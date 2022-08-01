package com.muze.mvc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.product.model.vo.Payment;
import com.muze.mvc.product.model.vo.Writer;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/product/payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/product/Payment.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		Payment payment = null;
		
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, encoding);
		
		String receiverName = mr.getParameter("receiverName");
		String receiverZonecode = mr.getParameter("receiverZonecode");
		String receiverPhone = mr.getParameter("receiverPhone");
		String orderName = mr.getParameter("orderName");
		String orderName = mr.getParameter("orderName");
		String orderName = mr.getParameter("orderName");
		String orderName = mr.getParameter("orderName");
		String orderName = mr.getParameter("orderName");
		String orderName = mr.getParameter("orderName");
		String orderName = mr.getParameter("orderName");
		String orderName = mr.getParameter("orderName");
	}

}
