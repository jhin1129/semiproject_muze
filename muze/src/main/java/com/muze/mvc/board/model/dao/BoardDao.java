package com.muze.mvc.board.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.member.model.vo.Artist;

public class BoardDao {

	public int getBoardCount(Connection connection, String type, String searchType, String searchVal) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		switch(searchType) {
		
		case "title":
			query = "SELECT COUNT(*) FROM BOARD WHERE BRD_STATUS='Y' AND BRD_TYPE=? AND BRD_TITLE LIKE '%"+searchVal+"%'";
			break;
		case "proName":
			query = "SELECT COUNT(*) FROM BOARD JOIN PRODUCT ON(BOARD.BRD_PRO_NO = PRODUCT.PRO_NO) WHERE BRD_STATUS='Y' AND BRD_TYPE=? AND PRO_NAME LIKE '%"+searchVal+"%'";
			break;
		case "writer":
			query = "SELECT COUNT(*) FROM BOARD JOIN MEMBER ON(BOARD.BRD_WRITER_NO = MEMBER.MEMBER_NO) WHERE BRD_STATUS='Y' AND BRD_TYPE=? AND MEMBER_ID LIKE '%"+searchVal+"%'";
			break;
		case "proNo":
			query = "SELECT COUNT(*) FROM BOARD JOIN PRODUCT ON(BOARD.BRD_PRO_NO = PRODUCT.PRO_NO) WHERE BRD_STATUS='Y' AND BRD_TYPE=? AND PRO_NO = " + Integer.parseInt(searchVal);
			break;
		default:
			query = "SELECT COUNT(*) FROM BOARD WHERE BRD_STATUS='Y' AND BRD_TYPE=?";			
		}
			
		
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

