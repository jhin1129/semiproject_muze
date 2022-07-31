package com.muze.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.muze.mvc.board.model.vo.Board;
import com.muze.mvc.board.model.vo.Comments;
import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

public class CommentsDao {

	public List<Comments> findCommentsList(Connection connection, int brdNo) {
		List<Comments> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COMMENTS_NO,"
							+ " COMMENTS_CONTENT,"
							+ " COMMENTS_DATE,"
							+ " BRD_NO,"
							+ " COMMENTS_WRITER_NO,"
							+ " MEMBER_ID,"
							+ " COMMENTS_STATUS"
							+ " FROM COMMENTS"
							+ " JOIN MEMBER ON (COMMENTS.COMMENTS_WRITER_NO = MEMBER.MEMBER_NO)"
							+ " WHERE BRD_NO=?"
							+ " AND COMMENTS_STATUS = 'Y'"
							+ " ORDER BY COMMENTS_NO ASC";
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, brdNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comments comments = new Comments();

				comments.setCommentsNo(rs.getInt("COMMENTS_NO"));
				comments.setCommentsContent(rs.getString("COMMENTS_CONTENT"));
				comments.setCommentsDate(rs.getDate("COMMENTS_DATE"));
				comments.setBrdNo(rs.getInt("BRD_NO"));
				comments.setCommentsWriterNo(rs.getInt("COMMENTS_WRITER_NO"));
				comments.setCommentsWriterId(rs.getString("MEMBER_ID"));
				comments.setCommentsStatus("COMMENTS_STATUS");
				
				list.add(comments);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public Comments insertComments(Connection connection, Comments comments) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int commentsNo=0;
		Comments getComments = new Comments();
		String query = "INSERT INTO COMMENTS VALUES("
							+ "SEQ_COMMENTS_NO.NEXTVAL,"	
							+ "?,"						
							+ "SYSDATE,"				
							+ "?,"						
							+ "?,"						
							+ "'Y'"						
							+ ")";
				
		try {
			pstmt = connection.prepareStatement(query, new String[] {"COMMENTS_NO"});
			
			pstmt.setString(1, comments.getCommentsContent());
			pstmt.setInt(2, comments.getBrdNo());
			pstmt.setInt(3, comments.getCommentsWriterNo());
			
			pstmt.executeUpdate();
			
			rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				commentsNo = rs.getInt(1);
			}
			getComments = this.findCommentsByCommentsNo(connection, commentsNo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return getComments;
	}

	private Comments findCommentsByCommentsNo(Connection connection, int commentsNo) {
		Comments comments = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
					" SELECT COMMENTS_NO,"
				+ 	" COMMENTS_CONTENT,"
				+ 	" COMMENTS_DATE,"
				+ 	" BRD_NO,"
				+ 	" COMMENTS_WRITER_NO,"
				+ 	" MEMBER_ID,"
				+ 	" COMMENTS_STATUS"
				+ 	" FROM COMMENTS"
				+ 	" JOIN MEMBER ON(COMMENTS.COMMENTS_WRITER_NO = MEMBER.MEMBER_NO)"
				+ 	" WHERE COMMENTS_STATUS = 'Y'"
				+   " AND COMMENTS_NO= ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, commentsNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				comments = new Comments();
				
				comments.setCommentsNo(rs.getInt("COMMENTS_NO"));
				comments.setCommentsContent(rs.getString("COMMENTS_CONTENT"));
				comments.setCommentsDate(rs.getDate("COMMENTS_DATE"));
				comments.setBrdNo(rs.getInt("BRD_NO"));
				comments.setCommentsWriterNo(rs.getInt("COMMENTS_WRITER_NO"));
				comments.setCommentsWriterId(rs.getString("MEMBER_ID"));
				comments.setCommentsStatus("COMMENTS_STATUS");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return comments;
	}

	public int updateStatus(Connection connection, int commentsNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE COMMENTS SET COMMENTS_STATUS=? WHERE COMMENTS_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, commentsNo);		
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateComments(Connection connection, Comments comments) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE COMMENTS"
							 + " SET COMMENTS_CONTENT=?"
							 + " WHERE COMMENTS_NO=?";
	
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, comments.getCommentsContent());
			pstmt.setInt(2, comments.getCommentsNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
