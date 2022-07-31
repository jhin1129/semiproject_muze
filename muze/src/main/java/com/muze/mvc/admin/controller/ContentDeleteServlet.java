package com.muze.mvc.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.admin.model.service.AdminService;

@WebServlet("/admin/delete")
public class ContentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ContentDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] deleteContents = request.getParameterValues("deleteContent");
		String btn = request.getParameter("btn");
		
		int[] contents = new int[deleteContents.length];
		for(int i = 0; i < deleteContents.length; i++) {
			contents[i] = Integer.parseInt(deleteContents[i]);
		}
		
		int result = new AdminService().deleteContent(contents);
		
//	Board2 board = new Board2();
//	
//	board.setBrdStatus(String.join(",", request.getParameterValues("status")));
//	
//	System.out.println(board.getBrdStatus());
//	
//	int result = new AdminService().updateBoard(board);
//
	if(result > 0) {
		// 콘텐츠 관리 변경 내용 저장 완료
		request.setAttribute("msg", "변경 내용 저장 완료");
		request.setAttribute("location", "/admin/content");
	} else {
		request.setAttribute("msg", "변경 내용 저장 실패");
		request.setAttribute("location", "/admin/content");
	}
	
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	}
}
