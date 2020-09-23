package kr.co.hanacard.chart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.hanacard.chart.service.ChartService;
import kr.co.hanacard.chart.vo.ChartVO;
import kr.co.hanacard.member.service.MemberService;
import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.mypage.vo.CardTransactionVO;
import kr.co.hanacard.mypage.vo.MypageVO;


//@SessionAttributes({"loginVO", "hanaList"}) // mav.addObject() 메소드로 저장하는 객체이름이 loginVO라면, 세션에 등록하라!
@Controller
public class ChartController {

	@Autowired
	private ChartService chartService;
	
	@GetMapping("/chart")
	public String baseChart() {
		
		return "/chart/benefitRank";
	}
	
	@GetMapping("/chart/benefitRank")
	public String benefitChart() {
		
		return "/chart/benefitRank";
	}
	
	@GetMapping("/chart/annualfeeRank")
	public String annualfeeChart() {
		
		return "/chart/annualfeeRank";
	}
	
	@GetMapping("/chart/typeRank")
	public String performChart() {
		
		return "/chart/typeRank";
	}
	
	@GetMapping("/chart/ageRank")
	public String ageChart() {
		
		return "/chart/ageRank";
	}
	
	
	@ResponseBody // ajax 사용할 때 쓰는 어노테이션(forward 시킬 주소가 필요없음)
	@GetMapping("/chart/benefitrank/{category}/{year}/{month}") // 해당 주소로 get 방식으로 request가 왔을 때 아래의 메소드가 실행된다.
	public List<ChartVO> getTopLife(@PathVariable("category") String category, @PathVariable("year") String year, @PathVariable("month") String month) {
		
		/*
		 * 		if(category == '생활')
					category = 'life';
				if(category == '마트/쇼핑')
					category = 'mart_shopping';
				if(category == '통신/교통')
					category = 'comm_trans';
				if(category == '레저/여행/항공')
					category = 'leisure_travle_flight';
		 */
		
		List<ChartVO> benefitSortList = chartService.getBenefitSortList(category, year, month);
		
		
		
		//List<ChartVO> list = chartService.getTopLife();
		
		return benefitSortList;
	}
	
	
	@ResponseBody // ajax 사용할 때 쓰는 어노테이션(forward 시킬 주소가 필요없음)
	@GetMapping("/chart/agerank/{category}/{year}/{month}") // 해당 주소로 get 방식으로 request가 왔을 때 아래의 메소드가 실행된다.
	public List<ChartVO> getTopAge(@PathVariable("category") String category, @PathVariable("year") String year, @PathVariable("month") String month) {
		
		/*
		 * 		if(category == '생활')
					category = 'life';
				if(category == '마트/쇼핑')
					category = 'mart_shopping';
				if(category == '통신/교통')
					category = 'comm_trans';
				if(category == '레저/여행/항공')
					category = 'leisure_travle_flight';
		 */
		
		List<ChartVO> ageSortList = chartService.getAgeSortList(category, year, month);
		
		
		//List<ChartVO> list = chartService.getTopLife();
		
		return ageSortList;
	}
	
	
	
	
}
