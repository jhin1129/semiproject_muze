package com.muze.mvc.exihibition.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/exhibition/view")
public class ExhibitionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExhibitionViewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("no", request.getParameter("no"));
		request.getRequestDispatcher("/views/community/exhibition/exhibition_view.jsp").forward(request, response);

	}

}
