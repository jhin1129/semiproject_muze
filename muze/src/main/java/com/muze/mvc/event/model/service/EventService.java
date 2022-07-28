package com.muze.mvc.event.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.muze.mvc.event.model.dao.EventDao;
import com.muze.mvc.event.model.vo.Mileage;

public class EventService {
	
	public int save(Mileage mileage) {
		int result = 0;
		Connection connection = getConnection();
		
		if(mileage.getMemberNo() != 0) {
			result = new EventDao().insertAttMileage(connection, mileage);
		} 
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
}
