package com.muze.mvc.admin.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;

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
		
		list = new AdminDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	

}