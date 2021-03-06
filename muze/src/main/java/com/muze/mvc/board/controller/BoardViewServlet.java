package com.muze.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.muze.mvc.board.model.service.BoardService;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board.model.vo.Comments;
import com.muze.mvc.board.model.vo.Product;


@WebServlet("/board/view")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardViewServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Board board = null;
    	List<Comments> commentsList = null;
    	String type = request.getParameter("type");
    	int no = Integer.parseInt(request.getParameter("no"));
    	board = new BoardService().getBoardByNo(no, true, type);
    	
    	if(type.equals("REVIEW")) {
    		Product product = new Product();
    		product = new BoardService().getProductByNo(board.getBrdProNo());
    		request.setAttribute("product", product);
    	}
    	
    	commentsList = new BoardService().getCommentsList(no);
    	
    	request.setAttribute("type", type);
    	request.setAttribute("board", board);
    	request.setAttribute("commentsList", commentsList);
    	request.getRequestDispatcher("/views/community/board/board_view.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
