package kr.co.hanacard.chart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hanacard.chart.dao.ChartDAO;
import kr.co.hanacard.chart.vo.ChartVO;

@Service
public class ChartServiceImpl implements ChartService {

	
	@Autowired
	private ChartDAO chartDAO;

	@Override
	public List<ChartVO> getBenefitSortList(String category, String year, String month) {

		return chartDAO.getBenefitSortList(category, year, month);
	}

	@Override
	public List<ChartVO> getAgeSortList(String category, String year, String month) {
		
		return chartDAO.getAgeSortList(category, year, month);
	}

	@Override
	public List<ChartVO> getAnnualfeeSortList(String category, String year, String month) {

		return chartDAO.getAnnualfeeSortList(category, year, month);
	}
	
	
	
	



}
