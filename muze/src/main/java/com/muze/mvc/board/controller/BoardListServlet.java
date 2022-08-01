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
		String searchType = request.getParameter("searchType");
		String searchVal = request.getParameter("searchVal");
		String isSearch = request.getParameter("isSearch");
		
		if(isSearch == null || isSearch.equals("false") || searchVal == null) {
			isSearch = "false";
			searchVal = "";
			searchType= "";
		} else {
			isSearch = "true";
		}
		
		String path = null;
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Board> list = null;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			page = 1;
		}
		
		listCount = new BoardService().getBoardCount(type, searchType, searchVal);
		
		if(type.equals("REVIEW")) {
			pageInfo = new PageInfo(page, 5, listCount, 8);
			path = "/views/community/board/review_board_list.jsp";
		} else if(type.equals("FREE")) {
			pageInfo = new PageInfo(page, 5, listCount, 10);
			path = "/views/community/board/free_board_list.jsp";
		}
		
		list = new BoardService().getBoardList(pageInfo, type, searchType, searchVal);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		request.setAttribute("searchType", searchType);
		request.setAttribute("searchVal", searchVal);
		request.setAttribute("isSearch", isSearch);
		request.getRequestDispatcher(path).forward(request, response);			
		
	}

}
