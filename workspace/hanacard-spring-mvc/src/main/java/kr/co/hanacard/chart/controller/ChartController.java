package kr.co.hanacard.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


//@SessionAttributes({"loginVO", "hanaList"}) // mav.addObject() 메소드로 저장하는 객체이름이 loginVO라면, 세션에 등록하라!
@Controller
public class ChartController {

	
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
	
	@GetMapping("/chart/performRank")
	public String performChart() {
		
		return "/chart/performRank";
	}
	
	
	
}
