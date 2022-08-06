package com.muze.mvc.event.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.muze.mvc.event.model.vo.Mileage;

public class MileageService {

	public int insertATTMileage(int memberNo) {
		int result = 0;
		Connection connection = getConnection();
		result = new MileageDao().insertAttMileage(connection, memberNo);
	
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	// 회원가입 시 마일리지
	public int insertJoinMileage(int memberNo) {
		int result = 0;
		Connection connection = getConnection();
		
		try {
			result = new MileageDao().insertJoinMileage(connection, memberNo);
			commit(connection);
		} catch (Exception e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
		return result;
	}


	public int insertOrderMileage(int memberNo, int i) {
		int result = 0;
		Connection connection = getConnection();
		result = new MileageDao().insertOrderMileage(connection, memberNo, i);
	
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
		
		
	}
	
	public int getCurrentMileage(int memberNo) {
		Connection connection = getConnection();
		int mileage = new MileageDao().getPointCur(connection, memberNo);
		
		close(connection);
		
		return mileage;
		
	}
}

