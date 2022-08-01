package com.muze.mvc.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.product.model.service.PaintingService;


@WebServlet(name = "paintingServlet", urlPatterns = { "/product/painting" })
public class PaintingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaintingServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/product/Product_painting.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Product> list = null;
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
			page = 1;
		}
    	
    	listCount = new PaintingService().getPaintingCount();
    	pageInfo = new PageInfo(page, 10, listCount, 5);    
    	list = new PaintingService().getPaingingList(pageInfo);
    	
    	System.out.println(list);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
    	request.getRequestDispatcher("/views/product/Product_painting.jsp").forward(request, response);
	}

}
