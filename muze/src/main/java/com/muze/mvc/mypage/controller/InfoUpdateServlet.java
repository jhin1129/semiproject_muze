package com.muze.mvc.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.service.MyInfoService;

@WebServlet("/mypage/updateinfo")
public class InfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InfoUpdateServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;

    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
	    
			if (loginMember != null) {
	    		Member member = new Member();
        
	        	member.setMemberId(request.getParameter("memId"));
	        	member.setMemberPassword(request.getParameter("memPw"));
	        	member.setMemberName(request.getParameter("memNm"));
	        	member.setMemberPhonenumber(request.getParameter("cellPhone"));
	        	member.setMemberEmail(request.getParameter("email"));
	        	member.setMemberAddress(request.getParameter("address"));
	        	member.setMemberNo(loginMember.getMemberNo());
	    		
	    		result = new MyInfoService().save(member);
	    		
	        	if (result > 0) {
	        		request.setAttribute("msg", "회원 정보 수정 완료. 다시 로그인해 주세요.");
	    			request.setAttribute("location", "/member/logout");	
				}else {
		    		request.setAttribute("msg", "회원 정보 수정에 실패하였습니다. 관리자에게 문의해 주세요.");
					request.setAttribute("location", "/mypage/welcome");	
				}
        	
		    } else {
	    		request.setAttribute("msg", "로그인 후 수정해 주세요.");
				request.setAttribute("location", "/");			
		    }
		    request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}
