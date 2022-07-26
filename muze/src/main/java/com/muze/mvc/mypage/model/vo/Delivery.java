package com.muze.mvc.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Delivery {
	
	private int orderNo;
	private Date orderdate;
	private int orderIn;
	private int orderPaid;
	private int orderReady;
	private int orderShip;
	private int orderDelivered;
	private int orderComplete;
	private int memberNo; 
	
}
