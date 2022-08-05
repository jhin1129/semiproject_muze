package com.muze.mvc.product.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.muze.mvc.product.model.dao.OrderDao;
import com.muze.mvc.product.model.vo.Payment;

public class OrderService {
	
	public int save(Payment pay) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new OrderDao().insertPayment(connection, pay);

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		
		return result;
	}

}
