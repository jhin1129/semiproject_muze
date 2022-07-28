package com.muze.mvc.board.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Comments;


@WebServlet("/board/commentswrite")
public class CommentsWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CommentsWriteServlet() {
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
				
		Comments comments = new Comments();
		Comments getComments = new Comments();
		
		comments.setCommentsContent(request.getParameter("commentsContent"));
		comments.setBrdNo(Integer.parseInt(request.getParameter("brdNo")));
		comments.setCommentsWriterNo(Integer.parseInt(request.getParameter("commentsWriterNo")));
		comments.setCommentsWriterId(request.getParameter("commentsWriterId"));
		
		getComments = new BoardService().saveComments(comments);
		response.setContentType("application/json;charset=UTF-8");
		System.out.println(getComments);
		Gson gson =  new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(getComments, response.getWriter());
	}

}
