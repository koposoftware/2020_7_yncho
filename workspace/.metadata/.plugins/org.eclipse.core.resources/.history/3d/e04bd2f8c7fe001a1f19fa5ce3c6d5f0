package kr.co.hanacard.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hanacard.board.vo.BoardVO;



@Repository //이 어노테이션 무슨뜻이야? 아. Component, Controller, Repository 등 똑같은 기능을 하는건데 명시적으로 적어줌
public class BoardDAOImpl implements BoardDAO {

	@Autowired // 객체 찾는 순서에 의해, 첫번째로 생성된 bean 중에 타입이 맞는 것을 가져와서 넣는다. (spring-mvc.xml에 bean 태그 중 SqlSessionTemplete  있음)
	private SqlSessionTemplate sqlSession; 
	// spring-mvc.xml 내에 관련 bean 태그가 있다.
	// src/test/java의 MyBatisTest.java에서 SqlSessionTemplate 객체가 잘 생성되나 테스트 해봤음. jUnit 테스트.
	// 전에는 conn 객체를 만들었는데, 이제는 sqlSession 객체를 활용해서 처리한다.
	
	@Override
	public List<BoardVO> selectAll() {
		List<BoardVO> boardList = sqlSession.selectList("board.dao.BoardDAO.selectAll");
		return boardList;
	}

	@Override
	public void insert(BoardVO board) {
	}

	@Override
	public BoardVO selectByNo(int no) {
		
		BoardVO board = sqlSession.selectOne("board.dao.BoardDAO.selectByNo", no);
		 
		return board;
	}

}
