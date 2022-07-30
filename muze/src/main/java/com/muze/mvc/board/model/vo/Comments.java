package com.muze.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comments {
	int commentsNo;
	
	String commentsContent;
	
	Date commentsDate;
	
	int brdNo;
	
	int commentsWriterNo;
	
	String commentsWriterId;
	
	String commentsStatus;
}
