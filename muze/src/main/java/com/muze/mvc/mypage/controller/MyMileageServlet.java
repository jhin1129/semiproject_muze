package com.muze.mvc.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.service.MyInfoService;
import com.muze.mvc.mypage.model.service.WelcomeService;
import com.muze.mvc.mypage.model.vo.MyMileage;
import com.muze.mvc.mypage.model.vo.Welcome;

@WebServlet("/mypage/mileage")
public class MyMileageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyMileageServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 체크 & 본인 게시글 여부 확인 
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
    	if (loginMember != null) {
    		// 로그인 객체의 PK값을 넘기기 위한 객체 생성 
			Member member = new Member();
			member.setMemberName(loginMember.getMemberName());
    		int memNo = loginMember.getMemberNo();
    		
    		request.setAttribute("member", member);
	    	
			// 1st row
	    	Welcome welcomeRow = new WelcomeService().getMileage(memNo);
	    	Welcome welcomeRow2 = new WelcomeService().getReview(memNo);
	    	
	    	request.setAttribute("welcomeRow", welcomeRow);
	    	request.setAttribute("welcomeRow2", welcomeRow2);
			
			// 검색
			List<MyMileage> list = null;
			
			// 매개 값 (검색 날짜) 가져오기 
			String dateFrom = request.getParameter("dateFrom");
			String dateTo = request.getParameter("dateTo");
			
			// 처리 결과 
			list = new MyInfoService().infoMileage(dateFrom, dateTo, memNo);
			
			request.setAttribute("list", list);
	    	request.getRequestDispatcher("/views/mypage/my_mileage.jsp").forward(request, response);
	    	
    	} else {
    		request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("location", "/");		
    		
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
	}

}
