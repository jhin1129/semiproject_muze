package com.muze.mvc.event.model.dao;
import static com.muze.mvc.common.jdbc.JDBCTemplate.*;
import java.sql.Date;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.muze.mvc.event.model.vo.Event;
import com.muze.mvc.event.model.vo.Mileage;
import com.muze.mvc.member.model.vo.Member;


public class EventDao {
	
		public int insertMileage (Connection connection, Mileage mileage) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = "INSERT INTO MILEAGE VALUES(SEQ_POINT,?,100,'ATT',DEFAULT,'IN')";
			
			try {
				pstmt = connection.prepareStatement(query);
				
				pstmt.setInt(1, mileage.getMemberNo());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
		
//		public int insertEvent(Connection connection, int memberNo, Date attend_date) {
//			int result = 0;
//			PreparedStatement pstmt = null;
//			String query = "INSERT INTO EVENT(MEMBER_NO, EV_ATTEND_DATE) VALUES(?,?)";
//			
//			try {
//				pstmt = connection.prepareStatement(query);
//				
//				pstmt.setInt(1, memberNo);
//				pstmt.setDate(2, attend_date);				
//				
//				result = pstmt.executeUpdate();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				close(pstmt);
//			}
//			
//			return result;
//		}

		public int insertEvent(Connection connection, Event event) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = "INSERT INTO EVENT(MEMBER_NO, EV_ATTEND_DATE) VALUES(?,?)";
			
			try {
				pstmt = connection.prepareStatement(query);
				
				pstmt.setInt(1, event.getMemberNo());
				pstmt.setDate(2, event.getEvAttendDate());				
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

		public List<Event> getAttendCheck(Connection connection, Member member) {
			List<Event> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "SELECT MEMBER_NO, EV_ATTEND_DATE FROM EVENT WHERE MEMBER_NO = ?";
			
			try {
				pstmt = connection.prepareStatement(query);
				
				pstmt.setInt(1, member.getMemberNo());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					Event event = new Event();
					
					event.setMemberNo(rs.getInt("MEMBER_NO"));
					event.setEvAttendDate(rs.getDate("EV_ATTEND_DATE"));
					
					list.add(event);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return list;
		}
}