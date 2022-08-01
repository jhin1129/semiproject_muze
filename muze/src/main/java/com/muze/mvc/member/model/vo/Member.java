package com.muze.mvc.member.model.vo;

import lombok.Data;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	int memberNo;
	
	String memberId;
	
	String memberPassword;
	
	String memberRole;
	
	String memberName;
	
	String memberPhonenumber;
	
	String memberEmail;
	
	String memberAddress;
	
	int point;
	
	Date enrollDate;
	
	String ismember;

}
