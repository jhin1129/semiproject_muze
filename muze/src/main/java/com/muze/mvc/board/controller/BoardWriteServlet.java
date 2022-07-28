package com.muze.mvc.board.controller;

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

@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		request.setAttribute("type", type);
		request.getRequestDispatcher("/views/community/board/board_write.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	Board board = null;
    	String type = request.getParameter("type");
    	// 파일이 저장될 경로
    	String path = getServletContext().getRealPath("/resources/upload/board/permanant");
    	
    	// 파일의 최대 사이즈 지정 (10MB)
    	int maxSize = 10485760;
    	
    	// 인코딩 설정
    	String encoding = "UTF-8";
    	
    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	// 폼 파리미터로 넘어온 값들 (파일에 대한 정보 X)
    	String title = mr.getParameter("title");
    	String writer = mr.getParameter("writer");
    	String content = mr.getParameter("content");
    	
    	// 파일에 대한 정보를 가져올 때
    	String filesystemName = mr.getFilesystemName("upfile");
    	String originalFileName = mr.getOriginalFileName("upfile");
    	
   		System.out.println(content);
    	board = new Board();
    		
		board.setBrdWriterNo(1);
		board.setBrdTitle(title);
		if(type.equals("REVIEW")) {
			board.setBrdProNo(Integer.parseInt(mr.getParameter("proNo")));
		}
		System.out.println(board.getBrdProNo());
		board.setBrdContent(content);
		board.setBrdOriginalFileName(originalFileName);
		board.setBrdRenamedFileName(filesystemName);
		board.setBrdType(type);
		
		result = new BoardService().save(board);
    		
//		if(result > 0) {
//    		request.setAttribute("msg", "게시글 등록 성공");
//    		request.setAttribute("location", "/board/list");
//		} else {
//    		request.setAttribute("msg", "게시글 등록 실패");
//    		request.setAttribute("location", "/board/list");
//		}
//    	new BoardService().deleteAllTempFiles(getServletContext().getRealPath("/resources/upload/board/temporary"));
    	response.sendRedirect(request.getContextPath() + "/board/list?type=" + type);
	}

}
