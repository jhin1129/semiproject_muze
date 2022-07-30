package com.muze.mvc.member.model.service;

import java.sql.Connection;
import java.util.Map;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;
import com.muze.mvc.member.model.dao.MemberDao;
import com.muze.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDao memberDao = new MemberDao();
	
	public static final String MEMBER_ROLE_USER = "U";
	public static final String MEMBER_ROLE_ADMIN = "D";
	public static final String MEMBER_ROLE_ARTIST = "R";


	// 로그인
	public Member login(String loginId, String loginPwd) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, loginId);
		
		close(connection);
		
		if(member == null || !member.getMemberPassword().equals(loginPwd)) {
			return null;
		} else {
			return member;			
		}
		
	}

	// 회원가입
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

	// 이메일 중복 검사
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

	// 아이디 찾기
	public Member findId(String memberName, String memberEmail) {
		Connection connection = getConnection();
		Member member = null;
		
		try {
			member = MemberDao.findId(connection, memberName, memberEmail);
		} catch (Exception e) {
			throw e;
		} finally {
			close(connection);
		}
		return member;
	}
	

	
	public int insertCertification(Map<String, String> map) {
		Connection connection = getConnection();
		int result = 0;
		try {
			result = memberDao.insertCertification(connection, map);
			commit(connection);
		} catch (Exception e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
		return result;
	}

	// 비밀번호 찾기 1차
	public Member findPasswordById(String memberId) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, memberId);
		
		close(connection);
		
		return member;			
		}
	
	// 비밀번호 찾기
	public Member findPassword(String memberId, String memberEmail) {
		Connection connection = getConnection();
		Member member = null;
		
		try {
			member = MemberDao.findPassword(connection, memberId, memberEmail);
		} catch (Exception e) {
			throw e;
		} finally {
			close(connection);
		}
		return member;
	}
}