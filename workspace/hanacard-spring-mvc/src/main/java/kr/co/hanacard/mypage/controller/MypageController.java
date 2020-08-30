package kr.co.hanacard.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.mypage.service.MypageService;
import kr.co.hanacard.mypage.vo.MypageVO;

@Controller
public class MypageController {
	
	@Autowired //BoardService 클래스 위에 어노테이션이 있기 때문에, 빈이 생성되기 때문에 Autowired 하면 자동으로 그것을 여기에 자동으로 넣는다.
	private MypageService mypageService;
	
	
	@GetMapping("/mypage")
	public String loginForm() {
		
		return "/mypage/mypage";
	}
	
	
	@ResponseBody // ajax 사용할 때 쓰는 어노테이션(forward 시킬 주소가 필요없음)
	@GetMapping("/mypage/update") // ajax를 통해 post 방식으로 data(즉, 파라미터)가 날라온다. 
	public MypageVO getData(HttpSession session) { 
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		String resiNum = loginVO.getResiNum();
		
		MypageVO mypageVO = mypageService.getDataCurrentYear(resiNum);
		
		return mypageVO; 
		// ajax를 사용한 jsp로 날라가며, ajax의 success 부분에서 이를 받아 처리한다. 
		// String 형태로 날라가기 때문에, JSON 형태로 parsing이 필요하다.

	}
	
	
	
//	@ResponseBody
//	@GetMapping("/mypage/update") // ajax를 통해 post 방식으로 data(즉, 파라미터)가 날라온다. 
//	public void addReply(ReplyVO replyVO) { // (3) ReplyVO reployVO 하면, jsp의 댓글관련 form 태그에서 전송하는 데이터들을(ajax를 활용하여. data : {} 를 사용하여) replyVO 타입으로 받을 수 있다.
//		//System.out.println("/reply controller 호출");
//		replyService.insertReply(replyVO);
//	}
	
	
}
