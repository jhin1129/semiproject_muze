package com.muze.mvc.admin.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.admin.model.dao.AdminDao;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.member.model.vo.Member;

public class AdminService {

	public int getMemberCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new AdminDao().getMemberCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Member> getMemberList(PageInfo pageInfo) {
		List<Member> list = null;
		Connection connection = getConnection();
		
		list = new AdminDao().getMemberList(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public int hideContent(int[] hcontents) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new AdminDao().hideContent(connection, hcontents);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);
		
		return result;
	}

	public int openContent(int[] ocontents) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new AdminDao().openContent(connection, ocontents);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);
		
		return result;
	}

	public int delMember(int[] dmembers) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new AdminDao().delMember(connection, dmembers);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);

		return result;
	}

}