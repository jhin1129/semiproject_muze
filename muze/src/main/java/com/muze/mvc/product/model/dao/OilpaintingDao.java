package com.muze.mvc.product.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;


public class OilpaintingDao {

	public int getPaintingCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT "
				+ " COUNT(*)"
				+ " FROM PRODUCT"
				+ " WHERE PRO_TYPE = '유화'";
		
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

	public List<Product> finalAll(Connection connection, PageInfo pageInfo) {
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
				+ " WHERE PRO_TYPE = '유화' ORDER BY PRO_NO DESC"
				+ ")"
				+ " WHERE RNUM BETWEEN ? AND ?";
		
		
		try {
			
			
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
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
