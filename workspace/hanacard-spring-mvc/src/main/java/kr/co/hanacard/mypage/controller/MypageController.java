package kr.co.hanacard.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("/mypage")
	public String loginForm() {
		
		return "/mypage/mypage";
	}
}
