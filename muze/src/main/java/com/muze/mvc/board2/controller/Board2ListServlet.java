package com.muze.mvc.board2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board2.model.service.Board2Service;
import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.PageInfo;

@WebServlet("/support/list")
public class Board2ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Board2ListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String path = null;
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Board2> list = null;

		if(type.equals("NOTICE")) {
			path = "/views/support/notice_brd_list.jsp";
		} else if(type.equals("FAQ")) {
			path = "/views/support/faq_brd.jsp";
		} else if(type.equals("QNA")) {
			path = "/views/mypage/my_qna.jsp";
		}

		try {
		page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			page = 1;
		}
		
		listCount = new Board2Service().getBoardCount(type);
		pageInfo = new PageInfo(page, 5, listCount, 10);
		list = new Board2Service().getBoardList(pageInfo, type);
			
		System.out.println(listCount);
		System.out.println(list);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}