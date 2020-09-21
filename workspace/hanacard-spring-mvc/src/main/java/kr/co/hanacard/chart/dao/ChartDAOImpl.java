package kr.co.hanacard.chart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.hanacard.chart.vo.ChartVO;
import kr.co.hanacard.mypage.vo.CardTransactionVO;


@Repository 
public class ChartDAOImpl implements ChartDAO{

	//마이바티스 연동을 위해, SqlSessionTemplet 객체가 있어야 한다.
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<ChartVO> getTopTG() {
		
		return null;
		
	
	}

	@Override
	public ChartVO getTopLTF() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ChartVO getTopMS() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ChartVO getTopPet() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ChartVO getTopHM() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChartVO> getTopLife() {

		List<ChartVO> chartList = sqlSession.selectList("chart.dao.ChartDAO.getTopLife");
		
		return chartList;
		
	}

	@Override
	public ChartVO getTopFB() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ChartVO getTopComm() {
		// TODO Auto-generated method stub
		return null;
	}

}
