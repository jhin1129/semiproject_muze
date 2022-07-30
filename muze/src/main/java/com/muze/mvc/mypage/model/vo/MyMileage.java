package com.muze.mvc.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyMileage {
	
	private int pointNo;
	private int memberNo;
	private int point;
	private Date pointDate;
	private String route;
	private String inOut;
	
	public void setRoute(String route) {
		
		if (route.equals("ATT")) {
			
			this.route = "출석 이벤트";
		}
	}
	
}
