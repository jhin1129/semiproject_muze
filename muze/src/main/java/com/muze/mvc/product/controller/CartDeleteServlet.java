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

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.member.model.vo.Member;

@WebServlet("/cart/delete")
public class CartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		String[] proNoStrList = request.getParameterValues("list");
		List<Integer> proNoList = new ArrayList<Integer>();
		String[] splitProNo = proNoStrList[0].split(",");
		for(String str : splitProNo) {
			proNoList.add(Integer.parseInt(str));
		}
		
		new BoardService().deleteCartByProNoList(loginMember.getMemberNo(), proNoList);
		
		request.getRequestDispatcher("/cart/view").forward(request, response);
	}

}
