package com.muze.mvc.member.service;

import java.sql.Connection;

import com.muze.mvc.common.jdbc.JDBCTemplate;
import com.muze.mvc.member.model.dao.MemberDao;
import com.muze.mvc.member.model.vo.Member;

public class MemberService {

	public Member login(String loginId, String loginPwd) {
		Connection connection = JDBCTemplate.getConnection();
		
		Member member = new MemberDao().findMemberById(connection, loginId);;
		
		JDBCTemplate.close(connection);
		
		if(member == null || !member.getMemberPassword().equals(loginPwd)) {
			return null;
		} else {
			return member;			
		}
		
		
	}

	public int save(Member member) {
		int result = 0;

		
		return result;
	}
}