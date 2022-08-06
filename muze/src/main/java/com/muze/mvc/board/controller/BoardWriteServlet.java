package com.muze.mvc.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.FileRename;
import com.muze.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> authority = new ArrayList<>();
		String type = request.getParameter("type");
		
		authority.add("MEMBER_ROLE_USER");
		if(type.equals("FREE")) {
			authority.add("MEMBER_ROLE_ADMIN");
			authority.add("MEMBER_ROLE_ARTIST");
		}
		
		boolean authorityCheck = new BoardService().authorityCheck(request, authority);
		
		if(!authorityCheck) {
			if(type.equals("FREE")) {
				request.setAttribute("msg", "로그인해 주세요");
			} else if(type.equals("REVIEW")) {
				request.setAttribute("msg", "일반 계정으로 로그인해 주세요");
			}
			request.setAttribute("location", "/board/list?type="+type);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			HttpSession session = request.getSession(false);
			Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
			List<Product> list = null;
			list = new BoardService().getProductListByOrdersMemberNo(loginMember.getMemberNo());
			if(list.size() == 0 && type.equals("REVIEW")) {
				request.setAttribute("msg", "구매하신 작품이 없습니다. 작품 구매후 리뷰글을 작성해주세요.");
				request.setAttribute("location", "/board/list?type="+type);
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			} else {
				request.setAttribute("type", type);
				request.getRequestDispatcher("/views/community/board/board_write.jsp").forward(request, response);
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> authority = new ArrayList<>();
		String type = request.getParameter("type");
    	int result = 0;
    	Board board = null;
    	
    	authority.add("MEMBER_ROLE_USER");
    	if(type.equals("FREE")) {
    		authority.add("MEMBER_ROLE_ADMIN");
    		authority.add("MEMBER_ROLE_ARTIST");
    	}
    	
    	
    	boolean authorityCheck = new BoardService().authorityCheck(request, authority);
    	
    	if(!authorityCheck) {
			request.setAttribute("msg", "접근 권한이 없습니다.");
			request.setAttribute("location", "/board/list?type="+type);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	} else {
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
    		int writerNo = Integer.parseInt(mr.getParameter("writerNo"));
    		String content = mr.getParameter("content");
    		
    		// 파일에 대한 정보를 가져올 때
    		String filesystemName = mr.getFilesystemName("upfile");
    		String originalFileName = mr.getOriginalFileName("upfile");
    		
    		String img = new BoardService().getImg(content);
    		
    		board = new Board();
    		
    		board.setBrdTitle(title);
    		board.setBrdWriterNo(writerNo);
    		if(type.equals("REVIEW")) {
    			board.setBrdProNo(Integer.parseInt(mr.getParameter("proNo")));
    		}
    		board.setBrdContent(content);
    		board.setBrdOriginalFileName(originalFileName);
    		board.setBrdRenamedFileName(filesystemName);
    		board.setBrdType(type);
    		board.setBrdImg(img);
    		result = new BoardService().saveBoard(board);
    		
			if(result > 0) {
	    		request.setAttribute("msg", "게시글 작성에 성공하였습니다.");
	    		request.setAttribute("location", "/board/list?type="+type);
			} else {
	    		request.setAttribute("msg", "게시글 작성에 실패하였습니다.");
	    		request.setAttribute("location", "/board/list?type="+type);
			}
//	    	new BoardService().deleteAllTempFiles(getServletContext().getRealPath("/resources/upload/board/temporary"));
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

    		
    	}
	}

}
