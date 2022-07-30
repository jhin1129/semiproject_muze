package com.muze.mvc.product.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.muze.mvc.product.model.vo.PcwWriter;

public class PcwWriterDao {

	public int insertPcwWriter(Connection connection, PcwWriter pcwwriter) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL,?,?,?,?,?,SEQ_ARTIST_NO.NEXTVAL,SYSDATE,?,?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			
			pstmt.setString(1, pcwwriter.getProName());
			pstmt.setString(2, pcwwriter.getProSize());
			pstmt.setInt(3, pcwwriter.getProPrice());
			pstmt.setInt(4, pcwwriter.getProQuantity());
			pstmt.setString(5, pcwwriter.getProImg());
			pstmt.setString(6, pcwwriter.getProDescription());
			pstmt.setString(7, pcwwriter.getProType());

			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

}
