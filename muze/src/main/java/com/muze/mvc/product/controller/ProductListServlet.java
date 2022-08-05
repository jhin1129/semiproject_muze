package com.muze.mvc.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.product.model.dao.ProductDao;
import com.muze.mvc.product.model.service.ProductService;

@WebServlet("/product/list")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String searchType_ = request.getParameter("searchType");
		String searchVal_ = request.getParameter("searchVal");
		String isSearch = request.getParameter("isSearch");
		
		System.out.println("타입:" + type);
		System.out.println("서치타입:" +searchType_);
		System.out.println("서치밸류:" +searchVal_);
		
		String searchType = "pro_Name";
		if(searchType_ != null)
			searchType = searchType_;
		
		String searchVal = "";
		if(searchVal_ != null)
			searchVal = searchVal_;
		
//		if(isSearch == null || isSearch.equals("false") || searchVal == null) {
//			isSearch = "false";
//			searchVal = "";
//			searchType= "";
//		} else {
//			isSearch = "true";
//		}
		
		String path = null;
		int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Product> list = null;
    	
//    	path = "/views/product/product_list.jsp";
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
    
//    	listCount = new ProductService().getProductCount(type); // 페이지 숫자를 넘버링하기 위한 총 리스트 갯수
//    	list = new ProductService().getProductList(pageInfo, type); // 페이지 별 실제 리스트 개수
    	
    	listCount = new ProductService().getProductCount(type, searchType, searchVal);
    	pageInfo = new PageInfo(page, 10, listCount, 4); // 페이지 정보 만들기
    	list = new ProductService().getProductList(pageInfo, type, searchType, searchVal);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
		request.setAttribute("type", type);
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchVal", searchVal);
		request.setAttribute("isSearch", isSearch);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}