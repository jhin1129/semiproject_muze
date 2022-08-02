package com.muze.mvc.event.model.vo;

import java.sql.Date;
//import java.util.Date;
import java.text.SimpleDateFormat;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Event {
	int memberNo;
	Date evAttendDate;
	
	public void setEvAttendDate(String attend_date) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			evAttendDate = new java.sql.Date(sdf.parse(attend_date).getTime());
		}
		catch(Exception e) {
			System.out.print("setEvAttendDate Err:" + e.getMessage());
		}
	}
	
	public void setEvAttendDate(Date evAttendDate) {
		this.evAttendDate = evAttendDate;
	}
	
	public Date getEvAttendDate() {
		return evAttendDate;
	}

	
}
