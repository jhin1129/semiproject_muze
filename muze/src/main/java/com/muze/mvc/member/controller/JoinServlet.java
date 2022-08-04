package com.muze.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.common.util.FileRename;
import com.muze.mvc.event.model.service.MileageService;
import com.muze.mvc.member.model.service.MemberService;
import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;


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
    	
		// 파일 저장 경로
		String path = getServletContext().getRealPath("/resources/upload/artistImg");
		
		// 파일 최대 사이즈
		int maxSize = 10485760;
		
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    	
    	int resultArtist = 0;

	    String joinType = mr.getParameter("memberFl");
	    
	    	member.setMemberId(mr.getParameter("memId"));
	    	member.setMemberPassword(mr.getParameter("memPw"));
	    	member.setMemberRole(joinType);
	    	member.setMemberName(mr.getParameter("memNm"));
	    	member.setMemberEmail(mr.getParameter("email"));
	    	member.setMemberPhonenumber(mr.getParameter("cellPhone"));
	    	member.setMemberAddress(mr.getParameter("address"));
	    	
	    	System.out.println(joinType);
	    	System.out.println(member);
	    	
	    	int resultMember = new MemberService().saveMember(member);
	    	int insertMileage = new MileageService().insertJoinMileage(resultMember);	    	
	    	
	    	
	    	if ("MEMBER_ROLE_ARTIST".equals(joinType)) {
	    	   	Artist artist = new Artist();
	    				
	    		artist.setArtistNo(resultMember);
	    		artist.setArtistImg(mr.getFilesystemName("image"));
	    		artist.setArtistIntroduce(mr.getParameter("introduction"));
	    		artist.setBusName(mr.getParameter("company"));
	    		artist.setBusLicense(mr.getParameter("busiNo"));

	    		System.out.println(artist);

		    	resultArtist = new MemberService().saveArtist(artist);
		    	
		    	if(resultMember > 0 && resultArtist > 0 && insertMileage > 0) {
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
	    		
	    	if(resultMember > 0 && insertMileage > 0) {
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
