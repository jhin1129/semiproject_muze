package com.muze.mvc.product.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.muze.mvc.product.model.vo.PowWriter;

public class PowWriterDao {

	public int insertPwoWriter(Connection connection, PowWriter powwriter) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL,?,?,?,?,?,SEQ_ARTIST_NO.NEXTVAL,SYSDATE,?,?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			
			pstmt.setString(1, powwriter.getProName());
			pstmt.setString(2, powwriter.getProSize());
			pstmt.setInt(3, powwriter.getProPrice());
			pstmt.setInt(4, powwriter.getProQuantity());
			pstmt.setString(5, powwriter.getProImg());
			pstmt.setString(6, powwriter.getProDescription());
			pstmt.setString(7, powwriter.getProType());

			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	

	
}
