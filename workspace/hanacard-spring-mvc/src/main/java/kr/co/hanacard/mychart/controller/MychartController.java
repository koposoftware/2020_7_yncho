package kr.co.hanacard.mychart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


//@SessionAttributes({"loginVO", "hanaList"}) // mav.addObject() 메소드로 저장하는 객체이름이 loginVO라면, 세션에 등록하라!
@Controller
public class MychartController {

	@GetMapping("/mychart")
	public String baseChart() {
		
		return "/mychart/totalRank";
	}
	
	@GetMapping("/mychart/totalRank")
	public String totalChart() {
		
		return "/mychart/totalRank";
	}
	
	@GetMapping("/mychart/discountRank")
	public String discountChart() {
		
		return "/mychart/discountRank";
	}
	
	@GetMapping("/mychart/pointRank")
	public String pointChart() {
		
		return "/mychart/pointRank";
	}
	
	@GetMapping("/mychart/mileRank")
	public String mileChart() {
		
		return "/mychart/mileRank";
	}
	
	
}
