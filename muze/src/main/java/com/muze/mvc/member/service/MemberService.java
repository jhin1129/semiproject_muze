package com.muze.mvc.member.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.muze.mvc.member.dao.MemberDao;
import com.muze.mvc.member.vo.Member;

public class MemberService {

	public Member login(String loginId, String loginPwd) {
		Member member = new MemberDao().findMemberById(loginId);;
		
		if(member == null || !member.getMemberPassword().equals(loginPwd)) {
			return null;
		} else {
			return member;			
		}
		
		
	}
}