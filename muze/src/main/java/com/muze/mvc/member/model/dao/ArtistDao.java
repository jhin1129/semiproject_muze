package com.muze.mvc.member.model.dao;

import static com.muze.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.muze.mvc.member.model.vo.Artist;

public class ArtistDao {
	public Artist findArtistByNo(Connection connection, int memberNo) {
		Artist artist = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM ARTIST_DETAIL WHERE ARTIST_NO=?";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setInt(1, memberNo);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				artist = new Artist();
				
				artist.setArtistNo(rs.getInt("ARTIST_NO"));
				artist.setArtistImg(rs.getString("ARTIST_IMG"));
				artist.setArtistIntroduce(rs.getString("ARTIST_INTRODUCE"));
				artist.setBusName(rs.getString("BUS_NAME"));
				artist.setBusLicense(rs.getString("BUS_LICENSE"));
			}
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return artist;
	}
}
