package com.muze.mvc.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.product.model.service.PowWriterService;
import com.muze.mvc.product.model.vo.PowWriter;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/product/oilpainting")
public class PowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PowServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		PowWriter powwriter = null;
		String saveFolder = "/resources/upload/product/oilpainting";	
		ServletContext context = getServletContext();
		String realFolder = context.getRealPath(saveFolder);
		
		System.out.println("realFolder : ------> " + realFolder + "<br>");
		
		int maxSize = 20971520; //20mb
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, realFolder, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String pocode = mr.getParameter("pocode");
		String potype = mr.getParameter("potype");
		String poname = mr.getParameter("poname");
		String posize = mr.getParameter("posize");
		String pocount = mr.getParameter("pocount");
		String poartist = mr.getParameter("poartist");
		String poDescription = mr.getParameter("poDescription");
		
		String filename = mr.getFilesystemName("poimg");
		String flag = mr.getParameter("flag");
		File file = mr.getFile("poimg");
		
		String fielsystemName = mr.getFilesystemName("poimg");
		String originalFileName = mr.getOriginalFileName("poimg");
		mr.getFile("poimg");
		
		powwriter = new PowWriter();
		
		powwriter.setProNo(1);
		powwriter.setProName(poname);
		powwriter.setProSize(posize);
		powwriter.setProPrice(25000);
		powwriter.setProQuantity(1);
		powwriter.setProOriginalFileName(originalFileName);
		powwriter.setProRenamedFileName(filename);
		powwriter.setProArtistNo(poartist);
		powwriter.setProDescription(poDescription);
		powwriter.setProType(potype);
		
		result = new PowWriterService().save(powwriter);
		
		if(result > 0) {
			request.setAttribute("location", "/product/Product_oilpainting.jsp");
		}else {
			request.setAttribute("location", "/product/Product_oilpainting.jsp");
		}
		request.getRequestDispatcher("/views/product/Product_oilpainting.jsp").forward(request, response);
		
		
		
		
	
	}

}
