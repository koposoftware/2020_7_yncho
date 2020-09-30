package kr.co.hanacard.chart.dao;

import java.util.List;

import kr.co.hanacard.chart.vo.ChartVO;

public interface ChartDAO {

//	List<ChartVO> getTopTG();
//	ChartVO getTopLTF();
//	ChartVO getTopMS();
//	ChartVO getTopPet();
//	ChartVO getTopHM();
//	List<ChartVO> getTopLife();
//	ChartVO getTopFB();
//	ChartVO getTopComm();
	
	List<ChartVO> getBenefitSortList(String category, String year, String month);

	List<ChartVO> getAgeSortList(String category, String year, String month);
	
	List<ChartVO> getAnnualfeeSortList(String category, String year, String month);

	List<ChartVO> getTypeSortList(String category, String year, String month);


}
