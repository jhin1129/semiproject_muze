package com.muze.mvc.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

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


}
