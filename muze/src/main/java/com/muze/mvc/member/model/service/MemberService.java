package com.muze.mvc.member.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.Map;

import com.muze.mvc.board.model.dao.CommentsDao;
import com.muze.mvc.board.model.vo.Comments;
import com.muze.mvc.member.model.dao.ArtistDao;
import com.muze.mvc.member.model.dao.MemberDao;
import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.member.model.vo.Member;

public class MemberService {
	private static MemberDao memberDao = new MemberDao();
	
	public static final String MEMBER_ROLE_USER = "U";
	public static final String MEMBER_ROLE_ADMIN = "D";
	public static final String MEMBER_ROLE_ARTIST = "R";

	// 로그인
	public Member login(String memId, String memPw) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, memId);
		
		close(connection);
		
		if(member == null || !member.getMemberPassword().equals(memPw)) {
			return null;
		} else {
			return member;			
		}
	}
	
	// 로그인시 아티스트 정보 받아오기
		public Artist getArtistByNo(int memberNo) {
			Connection conn = getConnection();
			Artist artist = null;
			
			artist = new ArtistDao().findArtistByNo(conn, memberNo);
			
			return artist;
		}

	// 회원가입 - 개인 회원
	public int saveMember(Member member) {
		int result = 0;
		Connection connection = getConnection();
		
		try {
			result = memberDao.insertMember(connection, member);
			commit(connection);
		} catch (Exception e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
		return result;
	}
	
	// 회원가입 - 아티스트 회원
	public int saveArtist(Artist artist) {
		int result = 0;
		Connection connection = getConnection();
		
		try {
			result = new ArtistDao().insertArtist(connection, artist);
			commit(connection);
		} catch (Exception e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
		return result;
	}

	// 아이디 중복 검사
	public Boolean isDuplicateID(String newMemId) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, newMemId);
		
		close(connection);
		
		return member != null;
	}

	// 이메일 중복 검사
	public int selectEmail(String email) {
		int result = 0;
		Connection connection = getConnection();
		try {
			result = memberDao.selectEmail(connection, email);
		} catch (Exception e) {
			throw e;
		} finally {
			close(connection);
		}
		return result;
	}

	// 아이디 찾기
	public Member findId(String memberName, String memberEmail) {
		Connection connection = getConnection();

		Member member = new MemberDao().findId(connection, memberName, memberEmail);
		
		close(connection);
		
		return member;
	
	}
	

	// 이메일을 통한 본인인증
	public int insertCertification(Map<String, String> map) {
		Connection connection = getConnection();
		int result = 0;
		try {
			result = memberDao.insertCertification(connection, map);
			commit(connection);
		} catch (Exception e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
		return result;
	}

	// 비밀번호 찾기 1차
	public Member findPasswordById(String memberId) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, memberId);
		
		close(connection);
		
		return member;
		}
	
	// 비밀번호 찾기
	public Member findPassword(String memberEmail) {
		Connection connection = getConnection();
		Member member = null;
		
		try {
			member = MemberDao.findPassword(connection, memberEmail);
		} catch (Exception e) {
			throw e;
		} finally {
			close(connection);
		}
		return member;
	}

	// 임시비밀번호 체크
	public Member checkPassword(String passwordCheck) {
		Connection connection = getConnection();
		Member member = null;
		
		try {
			member = MemberDao.checkPassword(connection, passwordCheck);
		} catch (Exception e) {
			throw e;
		} finally {
			close(connection);
		}
		return member;
	}

	public static int updatePassword(Member member) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			result = memberDao.updateMemberPassword(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	
}