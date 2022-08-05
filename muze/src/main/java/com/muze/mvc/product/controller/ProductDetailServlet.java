package com.muze.mvc.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.member.model.vo.Artist;

@WebServlet("/product/detail")
public class ProductDetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public ProductDetailServlet() {
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int proNo = Integer.parseInt(request.getParameter("proNo"));
      
      Product product = new BoardService().getProductByProNo(proNo);
      
      List<Product> productList = new ArrayList<Product>();
      
      productList = new BoardService().getProductListByArtistNoNotSelfProduct(product.getProArtistNo(), proNo);
      
      Artist artist = new BoardService().getArtistByProNo(proNo);
      
      request.setAttribute("artist", artist);
      request.setAttribute("product", product);
      request.setAttribute("productListByArtistNo", productList);
      
      request.getRequestDispatcher("/views/product/product_detail.jsp").forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
   }

}