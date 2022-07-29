package com.muze.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Product;

@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		int brdNo = Integer.parseInt(request.getParameter("no"));
		int brdWriterNo = Integer.parseInt(request.getParameter("brdWriterNo"));
		String type = request.getParameter("type");
		String path = "";
		
		boolean selfCheck = new BoardService().selfCheck(request, brdWriterNo);
    	
    	if(!selfCheck) {
    		request.setAttribute("msg", "접근 권한이 없습니다.");
			request.setAttribute("location", "/board/view?type="+type+"&no="+brdNo);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}else {
    		result = new BoardService().deleteBoard(brdNo);
    		
    		if(result > 0) {
    			path = request.getContextPath()+"/board/list?type="+type;
    		} else {
    			path = request.getContextPath()+"/board/view?no="+brdNo;
    		}
    		response.sendRedirect(path);
    	}

	}

}
