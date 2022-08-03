package com.muze.mvc.admin.controller;

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

@WebServlet("/admin/content")
public class ContentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContentListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Board2> list = null;
		
		try {
		page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			page = 1;
		}
		
		listCount = new Board2Service().getBoardCountAll();
		pageInfo = new PageInfo(page, 5, listCount, 20);
		list = new Board2Service().getBoardListAll(pageInfo);
		
		System.out.println(listCount);
		System.out.println(list);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/adminpage/contents.jsp").forward(request, response);
	}

}