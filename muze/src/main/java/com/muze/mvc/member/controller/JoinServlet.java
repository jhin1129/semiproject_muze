package com.muze.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.muze.mvc.board.model.vo.Comments;
import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Artist;
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
    	HttpSession session = null;
    	Member member = new Member();
    	int resultArtist = 0;

	    String joinType = request.getParameter("memberFl");
	    
	    	member.setMemberId(request.getParameter("memId"));
	    	member.setMemberPassword(request.getParameter("memPw"));
	    	member.setMemberRole(joinType);
	    	member.setMemberName(request.getParameter("memNm"));
	    	member.setMemberEmail(request.getParameter("email"));
	    	member.setMemberPhonenumber(request.getParameter("cellPhone"));
	    	member.setMemberAddress(request.getParameter("address"));
	    	
		
	    	System.out.println(joinType);
	    	System.out.println(member);
	    	
	    	int resultMember = new MemberService().saveMember(member);
	    	
	    	
	    	if ("MEMBER_ROLE_ARTIST".equals(joinType)) {
	    	   	Artist artist = new Artist();
	    		
	    		artist.setArtistNo(resultMember);
	    		artist.setArtistImg(request.getParameter("image"));
	    		artist.setArtistIntroduce(request.getParameter("introduction"));
	    		artist.setBusName(request.getParameter("company"));
	    		artist.setBusLicense(request.getParameter("busiNo"));
	    		
	    		System.out.println(artist);

		    	resultArtist = new MemberService().saveArtist(artist);

		    	if(resultMember > 0 && resultArtist > 0) {
		    		session = request.getSession();
		    		// 회원 가입 완료
		    		
		    		session.setAttribute("join", member);
		    		request.setAttribute("msg", "회원 가입 성공");
		    		request.setAttribute("location", "/member/join_ok");
		    	} else {
		    		// 회원 가입 실패
		    		request.setAttribute("msg", "회원 가입 실패");
		    		request.setAttribute("location", "/member/join");
		    	}
		    	
		    	request.getRequestDispatcher("/views/member/msg.jsp").forward(request, response);  
				
	    	} else {
	    		
	    	if(resultMember > 0) {
    			session = request.getSession();
    			// 회원 가입 완료
    			
    			session.setAttribute("join", member);
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

}
