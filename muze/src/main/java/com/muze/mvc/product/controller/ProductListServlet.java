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

@WebServlet("/product/list")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String path = null;
		int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Product> list = null;
    	
		if(type.equals("PORTRAIT")) {
			path = "/views/product/product_portrait.jsp";
		} else if(type.equals("LANDSCAPE")) {
			path = "/views/product/product_landscape.jsp";
		} else if(type.equals("STILL-LIFE")) {
			path = "/views/product/product_still-life.jsp";
		} else if(type.equals("ABSTRACT")) {
			path = "/views/product/product_abstract.jsp";
		}

    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
			page = 1;
		}
    	
    	listCount = new PaintingService().getPaintingCount(); // 페이지 숫자를 넘버링하기 위한 총 리스트 갯수
    	pageInfo = new PageInfo(page, 10, listCount, 4); // 페이지 정보 만들기
    	list = new PaintingService().getPaingingList(pageInfo); // 페이지 별 실제 리스트 개수
    	
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
		request.setAttribute("type", type);

		request.getRequestDispatcher(path).forward(request, response);
		
	}

}