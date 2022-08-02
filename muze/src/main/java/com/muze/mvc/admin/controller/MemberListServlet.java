package com.muze.mvc.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.admin.model.service.AdminService;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.member.model.vo.Member;

@WebServlet("/admin/member")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Member> list = null;
		
		try {
		page = Integer.parseInt(request.getParameter("page"));
		} catch(NumberFormatException e) {
			page = 1;
		}
		
		listCount = new AdminService().getMemberCount();
		pageInfo = new PageInfo(page, 5, listCount, 20);
		list = new AdminService().getMemberList(pageInfo);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/adminpage/members.jsp").forward(request, response);
	}

}