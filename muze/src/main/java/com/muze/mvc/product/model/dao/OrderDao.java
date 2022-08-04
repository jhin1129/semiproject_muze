package com.muze.mvc.product.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

<<<<<<< HEAD
import com.muze.mvc.product.model.vo.Orders;


public class OrderDao {
	
	public int insertPayment(Connection connection, Orders orders) {
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
			pstmt.setInt(1, orders.getProNo());
			pstmt.setInt(2, orders.getMemberNo());
			pstmt.setString(3, orders.getBuyName());
			pstmt.setString(4, orders.getBuyAdress());
			pstmt.setString(5, orders.getBuyPhone());
			pstmt.setInt(6, orders.getPointNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
=======
import com.muze.mvc.product.model.vo.OrderStatus;
import com.muze.mvc.product.model.vo.Orders;

public class OrderDao {

	public int insertOrder(Connection connection, List<Orders> orderList) {
		int orderNo = 0;
		ResultSet rs = null;
		PreparedStatement pstm = null;
		
		for(int i = 0; i < orderList.size(); i++) {
			if(i == 0) {
				String query = "INSERT INTO ORDERS VALUES(SEQ_ORDER_NO.NEXTVAL,?,SYSDATE,?,?,?,?,?,?)";
				
				try {
					pstm = connection.prepareStatement(query, new String[] {"ORDER_NO"} );
					
					pstm.setInt(1, orderList.get(i).getProNo());
					pstm.setInt(2, orderList.get(i).getOrderAmount());
					pstm.setInt(3, orderList.get(i).getMemberNo());
					pstm.setString(4, orderList.get(i).getBuyName());
					pstm.setString(5, orderList.get(i).getBuyAdress());
					pstm.setString(6, orderList.get(i).getBuyPhone());
					pstm.setInt(7, orderList.get(i).getPointNo());
					
					pstm.executeUpdate();			
					
					rs = pstm.getGeneratedKeys();
					if(rs.next()) {
						orderNo = rs.getInt(1);
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstm);
				}
				
			} else {
				String query = "INSERT INTO ORDERS VALUES(SEQ_ORDER_NO.CURRVAL,?,SYSDATE,?,?,?,?,?,?)";
				
				try {
					pstm = connection.prepareStatement(query);
					
					pstm.setInt(1, orderList.get(i).getProNo());
					pstm.setInt(2, orderList.get(i).getOrderAmount());
					pstm.setInt(3, orderList.get(i).getMemberNo());
					pstm.setString(4, orderList.get(i).getBuyName());
					pstm.setString(5, orderList.get(i).getBuyAdress());
					pstm.setString(6, orderList.get(i).getBuyPhone());
					pstm.setInt(7, orderList.get(i).getPointNo());
					
					pstm.executeUpdate();			
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstm);
				}
			}
>>>>>>> origin/jinsik
		}
		
		return orderNo;
	}

	public int insertOrderStatus(Connection connection, List<OrderStatus> orderStatusList) {
		int result = 0;
		PreparedStatement pstm = null;
		
		String query = "INSERT INTO ORDER_STATUS VALUES(?,SYSDATE,?,?,?)";
		
		for(int i = 0; i < orderStatusList.size(); i++) {
			try {
				pstm = connection.prepareStatement(query);
				
				pstm.setInt(1, orderStatusList.get(i).getOrderNo());
				pstm.setString(2, orderStatusList.get(i).getOrderStatus());
				pstm.setInt(3, orderStatusList.get(i).getMemberNo());
				pstm.setInt(4, orderStatusList.get(i).getProNo());
				
				result = pstm.executeUpdate();			
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstm);
			}
		
		}
		
		
		return result;
	}

}
