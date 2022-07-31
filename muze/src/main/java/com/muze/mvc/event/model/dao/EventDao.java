package com.muze.mvc.event.model.dao;
import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.muze.mvc.event.model.vo.Mileage;

public class EventDao {
	
		public int insertAttMileage (Connection connection, Mileage mileage) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = "INSERT INTO MILEAGE VALUES(SEQ_POINT,?,100,'ATT',DEFAULT,'IN')";
			
			try {
				pstmt = connection.prepareStatement(query);
				
				pstmt.setInt(1, mileage.getMemberNo());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}
	}

