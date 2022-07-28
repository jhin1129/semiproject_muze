package com.muze.mvc.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyOrder {
	
	// 상품상세 
	private String orderName; // 주문 이름 // ORDERS BUY_NAME
	private String orderAddr; // 주문 주소  // ORDERS BUY_ADDRESS
	private String orderPhone; // 주문 연락처  // ORDERS BUY_PHONE
	private String email; // 주문 이메일 // MEMBER MEMBER_EMAIL
	private int delFee; // 배송비 // 2500
	private int mileage; // 할인혜택 // MILAEGE POINT_PROCESS
	private int totalPrice; // 최종 결제금액 
	
	// 주문 정보
	private int orderNo; // 주문 코드 ORDERS
	private int orderAmount; // 구매수량 ORDERS
	private Date orderDate; // 주문날짜 ORDERS
	private String proName; // 작품명 PRODUCT
	private int proPrice; // 가격 PRODUCT
//	private String strPrice; // 가격 PRODUCT
	private int count;
	
	// 진행중인 주문 
	private String orderStatus; // 주문 상태 ORDER_STATUS
	private int pro1; // 입금대기 
	private int pro2; // 결제완료 
	private int pro3; // 상품준비중 
	private int pro4; // 배송중 
	private int pro5; // 배송완료 
	private int pro6; // 구매확정 
	
	public int getTotalPrice() {

		this.totalPrice = (proPrice * orderAmount) + delFee - mileage;
		
		return totalPrice;
	}

}
