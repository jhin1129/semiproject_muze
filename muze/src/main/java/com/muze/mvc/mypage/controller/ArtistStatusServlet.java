package com.muze.mvc.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.service.ArtOrderService;

@WebServlet("/mypage/artist_status")
public class ArtistStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ArtistStatusServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
    	if (loginMember != null) {
    		String status = request.getParameter("status"); // ok
    		String[] orderNoS = request.getParameterValues("orderNo"); // ok
			
    		result = new ArtOrderService().updateStatus(orderNoS, status);
    		
        	if (result > 0) {
        		request.setAttribute("msg", "주문 상태가 변경되었습니다.");
    			request.setAttribute("location", "/mypage/artist");	
			}else {
	    		request.setAttribute("msg", "주문 상태를 변경하는데 실패하였습니다. 관리자에게 문의하세요.");
				request.setAttribute("location", "/");	
			}
    	
    	} else {
    		request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("location", "/");		
    	}
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}
