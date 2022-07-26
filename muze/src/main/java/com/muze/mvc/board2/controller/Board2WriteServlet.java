package com.muze.mvc.board2.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.board2.model.service.Board2Service;
import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/Board2WriteServlet")
public class Board2WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Board2WriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		Board2 board = null;
		
		String path = getServletContext().getRealPath("/resources/upload/board");
		
		int maxSize = 10485760;
		
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		
		String brdTitle = mr.getParameter("brdTitle");
		String brdWriter = mr.getParameter("brdWriter");
		String brdContent = mr.getParameter("brdContent");
		
    	String filesystemName = mr.getFilesystemName("upfile");
    	String originalFileName = mr.getOriginalFileName("upfile");
    	
		HttpSession session = request.getSession(false);
		Member loginMemver = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		if(loginMember != null) {
		board = new Board2();
		
		board.setBrdTitle(brdTitle);
		board.setBrdWriterNo(loginMember.getNo());
		board.setBrdContent(brdContent);
		board.setBrdOriginalFileName(originalFileName);
		board.setBrdRenameFileName(originalFileName);
		
		result = new Board2Service().save(board);
		
			if(result > 0) {
				request.setAttribute("msg", "게시글 등록 성공");
				request.setAttribute("location", "/board/list");
			} else {
				request.setAttribute("msg", "게시글 등록 실패");
				request.setAttribute("location", "/board/list");
			}
		} else {
			request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/");
		}	
	request.getRequestDispatcher("/views/board/msg.jsp").forward(request, response);
	}

}
