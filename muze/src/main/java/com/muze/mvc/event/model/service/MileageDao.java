package com.muze.mvc.event.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MileageDao {

	public int insertMileage(Connection connection, int memberNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MILEAGE(MEMBER_NO, EV_ATTEND_DATE) VALUES()";
		
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
	

}
