package com.muze.mvc.product.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.muze.mvc.product.model.dao.WriterDao;
import com.muze.mvc.product.model.vo.Writer;

public class WriterService {

	public int save(Writer writer) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new WriterDao().insertWriter(connection, writer);

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		
		return result;
	}

}
