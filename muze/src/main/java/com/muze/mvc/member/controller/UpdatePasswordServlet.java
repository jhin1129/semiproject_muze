package com.muze.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Member;


@WebServlet(name = "updatePassword", urlPatterns = "/member/find_password_reset")
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;       
 
    public UpdatePasswordServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/find_password_reset.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		String msg = null;
		String location = request.getContextPath();
		String password = request.getParameter("memPw");
    	
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		
		
		if(member != null) {
			member.setMemberPassword(password);
			result = MemberService.updatePassword(member);
		
		
			msg = (result > 0) ? 
					"비밀번호를 성공적으로 변경했습니다." : 
						"비밀번호 변경을 실패했습니다.";
			
			location += "/member/find_password_complete";
		} else {
			msg = "오류가 발생했습니다.";				
			location += "/member/find_password_reset";
		}
		session.setAttribute("msg", msg);
		response.sendRedirect(location);		
	}
}
