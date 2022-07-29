package com.muze.mvc.member.model.service;

import java.sql.Connection;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;
import com.muze.mvc.member.model.dao.MemberDao;
import com.muze.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDao memberDao = new MemberDao();
	
	public static final String MEMBER_ROLE_USER = "U";
	public static final String MEMBER_ROLE_ADMIN = "D";
	public static final String MEMBER_ROLE_ARTIST = "R";


	public Member login(String loginId, String loginPwd) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, loginId);;
		
		close(connection);
		
		if(member == null || !member.getMemberPassword().equals(loginPwd)) {
			return null;
		} else {
			return member;			
		}
		
		
	}

	public int save(Member member) {
		int result = 0;
		Connection connection = getConnection();
		
		try {
			result = memberDao.insertMember(connection, member);
			commit(connection);
		} catch (Exception e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
		return result;
	}

	// 아이디 중복 검사
	public Boolean isDuplicateID(String newMemId) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, newMemId);
		
		close(connection);
		
		return member != null;
	}

	// 이메일 인증
	public int selectEmail(String email) {
		int result = 0;
		Connection connection = getConnection();
		try {
			result = memberDao.selectEmail(connection, email);
		} catch (Exception e) {
			throw e;
		} finally {
			close(connection);
		}
		return result;
	}
	
	

}