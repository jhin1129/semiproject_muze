package com.muze.mvc.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Comments;
import com.muze.mvc.member.model.vo.Member;


@WebServlet("/board/commentswrite")
public class CommentsWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CommentsWriteServlet() {
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> authority = new ArrayList<>();
		authority.add("MEMBER_ROLE_USER");
		authority.add("MEMBER_ROLE_ADMIN");
		authority.add("MEMBER_ROLE_ARTIST");
		
		boolean authorityCheck = new BoardService().authorityCheck(request, authority);
		
		if(authorityCheck) {
			HttpSession session = request.getSession(false);
			Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
			Comments comments = new Comments();
			Comments getComments = new Comments();
			
			comments.setCommentsContent(request.getParameter("commentsContent"));
			comments.setBrdNo(Integer.parseInt(request.getParameter("brdNo")));
			comments.setCommentsWriterNo(loginMember.getMemberNo());
			
			getComments = new BoardService().saveComments(comments);
			response.setContentType("application/json;charset=UTF-8");
			Gson gson =  new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(getComments, response.getWriter());
		} 

	}

}
