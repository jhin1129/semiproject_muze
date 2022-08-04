package com.muze.mvc.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderStatus {
	int orderNo;
	Date orderDate;
	String orderStatus;
	int memberNo;
	int proNo;
}
