package kr.co.hanacard.chart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.hanacard.chart.service.ChartService;
import kr.co.hanacard.chart.vo.ChartVO;
import kr.co.hanacard.member.service.MemberService;
import kr.co.hanacard.member.vo.MemberVO;
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
	
	@GetMapping("/chart/performRank")
	public String performChart() {
		
		return "/chart/performRank";
	}
	
	
	@ResponseBody // ajax 사용할 때 쓰는 어노테이션(forward 시킬 주소가 필요없음)
	@GetMapping("/chart/benefitrank/life") // 해당 주소로 get 방식으로 request가 왔을 때 아래의 메소드가 실행된다.
	public List<ChartVO> getTopLife(HttpSession session) {
		
		List<ChartVO> list = chartService.getTopLife();
		
		return list;
	}
	
	
	
	
}
