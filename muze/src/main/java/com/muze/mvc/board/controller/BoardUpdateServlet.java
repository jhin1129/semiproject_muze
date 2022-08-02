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
import com.muze.mvc.board.model.vo.Product;
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
    	int brdWriterNo = Integer.parseInt(request.getParameter("brdWriterNo"));
    	String type = request.getParameter("type");
    	
    	boolean selfCheck = new BoardService().selfCheck(request, brdWriterNo);
    	
    	if(!selfCheck) {
    		request.setAttribute("msg", "접근 권한이 없습니다.");
			request.setAttribute("location", "/board/view?type="+type+"&no="+brdNo);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}else {
    		board = new BoardService().getBoardByBrdNo(brdNo, true, type);
    		
    		request.setAttribute("board", board);
    		request.setAttribute("type", type);
    		if(type.equals("REVIEW")) {
    			Product product = new Product();
    			product = new BoardService().getProductByProNo(board.getBrdProNo());
    			request.setAttribute("product", product);
    		}
    		
    		request.getRequestDispatcher("/views/community/board/board_update.jsp").forward(request, response);
    	}
    	
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
    	board.setBrdProNo(Integer.parseInt(mr.getParameter("proNo")));
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
    	
    	String img = new BoardService().getImg(mr.getParameter("content"));
    	board.setBrdImg(img);
    	
    	result = new BoardService().saveBoard(board);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 수정 성공");
    	} else {
    		request.setAttribute("msg", "게시글 수정 실패");
    	}
    	
    	response.sendRedirect(request.getContextPath()+"/board/view?no="+board.getBrdNo()+"&type="+board.getBrdType());
	}

}
