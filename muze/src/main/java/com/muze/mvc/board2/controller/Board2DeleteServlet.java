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
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("게시글 번호 : " + no);
		
		result = new Board2Service().delete(no);
		
		if(result > 0) {
			request.setAttribute("msg", "게시글 삭제 성공");
			request.setAttribute("location", "/support/list?type=QNA");
		} else {
			request.setAttribute("msg", "게시글 삭제 실패");
			request.setAttribute("location", "/support/view?no=" + no);
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}
}