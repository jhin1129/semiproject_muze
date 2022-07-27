package com.muze.mvc.board.model.service;

import java.io.File;
import java.sql.Connection;
import java.util.List;

import com.muze.mvc.board.model.dao.BoardDao;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

public class BoardService {

	public int getBoardCount(String type, String searchType, String searchVal) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection, type, searchType, searchVal);
		
		close(connection);
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo, String type, String searchType, String searchVal) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo, type, searchType, searchVal);
		
		close(connection);
		
		return list;
	}

	public Board getBoardByNo(int brdNo, boolean hasRead, String type) {
		Board board = null;
		Connection connection = getConnection();
		
		board = new BoardDao().findBoardByNo(connection, brdNo, type);
		
		close(connection);
		
		return board;
	}

	public int save(Board board) {
		int result = 0;
		Connection connection = getConnection();
		
		if(board.getBrdNo() != 0) {
			result = new BoardDao().updateBoard(connection, board);
		} else {			
			result = new BoardDao().insertBoard(connection, board);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public void deleteAllTempFiles(String targetFolder) {
		File folder = new File(targetFolder);
		if(!folder.exists()) {
            return ;
        }
        
        File[] files = folder.listFiles();
        for(File file : files) {           
            file.delete();
        }
        
        return ;
		
	}

	public int delete(int brdNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new BoardDao().updateStatus(connection, brdNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		return result;
	}

	public List<Product> getProductListByMemberNo(int memberNo) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = BoardDao.findProductListByMemberNo(connection, memberNo);
		
		return list;
	}

	public Product getProductByNo(int brdProNo) {
		Product product = null;
		Connection connection = getConnection();
		
		product = new BoardDao().findProductByNo(connection, brdProNo);
		
		close(connection);
		
		return product;
	}




}
