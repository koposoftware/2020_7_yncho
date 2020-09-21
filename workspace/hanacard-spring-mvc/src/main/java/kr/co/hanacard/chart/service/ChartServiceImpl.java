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
	public List<ChartVO> getTopTG() {
		// TODO Auto-generated method stub
		
		return chartDAO.getTopTG();
	}

	@Override
	public ChartVO getTopLTF() {
		// TODO Auto-generated method stub
		return chartDAO.getTopLTF();
	}

	@Override
	public ChartVO getTopMS() {
		// TODO Auto-generated method stub
		return chartDAO.getTopMS();
	}

	@Override
	public ChartVO getTopPet() {
		// TODO Auto-generated method stub
		return chartDAO.getTopPet();
	}

	@Override
	public ChartVO getTopHM() {
		// TODO Auto-generated method stub
		return chartDAO.getTopHM();
	}

	@Override
	public List<ChartVO> getTopLife() {
		// TODO Auto-generated method stub
		return chartDAO.getTopLife();
	}

	@Override
	public ChartVO getTopFB() {
		// TODO Auto-generated method stub
		return chartDAO.getTopFB();
	}

	@Override
	public ChartVO getTopComm() {
		// TODO Auto-generated method stub
		return chartDAO.getTopComm();
	}
	
	


}
