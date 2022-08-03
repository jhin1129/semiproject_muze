package com.muze.mvc.product.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.product.model.vo.Writer;

public class ProductDao {
	
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



}
