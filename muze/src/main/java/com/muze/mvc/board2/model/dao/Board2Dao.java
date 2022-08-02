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

	public int getBoardCountAll(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM BOARD";
		
		try {
			pstmt = connection.prepareStatement(query);
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
	
	public List<Board2> getBoardList(Connection connection, PageInfo pageInfo, String type) {
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


	public List<Board2> getBoardListAll(Connection connection, PageInfo pageInfo) {
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
						+               "ORDER BY BOARD.BRD_NO DESC"
						+ 				") "
						+ 		") "
						+ 	"WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
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
	
	public Board2 findBoardByNo(Connection connection, int brdNo, String type) {
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
			
			pstmt.setInt(1, brdNo);
			
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
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET BRD_TITLE=?,BRD_CONTENT=?,BRD_REP_CONTENT=?,BRD_ORIGINALFILENAME=?,BRD_RENAMEDFILENAME=? WHERE BRD_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getBrdTitle());
			pstmt.setString(2, board.getBrdContent());
			pstmt.setString(3, board.getBrdRepContent());
			pstmt.setString(4, board.getBrdOriginalFileName());
			pstmt.setString(5, board.getBrdRenamedFileName());
			pstmt.setInt(6, board.getBrdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertBoard(Connection connection, Board2 board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO BOARD VALUES("
				+ "SEQ_BOARD_NO.NEXTVAL, "  //BRD_NO
				+ "?, "						//BRD_TITLE
				+ "?, "						//BRD_CONTENT
				+ "SYSDATE, "				//BRD_DATE
				+ "0, "						//BRD_READCOUNT
				+ "?, "						//BRD_WRITER_NO
				+ "?, "						//BRD_PRO_NO
				+ "?, "						//BRD_CATEGORY
				+ "?, "						//BRD_REP_CONTENT
				+ "?, "						//BRD_TYPE
				+ "'Y' ,"					//BRD_STATUS
				+ "?, "						//BRD_ORIGINALFILENAME
				+ "?, "						//BRD_RENAMEDFILENAME
				+ "?"						//BRD_IMG
				+ ")";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getBrdTitle());
			pstmt.setString(2, board.getBrdContent());
			pstmt.setInt(3, board.getBrdWriterNo());
			if (board.getBrdType().equals("REVIEW")) {
				pstmt.setInt(4, board.getBrdProNo());
			} else {
				pstmt.setString(4, "");
			}
			if (board.getBrdType().equals("QNA")) {
				pstmt.setString(5, board.getBrdCategory());
			} else {
				pstmt.setString(5, "");				
			}
			pstmt.setString(6, board.getBrdRepContent());
			pstmt.setString(7, board.getBrdType());
			pstmt.setString(8, board.getBrdOriginalFileName());
			pstmt.setString(9, board.getBrdRenamedFileName());
			pstmt.setString(10, board.getBrdImg());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateStatus(Connection connection, int brdNo, String type, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET BRD_STATUS=? WHERE BRD_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, status);
			pstmt.setInt(2, brdNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateReadCount(Connection connection, Board2 board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET BRD_READCOUNT=? WHERE BRD_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			board.setBrdReadCount(board.getBrdReadCount() + 1);
			
			pstmt.setInt(1, board.getBrdReadCount());
			pstmt.setInt(2, board.getBrdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}