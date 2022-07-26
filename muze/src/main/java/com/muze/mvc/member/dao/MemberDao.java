package com.muze.mvc.member.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.muze.mvc.member.vo.Member;

public class MemberDao {	
	public Member findMemberById(String loginId) {
		Member member = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=? AND ISMEMBER='Y'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@110.12.241.226:1521:xe", "MUZE", "MUZE");
			pstm = conn.prepareStatement(query);
			
			pstm.setString(1, loginId);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setMemberNo(rs.getInt("MEMBER_NO"));
				member.setMemberId(rs.getString("MEMBER_ID"));
				member.setMemberPassword(rs.getString("MEMBER_PASSWORD"));
				member.setMemberRole(rs.getString("MEMBER_ROLE"));
				member.setMemberName(rs.getString("MEMBER_NAME"));
				member.setMemberPhonenumber(rs.getString("MEMBER_PHONE_NUMBER"));
				member.setMemberEmail(rs.getString("MEMBER_EMAIL"));
				member.setMemberAddress(rs.getString("MEMBER_ADDRESS"));
				member.setPoint(rs.getInt("POINT"));
				member.setEnrollDate(rs.getDate("ENROLL_DATE"));
				member.setIsmember(rs.getString("ISMEMBER"));
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return member;
	}
}	