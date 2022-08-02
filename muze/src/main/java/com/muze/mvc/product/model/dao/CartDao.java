package com.muze.mvc.product.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.product.model.vo.Cart;

public class CartDao {

	public List<Cart> getCartListByMemberNo(Connection connection, int memberNo) {
		List<Cart> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT MEMBER_NO, PRO_NO FROM CART WHERE MEMBER_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				Cart cart = new Cart();
				
				cart.setMemberNo(rs.getInt("MEMBER_NO"));
				cart.setProNo(rs.getInt("PRO_NO"));
				
				list.add(cart);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int insertCart(Connection connection, Cart cart) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO CART VALUES(? , ?)";
				
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, cart.getMemberNo());
			pstmt.setInt(2, cart.getProNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteCartByMemberNoProNo(Connection connection, int memberNo, int proNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE FROM CART WHERE MEMBER_NO = ? AND PRO_NO = ?";
				
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, memberNo);
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
