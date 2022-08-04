package com.muze.mvc.mypage.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.mypage.model.vo.ArtOrder;

public class ArtOrderDao {

	public List<ArtOrder> getArtOrder(Connection connection, Artist artist) {
		List<ArtOrder> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT O.ORDER_DATE, O.ORDER_NO, P.PRO_NAME, P.PRO_PRICE, O.ORDER_AMOUNT, "
						+ "P.PRO_NO, P.PRO_ARTIST_NO, OS.ORDER_STATUS "
						+ "FROM ORDER_STATUS OS "
						+ "JOIN ORDERS O ON (OS.ORDER_NO = O.ORDER_NO) "
						+ "JOIN PRODUCT P ON (P.PRO_NO = O.PRO_NO) "
						+ "JOIN ARTIST_DETAIL A ON (A.ARTIST_NO = P.PRO_ARTIST_NO) "
						+ "WHERE A.ARTIST_NO = ? AND O.ORDER_DATE > SYSDATE -30";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, artist.getArtistNo());
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ArtOrder getArtOrder = new ArtOrder();
				
				getArtOrder.setOrderDate(rs.getDate("ORDER_DATE"));
				getArtOrder.setOrderNo(rs.getInt("ORDER_NO"));
				getArtOrder.setProName(rs.getString("PRO_NAME"));
				getArtOrder.setProPrice(rs.getInt("PRO_PRICE"));
				getArtOrder.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
				getArtOrder.setProNo(rs.getInt("PRO_NO"));
				getArtOrder.setProArtistNo(rs.getInt("PRO_ARTIST_NO"));
				getArtOrder.setOrderStatus(rs.getString("ORDER_STATUS"));
				
				list.add(getArtOrder);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int updateStatus(Connection connection, String status, int orderNo) {
		int result = 0;
		PreparedStatement pstm = null;
		String query = "UPDATE ORDER_STATUS SET ORDER_STATUS = ? WHERE ORDER_NO = ? ";
		
		try {
			pstm = connection.prepareStatement(query);
			pstm.setString(1, status); 
			pstm.setInt(2, orderNo); 
			
			result = pstm.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return result;
	}

}