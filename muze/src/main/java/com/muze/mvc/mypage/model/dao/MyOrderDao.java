package com.muze.mvc.mypage.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.lookup.TagBits;

import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.mypage.model.vo.ArtOrder;
import com.muze.mvc.mypage.model.vo.MyOrder;

import oracle.net.aso.e;

public class MyOrderDao {

	// 주문 상세 
	public MyOrder getOrderDetail(Connection connection, int no) {
		MyOrder orderDetail = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT O.ORDER_NO, O.ORDER_DATE, O.BUY_NAME, O.ORDER_AMOUNT, O.BUY_ADDRESS, OS.MEMBER_NO, P.PRO_NO, "
						+ "P.PRO_NAME, P.PRO_PRICE, OS.ORDER_STATUS, O.BUY_PHONE, "
						+ "M.MEMBER_EMAIL, I.POINT_CUR "
						+ "FROM PRODUCT P "
						+ "JOIN ORDERS O ON (P.PRO_NO = O.PRO_NO) "
						+ "JOIN ORDER_STATUS OS ON (OS.ORDER_NO = O.ORDER_NO) "
						+ "JOIN MEMBER M ON (M.MEMBER_NO = OS.MEMBER_NO) "
						+ "JOIN MILEAGE I ON (I.MEMBER_NO = M.MEMBER_NO) "
						+ "WHERE O.ORDER_NO = ? ";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				orderDetail = new MyOrder();
			
				orderDetail.setMemNo(rs.getInt("MEMBER_NO"));
				orderDetail.setOrderName(rs.getString("BUY_NAME"));
				orderDetail.setOrderAddr(rs.getString("BUY_ADDRESS"));
				orderDetail.setOrderPhone(rs.getString("BUY_PHONE"));
				orderDetail.setEmail(rs.getString("MEMBER_EMAIL"));
				orderDetail.setOrderNo(rs.getInt("ORDER_NO"));
				orderDetail.setOrderDate(rs.getDate("ORDER_DATE"));
				orderDetail.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				orderDetail.setProName(rs.getString("PRO_NAME"));
				orderDetail.setProPrice(rs.getInt("PRO_PRICE"));
				orderDetail.setMileage(rs.getInt("POINT_CUR"));
				orderDetail.setOrderStatus(rs.getString("ORDER_STATUS"));
				orderDetail.setProNo(rs.getInt("PRO_NO"));			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return orderDetail;
	}


	// 주문 정보 (30일) 
	public List<MyOrder> getOrderMem(Connection connection, int memNo) {
		List<MyOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT O.ORDER_NO, O.BUY_NAME, O.ORDER_DATE, O.ORDER_AMOUNT, OS.ORDER_STATUS, P.PRO_NAME, P.PRO_PRICE, P.PRO_NO "
						+ "FROM PRODUCT P "
						+ "JOIN ORDERS O ON (P.PRO_NO = O.PRO_NO) "
						+ "JOIN ORDER_STATUS OS ON (OS.ORDER_NO = O.ORDER_NO) "
						+ "WHERE O.MEMBER_NO = ? AND O.ORDER_DATE > SYSDATE -30 "
						+ "GROUP BY O.ORDER_NO, O.BUY_NAME, O.ORDER_DATE, O.ORDER_AMOUNT, OS.ORDER_STATUS, P.PRO_NAME, P.PRO_PRICE, P.PRO_NO "
						+ "ORDER BY ORDER_DATE DESC";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, memNo);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MyOrder getOrderRec = new MyOrder();
				
				getOrderRec.setOrderNo(rs.getInt("ORDER_NO"));
				getOrderRec.setOrderName(rs.getString("BUY_NAME"));
				getOrderRec.setOrderDate(rs.getDate("ORDER_DATE"));
				getOrderRec.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				getOrderRec.setProName(rs.getString("PRO_NAME"));
				getOrderRec.setProPrice(rs.getInt("PRO_PRICE"));
				getOrderRec.setOrderStatus(rs.getString("ORDER_STATUS"));
				getOrderRec.setProNo(rs.getInt("PRO_NO"));
				
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
	public List<MyOrder> getOrderStatus(Connection connection, int memNo) {
		List<MyOrder> getOrderStatus = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT ORDER_STATUS "
						+ "FROM ORDER_STATUS "
						+ "WHERE MEMBER_NO = ? AND ORDER_DATE > SYSDATE -30";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, memNo);
			
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
				orderStatus.setPro7(1);
				orderStatus.setPro8(1);
				
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
	public int orderCancel(Connection connection, int no) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE ORDER_STATUS SET ORDER_STATUS = '취소' WHERE ORDER_NO = ? ";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setInt(1, no); 
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}
	
	// 날짜별 주문 검색 
	public List<MyOrder> getOrderByDate(Connection connection, String dateFrom, String dateTo, int memNo, String type, int artNo) {
		List<MyOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String subquery1 = "";
		String subquery2 = "";
		
		if(artNo != 0) {
			subquery1 = "WHERE PRO_ARTIST_NO =";
		}else {
			subquery1 = "WHERE O.MEMBER_NO =";
		}

		if(type.equals("ORDER")) {
			subquery2 = "AND NOT(ORDER_STATUS = '환불' OR ORDER_STATUS = '취소') ";
		} else if (type.equals("CANCEL")) {
			subquery2 = "AND (ORDER_STATUS = '반품' OR ORDER_STATUS = '취소' OR ORDER_STATUS = '환불') ";
		} 
		
		String query = "SELECT O.ORDER_DATE, O.ORDER_NO, P.PRO_NAME, P.PRO_PRICE,  O.ORDER_AMOUNT, P.PRO_NO, P.PRO_ARTIST_NO, OS.ORDER_STATUS, COUNT(*) AS CNT "
						+ "FROM ORDER_STATUS OS "
						+ "JOIN ORDERS O ON (OS.ORDER_NO = O.ORDER_NO) "
						+ "JOIN PRODUCT P ON (P.PRO_NO = O.PRO_NO) "
						+ "JOIN ARTIST_DETAIL A ON (A.ARTIST_NO = P.PRO_ARTIST_NO) "
						+ subquery1
						+ "? AND O.ORDER_DATE BETWEEN ? AND TO_DATE(TO_CHAR( ? ))+1 "
						+ subquery2
						+ "GROUP BY O.ORDER_DATE, O.ORDER_NO, P.PRO_NAME, P.PRO_PRICE, O.ORDER_AMOUNT, P.PRO_NO, P.PRO_ARTIST_NO, OS.ORDER_STATUS "
						+ "ORDER BY ORDER_DATE DESC";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, memNo);
			pstmt.setString(2, dateFrom);
			pstmt.setString(3, dateTo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MyOrder orderByDate = new MyOrder();
				
				orderByDate.setOrderDate(rs.getDate("ORDER_DATE"));
				orderByDate.setOrderNo(rs.getInt("ORDER_NO"));
				orderByDate.setProName(rs.getString("PRO_NAME"));
				orderByDate.setProPrice(rs.getInt("PRO_PRICE"));
				orderByDate.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				orderByDate.setCount(rs.getInt("CNT"));
				orderByDate.setOrderStatus(rs.getString("ORDER_STATUS"));
				orderByDate.setProNo(rs.getInt("PRO_NO"));
				
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
}
