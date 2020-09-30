package kr.co.hanacard.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//@SessionAttributes({"loginVO", "hanaList"}) // mav.addObject() 메소드로 저장하는 객체이름이 loginVO라면, 세션에 등록하라!
@Controller
public class BoardController {
	
	@GetMapping("/board")
	public String baseChart() {
		
		return "/board/list";
	}
	

}
