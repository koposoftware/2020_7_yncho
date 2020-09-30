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
	public List<ChartVO> getBenefitSortList(String category, String year, String month) {
		
		
		/*

		 	if(category == '생활')
				category = 'life';
			if(category == '마트/쇼핑')
				category = 'mart_shopping';
			if(category == '통신/교통')
				category = 'comm_trans';
			if(category == '레저/여행/항공')
				category = 'leisure_travle_flight'; 
				
		 */
		
		
		
		
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		
		
		String year_month = year + month;
		map.put("year_month", year_month);

		System.out.println("CharDAOImple 단 category ==> " + category );
		System.out.println("CharDAOImple 단 year_month ==> " + year_month );
		
		List<ChartVO> benefitSortList = sqlSession.selectList("chart.dao.ChartDAO.getBenefitSortList", map);
		
		System.out.println("CharDAOImple 단 benefitSortList ==> " + benefitSortList );
		
		
		return benefitSortList;		
		
	}

	@Override
	public List<ChartVO> getAgeSortList(String category, String year, String month) {
		
		
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		
		String year_month = year + month;
		map.put("year_month", year_month);

		System.out.println("CharDAOImple 단 category ==> " + category );
		System.out.println("CharDAOImple 단 year_month ==> " + year_month );
		
		List<ChartVO> ageSortList = sqlSession.selectList("chart.dao.ChartDAO.getAgeSortList", map);
		
		System.out.println("CharDAOImple 단 ageSortList ==> " + ageSortList );
		
		
		
		
		return ageSortList;
	}

	
	
	@Override
	public List<ChartVO> getAnnualfeeSortList(String category, String year, String month) {
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		
		String year_month = year + month;
		map.put("year_month", year_month);

		System.out.println("CharDAOImple 단 category ==> " + category );
		System.out.println("CharDAOImple 단 year_month ==> " + year_month );
		
		List<ChartVO> annualfeeSortList = sqlSession.selectList("chart.dao.ChartDAO.getAnnualfeeSortList", map);
		
		System.out.println("CharDAOImple 단 annualfeeSortList ==> " + annualfeeSortList );
		
		
		
		return annualfeeSortList;
	}

	
	@Override
	public List<ChartVO> getTypeSortList(String category, String year, String month) {
		
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		
		String year_month = year + month;
		map.put("year_month", year_month);

		System.out.println("CharDAOImple 단 category ==> " + category );
		System.out.println("CharDAOImple 단 year_month ==> " + year_month );
		
		List<ChartVO> typeSortList = sqlSession.selectList("chart.dao.ChartDAO.getTypeSortList", map);
		System.out.println("CharDAOImple 단 typeSortList ==> " + typeSortList );
		
		
		return typeSortList;
		
		
	}
	
	
	
	
	

}
