package com.muze.mvc.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.admin.model.service.AdminService;

@WebServlet("/admin/member/mgmt")
public class MemberMgmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberMgmtServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;
		String[] delMembers = request.getParameterValues("delMember");
		String btn = request.getParameter("btn");

		if (btn.equals("저장")) {

			int[] dmembers = new int[delMembers.length];
			for (int i = 0; i < delMembers.length; i++) {
				dmembers[i] = Integer.parseInt(delMembers[i]);

				result = new AdminService().delMember(dmembers);
			}
		}
		System.out.println(result);
		
		if (result > 0) {
			// 콘텐츠 관리 변경 내용 저장 완료
			request.setAttribute("msg", "변경 내용 저장 완료");
			request.setAttribute("location", "/admin/member");
		} else {
			request.setAttribute("msg", "변경 내용 저장 실패");
			request.setAttribute("location", "/admin/member");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}
