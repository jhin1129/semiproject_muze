package com.muze.mvc.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.product.model.service.CartService;
import com.muze.mvc.product.model.vo.Cart;

@WebServlet(name = "CartViewServlet", urlPatterns = { "/cart/view" })
public class CartViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartViewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		if(!loginMember.getMemberRole().equals("MEMBER_ROLE_USER")) {
			request.setAttribute("msg", "일반 계정으로 로그인 해 주세요");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			List<Cart> list = new ArrayList<Cart>();
			
			list = new CartService().getCartListByMemberNo(loginMember.getMemberNo());
			
			List<Product> productList = new CartService().getProductListByCartList(list);
			
			request.setAttribute("list", productList);
			request.getRequestDispatcher("/views/product/Cart.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
