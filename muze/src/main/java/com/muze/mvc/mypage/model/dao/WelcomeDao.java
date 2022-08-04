package com.muze.mvc.mypage.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.vo.Welcome;

public class WelcomeDao {

	public Welcome getWelcomeRow(Connection connection, int member) {
		Welcome welcomeRow = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT M.MEMBER_NO, M.MEMBER_NAME, MI.POINT_CUR, MI.POINT_NO, COUNT(*) AS CNT "
						+ "FROM MEMBER M "
						+ "JOIN MILEAGE MI ON (M.MEMBER_NO = MI.MEMBER_NO) "
						+ "JOIN BOARD B ON (MI.MEMBER_NO = B.BRD_WRITER_NO) "
						+ "WHERE M.MEMBER_NO = ? AND BRD_TYPE = 'REVIEW' AND BRD_STATUS = 'Y' "
						+ "GROUP BY M.MEMBER_NO, M.MEMBER_NAME, MI.POINT_CUR, MI.POINT_NO "
						+ "ORDER BY MI.POINT_NO DESC ";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, member);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				do {
						welcomeRow = new Welcome();
						
						welcomeRow.setMemberNo(rs.getInt("MEMBER_NO"));
						welcomeRow.setMemberName(rs.getString("MEMBER_NAME"));
						welcomeRow.setMileageNow(rs.getInt("POINT_CUR"));
						welcomeRow.setBoardCount(rs.getInt("CNT"));
				}while(rs.next());
				
			}else {
				welcomeRow = new Welcome();
								
				welcomeRow.setMemberNo(0);
				welcomeRow.setMemberName("0");
				welcomeRow.setMileageNow(0);
				welcomeRow.setBoardCount(0);
			
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
