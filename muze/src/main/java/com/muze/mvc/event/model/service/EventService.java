package com.muze.mvc.event.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;
import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import com.muze.mvc.event.model.vo.Event;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.event.model.dao.EventDao;
import com.muze.mvc.event.model.vo.Mileage;

public class EventService {
	public Event calendar_event;
	
//	public EventService(Event e) {
//		calendar_event = e;
//	}
	
/*	public int save(Mileage mileage) {
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
	}*/
	
	EventDao eventdao = new EventDao();
	
	public int saveEvent(Event event) {
		int result = 0;
		Connection connection = getConnection();
//		result = new EventDao().insertEvent(connection, memberNo, calendar_event.getEvAttendDate());
		
		try {
			result = eventdao.insertEvent(connection, event);
			commit(connection);
		} catch (Exception e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
		return result;
	}

	public List<Event> getAttendCheck(Member member) {
		List<Event> list = null;
		Connection connection = getConnection();
		
		list = new EventDao().getAttendCheck(connection, member);
		
		close(connection);
		
		return list;
	}
}
