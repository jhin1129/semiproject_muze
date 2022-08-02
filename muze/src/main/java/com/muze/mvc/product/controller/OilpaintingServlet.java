package com.muze.mvc.product.controller;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.product.model.service.OilpaintingService;



@WebServlet(name = "oilpaintingServlet", urlPatterns = { "/product/oilpainting" })
public class OilpaintingServlet extends HttpServlet {
	private static final Logger log = Logger.getLogger(PaintingServlet.class.getName()); 
	private static final long serialVersionUID = 1L;
       
    public OilpaintingServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Product> list = null;
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
			page = 1;
		}
    	
    	listCount = new OilpaintingService().getPaintingCount(); // 페이지 숫자를 넘버링하기 위한 총 리스트 갯수
    	pageInfo = new PageInfo(page, 10, listCount, 4); // 페이지 정보 만들기
    	list = new OilpaintingService().getPaingingList(pageInfo); // 페이지 별 실제 리스트 개수
    	
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
    	
    	

		request.getRequestDispatcher("/views/product/Product_oilpainting.jsp").forward(request, response);
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
