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

@WebServlet("/product/update")
public class ProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductUpdateServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product product = null;

		int proNo = Integer.parseInt(request.getParameter("proNo"));
		
		System.out.println("게시글 번호 " + proNo);
		
		product = new ProductService().getProductByProNo(proNo);
		
		request.setAttribute("product", product);
		
		request.setAttribute("proNo", proNo);
		
		request.getRequestDispatcher("/views/product/product_update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
//		int proNo = Integer.parseInt(request.getParameter("proNo"));
		
		// 파일 저장 경로
		String path = getServletContext().getRealPath("/resources/upload/product/painting");	

		int maxSize = 20971520; //20mb
		
		String encoding = "UTF-8";

		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());

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
		
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		System.out.println(proNo);
		
    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");

		Product product = new Product();
		product.setProType(type);
		product.setProNo(proNo);
		product.setProArtistNo(loginMember.getMemberNo());
		product.setProName(pname);
		product.setProQuantity(pcount);
		product.setProSize(psize);
		product.setProImg(filesystemname);
		product.setProPrice(pprice);
		product.setProDescription(description);
		
		result = new ProductService().save(product);
		
		System.out.println(product);
		
		if(result > 0) {
			request.setAttribute("msg", "게시글 수정 성공");
		} else {
			request.setAttribute("msg", "게시글 수정 실패");
		}

	request.setAttribute("location", "/product/view?proNo=" + proNo);
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

	}

}
