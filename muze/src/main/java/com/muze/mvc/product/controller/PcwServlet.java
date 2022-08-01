package com.muze.mvc.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.product.model.service.PcwWriterService;
import com.muze.mvc.product.model.vo.PcwWriter;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/product/craft/writer")
public class PcwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PcwServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/product/Product_craft_writer.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		PcwWriter pcwwriter = null;
		String saveFolder = "/resources/upload/product/craft";	
		ServletContext context = getServletContext();
		String realFolder = context.getRealPath(saveFolder);
		
		System.out.println("realFolder : ------> " + realFolder + "<br>");
		
		int maxSize = 20971520; //20mb
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, realFolder, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String pccode = mr.getParameter("pccode");
		String pctype = mr.getParameter("pctype");
		String pcname = mr.getParameter("pcname");
		String pcsize = mr.getParameter("pcsize");
		String pccount = mr.getParameter("pccount");
		String pcartist = mr.getParameter("pcartist");
		String pcDescription = mr.getParameter("pcDescription");
		
		String filename = mr.getFilesystemName("pcimg");
		String flag = mr.getParameter("flag");
		File file = mr.getFile("pcimg");
		
		String fielsystemName = mr.getFilesystemName("pcimg");
		String originalFileName = mr.getOriginalFileName("pcimg");
		mr.getFile("pcimg");
		
		pcwwriter = new PcwWriter();
		
		pcwwriter.setProNo(1);
		pcwwriter.setProName(pcname);
		pcwwriter.setProSize(pcsize);
		pcwwriter.setProPrice(25000);
		pcwwriter.setProQuantity(1);
		pcwwriter.setProOriginalFileName(originalFileName);
		pcwwriter.setProRenamedFileName(filename);
		pcwwriter.setProArtistNo(pcartist);
		pcwwriter.setProDescription(pcDescription);
		pcwwriter.setProType(pctype);
		
		result = new PcwWriterService().save(pcwwriter);
		
		if(result > 0) {
			request.setAttribute("location", "/product/Product_craft.jsp");
		}else {
			request.setAttribute("location", "/product/Product_craft.jsp");
		}
		request.getRequestDispatcher("/views/product/Product_craft.jsp").forward(request, response);
	}

}
