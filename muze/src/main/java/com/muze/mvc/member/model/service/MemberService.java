package com.muze.mvc.member.model.service;

import java.sql.Connection;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;
import com.muze.mvc.member.model.dao.MemberDao;
import com.muze.mvc.member.model.vo.Member;

public class MemberService {

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
		
		result = new MemberDao().insertMember(connection, member);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		return result;
	}

	// 아이디 중복 검사
	public Boolean isDuplicateID(String memId) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, memId);
		
		close(connection);
		
		return member != null;
	}
}