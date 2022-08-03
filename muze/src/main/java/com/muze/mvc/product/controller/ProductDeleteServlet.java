package com.muze.mvc.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.product.model.service.ProductService;

@WebServlet("/product/delete")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		String type = request.getParameter("proType");
		System.out.println(type);
		String typepath = "";
		String path = "";

		result = new ProductService().deleteProduct(proNo);
		
		if(result > 0) {
			path = request.getContextPath()+"/";
		} else {
			path = request.getContextPath()+"/";
		}
		response.sendRedirect(path);
    	
	}

}
