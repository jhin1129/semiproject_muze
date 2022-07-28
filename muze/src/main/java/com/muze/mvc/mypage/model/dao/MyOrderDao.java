package com.muze.mvc.mypage.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.lookup.TagBits;

import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.mypage.model.vo.MyOrder;

public class MyOrderDao {

	// 기본 주문 정보 
	public MyOrder getOrderInfo(Connection connection) {
		MyOrder orderInfo = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT O.ORDER_NO, O.BUY_NAME, O.ORDER_DATE, O.ORDER_AMOUNT, P.PRO_NAME, OS.ORDER_STATUS, P.PRO_PRICE, "
						+ "REGEXP_REPLACE(REVERSE(REGEXP_REPLACE( REVERSE(TO_CHAR(P.PRO_PRICE)), '([0-9]{3})','\\1,')), '^,','') AS PRICE "
						+ "FROM PRODUCT P "
						+ "JOIN ORDERS O ON (P.PRO_NO = O.PRO_NO) "
						+ "JOIN ORDER_STATUS OS ON (OS.ORDER_NO = O.ORDER_NO) "
						+ "WHERE O.MEMBER_NO = 9";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				orderInfo = new MyOrder();
			
				orderInfo.setOrderNo(rs.getInt("ORDER_NO"));
				orderInfo.setOrderName(rs.getString("BUY_NAME"));
				orderInfo.setOrderDate(rs.getDate("ORDER_DATE"));
				orderInfo.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				orderInfo.setProName(rs.getString("PRO_NAME"));
				orderInfo.setProPrice(rs.getInt("PRO_PRICE"));
				orderInfo.setStrPrice(rs.getString("PRICE"));
				orderInfo.setOrderStatus(rs.getString("ORDER_STATUS"));

				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return orderInfo;
	}

