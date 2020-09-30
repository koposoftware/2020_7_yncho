package kr.co.hanacard.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hanacard.board.dao.BoardDAO;
import kr.co.hanacard.board.vo.BoardVO;


@Service //이 어노테이션 무슨뜻이야? 아. Component, Controller, Repository 등 똑같은 기능을 하는건데 명시적으로 적어줌
public class BoardServiceImpl implements BoardService{
	
	/*
		DAO단은 레고 부품처럼 모든 세부적인 기능을 제공하고,
		서비스 객체단에서는 이런 부품을 조립해서 다양한 기능을 사용하려고 하는 것 같다.
		
		예를 들어,
		특정 번호로 게시글 조회 후에 insert 실행하는 메소드를 만든다고 생각해보자.
			boardDAO.selectByNO()
			boardDAO.insert()
		이런식으로 하겠지?
			
	 */
	
	
	@Autowired //BoardDAO에 관련된 타입매칭을 먼저 한다. 컨테이너에 BoardDAO 타입의 객체가(이것을 상속받은 BoardDAOImpl) 있기 때문에 Autowired 하면 그것을 사용하게 되는 것이다.
	private BoardDAO boardDAO;
	
	
	@Override
	public List<BoardVO> selectAllBoard() {
		List<BoardVO> boardList = boardDAO.selectAll();
		return boardList;
	}


	@Override
	public BoardVO selectByNo(int no) {
		
		BoardVO board = boardDAO.selectByNo(no);
		return board;
	}

	
}
