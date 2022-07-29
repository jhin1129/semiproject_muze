package com.muze.mvc.board2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board2.model.service.Board2Service;
import com.muze.mvc.board2.model.vo.Board2;

@WebServlet("/support/view")
public class Board2ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	public Board2ViewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board2 board = null;

		int brdNo = Integer.parseInt(request.getParameter("brdNo"));
		
		System.out.println(brdNo);
		
		String type = request.getParameter("type");
		
		// 새로 고침 시 조회수 증가 방지 로직
		// 쿠키에 조회한 게시글의 번호를 기록
		// 1. 쿠키에 조회한 이력이 있는지 확인
		Cookie[] cookies = request.getCookies();
		String boardHistory = ""; // 조회한 게시글 번호를 저장
		boolean hasRead = false; // 읽은 글에 true, 아니면 false
		
		if(cookies != null) {
			String name = null;
			String value = null;
			for(Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();
				
				// boardHistory 쿠키 값을 확인
				if(name.equals("boardHistory")) {
					boardHistory = value;
					
					if(value.contains("|" + brdNo + "|")) {
						hasRead = true;
						
						break;
					}
				}
			}
		}
		
		// 2. 읽지 않은 게시글이면 cookie에 기록
		if(!hasRead) {
			Cookie cookie = new Cookie("boardHistory", boardHistory + "|" + brdNo + "|");

			// 브라우저 종료 시 삭제
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		}
		
		board = new Board2Service().getBoardByNo(brdNo, hasRead, type);
		
		request.setAttribute("board", board);
		
		request.setAttribute("type", type);
		
		if(type.equals("NOTICE")) {
			request.getRequestDispatcher("/views/support/notice_brd_content.jsp").forward(request, response);
		} else if(type.equals("QNA")) {
			request.getRequestDispatcher("/views/support/qna_brd_content.jsp").forward(request, response);
		}
		
	}
	
}
