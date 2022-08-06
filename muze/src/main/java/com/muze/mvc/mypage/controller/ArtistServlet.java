package com.muze.mvc.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.service.ArtOrderService;
import com.muze.mvc.mypage.model.vo.ArtOrder;

@WebServlet("/mypage/artist")
public class ArtistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ArtistServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 로그인 체크 & 본인 게시글 여부 확인 
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
    	if (loginMember != null) {
			Artist loginartist = new MemberService().getArtistByNo(loginMember.getMemberNo());
			Artist artist = new Artist();
			artist.setArtistNo(loginMember.getMemberNo());
//			artist.setBusName(loginartist.getBusName());
			artist.setBusName(loginMember.getMemberName());
			request.setAttribute("artist", artist);
			
	    	// 3rd row 
			List<ArtOrder> list = null;
			list = new ArtOrderService().getArtOrder(artist);
	
			request.setAttribute("list", list);
    	
    	} else {
    		request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("location", "/");		
    		
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
    	
    	request.getRequestDispatcher("/views/mypage/welcome.jsp").forward(request, response);
	}

}
