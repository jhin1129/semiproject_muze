package com.muze.mvc.board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board.model.vo.Comments;
import com.muze.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/board/commentsupdate")
public class CommentsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CommentsUpdateServlet() {
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commentsWriterNo = Integer.parseInt(request.getParameter("commentsWriterNo"));
		
		boolean selfCheck = new BoardService().selfCheck(request, commentsWriterNo);
		
		if(selfCheck) {
			int result = 0;
	    	Comments comments = new Comments();
	    	Comments getComments = new Comments();
	    	comments.setCommentsNo(Integer.parseInt(request.getParameter("commentsNo")));
	    	comments.setCommentsContent( request.getParameter("commentsContent"));
	    	
	    	getComments = new BoardService().saveComments(comments);

	    	if(getComments.getCommentsNo() > 0) {
				new Gson().toJson(getComments.getCommentsNo(), response.getWriter());
			}
    	}

	}

}
