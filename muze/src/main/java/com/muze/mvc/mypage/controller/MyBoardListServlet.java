package com.muze.mvc.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.service.MyBoardService;

/**
 * Servlet implementation class MyCommunityServlet
 */
@WebServlet("/mypage/community")
public class MyBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public MyBoardListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession(false);
		  Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		  	if (loginMember != null) {
				Member member = new Member();
				member.setMemberNo(loginMember.getMemberNo());
			
				String type = request.getParameter("type");
				int searchVal = member.getMemberNo();
				String path = null;
				int page = 0;
				int listCount = 0;
				PageInfo pageInfo = null;
				List<Board> list = null;
				
				// 기본 페이지 1로 설정 
				try {
					page = Integer.parseInt(request.getParameter("page"));
				} catch(NumberFormatException e) {
					page = 1;
				}
				
				// 게시판종류, 서치내용
				listCount = new MyBoardService().getBoardCount(type, searchVal);
				
				if(type.equals("REVIEW")) {
					pageInfo = new PageInfo(page, 5, listCount, 8);
					path = "/views/mypage/my_review.jsp";
				} else if(type.equals("FREE")) {
					pageInfo = new PageInfo(page, 5, listCount, 10);
					path = "/views/mypage/my_free_board.jsp";
				} else if(type.equals("REVIEW_ART")) {
					pageInfo = new PageInfo(page, 5, listCount, 8);
					path = "/views/mypage/my_review.jsp";
				} else if(type.equals("QNA")) {
					pageInfo = new PageInfo(page, 5, listCount, 10);
					path = "/views/mypage/my_qna.jsp";
				}
				
				list = new MyBoardService().getBoardList(pageInfo, type, searchVal);
					
					request.setAttribute("pageInfo", pageInfo);
					request.setAttribute("list", list);
					request.setAttribute("type", type);
					request.setAttribute("searchVal", searchVal);
					
					request.getRequestDispatcher(path).forward(request, response);	
		
		  	} else {
		  			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
					request.setAttribute("location", "/");		
		  		
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		  	}
			
			
	}

}