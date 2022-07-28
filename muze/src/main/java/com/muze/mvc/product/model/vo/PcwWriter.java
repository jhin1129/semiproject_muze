package com.muze.mvc.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PcwWriter {
	private int proNo; //작품코드
	
	private String proName; //작품명
	
	private String proSize; //사이즈
	
	private int proPrice; //가격
	
	private int proQuantity; //수량
	
	private String proImg; //이미지
	
	private String ProArtistNo; //아티스트
	
	private Date proRegDate; //등록일
	
	private String proDescription; //작품설명
	
	private String proType; //작품타입

	private String proOriginalFileName;
	
	private String proRenamedFileName;
}
