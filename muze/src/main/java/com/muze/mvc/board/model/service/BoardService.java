package com.muze.mvc.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.board.model.dao.BoardDao;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.common.util.PageInfo;
import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

public class BoardService {

	public int getBoardCount(String type) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection, type);
		
		close(connection);
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo, String type) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo, type);
		
		close(connection);
		
		return list;
	}

	public Board getBoardByNo(int no) {
		Board board = null;
		Connection connection = getConnection();
		
		board = new BoardDao().findBoardByNo(connection, no);
		
		close(connection);
		
		return board;
	}

}
