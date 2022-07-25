package com.muze.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.common.util.PageInfo;
import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

public class BoardDao {

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

	public List<Board> findAll(Connection connection, PageInfo pageInfo, String type) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM,"
						+ " BRD_NO,"
						+ " BRD_TITLE,"
						+ " BRD_CONTENT,"
						+ " BRD_DATE,"
						+ " BRD_READCOUNT,"
						+ " MEMBER_ID,"
						+ " BRD_TYPE,"
						+ " BRD_STATUS,"
						+ " BRD_ORIGINALFILENAME,"
						+ " BRD_RENAMEDFILENAME"
						+ " FROM ("
						+ 	" SELECT RNUM,"
						+ 		" BRD_NO,"
						+ 		" BRD_TITLE,"
						+ 		" BRD_CONTENT,"
						+ 		" BRD_DATE,"
						+ 		" BRD_READCOUNT,"
						+ 		" MEMBER_ID,"
						+ 		" BRD_TYPE,"
						+ 		" BRD_STATUS,"
						+ 		" BRD_ORIGINALFILENAME,"
						+ 		" BRD_RENAMEDFILENAME"
						+ 			" FROM ("
						+ 				" SELECT ROWNUM AS RNUM,"
						+ 					   " BRD_NO,"
						+ 					   " BRD_TITLE,"
						+ 					   " BRD_CONTENT,"
						+ 					   " BRD_DATE,"
						+ 					   " BRD_READCOUNT,"
						+ 					   " MEMBER_ID,"
						+ 					   " BRD_TYPE,"
						+ 					   " BRD_STATUS,"
						+ 					   " BRD_ORIGINALFILENAME,"
						+ 					   " BRD_RENAMEDFILENAME"
						+ 				" FROM BOARD"
						+ 				" JOIN MEMBER ON(BOARD.BRD_WRITER_NO = MEMBER.MEMBER_NO)"
						+ 				" WHERE BRD_STATUS = 'Y'"
						+               " AND BRD_TYPE= ?"    
						+               " ORDER BY BOARD.BRD_NO DESC"
						+ 				")"
						+ 		")"
						+ 	" WHERE RNUM BETWEEN ? AND ?";
		

		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, type);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setRowNum(rs.getInt("RNUM"));
				board.setBrdNo(rs.getInt("BRD_NO"));
				board.setBrdTitle(rs.getString("BRD_TITLE"));
				board.setBrdContent(rs.getString("BRD_CONTENT"));
				board.setBrdDate(rs.getDate("BRD_DATE"));
				board.setBrdReadCount(rs.getInt("BRD_READCOUNT"));
				board.setBrdWriterId(rs.getString("MEMBER_ID"));
				board.setBrdType(rs.getString("BRD_STATUS"));
				board.setBrdOriginalFileName(rs.getString("BRD_ORIGINALFILENAME"));
				board.setBrdRenameFileName(rs.getString("BRD_RENAMEDFILENAME"));
				
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

	public Board findBoardByNo(Connection connection, int no) {
		Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
					" SELECT BRD_NO,"
				+ 	" BRD_NO,"
				+ 	" BRD_TITLE,"
				+ 	" BRD_CONTENT,"
				+ 	" BRD_DATE,"
				+ 	" BRD_READCOUNT,"
				+ 	" MEMBER_ID,"
				+ 	" BRD_TYPE,"
				+ 	" BRD_STATUS,"
				+ 	" BRD_ORIGINALFILENAME,"
				+ 	" BRD_RENAMEDFILENAME"
				+ 	" FROM BOARD"
				+ 	" JOIN MEMBER ON(BOARD.BRD_WRITER_NO = MEMBER.MEMBER_NO)"
				+ 	" WHERE BRD_STATUS = 'Y'"
				+   " AND BRD_NO= ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				
				board.setBrdNo(rs.getInt("BRD_NO"));
				board.setBrdTitle(rs.getString("BRD_TITLE"));
				board.setBrdContent(rs.getString("BRD_CONTENT"));
				board.setBrdDate(rs.getDate("BRD_DATE"));
				board.setBrdReadCount(rs.getInt("BRD_READCOUNT"));
				board.setBrdWriterId(rs.getString("MEMBER_ID"));
				board.setBrdType(rs.getString("BRD_STATUS"));
				board.setBrdOriginalFileName(rs.getString("BRD_ORIGINALFILENAME"));
				board.setBrdRenameFileName(rs.getString("BRD_RENAMEDFILENAME"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return board;
	}

}