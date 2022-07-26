package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.muze.mvc.mypage.model.dao.WelcomeDao;
import com.muze.mvc.mypage.model.vo.Delivery;
import com.muze.mvc.mypage.model.vo.Welcome;

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

	public Delivery getOrderStatus() {
		Delivery orderStatus = null;
		Connection connection = getConnection();

		orderStatus = new WelcomeDao().getOrderStatus(connection);
		
		close(connection);
		
		return orderStatus;
	}
	
	
	
	
	
	
	
	
	

}
