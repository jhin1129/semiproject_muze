package com.muze.mvc.product.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.muze.mvc.product.model.vo.Writer;

public class WriterDao {
	

	public int insertWriter(Connection connection, Writer writer) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL,?,?,?,?,?,SEQ_ARTIST_NO.NEXTVAL,SYSDATE,?,?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			
			pstmt.setString(1, writer.getProName());
			pstmt.setString(2, writer.getProSize());
			pstmt.setInt(3, writer.getProPrice());
			pstmt.setInt(4, writer.getProQuantity());
			pstmt.setString(5, writer.getProImg());
			pstmt.setString(6, writer.getProDescription());
			pstmt.setString(7, writer.getProType());

			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



}
