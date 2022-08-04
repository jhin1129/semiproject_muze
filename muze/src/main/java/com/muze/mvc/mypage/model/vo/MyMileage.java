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
	private int pointcur;
	
	public void setRoute(String route) {
		if (route.equals("ATT")) {
			this.route = "출석 이벤트";
			
		} else if (route.equals("JOIN")) {
			this.route = "신규회원 가입";

		} else if (route.equals("ORDER")) {
			this.route = "상품 구매";
			
		} else if (route.equals("REFUND")) {
			this.route = "환불";
		}
	}
	
	public void setInOut(String inOut) {
		if (inOut.equals("IN")) {
			this.inOut = "+";
		}
		if (inOut.equals("OUT")) {
			this.inOut = "-";
		}
	}
}
