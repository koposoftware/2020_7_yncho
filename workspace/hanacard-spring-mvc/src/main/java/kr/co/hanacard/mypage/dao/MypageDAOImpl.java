package kr.co.hanacard.mypage.dao;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hanacard.mypage.vo.MypageVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Autowired // 객체 찾는 순서에 의해, 첫번째로 생성된 bean 중에 타입이 맞는 것을 가져와서 넣는다. (spring-mvc.xml에 bean 태그 중 SqlSessionTemplete  있음)
	private SqlSessionTemplate sqlSession; 
	// spring-mvc.xml 내에 관련 bean 태그가 있다.
	// src/test/java의 MyBatisTest.java에서 SqlSessionTemplate 객체가 잘 생성되나 테스트 해봤음. jUnit 테스트.
	// 전에는 conn 객체를 만들었는데, 이제는 sqlSession 객체를 활용해서 처리한다.
	
	@Override
	public MypageVO getTopCurrentYear(String resiNum) {
		
		MypageVO mypageVO = sqlSession.selectOne("mypage.dao.MypageDAO.getTopCurrentYear", resiNum);
		//selectOne("매퍼의 namespace + <select> 등 태그의 id")

		return mypageVO;
	}
	
	@Override // 이렇게 @Param으로 날라갈까?
	public MypageVO getTopCurrentYear(String resiNum, String cardListString) {
				
		Map<String, String> map = new HashMap<>();
		map.put("resiNum", resiNum);
		map.put("cardListString", cardListString);
		
		System.out.println("map.get(\"resiNum\") : " + map.get("resiNum") );
		System.out.println("map.get(\"cardListString\") : " + map.get("cardListString"));
		MypageVO mypageVO = sqlSession.selectOne("mypage.dao.MypageDAO.getTopCurrentYearOpen", map);
		
		
		//MypageVO mypageVO = sqlSession.selectOne("mypage.dao.MypageDAO.getTopCurrentYear", resiNum);
		// 이렇게는 안되는듯 MypageVO mypageVO = sqlSession.selectOne("mypage.dao.MypageDAO.getTopCurrentYear", resiNum, cardListString);
		//selectOne("매퍼의 namespace + <select> 등 태그의 id")
		
		return mypageVO;
	}

	
	@Override
	public MypageVO getTopSpecific(String resiNum, String year) {
		
		Map<String, String> map = new HashMap<>();
		map.put("resiNum", resiNum);
		map.put("year", year);
		
		MypageVO mypageVO = sqlSession.selectOne("mypage.dao.MypageDAO.getTopSpecific", map);

		return mypageVO;
	}

	@Override
	public MypageVO getTopSpecific(String resiNum, String cardListString, String year) {
		Map<String, String> map = new HashMap<>();
		map.put("resiNum", resiNum);
		map.put("cardListString", cardListString);
		map.put("year", year);
		
		MypageVO mypageVO = sqlSession.selectOne("mypage.dao.MypageDAO.getTopSpecificOpen", map);
		
		return mypageVO;
	}

	
	@Override
	public MypageVO getBottomSpecific(String resiNum, String year, String month) {
	
		Map<String, String> map = new HashMap<>();
		map.put("resiNum", resiNum);
		map.put("year", year);
		map.put("month", month);
		
		MypageVO mypageVO = sqlSession.selectOne("mypage.dao.MypageDAO.getBottomSpecific", map);

		//하드코딩이다. mypageVO를 mypagetopVO, mypagebottomVO로 나누어야 한다. 
		// 지금은 혹시나 월별 소비합계랑과 영역별 소비합계를 같이 사용할 일이 있지 않을까싶어서 그냥 두는 것임.
		// 나중에 따로 사용할 일이 없을거같으면 과감하게 객체를 분리한다.
		// 지금 여기서 0으로 값을 변경하는 이유는, 도넛차트에서 option에서 array 가져올 때 null 때문에 total 값이 NaN이 되어버리는 문제때문임.
		// 이것때문이 아닌거같다. 아직도 nan으로 뜨네..뭐지
		// 하하. 1) list.leisure_travel_flight을 list.Leisure_travel_flight 오타.
		// 2) MypageVO에서 영역별 소비금액이 String으로 되어있다. java script에서 reduce 활용해 배열의 합계를 구할 때, 문자열이라 이어붙여져버렸다. 그래서 제대로 안나옴.
		// 그냥 mypageVO의 멤버변수들을 double로 바꿔버림.
		// 이렇게 되면, 객체가 생겨날 때 모든 멤버변수들의 초기값이 0이 되어버린다. vs 문자열은 null이 초기값이다.

//		mypageVO.setJan("0");
//		mypageVO.setFeb("0");
//		mypageVO.setMar("0");
//		mypageVO.setApr("0");
//		mypageVO.setMay("0");
//		mypageVO.setJun("0");
//		mypageVO.setJul("0");
//		mypageVO.setAug("0");
//		mypageVO.setSept("0");
//		mypageVO.setOct("0");
//		mypageVO.setNov("0");
//		mypageVO.setDec("0");
		
		
		return mypageVO;
	}
	

	@Override
	public MypageVO getBottomSpecific(String resiNum, String cardListString, String year, String month) {
		Map<String, String> map = new HashMap<>();
		map.put("resiNum", resiNum);
		map.put("cardListString", cardListString);
		map.put("year", year);
		map.put("month", month);

		System.out.println("DAOImpl 단에서 받는 month : " + month);
		MypageVO mypageVO = sqlSession.selectOne("mypage.dao.MypageDAO.getBottomSpecificOpen", map);

		
		//하드코딩이다. mypageVO를 mypagetopVO, mypagebottomVO로 나누어야 한다. 
		// 지금은 혹시나 월별 소비합계랑과 영역별 소비합계를 같이 사용할 일이 있지 않을까싶어서 그냥 두는 것임.
		// 나중에 따로 사용할 일이 없을거같으면 과감하게 객체를 분리한다.
		// 지금 여기서 0으로 값을 변경하는 이유는, 도넛차트에서 option에서 array 가져올 때 null 때문에 total 값이 NaN이 되어버리는 문제때문임.
		// 이것때문이 아닌거같다. 아직도 nan으로 뜨네..뭐지
		// 하하. 1) list.leisure_travel_flight을 list.Leisure_travel_flight 오타.
		// 2) MypageVO에서 영역별 소비금액이 String으로 되어있다. java script에서 reduce 활용해 배열의 합계를 구할 때, 문자열이라 이어붙여져버렸다. 그래서 제대로 안나옴.
		// 그냥 mypageVO의 멤버변수들을 long으로 바꿔버림. int : 2147483647(20억) long : 매우 긴 숫자. 혹시나 모를 20억 이상의 소비합계를 대비하여...은행은 안정적인게 중요함.
		
//		mypageVO.setJan("0");
//		mypageVO.setFeb("0");
//		mypageVO.setMar("0");
//		mypageVO.setApr("0");
//		mypageVO.setMay("0");
//		mypageVO.setJun("0");
//		mypageVO.setJul("0");
//		mypageVO.setAug("0");
//		mypageVO.setSept("0");
//		mypageVO.setOct("0");
//		mypageVO.setNov("0");
//		mypageVO.setDec("0");
		System.out.println("mypageVO : " + mypageVO);
		
		return mypageVO;
	}

	@Override
	public void doUpdateLink(Map<String, String> map) {
		
		sqlSession.update("mypage.dao.MypageDAO.doUpdateLink", map);
		
	}
	
	
	
	
	
	
	/*
			@Override
			public BoardVO selectByNo(int no) {
				
				BoardVO board = sqlSession.selectOne("board.dao.BoardDAO.selectByNo", no);
				 
				return board;
			}

	 */

}
