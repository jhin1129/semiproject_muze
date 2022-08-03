package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.mypage.model.dao.MyBoardDao;

public class MyBoardService {
	
	public int getBoardCount(String type, int searchVal) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new MyBoardDao().getBoardCount(connection, type, searchVal);
		
		close(connection);
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo, String type, int searchVal) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new MyBoardDao().findAll(connection, pageInfo, type, searchVal);
		
		close(connection);
		
		return list;
	}

}