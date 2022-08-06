package com.muze.mvc.mypage.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.vo.MyMileage;

public class MyInfoDao {

	// 마일리지 가져오기 
	public List<MyMileage> getMileage(Connection connection, String dateFrom, String dateTo, int memNo) {
		List<MyMileage> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT POINT_NO, MEMBER_NO, POINT, POINT_ROUTE, POINT_DATE, POINT_IN_OUT, POINT_CUR "
						+ "FROM MILEAGE "
						+ "WHERE POINT_DATE BETWEEN ? AND TO_DATE(TO_CHAR( ? ))+1 AND MEMBER_NO = ?"
						+ "ORDER BY POINT_NO ASC " ;
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dateFrom);
			pstmt.setString(2, dateTo);
			pstmt.setInt(3, memNo); 

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MyMileage myMileage = new MyMileage();
				
				myMileage.setInOut(rs.getString("POINT_IN_OUT"));
				myMileage.setPointDate(rs.getDate("POINT_DATE"));
				myMileage.setMemberNo(rs.getInt("MEMBER_NO"));
				myMileage.setPoint(rs.getInt("POINT"));
				myMileage.setPointNo(rs.getInt("POINT_NO"));
				myMileage.setRoute(rs.getString("POINT_ROUTE"));
				myMileage.setPointcur(rs.getInt("POINT_CUR"));
				
				list.add(myMileage);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 회원 정보 수정 
	public int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE MEMBER "
						+ "SET MEMBER_PASSWORD=?, MEMBER_NAME=?, MEMBER_PHONE_NUMBER=?, MEMBER_EMAIL=?, MEMBER_ADDRESS=? "
						+ "WHERE MEMBER_NO = ? ";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, member.getMemberPassword());
			pstm.setString(2, member.getMemberName());
			pstm.setString(3, member.getMemberPhonenumber());
			pstm.setString(4, member.getMemberEmail());
			pstm.setString(5, member.getMemberAddress());
			pstm.setInt(6, member.getMemberNo());
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}

	// 회원 탈퇴
	public int updateMemberStatus(Connection connection, int memberNo, String n) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE MEMBER SET ISMEMBER=? WHERE MEMBER_NO=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, n);
			pstm.setInt(2, memberNo);
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}

}
