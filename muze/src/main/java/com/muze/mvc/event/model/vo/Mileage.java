package com.muze.mvc.event.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mileage {
	int pointNo;
	int memberNo;
	int pointProcess;
	String pointRoute;
	Date pointDate;
	String pointInOut;
	int pointBefore;
	int pointAfter;
}
