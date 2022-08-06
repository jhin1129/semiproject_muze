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

	public Welcome getMileage(Connection connection, int memNo) {
		Welcome getMileage = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT M.MEMBER_NO, M.MEMBER_NAME, MI.POINT_CUR, MI.POINT_NO "
						+ "FROM MEMBER M "
						+ "JOIN MILEAGE MI ON (M.MEMBER_NO = MI.MEMBER_NO) "
						+ "WHERE MI.MEMBER_NO = ? "
						+ "ORDER BY MI.POINT_NO ASC ";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, memNo);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				do {
						getMileage = new Welcome();
							
						getMileage.setMemberNo(rs.getInt("MEMBER_NO"));
						getMileage.setMemberName(rs.getString("MEMBER_NAME"));
						getMileage.setMileageNow(rs.getInt("POINT_CUR"));
						getMileage.setPointNo(rs.getInt("POINT_NO"));
						
				}while(rs.next());
				
			}else {
				getMileage = new Welcome();
								
				getMileage.setMemberNo(0);
				getMileage.setMemberName("0");
				getMileage.setMileageNow(0);
				getMileage.setBoardCount(0);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return getMileage;
	}

	public Welcome getReview(Connection connection, int memNo) {
		Welcome getReview = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT M.MEMBER_NO, M.MEMBER_NAME, COUNT(*) AS CNT "
						+ "FROM MEMBER M "
						+ "JOIN MILEAGE MI ON (M.MEMBER_NO = MI.MEMBER_NO) "
						+ "JOIN BOARD B ON (MI.MEMBER_NO = B.BRD_WRITER_NO) "
						+ "WHERE M.MEMBER_NO = ? AND BRD_TYPE = 'REVIEW' AND BRD_STATUS = 'Y' "
						+ "GROUP BY M.MEMBER_NO, M.MEMBER_NAME " ;
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, memNo);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				do {
						getReview = new Welcome();
						
						getReview.setMemberNo(rs.getInt("MEMBER_NO"));
						getReview.setMemberName(rs.getString("MEMBER_NAME"));
						getReview.setBoardCount(rs.getInt("CNT"));
						
				}while(rs.next());
				
			}else {
				getReview = new Welcome();
								
				getReview.setMemberNo(0);
				getReview.setMemberName("0");
				getReview.setBoardCount(0);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return getReview;
	}

}