	public List<Board> findAll(Connection connection, PageInfo pageInfo, String type, String searchType, String searchVal) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String typequery[] = {"",""};
		String subquery = "";
		if(type.equals("REVIEW")) {
			typequery[0] = " PRO_NAME,";
			typequery[1] = " JOIN PRODUCT ON (BOARD.BRD_PRO_NO = PRODUCT.PRO_NO)";
		}
		switch(searchType) {
		case "title":
			subquery = " AND BRD_TITLE LIKE '%" + searchVal + "%'";
			break;
		case "proName":
			subquery = " AND PRO_NAME LIKE '%" + searchVal + "%'";
			break;
		case "writer":
			subquery = " AND MEMBER_ID LIKE '%" + searchVal + "%'";
			break;
		case "proNo":
			subquery = " AND PRO_NO = " + Integer.parseInt(searchVal);
			break;
		default:
			subquery = "";
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
						+ " BRD_RENAMEDFILENAME,"
						+ " BRD_IMG"
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
						+ 		" BRD_RENAMEDFILENAME,"
						+ 		" BRD_IMG"
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
						+ 					   " BRD_RENAMEDFILENAME,"
						+ 					   " BRD_IMG"
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
				board.setBrdImg(rs.getString("BRD_IMG"));
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

	public Board findBoardByBrdNo(Connection connection, int no, String type) {
		Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String typequery[] = {"",""};
		if(type.equals("REVIEW")) {
			typequery[0] = " PRO_NAME,";
			typequery[1] = " JOIN PRODUCT ON (BOARD.BRD_PRO_NO = PRODUCT.PRO_NO)";
		}
		String query = 
					" SELECT BRD_NO,"
				+ 	" BRD_TITLE,"
				+ 	" BRD_CONTENT,"
				+ 	" BRD_DATE,"
				+ 	" BRD_READCOUNT,"
				+ 	" BRD_WRITER_NO,"
				+ 	" MEMBER_ID,"
				+ 	" BRD_PRO_NO,"
				+ 	typequery[0]
				+ 	" BRD_CATEGORY,"
				+ 	" BRD_REP_CONTENT,"
				+ 	" BRD_TYPE,"
				+ 	" BRD_STATUS,"
				+ 	" BRD_ORIGINALFILENAME,"
				+ 	" BRD_RENAMEDFILENAME,"
				+ 	" BRD_IMG"
				+ 	" FROM BOARD"
				+ 	" JOIN MEMBER ON(BOARD.BRD_WRITER_NO = MEMBER.MEMBER_NO)"
				+ 	typequery[1]
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
				board.setBrdWriterNo(rs.getInt("BRD_WRITER_NO"));
				board.setBrdWriterId(rs.getString("MEMBER_ID"));
				board.setBrdProNo(rs.getInt("BRD_PRO_NO"));
				if(type.equals("REVIEW"))
					board.setBrdProName(rs.getString("PRO_NAME"));
				board.setBrdCategory(rs.getString("BRD_CATEGORY"));
				board.setBrdRepContent(rs.getString("BRD_REP_CONTENT"));
				board.setBrdType(rs.getString("BRD_TYPE"));
				board.setBrdStatus(rs.getString("BRD_STATUS"));
				board.setBrdOriginalFileName(rs.getString("BRD_ORIGINALFILENAME"));
				board.setBrdRenamedFileName(rs.getString("BRD_RENAMEDFILENAME"));
				board.setBrdImg(rs.getString("BRD_IMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return board;
	}

	public int insertBoard(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO BOARD VALUES("
							+ "SEQ_BOARD_NO.NEXTVAL,"	//BRD_NO
							+ "?,"						//BRD_TITLE
							+ "?,"						//BRD_CONTENT
							+ "SYSDATE,"				//BRD_DATE
							+ "0,"						//BRD_READCOUNT
							+ "?,"						//BRD_WRITER_NO
							+ "?,"						//BRD_PRO_NO
							+ "NULL,"					//BRD_CATEGORY
							+ "NULL,"					//BRD_REP_CONTENT
							+ "?,"						//BRD_TYPE
							+ "'Y',"						//BRD_STATUS
							+ "?,"						//BRD_ORIGINALFILENAME
							+ "?,"						//BRD_RENAMEDFILENAME
							+ "?"						//BRD_IMG
							+ ")";
				
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getBrdTitle());
			pstmt.setString(2, board.getBrdContent());
			pstmt.setInt(3, board.getBrdWriterNo());
			if(board.getBrdType().equals("REVIEW")) {
				pstmt.setInt(4, board.getBrdProNo());
			}else {
				pstmt.setString(4, "");
			}
			pstmt.setString(5, board.getBrdType());
			pstmt.setString(6, board.getBrdOriginalFileName());
			pstmt.setString(7, board.getBrdRenamedFileName());
			pstmt.setString(8, board.getBrdImg());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateStatus(Connection connection, int brdNo, String status) {
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

	public int updateBoard(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD"
							 + " SET BRD_TITLE=?,"
							 + " BRD_CONTENT=?,"
							 + " BRD_PRO_NO=?,"
							 + " BRD_ORIGINALFILENAME=?,"
							 + " BRD_RENAMEDFILENAME=?,"
							 + " BRD_IMG=?"
							 + " WHERE BRD_NO=?";
	
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getBrdTitle());
			pstmt.setString(2, board.getBrdContent());
			pstmt.setInt(3, board.getBrdProNo());
			pstmt.setString(4, board.getBrdOriginalFileName());
			pstmt.setString(5, board.getBrdRenamedFileName());
			pstmt.setString(6, board.getBrdImg());
			pstmt.setInt(7, board.getBrdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public static List<Product> findProductListByOrdersMemberNo(Connection connection, int memberNo) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT PRODUCT.PRO_NO,"
				+ " PRO_NAME,"
				+ " PRO_SIZE,"
				+ " PRO_PRICE,"
				+ " PRO_QUANTITY,"
				+ " PRO_IMG,"
				+ " PRO_ARTIST_NO,"
				+ " MEMBER.MEMBER_NAME,"
				+ " PRO_REG_DATE,"
				+ " PRO_DESCRIPTION,"
				+ " PRO_TYPE"
				+ " FROM PRODUCT"
				+ " JOIN MEMBER ON (PRODUCT.PRO_ARTIST_NO = MEMBER.MEMBER_NO)"
				+ " WHERE PRO_NO IN ("
				+ " SELECT DISTINCT PRODUCT.PRO_NO FROM PRODUCT"
				+ " JOIN ORDERS ON (PRODUCT.PRO_NO = ORDERS.PRO_NO)"
				+ " JOIN MEMBER ON (PRODUCT.PRO_ARTIST_NO = MEMBER.MEMBER_NO)"
				+ " JOIN MEMBER ON (ORDERS.MEMBER_NO = MEMBER.MEMBER_NO)"
				+ " WHERE ORDERS.MEMBER_NO = ?)";

		

		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setProNo(rs.getInt("PRO_NO"));
				product.setProName(rs.getString("PRO_NAME"));
				product.setProSize(rs.getString("PRO_SIZE"));
				product.setProPrice(rs.getInt("PRO_PRICE"));
				product.setProQuantity(rs.getInt("PRO_QUANTITY"));
				product.setProImg(rs.getString("PRO_IMG"));
				product.setProArtistNo(rs.getInt("PRO_ARTIST_NO"));
				product.setProArtistName(rs.getString("MEMBER_NAME"));
				product.setProRegDate(rs.getDate("PRO_REG_DATE"));
				product.setProDescription(rs.getString("PRO_DESCRIPTION"));
				product.setProType(rs.getString("PRO_TYPE"));
				
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return list;
	}
	//PRODUCT DAO?
	public Product findProductByProNo(Connection connection, int no) {
		Product product = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT PRO_NO,"
				+ " PRO_NAME,"
				+ " PRO_SIZE,"
				+ " PRO_PRICE,"
				+ " PRO_QUANTITY,"
				+ " PRO_IMG,"
				+ " PRO_ARTIST_NO,"
				+ " MEMBER.MEMBER_NAME,"
				+ " PRO_REG_DATE,"
				+ " PRO_DESCRIPTION,"
				+ " PRO_TYPE"
				+ " FROM PRODUCT"
				+ " JOIN MEMBER ON (PRODUCT.PRO_ARTIST_NO = MEMBER.MEMBER_NO)"
				+ " WHERE PRO_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new Product();
				
				product.setProNo(rs.getInt("PRO_NO"));
				product.setProName(rs.getString("PRO_NAME"));
				product.setProSize(rs.getString("PRO_SIZE"));
				product.setProPrice(rs.getInt("PRO_PRICE"));
				product.setProQuantity(rs.getInt("PRO_QUANTITY"));
				product.setProImg(rs.getString("PRO_IMG"));
				product.setProArtistNo(rs.getInt("PRO_ARTIST_NO"));
				product.setProArtistName(rs.getString("MEMBER_NAME"));
				product.setProRegDate(rs.getDate("PRO_REG_DATE"));
				product.setProDescription(rs.getString("PRO_DESCRIPTION"));
				product.setProType(rs.getString("PRO_TYPE"));;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return product;
	}

	public int updateReadCount(Connection connection, Board board) {
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
	//PRODUCT SERVICE
	public List<Product> findProductListByArtistNoNotSelfProduct(Connection connection, int proArtistNo, int proNo) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT PRO_NO,"
				+ " PRO_NAME,"
				+ " PRO_SIZE,"
				+ " PRO_PRICE,"
				+ " PRO_QUANTITY,"
				+ " PRO_IMG,"
				+ " PRO_ARTIST_NO,"
				+ " MEMBER.MEMBER_NAME,"
				+ " PRO_REG_DATE,"
				+ " PRO_DESCRIPTION,"
				+ " PRO_TYPE"
				+ " FROM PRODUCT"
				+ " JOIN MEMBER ON (PRODUCT.PRO_ARTIST_NO = MEMBER.MEMBER_NO)"
				+ " WHERE PRO_ARTIST_NO = ?";

		

		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, proArtistNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setProNo(rs.getInt("PRO_NO"));
				product.setProName(rs.getString("PRO_NAME"));
				product.setProSize(rs.getString("PRO_SIZE"));
				product.setProPrice(rs.getInt("PRO_PRICE"));
				product.setProQuantity(rs.getInt("PRO_QUANTITY"));
				product.setProImg(rs.getString("PRO_IMG"));
				product.setProArtistNo(rs.getInt("PRO_ARTIST_NO"));
				product.setProArtistName(rs.getString("MEMBER_NAME"));
				product.setProRegDate(rs.getDate("PRO_REG_DATE"));
				product.setProDescription(rs.getString("PRO_DESCRIPTION"));
				product.setProType(rs.getString("PRO_TYPE"));
				
				if(proNo != product.getProNo()) {
					list.add(product);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return list;
	}
	//PRODUCTDAO
	public Artist findArtistByProNo(Connection connection, int proNo) {
		Artist artist = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT ARTIST_NO,"
						   + " ARTIST_IMG,"
				           + " ARTIST_INTRODUCE,"
				           + " BUS_NAME,"
				           + " BUS_LICENSE"
				           + " FROM ARTIST_DETAIL"
				           + " JOIN PRODUCT ON (ARTIST_DETAIL.ARTIST_NO = PRODUCT.PRO_ARTIST_NO)"
				           + " WHERE PRO_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, proNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				artist = new Artist();
				
				artist.setArtistNo(rs.getInt("ARTIST_NO"));
				artist.setArtistImg(rs.getString("ARTIST_IMG"));
				artist.setArtistIntroduce(rs.getString("ARTIST_INTRODUCE"));
				artist.setBusName(rs.getString("BUS_NAME"));
				artist.setBusLicense(rs.getString("BUS_LICENSE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return artist;
	}

	

}
