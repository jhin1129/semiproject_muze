package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.dao.MyInfoDao;
import com.muze.mvc.mypage.model.vo.MyMileage;

public class MyInfoService {

	// 마일리지 검색 
	public List<MyMileage> infoMileage(String dateFrom, String dateTo, int memNo) {
		List<MyMileage> myMileage = null;
		
		Connection connection = getConnection();

		myMileage = new MyInfoDao().getMileage(connection, dateFrom, dateTo, memNo);
		
		close(connection);
		
		return myMileage;
	}

	// 회원정보 수정
	public int save(Member member) {
		int result = 0; 
		Connection connection = getConnection();
		
		result = new MyInfoDao().updateMember(connection, member);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	// 회원 탈퇴
	public int delete(int memberNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MyInfoDao().updateMemberStatus(connection, memberNo, "N");
		
		if(result > 0) {
			commit(connection);
		}else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
}
