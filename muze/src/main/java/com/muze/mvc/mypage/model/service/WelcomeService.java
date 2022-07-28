package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.muze.mvc.mypage.model.dao.WelcomeDao;
import com.muze.mvc.mypage.model.vo.Delivery;

public class WelcomeService {

	public int getReviewC() {
		int result = 0;
		Connection connection = getConnection();
		
		result = new WelcomeDao().getReviewC(connection);
		
		close(connection);

		return result;
	}

	public int getMileageN() {
		int result = 0;
		Connection connection = getConnection();
		
		result = new WelcomeDao().getMileageN(connection);
		
		close(connection);

		return result;
	}

}
