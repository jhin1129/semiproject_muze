package com.muze.mvc.mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.eclipse.jdt.internal.compiler.lookup.TagBits;

import com.muze.mvc.mypage.model.vo.Delivery;
import com.muze.mvc.mypage.model.vo.Welcome;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

public class WelcomeDao {

	public int getReviewC(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM BOARD WHERE BRD_WRITER_NO = 9 AND BRD_TYPE = 'FREE'";
		
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

	public int getMileageN(Connection connection) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT POINT_PROCESS FROM MILEAGE WHERE MEMBER_NO = 9";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public Delivery getOrderStatus(Connection connection) {
		Delivery orderStatus = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM ORDERSTATUS";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
			orderStatus = new Delivery();
			
			orderStatus.setOrderNo(rs.getInt("ORDER_NO"));
			orderStatus.setOrderdate(rs.getDate("ORDER_DATE"));
			orderStatus.setOrderIn(rs.getInt("ORDER_IN"));
			orderStatus.setOrderPaid(rs.getInt("ORDER_PAID"));;
			orderStatus.setOrderReady(rs.getInt("ORDER_READY"));
			orderStatus.setOrderShip(rs.getInt("ORDER_SHIP"));
			orderStatus.setOrderDelivered(rs.getInt("ORDER_DELIVERED"));
			orderStatus.setOrderComplete(rs.getInt("ORDER_COMPLETE"));
			orderStatus.setMemberNo(rs.getInt("MEMBER_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return orderStatus;
		
	}

	
	
}
