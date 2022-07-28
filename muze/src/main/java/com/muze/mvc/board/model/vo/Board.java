package com.muze.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	int rowNum;
	
	int brdNo;
	
	String brdTitle;
	
	String brdContent;
	
	Date brdDate;
	
	int brdReadCount;
	
	int brdWriterNo;
	
	String brdWriterId;
	
	int brdProNo;
	
	String brdProName;
	
	String brdCategory;
	
	String brdRepContent;
	
	String brdType;
	
	String brdStatus;
	
	String brdOriginalFileName;
	
	String brdRenamedFileName;
	
}
