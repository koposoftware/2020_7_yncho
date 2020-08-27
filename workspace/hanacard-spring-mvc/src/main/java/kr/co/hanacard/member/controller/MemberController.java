package kr.co.hanacard.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hanacard.member.service.MemberService;
import kr.co.hanacard.member.vo.MemberVO;


//@SessionAttributes({"loginVO", "boardVO"}) 식으로 배열로 만들 수 있다.
@SessionAttributes("loginVO") // mav.addObject() 메소드로 저장하는 객체이름이 loginVO라면, 세션에 등록하라!
@Controller
public class MemberController {
	
	
	
	@Autowired
	private MemberService memberService;
	

//	@RequestMapping(value="/login", method = RequestMethod.GET)
	@GetMapping("/login")
	public String loginForm() {
		
		return "/login/login";
	}
	
	
//	@RequestMapping(value="/login", method = RequestMethod.POST)
	@PostMapping("/login") //form 태그만 POST 방식이다!
	public ModelAndView login(MemberVO member, HttpSession session) { // session 객체를 사용하고싶으면, HttpSession session 매개변수에 적어주면 됨.
		// 날라오는 parameter가 많다면, @ReqeustParam도 엄청난 노가다가 된다.
		// 그럴 때는 아예 객채로 받는 방법을 쓴다. 그냥 객체명을 쓰면, 내부적으로 setter가 작동해서 form 태그 내의 데이터를 담아오는 듯하다. 
		
		MemberVO loginVO = memberService.login(member);
		ModelAndView mav = new ModelAndView();
		
		// 로그인 실패
		if(loginVO == null) {
			mav.setViewName("redirect:/login");
		} else {
			// 로그인 성공
			mav.setViewName("redirect:/");
			mav.addObject("loginVO", loginVO);
			// 이렇게 하면 안된다. 왜? addObject() 하면 request 영역에 저장되기 때문이다.
			// 그렇게 하려면 어떻게 해야하는가 : 클래스 위에 @SessionAttributes 어노테이션을 붙인다.
			// 그런데, sessionAttributes에 저장한 세션은 session.invalidate로 세션을 삭제할 수 없다!
			// 이때는, SessionStatus.setComplete() 메소드로 지워야 한다.
		}
		
		
		
		
		return mav;
	}
	
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
	//public String logout(HttpSession session) {
		
		//session.invalidate(); // 세션객체 삭제
		// sessionAttributes에 저장한 세션은 session.invalidate로 세션을 삭제할 수 없다!
		
		System.out.println("status.setComplete() 이전 : " +  status.isComplete());
		status.setComplete(); // 세션이 만료되었다고 알려줌. 그러면, 세션객체를 삭제한다.
		System.out.println("status.setComplete() 이후 : " + status.isComplete());
		
		return "redirect:/"; // 경로를 안써주면, welcom file list?에 의해서 index.jsp로 간다.
	}
	
}
