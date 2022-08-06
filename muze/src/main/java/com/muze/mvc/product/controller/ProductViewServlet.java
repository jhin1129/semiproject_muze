package com.muze.mvc.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.product.model.service.ProductService;

@WebServlet("/product/view")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductViewServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proNo = Integer.parseInt(request.getParameter("proNo"));
		
		Product product = new ProductService().getProductByProNo(proNo);
		
		List<Product> productList = new ArrayList<Product>();
		
		productList = new ProductService().getProductListByArtistNoNotSelfProduct(product.getProArtistNo(), proNo);
		
		Artist artist = new ProductService().getArtistByProNo(proNo);
		System.out.println(artist);
		request.setAttribute("proNo", proNo);
		request.setAttribute("artist", artist);
		request.setAttribute("product", product);
		request.setAttribute("productListByArtistNo", productList);
		
		request.getRequestDispatcher("/views/product/product_view.jsp").forward(request, response);
	}

}
