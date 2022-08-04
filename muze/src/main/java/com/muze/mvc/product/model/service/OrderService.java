package com.muze.mvc.product.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.product.model.dao.OrderDao;
<<<<<<< HEAD
=======
import com.muze.mvc.product.model.vo.OrderStatus;
>>>>>>> origin/jinsik
import com.muze.mvc.product.model.vo.Orders;

public class OrderService {
	
<<<<<<< HEAD
	public int save(Orders order) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new OrderDao().insertPayment(connection, order);
=======

	public int insertOrder(List<Orders> orderList) {
		int orderNo = 0;
		Connection connection = getConnection();
		
		orderNo = new OrderDao().insertOrder(connection, orderList);

		if(orderNo > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return orderNo;
	}

	public void insertOrderStatus(List<OrderStatus> orderStatusList) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new OrderDao().insertOrderStatus(connection, orderStatusList);
>>>>>>> origin/jinsik

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
	}

}
