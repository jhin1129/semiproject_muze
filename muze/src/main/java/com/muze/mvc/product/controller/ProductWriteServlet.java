package com.muze.mvc.product.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.FileRename;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.product.model.service.ProductService;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/product/write")
public class ProductWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductWriteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/product/Product_write.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
//		String type = request.getParameter("type");
		
		String path = getServletContext().getRealPath("/resources/upload/product/painting");	
//		ServletContext context = getServletContext();
//		String realFolder = context.getRealPath(saveFolder);
		
//		System.out.println("realFolder : ------> " + realFolder + "<br>");
		
		int maxSize = 20971520; //20mb
		
		String encoding = "UTF-8";

		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		
//		String pcode = mr.getParameter("pcode");
	//	int partistno = Integer.parseInt(mr.getParameter("partistno"));
		String type = mr.getParameter("type");
		String pname = mr.getParameter("pname");
		int pcount = Integer.parseInt(mr.getParameter("pcount"));
		String psize = mr.getParameter("psize");
		String filesystemname = mr.getFilesystemName("pimg");
		String originalFileName = mr.getOriginalFileName("pimg");
		int pprice = Integer.parseInt(mr.getParameter("pprice"));
		String description = mr.getParameter("description");
		
		System.out.println(type);
		System.out.println(pname);
		System.out.println(pcount);
		System.out.println(psize);
		System.out.println(filesystemname);
		System.out.println(originalFileName);
		System.out.println(pprice);
		System.out.println(description);
		
    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");

		
//		String flag = mr.getParameter("flag");
//		File file = mr.getFile("pimg");
//		mr.getFile("pimg");
		
//		if(loginMember != null) {
		Product product = new Product();
		product.setProArtistNo(loginMember.getMemberNo());
		product.setProType(type);
		product.setProName(pname);
		product.setProQuantity(pcount);
		product.setProSize(psize);
		product.setProImg(filesystemname);
//		product.setProImg(originalFileName);
		product.setProPrice(pprice);
		product.setProDescription(description);
		
		result = new ProductService().save(product);
		
		if(result > 0) {
			request.setAttribute("msg", "게시글 작성에 성공하였습니다.");
			request.setAttribute("location", "/product/list?type=" + type);
		}else {
			request.setAttribute("msg", "게시글 작성에 실패하였습니다.");
			request.setAttribute("location", "/product/list?type=" + type);
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//	}
		
		
		
	}

}
