package com.muze.mvc.board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;


@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardUpdateServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board board = null;
    	int brdNo = Integer.parseInt(request.getParameter("no"));
    	
    	
    	board = new BoardService().getBoardByNo(brdNo, true);
    	
    	System.out.println(board);
    	
    	request.setAttribute("board", board);
    	request.getRequestDispatcher("/views/community/board/board_update.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	Board board = null;
    	// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/board/permanant");
    	
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	board = new Board();
    	
    	board.setBrdNo(Integer.parseInt(mr.getParameter("no")));
    	board.setBrdTitle(mr.getParameter("title"));
    	board.setBrdContent(mr.getParameter("content"));
    	board.setBrdType(mr.getParameter("type"));
    	
    	String originalFileName = mr.getOriginalFileName("upfile");
    	String filesystemName = mr.getFilesystemName("upfile");
    	
    	if (originalFileName != null && !originalFileName.equals("")) {
    		File file = new File(path + "/" + mr.getParameter("renamedFileName"));
    		
    		if (file.exists()) {
				file.delete();
			}
    		
    		board.setBrdOriginalFileName(originalFileName);
        	board.setBrdRenamedFileName(filesystemName);    		
		} else {
			board.setBrdOriginalFileName(mr.getParameter("originalFileName"));
	    	board.setBrdRenamedFileName(mr.getParameter("renamedFileName"));
		}
    	
    	result = new BoardService().save(board);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 수정 성공");
    	} else {
    		request.setAttribute("msg", "게시글 수정 실패");
    	}
    	
    	response.sendRedirect(request.getContextPath()+"/board/view?no="+board.getBrdNo()+"&type="+board.getBrdType());
	}

}
