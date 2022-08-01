package com.muze.mvc.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
	private int orderNo; //주문코드
	
	private int proNo; //작품코드
	
	private Date orderDate; //주문날짜
	
	private int orderAmount; //구매수량
	
	private int memberNo; //유저번호
	
	private String buyName; //구매자이름
	
	private String buyAddress; //배송지
	
	private String buyPhone; //구매자연락처
	
	private String paymentType; //결재종류
	
	private int buyAcc; //구매자계좌
	
	private int adminAcc; //대표계좌
	
	private int pointNo; //포인트번호

}
