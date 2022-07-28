package com.muze.mvc.mypage.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.muze.mvc.mypage.model.vo.Welcome;

public class WelcomeDao {

	public Welcome getWelcomeRow(Connection connection) {
		Welcome welcomeRow = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT M.MEMBER_NO, M.MEMBER_NAME, MI.POINT_PROCESS, COUNT(*) AS CNT "
						+ "FROM MEMBER M\n"
						+ "JOIN MILEAGE MI ON (M.MEMBER_NO = MI.MEMBER_NO) "
						+ "JOIN BOARD B ON (MI.MEMBER_NO = B.BRD_WRITER_NO) "
						+ "WHERE M.MEMBER_NO = 9 AND BRD_TYPE = 'REVIEW' "
						+ "GROUP BY M.MEMBER_NO, M.MEMBER_NAME, MI.POINT_PROCESS";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				welcomeRow = new Welcome();
			
				welcomeRow.setMemberNo(rs.getInt("MEMBER_NO"));
				welcomeRow.setMemberName(rs.getString("MEMBER_NAME"));
				welcomeRow.setMileageNow(rs.getInt("POINT_PROCESS"));
				welcomeRow.setBoardCount(rs.getInt("CNT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return welcomeRow;
	}
	
}
