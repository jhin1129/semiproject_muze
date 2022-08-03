package com.muze.mvc.product.model.service;

import java.sql.Connection;
import java.util.List;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.product.model.dao.PaintingDao;

public class PaintingService {

	public int getPaintingCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new PaintingDao().getPaintingCount(connection);
		
		close(connection);
		
		return count;
		
	}

	public List<Product> getPaingingList(PageInfo pageInfo) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new PaintingDao().finalAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}



}
