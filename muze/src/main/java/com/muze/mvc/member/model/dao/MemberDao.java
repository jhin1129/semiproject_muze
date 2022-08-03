package com.muze.mvc.member.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.muze.mvc.member.filter.MemberException;
import com.muze.mvc.member.model.vo.Member;

public class MemberDao {	
	
	// 로그인
		public static Member findMemberById(Connection connection, String memId) {
			Member member = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			String query = "SELECT * FROM MEMBER WHERE MEMBER_ID=? AND ISMEMBER='Y'";
			
			try {
				pstm = connection.prepareStatement(query);
				
				pstm.setString(1, memId);
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
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
			}
			
			return member;
		}

		// 카카오 자동 회원가입
		public int kakaoJoin(Connection conn, Member joinMember) {
			int result = 0;
			PreparedStatement pstm =null;
			String query = "INSERT INTO MEMBER(MEMBER_NO, MEMBER_ID, MEMBER_PASSWORD, MEMBER_ROLE, MEMBER_NAME, MEMBER_PHONE_NUMBER) VALUES(SEQ_MEMBER.NEXTVAL,?,?,DEFAULT,?,?)";
			
			try {
				pstm = conn.prepareStatement(query);
				
				pstm.setString(1, joinMember.getMemberId());
				pstm.setString(2, joinMember.getMemberPassword());
				pstm.setString(3, joinMember.getMemberName());
				pstm.setString(4, joinMember.getMemberPhonenumber());
			
				result = pstm.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstm);
			}
			return result;
		}
		
	// 회원가입
	public int insertMember(Connection connection, Member member) {
		int memberNo = 0;
		ResultSet rs = null;
		PreparedStatement pstm = null;
		String query = "INSERT INTO MEMBER VALUES(SEQ_MEMBER.NEXTVAL,?,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
		
		try {
			pstm = connection.prepareStatement(query, new String[] {"MEMBER_NO"} );
			
			pstm.setString(1, member.getMemberId());
			pstm.setString(2, member.getMemberPassword());
			pstm.setString(3, member.getMemberRole());
			pstm.setString(4, member.getMemberName());
			pstm.setString(5, member.getMemberPhonenumber());
			pstm.setString(6, member.getMemberEmail());
			pstm.setString(7, member.getMemberAddress());
			
			pstm.executeUpdate();			
					
			rs = pstm.getGeneratedKeys();
			if(rs.next()) {
				memberNo = rs.getInt(1);
			}
			
			System.out.println(memberNo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return memberNo;

	}

	// 이메일 인증
	public int selectEmail(Connection connection, String email) {
		int result = 0;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE MEMBER_EMAIL=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, email);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return result;
	}

	// 아이디 찾기
	public Member findId(Connection connection, String memberName, String memberEmail) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_NAME=? AND MEMBER_EMAIL=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, memberName);
			pstm.setString(2, memberEmail);
			
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
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("아이디 찾기에 실패하였습니다.", e);
		} finally {
			close(rs);
			close(pstm);
		}
		
		return member;
	}
	
	// 비밀번호 찾기 1차 인증
	public static Member findPassword(Connection connection, String memberEmail) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_EMAIL=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, memberEmail);
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
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("비밀번호 찾기에 실패하였습니다.", e);
		} finally {
			close(rs);
			close(pstm);
		}
		
		return member;
	}

	// 임시비밀번호 UPDATE 
	public int insertCertification(Connection connection, Map<String, String> map) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE MEMBER SET MEMBER_PASSWORD=? WHERE MEMBER_ID=?";
		String id = map.get("id");
		String randomString = map.get("randomString");
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, randomString);
			pstm.setString(2, id);
			result = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MemberException("인증번호 DB에 접속 실패하였습니다.", e);
		} finally {
			close(pstm);
		}
		return result;
	}

	// 임시비밀번호 체크
	public static Member checkPassword(Connection connection, String passwordCheck) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE MEMBER_PASSWORD=?";
			
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, passwordCheck);
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
		} catch (SQLException e) {
			e.printStackTrace();
			throw new MemberException("인증에 실패하였습니다.", e);
		} finally {
			close(rs);
			close(pstm);
		}
			
		return member;
		}
	
	
	// 임시 비밀번호 인증 후 비밀번호 변경
	public int updateMemberPassword(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE MEMBER SET MEMBER_PASSWORD=? WHERE MEMBER_ID=?";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, member.getMemberPassword());
			pstm.setString(2, member.getMemberId());
			result = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MemberException("비밀번호 변경에 실패하였습니다.", e);
		} finally {
			close(pstm);
		}
		return result;
	}
	

}	