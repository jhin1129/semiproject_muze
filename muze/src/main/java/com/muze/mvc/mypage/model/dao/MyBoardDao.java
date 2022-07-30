package com.muze.mvc.mypage.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.common.util.PageInfo;

public class MyBoardDao {
	
	public int getBoardCount(Connection connection, String type, String searchVal) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;

		query = "SELECT COUNT(*) FROM BOARD JOIN MEMBER ON(BOARD.BRD_WRITER_NO = MEMBER.MEMBER_NO) WHERE BRD_STATUS='Y' AND BRD_TYPE=? AND MEMBER_ID LIKE '%"+searchVal+"%'";
		
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

	public List<Board> findAll(Connection connection, PageInfo pageInfo, String type, String searchVal) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String typequery[] = {"",""};
		String subquery = "";
		if(type.equals("REVIEW")) {
			typequery[0] = " PRO_NAME,";
			typequery[1] = " JOIN PRODUCT ON (BOARD.BRD_PRO_NO = PRODUCT.PRO_NO)";
		}

			subquery = " AND MEMBER_ID LIKE '%" + searchVal + "%'";
	
		
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
						+               " AND BRD_TYPE= ?"    
						+				subquery
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
				board.setBrdWriterNo(rs.getInt("BRD_WRITER_NO"));
				board.setBrdWriterId(rs.getString("MEMBER_ID"));
				board.setBrdProNo(rs.getInt("BRD_PRO_NO"));
				if(type.equals("REVIEW"))
					board.setBrdProName(rs.getString("PRO_NAME"));
				board.setBrdCategory(rs.getString("BRD_CATEGORY"));
				board.setBrdRepContent(rs.getString("BRD_REP_CONTENT"));
				board.setBrdType(rs.getString("BRD_STATUS"));
				board.setBrdStatus(rs.getString("BRD_STATUS"));
				board.setBrdOriginalFileName(rs.getString("BRD_ORIGINALFILENAME"));
				board.setBrdRenamedFileName(rs.getString("BRD_RENAMEDFILENAME"));
				System.out.println(board);
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
