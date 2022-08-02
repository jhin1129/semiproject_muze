package com.muze.mvc.product.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.product.model.dao.OilpaintingDao;


public class OilpaintingService {

	public int getPaintingCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new OilpaintingDao().getPaintingCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Product> getPaingingList(PageInfo pageInfo) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new OilpaintingDao().finalAll(connection, pageInfo);
		
		close(connection);
		
		return list;
		
	}

}