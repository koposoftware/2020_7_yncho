package kr.co.hanacard.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/test")
	public String performChart() {
		
		return "/test/test";
	}
}
