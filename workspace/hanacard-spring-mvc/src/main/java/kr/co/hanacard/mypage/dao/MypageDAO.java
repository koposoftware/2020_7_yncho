package kr.co.hanacard.mypage.dao;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.mypage.vo.MypageVO;

public interface MypageDAO {

	 public MypageVO getTopCurrentYear(String resiNum);
	 public MypageVO getTopCurrentYear(String resiNum, String cardListString);
	 
	 public MypageVO getTopSpecific(String resiNum, String year);
	 public MypageVO getTopSpecific(String resiNum, String cardListString, String year);
	 
	 public MypageVO getBottomSpecific(String resiNum, String year, String month);
	 public MypageVO getBottomSpecific(String resiNum, String cardListString, String year, String month);
	 
	 //public MypageVO getTopCurrentYear(@Param("loginVO") MemberVO loginVO, @Param("card") );

	 public void doUpdateLink(Map<String, String> map);
}
