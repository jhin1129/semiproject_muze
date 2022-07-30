package com.muze.mvc.mypage.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.member.vo.Member;
import com.muze.mvc.mypage.model.vo.MyMileage;

public class MyInfoDao {

	// 마일리지 가져오기 
	public List<MyMileage> getMileage(Connection connection, String dateFrom, String dateTo, Member member) {
		List<MyMileage> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * "
						+ "FROM MILEAGE "
						+ "WHERE POINT_DATE BETWEEN ? AND ? AND MEMBER_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dateFrom);
			pstmt.setString(2, dateTo);
			pstmt.setInt(3, member.getMemberNo()); 

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MyMileage myMileage = new MyMileage();
				
				myMileage.setInOut(rs.getString("POINT_IN_OUT"));
				myMileage.setPointDate(rs.getDate("POINT_DATE"));
				myMileage.setMemberNo(rs.getInt("MEMBER_NO"));
				myMileage.setPoint(rs.getInt("POINT_PROCESS"));
				myMileage.setPointNo(rs.getInt("POINT_NO"));
				myMileage.setRoute(rs.getString("POINT_ROUTE"));
				
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

}
