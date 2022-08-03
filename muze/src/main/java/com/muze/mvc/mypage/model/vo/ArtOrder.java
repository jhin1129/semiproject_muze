package com.muze.mvc.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ArtOrder {
	
	// 주문 정보
	private Date orderDate; // 주문날짜 ORDERS
	private String proName; // 작품명 PRODUCT
	private int orderNo; // 주문 코드 ORDERS
	private int orderAmount; // 구매수량 ORDERS
	private int proPrice; // 가격 PRODUCT
	private int proNo; // 작품넘버 PRODUCT 
	private int proArtistNo; // 작가넘버 PRODUCT
	private int count;

	// 주문 상태 
	private String orderStatus; // 주문 상태 ORDER_STATUS
	private int pro1; // 입금대기 
	private int pro2; // 결제완료 
	private int pro3; // 상품준비중 
	private int pro4; // 배송중 
	private int pro5; // 배송완료 
	private int pro6; // 구매확정 
	private int pro7; // 취소
	private int pro8; // 환불 
	
}
