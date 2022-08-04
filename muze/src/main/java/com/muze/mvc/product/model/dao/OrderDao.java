package com.muze.mvc.product.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.muze.mvc.product.model.vo.Payment;

public class OrderDao {
	
	public int insertPayment(Connection connection, Payment pay) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO ORDERS VALUES("
				+ "SEQ_ORDER_NO.NEXTVAL,"
				+ "?,"
				+ "SYSDATE,"
				+ "1,"
				+ "?,"
				+ "?,"
				+ "?,"
				+ "?,"
				+ "?"
				+ ")";
		
		try {
			pstmt = connection.prepareStatement(query);

//			pstmt.setInt(1, pay.getOrderNo());
			pstmt.setInt(1, pay.getProNo());
			pstmt.setInt(2, pay.getMemberNo());
			pstmt.setString(3, pay.getBuyName());
			pstmt.setString(4, pay.getBuyAdress());
			pstmt.setString(5, pay.getBuyPhone());
			pstmt.setInt(6, pay.getPointNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
