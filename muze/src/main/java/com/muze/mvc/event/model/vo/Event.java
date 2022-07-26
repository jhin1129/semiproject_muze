package com.muze.mvc.event.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Event {
	int memberNo;
	Date evAttendDate;
}
