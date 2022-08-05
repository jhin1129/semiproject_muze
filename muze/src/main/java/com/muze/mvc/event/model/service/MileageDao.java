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
		String query = "INSERT INTO MILEAGE VALUES(SEQ_POINT.NEXTVAL, ?, 100, 'ATT', SYSDATE, 'IN', ?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, this.getPointCur(connection, memberNo) + 100);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertOrderMileage(Connection connection, int memberNo, int i) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pointNo = 0;
		String query = "INSERT INTO MILEAGE VALUES(SEQ_POINT.NEXTVAL, ?, ?, 'ORDER', SYSDATE, 'OUT', ?)";
		
		try {
			pstmt = connection.prepareStatement(query, new String[] {"POINT_NO"});
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, i);
			pstmt.setInt(3, this.getPointCur(connection, memberNo)-i);
			
			pstmt.executeUpdate();
			
			rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				pointNo = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return pointNo;
	}

	public int getPointCur(Connection connection, int memberNo) {
		int pointCur = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String query = "SELECT POINT_CUR FROM MILEAGE WHERE MEMBER_NO=? ORDER BY POINT_NO DESC";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pointCur = rs.getInt("POINT_CUR");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pointCur;
	}
	
	// 회원가입 시 마일리지
		public int insertJoinMileage(Connection connection, int memberNo) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = "INSERT INTO MILEAGE VALUES(SEQ_POINT.NEXTVAL, ?, 10000, 'JOIN', SYSDATE, 'IN', 10000)";
			
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
}