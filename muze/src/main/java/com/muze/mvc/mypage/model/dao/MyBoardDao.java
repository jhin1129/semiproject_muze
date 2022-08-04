package com.muze.mvc.mypage.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board2.model.vo.Board2;
import com.muze.mvc.common.util.PageInfo;

public class MyBoardDao {
	
	public int getBoardCount(Connection connection, String type, int searchVal) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		String subquery = null;

		if(type.equals("REVIEW")) {
			subquery = "AND BRD_TYPE= 'REVIEW' AND MEMBER_NO = ";
		}else if (type.equals("REVIEW_ART")) {
			subquery = "AND BRD_TYPE= 'REVIEW' AND PRO_ARTIST_NO = ";
		}else if (type.equals("FREE")){
			subquery = "AND BRD_TYPE= 'FREE' AND MEMBER_NO = ";
		}else if (type.equals("QNA")){
			subquery = "AND BRD_TYPE= 'QNA' AND MEMBER_NO = ";
		}

		query = "SELECT COUNT(*) "
				+ "FROM BOARD "
				+ "FULL JOIN MEMBER ON(BOARD.BRD_WRITER_NO = MEMBER.MEMBER_NO) "
				+ "FULL JOIN PRODUCT ON(BOARD.BRD_PRO_NO = PRODUCT.PRO_NO) "
				+ "WHERE BRD_STATUS='Y' " + subquery + searchVal;
		
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

	public List<Board> findAll(Connection connection, PageInfo pageInfo, String type, int searchVal) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String typequery[] = {"","",""};
		String subquery = "";
		if(type.equals("REVIEW")) {
			typequery[0] = " PRO_NAME,";
			typequery[1] = " JOIN PRODUCT ON (BOARD.BRD_PRO_NO = PRODUCT.PRO_NO)";
			typequery[2] = " AND BRD_TYPE = 'REVIEW'"  ;
			subquery = " AND MEMBER_NO = " + searchVal ;
		}else if(type.equals("REVIEW_ART")) {
			typequery[0] = " PRO_NAME,";
			typequery[1] = " JOIN PRODUCT ON (BOARD.BRD_PRO_NO = PRODUCT.PRO_NO)";
			typequery[2] = " AND BRD_TYPE = 'REVIEW'"  ;
			subquery = " AND PRO_ARTIST_NO = " + searchVal ;
		}else if(type.equals("FREE")){
			typequery[2] = " AND BRD_TYPE = 'FREE'"  ;
			subquery = " AND MEMBER_NO = " + searchVal ;
		}else if(type.equals("QNA")){
			typequery[2] = " AND BRD_TYPE = 'QNA'"  ;
			subquery = " AND MEMBER_NO = " + searchVal ;
		}
		
		String query = "SELECT RNUM,"
						+ " BRD_NO,"
						+ " BRD_TITLE,"
						+ " BRD_CONTENT,"
						+ " BRD_DATE,"
						+ " BRD_READCOUNT,"
						+ " BRD_WRITER_NO,"
						+ " MEMBER_ID,"
						+ " BRD_PRO_NO,"
						+ typequery[0]
						+ " BRD_CATEGORY,"
						+ " BRD_REP_CONTENT,"
						+ " BRD_TYPE,"
						+ " BRD_STATUS,"
						+ " BRD_ORIGINALFILENAME,"
						+ " BRD_RENAMEDFILENAME"
						+ " FROM ("
						+ 	" SELECT ROWNUM AS RNUM,"
						+ 		" BRD_NO,"
						+ 		" BRD_TITLE,"
						+ 		" BRD_CONTENT,"
						+ 		" BRD_DATE,"
						+ 		" BRD_READCOUNT,"
						+ 		" BRD_WRITER_NO,"
						+ 		" MEMBER_ID,"
						+ 		" BRD_PRO_NO,"
						+ 		typequery[0]
						+ 		" BRD_CATEGORY,"
						+ 		" BRD_REP_CONTENT,"
						+ 		" BRD_TYPE,"
						+ 		" BRD_STATUS,"
						+ 		" BRD_ORIGINALFILENAME,"
						+ 		" BRD_RENAMEDFILENAME"
						+ 			" FROM ("
						+ 				" SELECT"
						+ 					   " BRD_NO,"
						+ 					   " BRD_TITLE,"
						+ 					   " BRD_CONTENT,"
						+ 					   " BRD_DATE,"
						+ 					   " BRD_READCOUNT,"
						+ 					   " BRD_WRITER_NO,"
						+ 					   " MEMBER_ID,"
						+ 					   " BRD_PRO_NO,"
						+ 					   typequery[0]
						+ 					   " BRD_CATEGORY,"
						+ 					   " BRD_REP_CONTENT,"
						+ 					   " BRD_TYPE,"
						+ 					   " BRD_STATUS,"
						+ 					   " BRD_ORIGINALFILENAME,"
						+ 					   " BRD_RENAMEDFILENAME"
						+ 				" FROM BOARD"
						+ 				" JOIN MEMBER ON(BOARD.BRD_WRITER_NO = MEMBER.MEMBER_NO)"
						+ 				typequery[1]
						+ 				" WHERE BRD_STATUS = 'Y'"
						+               typequery[2]    
						+				subquery
						+               " ORDER BY BOARD.BRD_NO DESC"
						+ 				")"
						+ 		")"
						+ 	" WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setRowNum(rs.getInt("RNUM"));
				board.setBrdNo(rs.getInt("BRD_NO"));
				board.setBrdTitle(rs.getString("BRD_TITLE"));
				board.setBrdContent(rs.getString("BRD_CONTENT"));
				board.setBrdDate(rs.getDate("BRD_DATE"));
				board.setBrdReadCount(rs.getInt("BRD_READCOUNT"));
				board.setBrdWriterNo(rs.getInt("BRD_WRITER_NO"));
				board.setBrdWriterId(rs.getString("MEMBER_ID"));
				board.setBrdProNo(rs.getInt("BRD_PRO_NO"));
				if(type.equals("REVIEW") || type.equals("REVIEW_ART"))
					board.setBrdProName(rs.getString("PRO_NAME"));
				board.setBrdCategory(rs.getString("BRD_CATEGORY"));
				board.setBrdRepContent(rs.getString("BRD_REP_CONTENT"));
				board.setBrdType(rs.getString("BRD_STATUS"));
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

	public List<Board2> getQnAList(Connection connection, PageInfo pageInfo, String type, int searchVal) {
		List<Board2> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String subquery = "WHERE BRD_STATUS = 'Y' AND BRD_TYPE= ? AND MEMBER_NO = " + searchVal;
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
						+ 				subquery
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

}