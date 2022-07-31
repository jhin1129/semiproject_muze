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
import com.muze.mvc.member.vo.Member;
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
		  // 로그인 체크 & 본인 게시글 여부 확인 
		  HttpSession session = request.getSession(false);
		  Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		  	if (loginMember != null) {
		  		// 로그인 객체의 PK값을 넘기기 위한 객체 생성 
				Member member = new Member();
				member.setMemberId(loginMember.getMemberId());
			
		
				// 검색을 위한 파라미터 
				String type = request.getParameter("type");
				String searchVal = member.getMemberId();
				String isSearch = "true";			
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
				
				// 게시판종류, 서치타입(작성자, 제목), 서치내용
				listCount = new MyBoardService().getBoardCount(type, searchVal);
				
				if(type.equals("REVIEW")) {
					pageInfo = new PageInfo(page, 5, listCount, 8);
					path = "/views/mypage/my_review.jsp";
				} else if(type.equals("FREE")) {
					pageInfo = new PageInfo(page, 5, listCount, 10);
					path = "/views/mypage/my_community.jsp";
				}
				
				// 그려주기위한 리스트에, 페이지 번호와 검색용 파라미터값을 넣어준다. (위에서 ""로 초기화하여 널값 처리를 해둠)
				// 선택된 값들로 가져온 객체들을 리스트에 담아온다. 
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
