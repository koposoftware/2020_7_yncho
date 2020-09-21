package kr.co.hanacard.chart.dao;

import java.util.List;

import kr.co.hanacard.chart.vo.ChartVO;

public interface ChartDAO {

	List<ChartVO> getTopTG();

	ChartVO getTopLTF();

	ChartVO getTopMS();

	ChartVO getTopPet();

	ChartVO getTopHM();

	List<ChartVO> getTopLife();

	ChartVO getTopFB();

	ChartVO getTopComm();

}
