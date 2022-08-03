package com.muze.mvc.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.admin.model.service.AdminService;

@WebServlet("/admin/content/mgmt")
public class ContentMgmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContentMgmtServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		String[] openContents = request.getParameterValues("openContent");
		String[] hideContents = request.getParameterValues("hideContent");
		String btn = request.getParameter("btn");
		
		if(btn.equals("공개")) {
			int[] ocontents = new int[openContents.length];
			for(int i = 0; i < openContents.length; i++) {
				ocontents[i] = Integer.parseInt(openContents[i]);
				
				result = new AdminService().openContent(ocontents);
			}	 
		} else if(btn.equals("숨김")) {
			int[] hcontents = new int[hideContents.length];
			for(int i = 0; i < hideContents.length; i++) {
				hcontents[i] = Integer.parseInt(hideContents[i]);
			
				result = new AdminService().hideContent(hcontents);
			}
		}
		
	if(result > 0) {
		// 콘텐츠 관리 변경 내용 저장 완료
		request.setAttribute("msg", "변경 내용 저장 완료");
		request.setAttribute("location", "/admin/content");
	} else {
		request.setAttribute("msg", "변경 내용 저장 실패");
		request.setAttribute("location", "/admin/content");
	}
	
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	}
}
