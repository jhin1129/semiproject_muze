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
	private int orderPrice; // 상품 금액  // PRODUCT PRO_PRICE
	private int delFee; // 배송비 // 2500
	private int mileage; // 할인혜택 // MILAEGE POINT_PROCESS
	private int totalPrice; // 최종 결제금액 
	
	// 주문 정보
	private int orderNo; // 주문 코드 ORDERS
	private Date orderDate; // 주문날짜 ORDERS
	private String proName; // 작품명 PRODUCT
	private int proPrice; // 가격 PRODUCT
	private String strPrice; // 가격 PRODUCT
	private int orderAmount; // 구매수량 ORDERS
	private int count;
	
	// 진행중인 주문 
	private String orderStatus; //
	private int pro1;
	private int pro2;
	private int pro3;
	private int pro4;
	private int pro5;
	private int pro6;
	
	// 상품상세 
	public MyOrder(String orderName, String orderAddr, String orderPhone, String email, int orderPrice, int delFee,
		int mileage, int totalPrice) {
		this.orderName = orderName;
		this.orderAddr = orderAddr;
		this.orderPhone = orderPhone;
		this.email = email;
		this.orderPrice = orderPrice;
		this.delFee = delFee;
		this.mileage = mileage;
		this.totalPrice = orderPrice + delFee - mileage;
	}


	// 주문 정보
	public MyOrder(String orderName, int orderNo, Date orderDate, String proName, int proPrice, String strPrice, int orderAmount, String orderStatus, int count) {
		this.orderName = orderName;
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.proName = proName;
		this.proPrice = proPrice;
		this.strPrice = strPrice;
		this.orderAmount = orderAmount;
		this.orderStatus = orderStatus;
		this.count = count;
	}

	// 주문 상태 
	public MyOrder(int pro1, int pro2, int pro3, int pro4, int pro5, int pro6) {
		this.pro1 = pro1;
		this.pro2 = pro2;
		this.pro3 = pro3;
		this.pro4 = pro4;
		this.pro5 = pro5;
		this.pro6 = pro6;
	}
	
	
	
	
	
	
}
