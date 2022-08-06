package com.muze.mvc.product.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.muze.mvc.board.model.dao.BoardDao;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.product.model.dao.ProductDao;

public class ProductService {
	
	public int getProductCount(String type) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new ProductDao().getProductCount(connection, type);
		
		close(connection);
		
		return count;
	}

	public List<Product> getProductList(PageInfo pageInfo, String type) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new ProductDao().findAll(connection, pageInfo, type);
		
		close(connection);
		
		return list;
	}
	
	public int save(Product product) {
		int result = 0;
		
		Connection connection = getConnection();
		
		if(product.getProNo() != 0) {
			result = new ProductDao().updateProduct(connection, product);
		} else {
			result = new ProductDao().insertProduct(connection, product);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		
		return result;
	}

	public int deleteProduct(int proNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new ProductDao().updateStatus(connection, proNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		return result;
	}	

	public List<Product> getProductListByArtistNoNotSelfProduct(int proArtistNo, int proNo) {
		List<Product> list = null;
		Connection connection = getConnection();
		System.out.println(list);
		list = new ProductDao().findProductListByArtistNoNotSelfProduct(connection, proArtistNo, proNo);
		
		return list;
	}

	public Artist getArtistByProNo(int proNo) {
		Artist artist = null;
		Connection connection = getConnection();
		
		artist = new ProductDao().findArtistByProNo(connection, proNo);
		System.out.println(artist);
		close(connection);
		
		return artist;
	}

	public int getTotalPrice(List<Product> list) {
		int totalPrice = 0;
		
		for(Product product : list) {
			totalPrice += product.getProPrice() * product.getPayQuantity();
		}
		
		return totalPrice;
	}
	
	public Product getProductByProNo(int proNo) {
		Product product = null;
		Connection connection = getConnection();
		
		product = new ProductDao().findProductByProNo(connection, proNo);
		
		close(connection);
		
		return product;
	}

	public void reduceProQuantity(String[] proNoSplit, String[] payQuantitySplit) {
		int result= 0;
		Connection connection = getConnection();
		
		for(int i = 0; i < proNoSplit.length; i++) {
			result = new ProductDao().reduceProQuantity(connection, Integer.parseInt(proNoSplit[i]) ,Integer.parseInt(payQuantitySplit[i]));
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
	}

	
	public int getProductCount(PageInfo pageInfo) {
		return getProductCount("", "pro_Name", "");
	}
	
	public int getProductCount(String type, String searchType, String searchVal) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new ProductDao().getProductCount(connection, type, searchType, searchVal);
		
		close(connection);
		
		return count;
	}

	public List<Product> getProductList(PageInfo pageInfo) {
		return getProductList(pageInfo, "", "pro_Name", "");
	}
	
	public List<Product> getProductList(PageInfo pageInfo, String type, String searchType, String searchVal) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new ProductDao().findAll(connection, pageInfo, type, searchType, searchVal);
		
		close(connection);
		
		return list;
	}

}
