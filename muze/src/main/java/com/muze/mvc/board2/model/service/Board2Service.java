package com.muze.mvc.board2.model.service;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.board2.model.dao.Board2Dao;
import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.PageInfo;
import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

public class Board2Service {

	public int getBoardCount(String type) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new Board2Dao().getBoardCount(connection, type);
		
		close(connection);
				
		return count;
	}

	public List<Board2> getBoardList(PageInfo pageInfo, String type) {
		List<Board2> list = null;
		Connection connection = getConnection();
		
		list = new Board2Dao().findAll(connection, pageInfo, type);
		
		close(connection);
		
		return list;
	}

	public Board2 getBoardByNo(int no) {
		Board2 board = null;
		Connection connection = getConnection();
		
		board = new Board2Dao().findBoardByNo(connection, no);
		
		close(connection);
		
		return board;
	}

	public int save(Board2 board) {
		// TODO Auto-generated method stub
		return 0;
	}
}
