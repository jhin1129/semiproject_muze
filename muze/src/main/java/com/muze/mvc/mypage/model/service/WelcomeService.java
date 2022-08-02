package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.dao.WelcomeDao;
import com.muze.mvc.mypage.model.vo.Welcome;

public class WelcomeService {

	public Welcome getWelcomeRow(int member) {
		Welcome welcomeRow = null;
		
		Connection connection = getConnection();

		welcomeRow = new WelcomeDao().getWelcomeRow(connection, member);
		
		close(connection);
		
		return welcomeRow;
	}

}
