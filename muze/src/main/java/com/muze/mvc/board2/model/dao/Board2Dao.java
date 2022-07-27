package com.muze.mvc.board2.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.PageInfo;
import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

public class Board2Dao {

	public int getBoardCount(Connection connection, String type) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM BOARD WHERE BRD_STATUS='Y' AND BRD_TYPE=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();	
			
			if(rs.next()) {
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

	public List<Board2> findAll(Connection connection, PageInfo pageInfo, String type) {
		List<Board2> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, "
						+ "BRD_NO, "
						+ "BRD_TITLE, "
						+ "BRD_CONTENT, "
						+ "BRD_DATE, "
						+ "BRD_READCOUNT, "
						+ "BRD_WRITER_NO, "
						+ "MEMBER_ID, "
						+ "BRD_PRO_NO, "
						+ "BRD_CATEGORY, "
						+ "BRD_REP_CONTENT, "
						+ "BRD_TYPE, "
						+ "BRD_STATUS, "
						+ "BRD_ORIGINALFILENAME, "
						+ "BRD_RENAMEDFILENAME "
						+ "FROM ("
						+ 	" SELECT ROWNUM AS RNUM, "
						+ 		"BRD_NO, "
						+ 		"BRD_TITLE, "
						+ 		"BRD_CONTENT, "
						+ 		"BRD_DATE, "
						+ 		"BRD_READCOUNT, "
						+ 		"BRD_WRITER_NO, "
						+ 		"MEMBER_ID, "
						+ 		"BRD_PRO_NO, "
						+ 		"BRD_CATEGORY, "
						+ 		"BRD_REP_CONTENT, "
						+ 		"BRD_TYPE, "
						+ 		"BRD_STATUS, "
						+ 		"BRD_ORIGINALFILENAME, "
						+ 		"BRD_RENAMEDFILENAME "
						+ 			"FROM ("
						+ 				"SELECT BRD_NO, "
						+ 					   "BRD_TITLE, "
						+ 					   "BRD_CONTENT, "
						+ 					   "BRD_DATE, "
						+ 					   "BRD_READCOUNT, "
						+ 					   "BRD_WRITER_NO, "
						+ 					   "MEMBER_ID, "
						+ 					   "BRD_PRO_NO, "
						+ 					   "BRD_CATEGORY, "
						+ 					   "BRD_REP_CONTENT, "
						+ 					   "BRD_TYPE, "
						+ 					   "BRD_STATUS, "
						+ 					   "BRD_ORIGINALFILENAME, "
						+ 					   "BRD_RENAMEDFILENAME "
						+ 				"FROM BOARD "
						+ 				"JOIN MEMBER ON(BOARD.BRD_WRITER_NO = MEMBER.MEMBER_NO) "
						+ 				"WHERE BRD_STATUS = 'Y' "
						+               "AND BRD_TYPE= ?"    
						+               "ORDER BY BOARD.BRD_NO DESC"
						+ 				") "
						+ 		") "
						+ 	"WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, type);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board2 board = new Board2();
				
				board.setRowNum(rs.getInt("RNUM"));
				board.setBrdNo(rs.getInt("BRD_NO"));
				board.setBrdTitle(rs.getString("BRD_TITLE"));
				board.setBrdContent(rs.getString("BRD_CONTENT"));
				board.setBrdDate(rs.getDate("BRD_DATE"));
				board.setBrdReadCount(rs.getInt("BRD_READCOUNT"));
				board.setBrdWriterNo(rs.getInt("BRD_WRITER_NO"));
				board.setBrdWriterId(rs.getString("MEMBER_ID"));
				board.setBrdProNo(rs.getInt("BRD_PRO_NO"));
				board.setBrdCategory(rs.getString("BRD_CATEGORY"));
				board.setBrdRepContent(rs.getString("BRD_REP_CONTENT"));
				board.setBrdType(rs.getString("BRD_TYPE"));
				board.setBrdStatus(rs.getString("BRD_STATUS"));
				board.setBrdOriginalFileName(rs.getString("BRD_ORIGINALFILENAME"));
				board.setBrdRenamedFileName(rs.getString("BRD_RENAMEDFILENAME"));
				
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return list;
	}

	public Board2 findBoardByNo(Connection connection, int no) {
		Board2 board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query =
				// 문단 끝 띄어쓰기로 줄 구분
					"SELECT BRD_NO, "
				+ 	"BRD_TITLE, "
				+ 	"BRD_CONTENT, "
				+ 	"BRD_DATE, "
				+ 	"BRD_READCOUNT, "
				+ 	"BRD_WRITER_NO, "
				+ 	"MEMBER_ID, "
				+ 	"BRD_PRO_NO, "
				+ 	"BRD_CATEGORY, "
				+ 	"BRD_REP_CONTENT, "
				+ 	"BRD_TYPE, "
				+ 	"BRD_STATUS, "
				+ 	"BRD_ORIGINALFILENAME, "
				+ 	"BRD_RENAMEDFILENAME "
				+ 	"FROM BOARD "
				+ 	"JOIN MEMBER ON(BOARD.BRD_WRITER_NO = MEMBER.MEMBER_NO) "
				+ 	"WHERE BRD_STATUS = 'Y' "
				+   "AND BRD_NO= ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board2();
				
				board.setBrdNo(rs.getInt("BRD_NO"));
				board.setBrdTitle(rs.getString("BRD_TITLE"));
				board.setBrdContent(rs.getString("BRD_CONTENT"));
				board.setBrdDate(rs.getDate("BRD_DATE"));
				board.setBrdReadCount(rs.getInt("BRD_READCOUNT"));
				board.setBrdWriterNo(rs.getInt("BRD_WRITER_NO"));
				board.setBrdWriterId(rs.getString("MEMBER_ID"));
				board.setBrdProNo(rs.getInt("BRD_PRO_NO"));
				board.setBrdCategory(rs.getString("BRD_CATEGORY"));
				board.setBrdRepContent(rs.getString("BRD_REP_CONTENT"));
				board.setBrdType(rs.getString("BRD_TYPE"));
				board.setBrdStatus(rs.getString("BRD_STATUS"));
				board.setBrdOriginalFileName(rs.getString("BRD_ORIGINALFILENAME"));
				board.setBrdRenamedFileName(rs.getString("BRD_RENAMEDFILENAME"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return board;
	}

	public int updateBoard(Connection connection, Board2 board) {
		
		return 0;
	}

	public int insertBoard(Connection connection, Board2 board) {
		return 0;
	}
	
}
