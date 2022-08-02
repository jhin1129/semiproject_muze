package com.muze.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board.model.vo.Comments;
import com.muze.mvc.board.model.vo.Product;


@WebServlet("/board/view")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardViewServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Board board = null;
    	List<Comments> commentsList = null;
    	String type = request.getParameter("type");
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	// 새로 고침 시 조회 수가 증가하는 것을 방지하는 로직
    	// 쿠키에 조회한 게시글의 번호를 기록하여 한 번 조회하면 그 뒤에는 조회 수가 올라가지 않도록 설정
    	// 1. 쿠키에 조회한 이력이 있는지 확인
    	Cookie[] cookies = request.getCookies();
    	String boardHistory = ""; // 조회한 게시글 번호를 저장하는 변수
    	boolean hasRead = false; // 읽은 글이면 true, 안 읽었으면 false
    	
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		for (Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();
				
				// boardHistory인 쿠키 값을 찾기
				if(name.equals("boardHistory")) {
					boardHistory = value;
					
					if(value.contains("|" + no + "|")) {
						hasRead = true;
						
						break;
					}
				}
			}
    	}
    	
    	// 2. 읽지 않은 게시글이면 cookie에 기록
    	if(!hasRead) {
    		Cookie cookie = new Cookie("boardHistory", boardHistory + "|" + no + "|");
        	
        	cookie.setMaxAge(-1); // 브라우저 종료 시 삭제
        	response.addCookie(cookie);
    	}    	
    	
    	
    	board = new BoardService().getBoardByBrdNo(no, hasRead, type);
    	
    	if(type.equals("REVIEW")) {
    		Product product = new Product();
    		product = new BoardService().getProductByProNo(board.getBrdProNo());
    		request.setAttribute("product", product);
    	}
    	
    	commentsList = new BoardService().getCommentsList(no);
    	
    	request.setAttribute("type", type);
    	request.setAttribute("board", board);
    	request.setAttribute("commentsList", commentsList);
    	request.getRequestDispatcher("/views/community/board/board_view.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
