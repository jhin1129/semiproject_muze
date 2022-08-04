package com.muze.mvc.event.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.muze.mvc.event.model.vo.Mileage;

public class MileageDao {

	public int insertAttMileage(Connection connection, int memberNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MILEAGE VALUES(SEQ_POINT.NEXTVAL, ?, 100, '출석체크', SYSDATE, 'IN', 100)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, memberNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Mileage currentMileage(Connection connection, int memberNo) {
		Mileage mileage = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String query = "SELECT SUM(POINT_AFTER) FROM MILEAGE WHERE MEMBER_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			mileage = new Mileage();
			
			mileage.setPointAfter(rs.getInt("POINT_AFTER"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return mileage;
	}
	

}
