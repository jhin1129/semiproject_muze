package com.muze.mvc.mypage.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

import java.sql.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Welcome {
	
	// welcome row
	private int memberNo;
	private int mileageNow; // Point_Process
	private int boardCount; // BRD_TITLE
	private String memberName;
	
}
