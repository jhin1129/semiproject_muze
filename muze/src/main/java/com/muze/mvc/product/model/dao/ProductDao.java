package com.muze.mvc.product.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board.model.dao.BoardDao;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.member.model.vo.Artist;

public class ProductDao {
	
	public int getProductCount(Connection connection, String type) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT "
				+ " COUNT(*)"
				+ " FROM PRODUCT"
				+ " WHERE PRO_TYPE = ?"
				+ " AND PRO_STATUS = 'Y'";
		
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

	public List<Product> findAll(Connection connection, PageInfo pageInfo, String type) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String query = "SELECT RNUM,"
				+ " PRO_NO,"
				+ " PRO_NAME,"
				+ " PRO_SIZE,"
				+ " PRO_PRICE,"
				+ " PRO_QUANTITY,"
				+ " PRO_IMG,"
				+ " PRO_ARTIST_NO,"
				+ " PRO_REG_DATE,"
				+ " PRO_DESCRIPTION,"
				+ " PRO_TYPE,"
				+ " PRO_STATUS"
				+ " FROM ("
				+ " SELECT ROWNUM AS RNUM,"
				+ " PRO_NO,"
				+ " PRO_NAME,"
				+ " PRO_SIZE,"
				+ " PRO_PRICE,"
				+ " PRO_QUANTITY,"
				+ " PRO_IMG,"
				+ " PRO_ARTIST_NO,"
				+ " PRO_REG_DATE,"
				+ " PRO_DESCRIPTION,"
				+ " PRO_TYPE,"
				+ " PRO_STATUS"
				+ " FROM PRODUCT"
				+ " WHERE PRO_TYPE = ?"
				+ " AND PRO_STATUS = 'Y'"
				+ " ORDER BY PRO_NO DESC"
				+ ")"
				+ " WHERE RNUM BETWEEN ? AND ?";
		
