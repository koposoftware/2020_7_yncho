package kr.co.hanacard.mypage.dao;
import org.apache.ibatis.annotations.Param;

import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.mypage.vo.MypageVO;

public interface MypageDAO {

	 public MypageVO getTopCurrentYear(String resiNum);
	 public MypageVO getTopCurrentYear(String resiNum, String cardListString);
	 
	 //public MypageVO getTopCurrentYear(@Param("loginVO") MemberVO loginVO, @Param("card") );

}
