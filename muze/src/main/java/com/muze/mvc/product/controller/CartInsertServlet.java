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

import com.google.gson.Gson;
import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.product.model.service.CartService;
import com.muze.mvc.product.model.vo.Cart;

@WebServlet("/cart/insert")
public class CartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CartInsertServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> authority = new ArrayList<>();
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		int result = 0;
		int type = 0;
		authority.add("MEMBER_ROLE_USER");
		
		boolean authorityCheck = new BoardService().authorityCheck(request, authority);
		
		if(!authorityCheck) {
			request.setAttribute("msg", "유저 계정으로 로그인해 주세요");
			type=2;
		}else {
			Cart cart = new Cart();
			
			cart.setMemberNo(loginMember.getMemberNo());
			cart.setProNo(proNo);
			
			if(new CartService().isAlreadyCart(cart)) {
				type=3;
			}else {
				result = new CartService().insert(cart);
				
				if(result > 0) {
					type=1;
				} else {
					type=4;
				}
			}
		}
		
		response.setContentType("application/json;charset=UTF-8");
    	new Gson().toJson(type, response.getWriter());    	

		
	}

}
