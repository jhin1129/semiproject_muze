package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.member.vo.Member;
import com.muze.mvc.mypage.model.dao.MyInfoDao;
import com.muze.mvc.mypage.model.vo.MyMileage;

public class MyInfoService {

	// 마일리지 검색 
	public List<MyMileage> infoMileage(String dateFrom, String dateTo, Member member) {
		List<MyMileage> myMileage = null;
		
		Connection connection = getConnection();

		myMileage = new MyInfoDao().getMileage(connection, dateFrom, dateTo, member);
		
		close(connection);
		
		return myMileage;
	}
}
