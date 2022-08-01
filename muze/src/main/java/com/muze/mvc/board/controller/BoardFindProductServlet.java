package com.muze.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Product;


@WebServlet("/board/findProduct")
public class BoardFindProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardFindProductServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		List<Product> list = null;
		
		list = new BoardService().getProductListByOrdersMemberNo(memberNo);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/community/board/findProduct.jsp").forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
