package com.muze.mvc.mypage.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.mypage.model.dao.MyOrderDao;
import com.muze.mvc.mypage.model.vo.MyOrder;


public class MyOrderService {
	// 기본 주문 정보 
	public MyOrder getOrderInfo() {
		MyOrder orderInfo = null;
		Connection connection = getConnection();

		orderInfo = new MyOrderDao().getOrderInfo(connection);
		
		close(connection);
		
		return orderInfo;
	}

	// 주문 상세 
	public MyOrder getOrderDetail() {
		MyOrder orderDetail = null;
		
		Connection connection = getConnection();

		orderDetail = new MyOrderDao().getOrderDetail(connection);
		
		close(connection);
		
		return orderDetail;
	}

	// 날짜별 주문 검색 
	public List<MyOrder> orderByDate(String dateFrom, String dateTo) {
		List<MyOrder> orderByDate = null;
		
		Connection connection = getConnection();

		orderByDate = new MyOrderDao().getOrderByDate(connection, dateFrom, dateTo);
		
		close(connection);
		
		return orderByDate;
	}

	// 주문 정보 (30일)
	public List<MyOrder> getOrderRec() {
		List<MyOrder> getOrderRec = null;
		
		Connection connection = getConnection();

		getOrderRec = new MyOrderDao().getOrderRec(connection);
		
		close(connection);
		
		return getOrderRec;
	}
	
	// 주문 현황 
	public List<MyOrder> getOrderStatus() {
		List<MyOrder> getOrderStatus = null;
        int result1 = 0;
        int result2 = 0;
        int result3 = 0;
        int result4 = 0;
        int result5 = 0;
        int result6 = 0;
		
		Connection connection = getConnection();

		getOrderStatus = new MyOrderDao().getOrderStatus(connection);
		
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
		}
			
		 for (int i = 0; i < getOrderStatus.size(); i++) {
			   getOrderStatus.get(i).setPro1(result1);
			   getOrderStatus.get(i).setPro2(result2);
			   getOrderStatus.get(i).setPro3(result3);
			   getOrderStatus.get(i).setPro4(result4);
			   getOrderStatus.get(i).setPro5(result5);
			   getOrderStatus.get(i).setPro6(result6);
		 }
		
		close(connection);
		
		return getOrderStatus;
	}

	// 주문 취소 
	public int orderCancel() {
		int result = 0; 
		Connection connection = getConnection();
		
		result = new MyOrderDao().orderCancel(connection);
		
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
	public List<MyOrder> cancelByDate(String dateFrom, String dateTo) {
		List<MyOrder> cancelByDate = null;
		
		Connection connection = getConnection();

		cancelByDate = new MyOrderDao().getCancelByDate(connection, dateFrom, dateTo);
		
		close(connection);
		
		return cancelByDate;
	}

	// 날짜별 환불 검색 
	public List<MyOrder> refundByDate(String dateFrom, String dateTo) {
		List<MyOrder> refundByDate = null;
		
		Connection connection = getConnection();

		refundByDate = new MyOrderDao().getRefundByDate(connection, dateFrom, dateTo);
		
		close(connection);
		
		return refundByDate;
	}
	
}
