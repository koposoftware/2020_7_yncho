package kr.co.hanacard.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.mypage.service.MypageService;
import kr.co.hanacard.mypage.vo.MypageVO;

@Controller
public class MypageController {
	
	@Autowired //MypageService 클래스 위에 어노테이션이 있기 때문에, 빈이 생성되기 때문에 Autowired 하면 자동으로 그것을 여기에 자동으로 넣는다.
	private MypageService mypageService;
	
	
	@GetMapping("/mypage")
	public String loginForm() {
		
		return "/mypage/mypage";
	}
	
	/**
	 * 마이페이지 화면 로딩 후 자동으로 현재 연도의 월별 소비 합계를 가져온다. 이후 top chart(area chart)에서 데이터를 받아서 화면에 뿌림.
	 * @param session
	 * @return
	 */
	@ResponseBody // ajax 사용할 때 쓰는 어노테이션(forward 시킬 주소가 필요없음)
	@GetMapping("/mypage/topcurrent") // 해당 주소로 get 방식으로 request가 왔을 때 아래의 메소드가 실행된다.
	public MypageVO getTopCurrentYear(HttpSession session) {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		String resiNum = loginVO.getResiNum();
		
		MypageVO mypageVO = mypageService.getTopCurrentYear(resiNum);
		System.out.println("mapping은 되는건가?");
		System.out.println("mypageVO : " + mypageVO); 
		// 왜 null 찍히지. 아 dao단에서 처리안했음. 디버깅의 중요성! 디버깅을 단계별로 하니 금방 잡힌다.
		// 이제부터 jUnit 테스트를 활용해보자!
		
		return mypageVO;
		// ajax를 사용한 jsp로 날라가며, ajax의 success 부분에서 이를 받아 처리한다. 
		// String 형태로 날라가기 때문에, JSON 형태로 parsing이 필요하다.
	}
	
	
//	@ResponseBody
//	@PostMapping
//	public MypageVO getTopSpecific() {
//		
//		return null;
//	}
	
	
	
//	@ResponseBody
//	@GetMapping("/mypage/bottomcurrent")
//	public MypageVO getBottomCurrentYear(HttpSession session) {
//
//		
//		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
//		String resiNum = loginVO.getResiNum();
//
//		
//		return null;
//	}
	
	
	
}
