package com.muze.mvc.product.model.service;

import static com.muze.mvc.common.jdbc.JDBCTemplate.close;
import static com.muze.mvc.common.jdbc.JDBCTemplate.commit;
import static com.muze.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.muze.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.product.model.dao.CartDao;
import com.muze.mvc.product.model.vo.Cart;

public class CartService {

	public boolean isAlreadyCart(Cart cart) {
		List<Cart> list = new ArrayList<Cart>();
		Connection connection = getConnection();
		list = new CartDao().getCartListByMemberNo(connection, cart.getMemberNo());
		
		for(Cart alreadycart : list) {
			if(alreadycart.getProNo() == cart.getProNo()) {
				return true;
			}
		}
		
		return false;
	}
	
	public int insert(Cart cart) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new CartDao().insertCart(connection, cart);

		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	public List<Cart> getCartListByMemberNo(int memberNo) {
		List<Cart> list = new ArrayList<Cart>();
		Connection connection = getConnection();
		
		list = new CartDao().getCartListByMemberNo(connection, memberNo);
		close(connection);

		return list;
	}

	public List<Product> getProductListByCartList(List<Cart> cartList) {
		List<Product> list = new ArrayList<Product>();
		
		for(Cart cart : cartList) {
			list.add(new BoardService().getProductByProNo(cart.getProNo())) ;
		}
		
		return list;
	}

}
