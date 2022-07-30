package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.member.vo.Member;
import com.muze.mvc.mypage.model.dao.MyOrderDao;
import com.muze.mvc.mypage.model.vo.MyOrder;


public class MyOrderService {

	// 주문 상세 
	public MyOrder getOrderDetail(int no) {
		MyOrder orderDetail = null;
		
		Connection connection = getConnection();

		orderDetail = new MyOrderDao().getOrderDetail(connection, no);
		
		close(connection);
		
		return orderDetail;
	}

	// 날짜별 주문 검색 
	public List<MyOrder> orderByDate(String dateFrom, String dateTo, Member member) {
		List<MyOrder> orderByDate = null;
		
		Connection connection = getConnection();

		orderByDate = new MyOrderDao().getOrderByDate(connection, dateFrom, dateTo, member);
		
		close(connection);
		
		return orderByDate;
	}

	// 주문 정보 (30일)
	public List<MyOrder> getOrderRec(Member member) {
		List<MyOrder> getOrderRec = null;
		
		Connection connection = getConnection();

		getOrderRec = new MyOrderDao().getOrderRec(connection, member);
		
		close(connection);
		
		return getOrderRec;
	}
	
	// 주문 현황 
	public List<MyOrder> getOrderStatus(Member member) {
		List<MyOrder> getOrderStatus = null;
        int result1 = 0;
        int result2 = 0;
        int result3 = 0;
        int result4 = 0;
        int result5 = 0;
        int result6 = 0;
        int result7 = 0;
        int result8 = 0;
		
		Connection connection = getConnection();

		getOrderStatus = new MyOrderDao().getOrderStatus(connection, member);
		
		for (int i = 0; i < getOrderStatus.size(); i++) {
			
		    if (getOrderStatus.get(i).getOrderStatus().equals("입금대기")) {
		        result1++;
		    }
		
		    if (getOrderStatus.get(i).getOrderStatus().equals("결제완료") ) {
		        result2++;
		    }
		
		    if (getOrderStatus.get(i).getOrderStatus().equals("상품준비중") ) {
		        result3++;
		    }
		
		    if (getOrderStatus.get(i).getOrderStatus().equals("배송중") ) {
		        result4++;
		    }
		
		    if (getOrderStatus.get(i).getOrderStatus().equals("배송완료") ) {
		        result5++;
		    }
		
		    if (getOrderStatus.get(i).getOrderStatus().equals("구매확정") ) {
		        result6++;
		    }
		    
		    if (getOrderStatus.get(i).getOrderStatus().equals("취소") ) {
		    	result7++;
		    }
		    
		    if (getOrderStatus.get(i).getOrderStatus().equals("환불") ) {
		    	result8++;
		    }
		}
			
		 for (int i = 0; i < getOrderStatus.size(); i++) {
			   getOrderStatus.get(i).setPro1(result1);
			   getOrderStatus.get(i).setPro2(result2);
			   getOrderStatus.get(i).setPro3(result3);
			   getOrderStatus.get(i).setPro4(result4);
			   getOrderStatus.get(i).setPro5(result5);
			   getOrderStatus.get(i).setPro6(result6);
			   getOrderStatus.get(i).setPro7(result7);
			   getOrderStatus.get(i).setPro8(result8);
		 }
		
		close(connection);
		
		return getOrderStatus;
	}

	// 주문 취소 
	public int orderCancel(int no) {
		int result = 0; 
		Connection connection = getConnection();
		
		result = new MyOrderDao().orderCancel(connection, no);
		
		// Dao에서 값을 받아오는 과정이 제대로 이루어져, 양수값을 반환한다면
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	// 날짜별 취소 검색 
	public List<MyOrder> cancelByDate(String dateFrom, String dateTo, Member member) {
		List<MyOrder> cancelByDate = null;
		
		Connection connection = getConnection();

		cancelByDate = new MyOrderDao().getCancelByDate(connection, dateFrom, dateTo, member);
		
		close(connection);
		
		return cancelByDate;
	}

	// 날짜별 환불 검색 
	public List<MyOrder> refundByDate(String dateFrom, String dateTo, Member member) {
		List<MyOrder> refundByDate = null;
		
		Connection connection = getConnection();

		refundByDate = new MyOrderDao().getRefundByDate(connection, dateFrom, dateTo, member);
		
		close(connection);
		
		return refundByDate;
	}
	
}
