package com.muze.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Member;


@WebServlet(name = "join", urlPatterns = "/member/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JoinServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 회원가입 페이지로 전환해주는 기능
    	request.getRequestDispatcher("/views/member/join.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Member member = new Member();
    	
    	member.setMemberId(request.getParameter("memId"));
    	member.setMemberPassword(request.getParameter("memPw"));
    	member.setMemberName(request.getParameter("memNm"));
    	member.setMemberEmail(request.getParameter("email"));
    	member.setMemberPhonenumber(request.getParameter("cellPhone"));
    	member.setMemberAddress(request.getParameter("address"));
    	
    	System.out.println(member);
    	
    	int result = new MemberService().save(member);
    	
    	if(result > 0) {
    		// 회원 가입 완료
        	request.setAttribute("msg", "회원 가입 성공");
    		request.setAttribute("location", "/member/join_ok");
    	} else {
    		// 회원 가입 실패
        	request.setAttribute("msg", "회원 가입 실패");
    		request.setAttribute("location", "/member/join");
    	}
		
		request.getRequestDispatcher("/views/member/msg.jsp").forward(request, response);
	}

}
