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
	private int mileageNow; // Point_Process
	private int boardCount; // BRD_TITLE
	// 진행중인 주문 (9번 이민형으로)
	private int orderNo;
	private int proNo;
	private Date orderDate;
	private int memberNo;

	public Welcome(int mileageNow, int reviewCount) {
		this.mileageNow = mileageNow;
		this.boardCount = reviewCount;
	}
	
	public Welcome(int orderNo, int proNo, Date orderDate, int memberNo) {
		super();
		this.orderNo = orderNo;
		this.proNo = proNo;
		this.orderDate = orderDate;
		this.memberNo = memberNo;
	}
	
	
}
