package kr.co.hanacard.mypage.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hanacard.mypage.dao.MypageDAO;
import kr.co.hanacard.mypage.vo.MypageVO;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	
	@Override
	public MypageVO getTopCurrentYear(String resiNum) {
		
		MypageVO mypageVO = mypageDAO.getTopCurrentYear(resiNum);
		
		return mypageVO;
	}
	
	@Override
	public MypageVO getTopCurrentYear(String resiNum, String cardListString) {
		
		MypageVO mypageVO = mypageDAO.getTopCurrentYear(resiNum, cardListString);
		
		return mypageVO;
	}

	@Override
	public MypageVO getTopSpecific(String resiNum, String year) {
		MypageVO mypageVO = mypageDAO.getTopSpecific(resiNum, year);

		
		return mypageVO;
	}

	@Override
	public MypageVO getTopSpecific(String resiNum, String cardListString, String year) {
		MypageVO mypageVO = mypageDAO.getTopSpecific(resiNum, cardListString, year);

		return mypageVO;
	}

		
	
	
	
	
	
	/*
		@Autowired //BoardDAO에 관련된 타입매칭을 먼저 한다. 컨테이너에 BoardDAO 타입의 객체가(이것을 상속받은 BoardDAOImpl) 있기 때문에 Autowired 하면 그것을 사용하게 되는 것이다.
		private BoardDAO boardDAO;
		
		
		@Override
		public List<BoardVO> selectAllBoard() {
			List<BoardVO> boardList = boardDAO.selectAll();
			return boardList;
		}

	 */
	
}
