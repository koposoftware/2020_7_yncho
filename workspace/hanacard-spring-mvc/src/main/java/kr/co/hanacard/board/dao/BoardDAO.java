package kr.co.hanacard.board.dao;

import java.util.List;

import kr.co.hanacard.board.vo.BoardVO;


public interface BoardDAO {


	/**
	 * 전체게시글 조회 서비스
	 * @return
	 */
	//public List<BoardVO> selectAll() throws Exception{}; //예외처리를 해줘야 함.
	public List<BoardVO> selectAll(); //예외처리를 해줘야 함.

	/**
	 * 새글 등록 서비스
	 * @param board
	 */
	public void insert(BoardVO board);
	
	
	/**
	 * 게시글 상세 조회 서비스
	 * @param no 게시물 번호
	 */
	
	public BoardVO selectByNo(int no);
}
