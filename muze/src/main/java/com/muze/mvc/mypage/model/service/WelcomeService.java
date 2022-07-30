package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.muze.mvc.member.vo.Member;
import com.muze.mvc.mypage.model.dao.MyOrderDao;
import com.muze.mvc.mypage.model.dao.WelcomeDao;
import com.muze.mvc.mypage.model.vo.MyOrder;
import com.muze.mvc.mypage.model.vo.Welcome;

public class WelcomeService {

	public Welcome getWelcomeRow(Member member) {
		Welcome welcomeRow = null;
		
		Connection connection = getConnection();

		welcomeRow = new WelcomeDao().getWelcomeRow(connection, member);
		
		close(connection);
		
		return welcomeRow;
	}
	
}
