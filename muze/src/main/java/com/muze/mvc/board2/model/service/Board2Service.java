package com.muze.mvc.board2.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.board2.model.dao.Board2Dao;
import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.PageInfo;

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
		int result = 0;
		
		Connection connection = getConnection();
		
		if(board.getBrdNo() != 0) {
			result = new Board2Dao().updateBoard(connection, board);
		} else {
			result = new Board2Dao().insertBoard(connection, board);
		}
			
		return result;
	}

	public int delete(int no, String type) {
		int result = 0;
	
		Connection connection = getConnection();
		
		result = new Board2Dao().updateStatus(connection, no, type, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
}
