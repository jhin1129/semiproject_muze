package com.muze.mvc.event.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.muze.mvc.event.model.dao.EventDao;

public class MileageService {

	public int insertMileage(int memberNo) {
		int result = 0;
		Connection connection = getConnection();
		result = new MileageDao().insertMileage(connection, memberNo);
	
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

}
