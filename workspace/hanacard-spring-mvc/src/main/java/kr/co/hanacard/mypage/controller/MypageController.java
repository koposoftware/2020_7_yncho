package kr.co.hanacard.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MypageController {
	
	@GetMapping("/mypage")
	public String loginForm() {
		
		return "/mypage/mypage";
	}
	
	
	@ResponseBody
	@GetMapping("/mypage/update") // ajax를 통해 post 방식으로 data(즉, 파라미터)가 날라온다. 
	public void getData() { 
		//System.out.println("/reply controller 호출");
		
	}
	
	
	
//	@ResponseBody
//	@GetMapping("/mypage/update") // ajax를 통해 post 방식으로 data(즉, 파라미터)가 날라온다. 
//	public void addReply(ReplyVO replyVO) { // (3) ReplyVO reployVO 하면, jsp의 댓글관련 form 태그에서 전송하는 데이터들을(ajax를 활용하여. data : {} 를 사용하여) replyVO 타입으로 받을 수 있다.
//		//System.out.println("/reply controller 호출");
//		replyService.insertReply(replyVO);
//	}
	
	
}
