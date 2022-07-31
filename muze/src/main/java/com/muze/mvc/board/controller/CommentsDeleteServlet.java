package com.muze.mvc.board.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Comments;


@WebServlet("/board/commentsdelete")
public class CommentsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentsDeleteServlet() {
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		int commentsNo = Integer.parseInt(request.getParameter("commentsNo"));
		int commentsWriterNo = Integer.parseInt(request.getParameter("commentsWriterNo"));
		
		
		boolean selfCheck = new BoardService().selfCheck(request, commentsWriterNo);
		
		if(selfCheck) {
    		result = new BoardService().deleteComments(commentsNo);
    		
    		if(result == 1) {
    			new Gson().toJson(result, response.getWriter());
    		}
    	}
		
	}

}