		try {
			
			
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setRowNum(rs.getInt("RNUM"));
				product.setProNo(rs.getInt("PRO_NO"));
				product.setProName(rs.getString("PRO_NAME"));
				product.setProSize(rs.getString("PRO_SIZE"));
				product.setProPrice(rs.getInt("PRO_PRICE"));
				product.setProQuantity(rs.getInt("PRO_QUANTITY"));
				product.setProImg(rs.getString("PRO_iMG"));
				product.setProArtistNo(rs.getInt("PRO_ARTIST_NO"));				
				product.setProRegDate(rs.getDate("PRO_REG_DATE"));
				product.setProDescription(rs.getString("PRO_DESCRIPTION"));
				product.setProType(rs.getString("PRO_TYPE"));
				product.setPRO_STATUS(rs.getString("PRO_STATUS"));
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
	
	public int insertProduct(Connection connection, Product product) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL,"
				+ "?," 		 // PRO_NAME
				+ "?," 		 // PRO_SIZE
				+ "?," 		 // PRO_PRICE
				+ "?,"		 // PRO_QUANTITY
				+ "?," 		 // PRO_IMG
				+ "?," 		 // PRO_ARTIST_NO
				+ "SYSDATE," // PRO_REG_DATE
				+ "?,"		 // PRO_DESCRIPTION
				+ "?,"		 // PRO_TYPE
				+ "'Y'"		 // PRO_STATUS
				+ ")";		 
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, product.getProName());
			pstmt.setString(2, product.getProSize());
			pstmt.setInt(3, product.getProPrice());
			pstmt.setInt(4, product.getProQuantity());
			pstmt.setString(5, product.getProImg());
			pstmt.setInt(6, product.getProArtistNo());
			pstmt.setString(7, product.getProDescription());
			pstmt.setString(8, product.getProType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateProduct(Connection connection, Product product) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE PRODUCT SET "
				+ "PRO_NAME=?,"
				+ "PRO_SIZE=?,"
				+ "PRO_PRICE=?,"
				+ "PRO_QUANTITY=?,"
				+ "PRO_IMG=?,"
				+ "PRO_ARTIST_NO=?,"
				+ "PRO_DESCRIPTION=?,"
				+ "PRO_TYPE=?"
				+ "WHERE PRO_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, product.getProName());
			pstmt.setString(2, product.getProSize());
			pstmt.setInt(3, product.getProPrice());
			pstmt.setInt(4, product.getProQuantity());
			pstmt.setString(5, product.getProImg());
			pstmt.setInt(6, product.getProArtistNo());
			pstmt.setString(7, product.getProDescription());
			pstmt.setString(8, product.getProType());
			pstmt.setInt(9, product.getProNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateStatus(Connection connection, int proNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE PRODUCT SET PRO_STATUS=? WHERE PRO_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, proNo);		
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
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
	

	public int getProductCount(Connection connection, String type, String searchType, String searchVal) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		switch(searchType) {
		
		case "pro_Name":
			query = "SELECT COUNT(*) FROM PRODUCT WHERE PRO_STATUS='Y' AND PRO_TYPE=? AND PRO_NAME LIKE '%"+searchVal+"%'";
			break;
		case "pro_Artist_No":
			query = "SELECT COUNT(*) FROM PRODUCT JOIN MEMBER ON(PRODUCT.PRO_ARTIST_NO = MEMBER.MEMBER_NO) WHERE PRO_STATUS='Y' AND PRO_TYPE=? AND MEMBER_ID LIKE '%"+searchVal+"%'";
			break;
		default: 
			query = "SELECT COUNT(*) FROM PRODUCT WHERE PRO_STATUS='Y' AND PRO_TYPE=?";			
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

			
	public Product getProductByProNo(int proNo) {
		Product product = null;
		Connection connection = getConnection();
		
		product = new BoardDao().findProductByProNo(connection, proNo);
		
		close(connection);
		
		return product;
	}

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

	public int reduceProQuantity(Connection connection, int proNo, int orderQuantity) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE PRODUCT SET PRO_QUANTITY=? WHERE PRO_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, new BoardDao().findProductByProNo(connection, proNo).getProQuantity() - orderQuantity);
			pstmt.setInt(2, proNo);		
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public List<Product> findAll(Connection connection, PageInfo pageInfo, String type, String searchType, String searchVal) {
		List<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM,"
				+ " PRO_NO, PRO_NAME, PRO_SIZE, PRO_PRICE,"
				+ " PRO_QUANTITY,"
				+ " PRO_IMG,"
				+ " PRO_ARTIST_NO,"
				+ " PRO_REG_DATE,"
				+ " PRO_DESCRIPTION,"
				+ " PRO_TYPE"
				+ " FROM ("
				+ " SELECT ROWNUM AS RNUM,"
				+ " PRO_NO,"
				+ " PRO_NAME,"
				+ " PRO_SIZE,"
				+ " PRO_PRICE,"
				+ " PRO_QUANTITY,"
				+ " PRO_IMG,"
				+ " PRO_ARTIST_NO,"
				+ " PRO_REG_DATE,"
				+ " PRO_DESCRIPTION,"
				+ " PRO_TYPE"            
				+ " FROM PRODUCT"
				+ " WHERE PRO_TYPE = ? AND "+searchType+" LIKE ? ORDER BY PRO_NO DESC ) WHERE RNUM BETWEEN ? AND ?";
		
		
		try {
			
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, type);
			pstmt.setString(2, "%"+searchVal+"%");
			pstmt.setInt(3, pageInfo.getStartList()); 
			pstmt.setInt(4, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				
				product.setRowNum(rs.getInt("RNUM"));
				product.setProNo(rs.getInt("PRO_NO"));
				product.setProName(rs.getString("PRO_NAME"));
				product.setProSize(rs.getString("PRO_SIZE"));
				product.setProPrice(rs.getInt("PRO_PRICE"));
				product.setProQuantity(rs.getInt("PRO_QUANTITY"));
				product.setProImg(rs.getString("PRO_IMG"));
				product.setProArtistNo(rs.getInt("PRO_ARTIST_NO"));				
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
}



