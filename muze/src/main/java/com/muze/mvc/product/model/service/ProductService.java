package com.muze.mvc.product.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.product.model.dao.ProductDao;

public class ProductService {

	public int save(Product product) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new ProductDao().insertProduct(connection, product);

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		
		return result;
	}

}
