package com.muze.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	int proNo;
	
	String proName;
	
	String proSize;
	
	int proPrice;
	
	int proQuantity;
	
	String proImg;
	
	int proArtistNo;
	
	String proArtistName;
	
	Date proRegDate;
	
	String proDescription;
	
	String proType;
	
	int rowNum;
	
	int payQuantity;
	
	String PRO_STATUS;
}