	// 주문 상세 
	public MyOrder getOrderDetail(Connection connection) {
		MyOrder orderDetail = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT O.BUY_NAME, O.BUY_ADDRESS, O.ORDER_AMOUNT, M.MEMBER_EMAIL, P.PRO_PRICE, I.POINT_PROCESS, "
						+ "REGEXP_REPLACE(BUY_PHONE, '(.{3})(.+)(.{4})', '\\1-\\2-\\3') B_PHONE "
						+ "FROM MEMBER M "
						+ "JOIN MILEAGE I ON (I.MEMBER_NO = M.MEMBER_NO) "
						+ "JOIN ORDERS O ON (I.MEMBER_NO = O.MEMBER_NO) "
						+ "JOIN PRODUCT P ON (P.PRO_NO = O.PRO_NO) "
						+ "WHERE O.MEMBER_NO = 9";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				orderDetail = new MyOrder();
			
				orderDetail.setOrderName(rs.getString("BUY_NAME"));
				orderDetail.setOrderAddr(rs.getString("BUY_ADDRESS"));
				orderDetail.setOrderPhone(rs.getString("B_PHONE"));
				orderDetail.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				orderDetail.setEmail(rs.getString("MEMBER_EMAIL"));
				orderDetail.setOrderPrice(rs.getInt("PRO_PRICE"));
				orderDetail.setDelFee(2500);
				orderDetail.setMileage(rs.getInt("POINT_PROCESS"));
				orderDetail.setTotalPrice((rs.getInt("PRO_PRICE")*rs.getInt("ORDER_AMOUNT"))+2500-rs.getInt("POINT_PROCESS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return orderDetail;
	}

	// 날짜별 주문 검색 
	public List<MyOrder> getOrderByDate(Connection connection, String dateFrom, String dateTo) {
		List<MyOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT O.ORDER_NO, O.ORDER_DATE, O.ORDER_AMOUNT, P.PRO_NAME, P.PRO_PRICE, OS.ORDER_STATUS, COUNT(*) AS CNT, "
						+ "REGEXP_REPLACE(REVERSE(REGEXP_REPLACE( REVERSE(TO_CHAR(P.PRO_PRICE)), '([0-9]{3})','\\1,')), '^,','') AS PRICE "
						+ "FROM PRODUCT P "
						+ "JOIN ORDERS O ON (P.PRO_NO = O.PRO_NO) "
						+ "JOIN ORDER_STATUS OS ON (OS.ORDER_NO = O.ORDER_NO) "
						+ "WHERE O.MEMBER_NO = 9 AND O.ORDER_DATE BETWEEN ? AND ? AND NOT(ORDER_STATUS = '환불' OR ORDER_STATUS = '취소') "
						+ "GROUP BY O.ORDER_NO, O.ORDER_DATE, O.ORDER_AMOUNT, P.PRO_NAME, P.PRO_PRICE, OS.ORDER_STATUS";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dateFrom);
			pstmt.setString(2, dateTo);

			rs = pstmt.executeQuery();

			// 조회되는 데이터가 있으면 myOrder 객체로 만들어 리턴한다.
			while (rs.next()) {
				MyOrder orderByDate = new MyOrder();
				
				orderByDate.setOrderDate(rs.getDate("ORDER_DATE"));
				orderByDate.setOrderNo(rs.getInt("ORDER_NO"));
				orderByDate.setProName(rs.getString("PRO_NAME"));
				orderByDate.setProPrice(rs.getInt("PRO_PRICE"));
				orderByDate.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				orderByDate.setStrPrice(rs.getString("PRICE"));
				orderByDate.setCount(rs.getInt("CNT"));
				orderByDate.setOrderStatus(rs.getString("ORDER_STATUS"));

				
				list.add(orderByDate);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 주문 정보 (30일) 
	public List<MyOrder> getOrderRec(Connection connection) {
		List<MyOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT O.ORDER_NO, O.BUY_NAME, O.ORDER_DATE, O.ORDER_AMOUNT, OS.ORDER_STATUS, P.PRO_NAME, P.PRO_PRICE, "
						+ "REGEXP_REPLACE(REVERSE(REGEXP_REPLACE( REVERSE(TO_CHAR(P.PRO_PRICE)), '([0-9]{3})','\\1,')), '^,','') AS PRICE "
						+ "FROM PRODUCT P "
						+ "JOIN ORDERS O ON (P.PRO_NO = O.PRO_NO) "
						+ "JOIN ORDER_STATUS OS ON (OS.ORDER_NO = O.ORDER_NO) "
						+ "WHERE O.MEMBER_NO = 9 AND O.ORDER_DATE > SYSDATE -30";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MyOrder getOrderRec = new MyOrder();
				
				getOrderRec.setOrderNo(rs.getInt("ORDER_NO"));
				getOrderRec.setOrderName(rs.getString("BUY_NAME"));
				getOrderRec.setOrderDate(rs.getDate("ORDER_DATE"));
				getOrderRec.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				getOrderRec.setProName(rs.getString("PRO_NAME"));
				getOrderRec.setProPrice(rs.getInt("PRO_PRICE"));
				getOrderRec.setStrPrice(rs.getString("PRICE"));
				getOrderRec.setOrderStatus(rs.getString("ORDER_STATUS"));
				
				list.add(getOrderRec);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 주문 현황 
	public List<MyOrder> getOrderStatus(Connection connection) {
		List<MyOrder> getOrderStatus = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
        int result1 = 0;
        int result2 = 0;
        int result3 = 0;
        int result4 = 0;
        int result5 = 0;
        int result6 = 0;
		String query = "SELECT ORDER_STATUS "
						+ "FROM ORDER_STATUS "
						+ "WHERE MEMBER_NO = 9 AND ORDER_DATE > SYSDATE -30 AND NOT(ORDER_STATUS = '환불' OR ORDER_STATUS = '취소')";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MyOrder orderStatus = new MyOrder();
				
				orderStatus.setOrderStatus(rs.getString("ORDER_STATUS"));
				orderStatus.setPro1(1);
				orderStatus.setPro2(1);
				orderStatus.setPro3(1);
				orderStatus.setPro4(1);
				orderStatus.setPro5(1);
				orderStatus.setPro6(1);
				
				getOrderStatus.add(orderStatus);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return getOrderStatus;
	}

	// 주문 취소 
	public int orderCancel(Connection connection) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE ORDER_STATUS SET ORDER_STATUS = '취소' WHERE ORDER_NO = '2207239'";
		
		try {
			pstm = connection.prepareStatement(query);
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}

	// 날짜별 취소 검색 
	public List<MyOrder> getCancelByDate(Connection connection, String dateFrom, String dateTo) {
		List<MyOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT O.ORDER_NO, O.ORDER_DATE, O.ORDER_AMOUNT, P.PRO_NAME, P.PRO_PRICE, OS.ORDER_STATUS, COUNT(*) AS CNT, "
						+ "REGEXP_REPLACE(REVERSE(REGEXP_REPLACE( REVERSE(TO_CHAR(P.PRO_PRICE)), '([0-9]{3})','\\1,')), '^,','') AS PRICE "
						+ "FROM PRODUCT P "
						+ "JOIN ORDERS O ON (P.PRO_NO = O.PRO_NO) "
						+ "JOIN ORDER_STATUS OS ON (OS.ORDER_NO = O.ORDER_NO) "
						+ "WHERE O.MEMBER_NO = 9 AND O.ORDER_DATE BETWEEN ? AND ? AND (ORDER_STATUS = '반품' OR ORDER_STATUS = '취소') "
						+ "GROUP BY O.ORDER_NO, O.ORDER_DATE, O.ORDER_AMOUNT, P.PRO_NAME, P.PRO_PRICE, OS.ORDER_STATUS";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dateFrom);
			pstmt.setString(2, dateTo);

			rs = pstmt.executeQuery();

			// 조회되는 데이터가 있으면 myOrder 객체로 만들어 리턴한다.
			while (rs.next()) {
				MyOrder cancelByDate = new MyOrder();
				
				cancelByDate.setOrderDate(rs.getDate("ORDER_DATE"));
				cancelByDate.setOrderNo(rs.getInt("ORDER_NO"));
				cancelByDate.setProName(rs.getString("PRO_NAME"));
				cancelByDate.setProPrice(rs.getInt("PRO_PRICE"));
				cancelByDate.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				cancelByDate.setStrPrice(rs.getString("PRICE"));
				cancelByDate.setCount(rs.getInt("CNT"));
				cancelByDate.setOrderStatus(rs.getString("ORDER_STATUS"));

				
				list.add(cancelByDate);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 날짜별 환불 검색 
	public List<MyOrder> getRefundByDate(Connection connection, String dateFrom, String dateTo) {
		List<MyOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT O.ORDER_NO, O.ORDER_DATE, O.ORDER_AMOUNT, P.PRO_NAME, P.PRO_PRICE, OS.ORDER_STATUS, COUNT(*) AS CNT, "
						+ "REGEXP_REPLACE(REVERSE(REGEXP_REPLACE( REVERSE(TO_CHAR(P.PRO_PRICE)), '([0-9]{3})','\\1,')), '^,','') AS PRICE "
						+ "FROM PRODUCT P "
						+ "JOIN ORDERS O ON (P.PRO_NO = O.PRO_NO) "
						+ "JOIN ORDER_STATUS OS ON (OS.ORDER_NO = O.ORDER_NO) "
						+ "WHERE O.MEMBER_NO = 9 AND O.ORDER_DATE BETWEEN ? AND ? AND (ORDER_STATUS = '환불') "
						+ "GROUP BY O.ORDER_NO, O.ORDER_DATE, O.ORDER_AMOUNT, P.PRO_NAME, P.PRO_PRICE, OS.ORDER_STATUS";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dateFrom);
			pstmt.setString(2, dateTo);

			rs = pstmt.executeQuery();

			// 조회되는 데이터가 있으면 myOrder 객체로 만들어 리턴한다.
			while (rs.next()) {
				MyOrder refundByDate = new MyOrder();
				
				refundByDate.setOrderDate(rs.getDate("ORDER_DATE"));
				refundByDate.setOrderNo(rs.getInt("ORDER_NO"));
				refundByDate.setProName(rs.getString("PRO_NAME"));
				refundByDate.setProPrice(rs.getInt("PRO_PRICE"));
				refundByDate.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				refundByDate.setStrPrice(rs.getString("PRICE"));
				refundByDate.setCount(rs.getInt("CNT"));
				refundByDate.setOrderStatus(rs.getString("ORDER_STATUS"));

				
				list.add(refundByDate);
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
