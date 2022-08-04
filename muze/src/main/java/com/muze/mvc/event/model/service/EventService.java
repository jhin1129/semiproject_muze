package com.muze.mvc.event.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;
import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import com.muze.mvc.event.model.vo.Event;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.event.model.dao.EventDao;
import com.muze.mvc.event.model.vo.Mileage;

public class EventService {
	public Event calendar_event;
	
	EventDao eventdao = new EventDao();
	
//	public int saveEvent(Event event) {
//		int result = 0;
//		Connection connection = getConnection();
//		
//		try {
//			result = eventdao.insertEvent(connection, event);
//			commit(connection);
//		} catch (Exception e) {
//			rollback(connection);
//			throw e;
//		} finally {
//			close(connection);
//		}
//		return result;
//	}

	public List<Event> getAttendCheck(Member member) {
		List<Event> list = null;
		Connection connection = getConnection();
		
		list = new EventDao().getAttendCheck(connection, member);
		
		close(connection);
		
		return list;
	}

	public List<Event> getEventListByMemberNo(int memberNo) {
		List<Event> list = null;
		Connection connection = getConnection();
		
		list = new EventDao().getEventListByMemberNo(connection, memberNo);
		
		close(connection);
		
		return list;
	}

	public boolean isAlreadyEvent(int memberNo) {
		List<Event> list = null;
		Connection connection = getConnection();
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) +1;
		int day = now.get(Calendar.DAY_OF_MONTH);

		list = new EventDao().getEventListByMemberNo(connection, memberNo);
		
		close(connection);
		
		for(Event event : list) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(event.getEvAttendDate());
			System.out.println(calendar.get(Calendar.YEAR));
			System.out.println(calendar.get(Calendar.MONTH)+1);
			System.out.println(calendar.get(Calendar.DAY_OF_MONTH));
			
			if( (calendar.get(Calendar.YEAR) == year ) && (calendar.get(Calendar.MONTH)+1 == month) && (calendar.get(Calendar.DAY_OF_MONTH) == day)) {
				return true;
			}
		}
		
		return false;
	}
	
	public int insertEvent(int memberNo) {
		int result = 0;
		Connection connection = getConnection();
		result = new EventDao().insertEvent(connection, memberNo);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

}
