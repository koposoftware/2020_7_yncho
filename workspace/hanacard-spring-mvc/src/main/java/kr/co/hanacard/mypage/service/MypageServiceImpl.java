package kr.co.hanacard.mypage.service;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hanacard.member.dao.MemberDAO;
import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.mypage.dao.MypageDAO;
import kr.co.hanacard.mypage.vo.CardTransactionVO;
import kr.co.hanacard.mypage.vo.MypageVO;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDAO mypageDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	
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

	@Override
	public MypageVO getBottomSpecific(String resiNum, String year, String month) {

		MypageVO mypageVO = mypageDAO.getBottomSpecific(resiNum, year, month);

		return mypageVO;
	}

	@Override
	public MypageVO getBottomSpecific(String resiNum, String cardListString, String year, String month) {
		MypageVO mypageVO = mypageDAO.getBottomSpecific(resiNum, cardListString, year, month);
		
		return mypageVO;
	}

	@Override
	public MemberVO doUpdateLink(Map<String, String> map, MemberVO loginVO) {
		
		mypageDAO.doUpdateLink(map);
		
		loginVO = memberDAO.login(loginVO);
		
		return loginVO;
	}

	@Override
	public List<CardTransactionVO> getCardTrans(String resiNum, String transPeriod, String lastNum) {
		List<CardTransactionVO> cardTransVO = mypageDAO.getCardTrans(resiNum, transPeriod, lastNum);
		
		return cardTransVO;
	}

	@Override
	public List<CardTransactionVO> getCardTransOpen(String resiNum, String cardListString, String transPeriod, String lastNum) {
		List<CardTransactionVO> cardTransVO = mypageDAO.getCardTransOpen(resiNum,cardListString, transPeriod, lastNum);

		return cardTransVO;
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
