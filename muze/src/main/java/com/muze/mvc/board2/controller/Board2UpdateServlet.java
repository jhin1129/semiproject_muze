package com.muze.mvc.board2.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board2.model.service.Board2Service;
import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/support/update")
public class Board2UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     public Board2UpdateServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board2 board = null;
		
		int brdNo = Integer.parseInt(request.getParameter("brdNo"));
		
		String type = request.getParameter("type");

		System.out.println("게시글 번호 " + brdNo);
	
		board = new Board2Service().getBoardByNo(brdNo, type);
	
		request.setAttribute("board", board);
	
		request.setAttribute("type", type);	
		
		if(type.equals("NOTICE")) {
			request.getRequestDispatcher("/views/support/notice_brd_update.jsp").forward(request, response);
		} else if(type.equals("QNA")) {
			request.getRequestDispatcher("/views/support/qna_brd_update.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int result = 0;
		
		Board2 board = null;
		
		// 파일 저장 경로
		String path = getServletContext().getRealPath("/resources/upload/board/permanant");
		
		// 파일 최대 사이즈
		int maxSize = 10485760;
		
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());

		// 게시글 번호 전달 확인
		System.out.println(mr.getParameter("brdNo"));
		
		board = new Board2();
		
		board.setBrdNo(Integer.parseInt(mr.getParameter("brdNo")));
		board.setBrdTitle(mr.getParameter("brdTitle"));
		board.setBrdContent(mr.getParameter("brdContent"));
//		board.setBrdWriterId(mr.getParameter("brdWriterId"));

		
		System.out.println(board);
    	
    	String originalFileName = mr.getOriginalFileName("upfile");
    	String filesystemName = mr.getFilesystemName("upfile");		
		
    	if(originalFileName != null && !originalFileName.equals("")) {
    		
    		File file = new File(path + "/" + mr.getParameter("BrdRenamedFileName"));
    		if(file.exists()) {
    			file.delete();
    		}
    		
    		board.setBrdOriginalFileName(originalFileName);
    		board.setBrdRenamedFileName(filesystemName);
    	} else {
    		board.setBrdOriginalFileName(mr.getParameter("originalFileName"));
    		board.setBrdRenamedFileName(mr.getParameter("renamedFileName"));
    	}
		
		result = new Board2Service().save(board);
		
		if(result > 0) {
			request.setAttribute("msg", "게시글 수정 성공");
			request.setAttribute("location", "/");
		} else {
			request.setAttribute("msg", "게시글 수정 실패");
			request.setAttribute("location", "/");
		}
	
	request.setAttribute("location", "/support/view?no=" + board.getBrdNo());
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
