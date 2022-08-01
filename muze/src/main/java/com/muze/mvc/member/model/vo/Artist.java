package com.muze.mvc.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Artist {

	int artistNo;
	
	String ArtistImg;
	
	String ArtistIntroduce;
	
	String busName;
	
	String busLicense;
}
