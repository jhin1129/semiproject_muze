package com.muze.mvc.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.vo.Member;

@WebServlet("/mypage/checkpwd")
public class InfoPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InfoPwdServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		if (loginMember != null) {
			 
			Member member = new Member();
			member.setMemberNo(loginMember.getMemberNo());			
			request.setAttribute("member", member);
		
			String type = request.getParameter("type");
			String path = null;
			
			if(type.equals("DELETE")) {
				path = "/views/mypage/info_pwd.jsp";
			} else if(type.equals("UPDATE")) {
				path = "/views/mypage/info_pwd.jsp";
			}
			
			request.setAttribute("type", type);
			request.getRequestDispatcher(path).forward(request, response);	
		
		} else {
					
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("location", "/");		
						
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
	}

}
