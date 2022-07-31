package com.muze.mvc.board2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.board2.model.service.Board2Service;
import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.FileRename;
import com.muze.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/support/write")
public class Board2tWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Board2tWriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		String type = request.getParameter("type");
		
		if(loginMember != null) {
			if(type.equals("NOTICE")) {
				request.getRequestDispatcher("/views/support/notice_brd_crud.jsp").forward(request, response);				
			} else if(type.equals("QNA")) {
				request.getRequestDispatcher("/views/support/qna_brd_crud.jsp").forward(request, response);				
			}
		} else {
			request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/member/login");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;

		Board2 board = null;
		
		String type = request.getParameter("type");
				
		// 파일 저장 경로
		String path = getServletContext().getRealPath("/resources/upload/board/permanant");
		
		// 파일 최대 사이즈
		int maxSize = 10485760;
		
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		
		String brdCategory = mr.getParameter("brdCategory");
		String brdWriterId = mr.getParameter("brdWriterId");
		String brdTitle = mr.getParameter("brdTitle");
		String brdContent = mr.getParameter("brdContent");
		
    	String filesystemName = mr.getFilesystemName("upfile");
    	String originalFileName = mr.getOriginalFileName("upfile");
    	
    	System.out.println(type);
    	System.out.println(brdCategory);
    	System.out.println(brdWriterId);
    	System.out.println(brdTitle);	
    	System.out.println(brdContent);
    	System.out.println(filesystemName);
    	System.out.println(originalFileName);

    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		if(loginMember != null) {
		board = new Board2();
		board.setBrdWriterNo(loginMember.getMemberNo());
		board.setBrdCategory(brdCategory);
		board.setBrdTitle(brdTitle);
		board.setBrdWriterId(brdWriterId);
		board.setBrdContent(brdContent);
		board.setBrdOriginalFileName(originalFileName);
		board.setBrdRenamedFileName(filesystemName);
		board.setBrdType(type);
		
		System.out.println(board);
		
		result = new Board2Service().save(board);
		
			if(result > 0) {
				request.setAttribute("msg", "게시글 등록 성공");
				request.setAttribute("location", "/support/list?type=" + type);
			} else {
				request.setAttribute("msg", "게시글 등록 실패");
				request.setAttribute("location", "/support/list?type=" + type);
			}
		} else {
			request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/member/login");
		}
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
