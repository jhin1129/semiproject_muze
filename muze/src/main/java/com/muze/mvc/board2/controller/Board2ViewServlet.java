package com.muze.mvc.board2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board2.model.service.Board2Service;
import com.muze.mvc.board2.model.vo.Board2;

@WebServlet("/board2/view")
public class Board2ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	public Board2ViewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board2 board = null;
		String type = request.getParameter("type");
		int no = Integer.parseInt(request.getParameter("no"));
		String path = null;
		
		board = new Board2Service().getBoardByNo(no);
		
		request.setAttribute("board", board);
		request.setAttribute("type", type);
		request.getRequestDispatcher("/views/support/qna_brd_content.jsp").forward(request, response);
	}
	
}
