package com.muze.mvc.member.util;

import java.util.Random;

public class MvcUtils {
	//랜덤값 생성기
	
	public static String randomAlphaWord(int wordLength) {
		Random r = new Random();
		StringBuilder sb = new StringBuilder(wordLength);
		for(int i = 0; i < wordLength; i++) {
			char tmp = (char) ('a' + r.nextInt('z' - 'a'));
			sb.append(tmp);
		}
		return sb.toString();

	}
}