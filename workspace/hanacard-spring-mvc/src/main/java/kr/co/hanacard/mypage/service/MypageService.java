package kr.co.hanacard.mypage.service;

import kr.co.hanacard.mypage.vo.MypageVO;

public interface MypageService {
	
	/*
		인터페이스에서.
		
		모든 멤버변수는 public static final이어야하며, 이를 생략할 수 있다.
		모든 메서드는 public abstract이어야하며, 이를 생략할 수 있다. 

	 */
	
	 MypageVO getTopCurrentYear(String resiNum);
	 MypageVO getTopCurrentYear(String resiNum, String cardListString);
	 
	 //MypageVO getDataByYear();
	  
	 //MypageVO getDataByYearMonth();
	 

}
