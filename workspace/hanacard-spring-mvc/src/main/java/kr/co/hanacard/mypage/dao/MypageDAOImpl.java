package kr.co.hanacard.mypage.dao;

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
	
	
	
	/*
			@Override
			public BoardVO selectByNo(int no) {
				
				BoardVO board = sqlSession.selectOne("board.dao.BoardDAO.selectByNo", no);
				 
				return board;
			}

	 */

}
