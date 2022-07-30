package com.muze.mvc.product.controller;


import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.product.model.service.WriterService;
import com.muze.mvc.product.model.vo.Writer;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/product/painting")
public class WriterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriterServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/product/Product_painting.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		Writer writer = null;
		String saveFolder = "/resources/upload/product/painting";	
		ServletContext context = getServletContext();
		String realFolder = context.getRealPath(saveFolder);
		
		System.out.println("realFolder : ------> " + realFolder + "<br>");
		
		int maxSize = 20971520; //20mb
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, realFolder, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String pcode = mr.getParameter("pcode");
		String ptype = mr.getParameter("ptype");
		String pname = mr.getParameter("pname");
		String psize = mr.getParameter("psize");
		String pcount = mr.getParameter("pcount");
		String partist = mr.getParameter("partist");
		String description = mr.getParameter("description");
		
		String filename = mr.getFilesystemName("pimg");
		String flag = mr.getParameter("flag");
		File file = mr.getFile("pimg");
		
		String fielsystemName = mr.getFilesystemName("pimg");
		String originalFileName = mr.getOriginalFileName("pimg");
		mr.getFile("pimg");
		
		writer = new Writer();
		
		writer.setProNo(1);
		writer.setProName(pname);
		writer.setProSize(psize);
		writer.setProPrice(25000);
		writer.setProQuantity(1);
		writer.setProOriginalFileName(originalFileName);
		writer.setProRenamedFileName(filename);
		writer.setProArtistNo(partist);
		writer.setProDescription(description);
		writer.setProType(ptype);
		
		result = new WriterService().save(writer);
		
		if(result > 0) {
			request.setAttribute("location", "/product/Product_painting.jsp");
		}else {
			request.setAttribute("location", "/product/Product_painting.jsp");
		}
		request.getRequestDispatcher("/views/product/Product_painting.jsp").forward(request, response);
		
		
		
		
	}

}
