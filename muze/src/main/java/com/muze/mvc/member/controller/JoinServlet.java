package com.muze.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.member.service.MemberService;
import com.muze.mvc.member.vo.Member;


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
    	
    	member.setMember_id(request.getParameter("userId"));
    	member.setMember_password(request.getParameter("userPwd"));
    	member.setMember_name(request.getParameter("userName"));
    	member.setMember_phone_number(request.getParameter("phone"));
    	member.setMember_email(request.getParameter("email"));
    	member.setMember_address(request.getParameter("address"));
    	
    	System.out.println(member);
    	
    	int result = new MemberService().save(member);
    	
    	if(result > 0) {
    		// 회원 가입 완료
        	request.setAttribute("msg", "회원 가입 성공");
    		request.setAttribute("location", "/");
    	} else {
    		// 회원 가입 실패
        	request.setAttribute("msg", "회원 가입 실패");
    		request.setAttribute("location", "/member/enroll");
    	}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
