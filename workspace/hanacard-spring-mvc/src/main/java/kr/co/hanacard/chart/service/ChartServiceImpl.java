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
		// TODO Auto-generated method stub
		return chartDAO.getBenefitSortList(category, year, month);
	}
	



}
