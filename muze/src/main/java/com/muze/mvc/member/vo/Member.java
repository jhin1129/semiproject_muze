package com.muze.mvc.member.vo;

import lombok.Data;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;
	
	private String memberId;
	
	private String memberPassword;
	
	private String memberRole;
	
	private String memberName;
	
	private String memberPhonenumber;
	
	private String memberEmail;
	
	private String memberAddress;
	
	private int point;
	
	private Date enrollDate;
	
	private String ismember;
}
