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
		String type = request.getParameter("type");
		System.out.println(proNo);
		
		result = new ProductService().deleteProduct(proNo);
		System.out.println(type);
		System.out.println(result);
		if(result > 0) {
			request.setAttribute("msg", "게시글 삭제 성공");
			request.setAttribute("location", "/product/list?type=" + type);
		} else {
			request.setAttribute("msg", "게시글 삭제 실패");
			request.setAttribute("location", "/product/list?type=" + type);
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	
	}

}
