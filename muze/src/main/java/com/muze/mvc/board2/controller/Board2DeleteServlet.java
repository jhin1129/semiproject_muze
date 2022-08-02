package com.muze.mvc.board2.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board2.model.service.Board2Service;

@WebServlet( name = "Board2DeleteServlet", urlPatterns = { "/support/delete" })
public class Board2DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Board2DeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
		int brdNo = Integer.parseInt(request.getParameter("brdNo"));
		
		String type = request.getParameter("type");
		
		result = new Board2Service().delete(brdNo, type);

		System.out.println(type);
		
		if(result > 0) {
			request.setAttribute("msg", "게시글 삭제 성공");
			request.setAttribute("location", "/support/list?type=" + type);
		} else {
			request.setAttribute("msg", "게시글 삭제 실패");
			request.setAttribute("location", "/support/view?brdNo=" + brdNo);
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}
}