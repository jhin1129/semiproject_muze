package com.muze.mvc.admin.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.member.model.vo.Member;

public class AdminDao {

	public int getMemberCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM MEMBER WHERE ISMEMBER='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 쿼리 조회한 1번째 행을 count로 넘김
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
	}

	public List<Member> getMemberList(Connection connection, PageInfo pageInfo) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT MEMBER_NO, "
						+ "MEMBER_ID, "
						+ "MEMBER_PASSWORD, "
						+ "MEMBER_ROLE, "
						+ "MEMBER_NAME, "
						+ "MEMBER_PHONE_NUMBER, "
						+ "MEMBER_EMAIL, "
						+ "MEMBER_ADDRESS, "
						+ "POINT, "
						+ "ENROLL_DATE, "
						+ "ISMEMBER "
						+ "FROM MEMBER "
						+ "ORDER BY MEMBER_NO DESC";
					
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			while(rs.next()) {

				Member member= new Member();
				
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
				
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);	
		}
		
		return list;
	}

	public int hideContent(Connection connection, int[] contents) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String params = "";
		for(int i = 0; i < contents.length; i++) {
			params += contents[i];
			if(i < contents.length - 1) 
				params += ", ";
		}
		String query = "UPDATE BOARD SET BRD_STATUS='N' WHERE BRD_NO IN ("+params+")";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int openContent(Connection connection, int[] ocontents) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String params = "";
		for(int i = 0; i < ocontents.length; i++) {
			params += ocontents[i];
			if(i < ocontents.length - 1) 
				params += ", ";
		}
		String query = "UPDATE BOARD SET BRD_STATUS='Y' WHERE BRD_NO IN ("+params+")";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int delMember(Connection connection, int[] dmembers) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String params = "";
		for(int i = 0; i < dmembers.length; i++) {
			params += dmembers[i];
			if(i < dmembers.length - 1)
				params += ", ";
		}
		String query = "UPDATE MEMBER SET ISMEMBER='N' WHERE MEMBER_NO IN ("+params+")";

		try {
			pstmt = connection.prepareStatement(query);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}