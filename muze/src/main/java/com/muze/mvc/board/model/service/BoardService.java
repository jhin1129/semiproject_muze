package com.muze.mvc.board.model.service;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.muze.mvc.board.model.dao.BoardDao;
import com.muze.mvc.board.model.dao.CommentsDao;
import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board.model.vo.Comments;
import com.muze.mvc.board.model.vo.Product;
import com.muze.mvc.common.util.PageInfo;
import com.muze.mvc.member.model.vo.Artist;
import com.muze.mvc.member.model.vo.Member;
import com.muze.mvc.product.model.dao.CartDao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

public class BoardService {

	public int getBoardCount(String type, String searchType, String searchVal) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection, type, searchType, searchVal);
		
		close(connection);
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo, String type, String searchType, String searchVal) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo, type, searchType, searchVal);
		
		close(connection);
		
		return list;
	}

	public Board getBoardByBrdNo(int brdNo, boolean hasRead, String type) {
		Board board = null;
		Connection connection = getConnection();
		
		board = new BoardDao().findBoardByBrdNo(connection, brdNo, type);
		
		// 게시글 조회수 증가 로직
		if(board != null && !hasRead) {
			int result = new BoardDao().updateReadCount(connection, board);
			
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		
		close(connection);
		
		return board;
	}

	public int saveBoard(Board board) {
		int result = 0;
		Connection connection = getConnection();
		
		if(board.getBrdNo() != 0) {
			result = new BoardDao().updateBoard(connection, board);
		} else {			
			result = new BoardDao().insertBoard(connection, board);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

//	public void deleteAllTempFiles(String targetFolder) {
//		File folder = new File(targetFolder);
//		if(!folder.exists()) {
//            return ;
//        }
//        
//        File[] files = folder.listFiles();
//        for(File file : files) {           
//            file.delete();
//        }
//        
//        return ;
//		
//	}

	public int deleteBoard(int brdNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new BoardDao().updateStatus(connection, brdNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		return result;
	}

	public List<Product> getProductListByOrdersMemberNo(int memberNo) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = BoardDao.findProductListByOrdersMemberNo(connection, memberNo);
		
		return list;
	}
	// PRODUCT SERVICE?
	public Product getProductByProNo(int brdProNo) {
		Product product = null;
		Connection connection = getConnection();
		
		product = new BoardDao().findProductByProNo(connection, brdProNo);
		
		close(connection);
		
		return product;
	}

	public List<Comments> getCommentsList(int brdNo) {
		List<Comments> commentsList = null;
		Connection connection = getConnection();
		
		commentsList = new CommentsDao().findCommentsList(connection, brdNo);
		return commentsList;
	}

	public Comments saveComments(Comments comments) {
		int result = 0;
		Comments getComments = new Comments();
		Connection connection = getConnection();
		
		if(comments.getCommentsNo() != 0) {
			result = new CommentsDao().updateComments(connection, comments);
			getComments.setCommentsNo(result);
		} else {			
			getComments = new CommentsDao().insertComments(connection, comments);
		}
		
		if(getComments.getCommentsNo() > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return getComments;
		
	}

	public int deleteComments(int commentsNo) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new CommentsDao().updateStatus(connection, commentsNo, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		return result;
	}

	public boolean authorityCheck(HttpServletRequest request, List<String> authority) {
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		if(loginMember != null) {
			for(String aut : authority) {
				if(loginMember.getMemberRole().equals(aut)) {
					return true;
				}
			}
		}
		
		return false;
	}

	public boolean selfCheck(HttpServletRequest request, int no) {
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		if(loginMember != null ) {
			if(loginMember.getMemberNo() == no)
				return true;
		}
		return false;
	}

	public String getImg(String content) {
		if(content.indexOf("src=\"") == -1) {
			return null;
		}
		return content.substring(content.indexOf("src=\"")).split("temporary/")[1].split("\"")[0];
	}
	//PRODUCT SERVICE
	public List<Product> getProductListByArtistNoNotSelfProduct(int proArtistNo, int proNo) {
		List<Product> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findProductListByArtistNoNotSelfProduct(connection, proArtistNo, proNo);
		
		return list;
	}
	//PRODUCT SERVICE
	public Artist getArtistByProNo(int proNo) {
		Artist artist = null;
		Connection connection = getConnection();
		
		artist = new BoardDao().findArtistByProNo(connection, proNo);
		
		close(connection);
		
		return artist;
	}
	//PRODUCT SERVICE
	public int getTotalPrice(List<Product> list) {
		int totalPrice = 0;
		
		for(Product product : list) {
			totalPrice += product.getProPrice() * product.getPayQuantity();
		}
		
		return totalPrice;
	}

	public List<Product> getProductListByproNoList(List<Integer> proNoList) {
		List<Product> list = new ArrayList<Product>();
		Connection connection = getConnection();
		
		for(int proNo : proNoList) {
			list.add(new BoardDao().findProductByProNo(connection, proNo));
		}
		
		return list;
	}

	public void deleteCartByProNoList(int memberNo, List<Integer> proNoList) {
		int result = 0;
		Connection connection = getConnection();
		
		for(int proNo : proNoList) {
			result = new CartDao().deleteCartByMemberNoProNo(connection, memberNo, proNo);
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		
		
		close(connection);
	}




}
