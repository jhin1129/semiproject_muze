package com.muze.mvc.product.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.muze.mvc.product.model.dao.PcwWriterDao;
import com.muze.mvc.product.model.vo.PcwWriter;

public class PcwWriterService {

	public int save(PcwWriter pcwwriter) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new PcwWriterDao().insertPcwWriter(connection, pcwwriter);

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		
		return result;
	}

}
