package com.muze.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.common.util.PageInfo;


@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String path = null;
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Board> list = null;
		
		if(type.equals("REVIEW")) {
			path = "/views/community/board/review_board_list.jsp";
		} else if(type.equals("FREE")) {
			path = "/views/community/board/free_board_list.jsp";
		}
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			page = 1;
		}
		
		listCount = new BoardService().getBoardCount(type);
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = new BoardService().getBoardList(pageInfo, type);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		
		request.getRequestDispatcher(path).forward(request, response);			
		
	}


}