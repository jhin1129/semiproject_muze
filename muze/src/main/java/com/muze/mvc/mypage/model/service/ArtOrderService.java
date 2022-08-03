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

public class ArtOrderService {
	
	
	// 주문 정보 (30일)
	public List<ArtOrder> getArtOrder(Artist artist) {
		List<ArtOrder> getArtOrder = null;
		
		Connection connection = getConnection();
		
		getArtOrder = new ArtOrderDao().getArtOrder(connection, artist);
		
		close(connection);
		
		return getArtOrder;
	}

	public int updateStatus(String[] orderNoS, String status) {
		int result = 0; 
		Connection connection = getConnection();
		
		int[] orderNo = new int[orderNoS.length];
		
		for (int i = 0; i < orderNoS.length; i++) {
			orderNo[i] = Integer.parseInt(orderNoS[i]);
			result = new ArtOrderDao().updateStatus(connection, status, orderNo[i]);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

}
