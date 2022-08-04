package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.mypage.model.dao.ArtOrderDao;
import com.muze.mvc.mypage.model.vo.ArtOrder;
import com.muze.mvc.mypage.model.vo.MyOrder;

public class ArtOrderService {
	
	
	// 주문 정보 (30일)
	public List<ArtOrder> getArtOrder(Artist artist) {
		List<ArtOrder> getArtOrder = null;
		
		Connection connection = getConnection();
		
		getArtOrder = new ArtOrderDao().getArtOrder(connection, artist);
		
		close(connection);
		
		return getArtOrder;
	}

	public int updateStatus(int[] orderNo, String status, int buyMemNo, int buyMemMil) {
		int result1 = 0; 
		int result2 = 0; 
		Connection connection = getConnection();
		
		if(status.equals("환불")) {
			for (int i = 0; i < orderNo.length; i++) {
				result1 = new ArtOrderDao().updateStatus(connection, status, orderNo[i]);
				result2 = new ArtOrderDao().insertMileage(connection, status, buyMemNo, buyMemMil);
			}

		}else {
			for (int j = 0; j < orderNo.length; j++) {
				result1 = new ArtOrderDao().updateStatus(connection, status, orderNo[j]);
			}
		}
			
		if(result1 + result2 > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result1;
	}

}
