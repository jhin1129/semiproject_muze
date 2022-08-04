package com.muze.mvc.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {
	int orderNo; //주문코드
	
	int proNo; //작품코드
	
	Date orderDate; //주문날짜
	
	int orderAmount; //구매수량
	
	int memberNo; //유저번호
	
	String buyName; //구매자이름
	
	String buyAdress; //배송지
	
	String buyPhone; //구매자연락처
	
	int pointNo; //포인트번호

}
