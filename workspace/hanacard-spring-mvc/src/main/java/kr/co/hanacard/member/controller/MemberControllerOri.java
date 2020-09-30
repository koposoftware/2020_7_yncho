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

import kr.co.hanacard.member.service.MemberService;
import kr.co.hanacard.member.vo.MemberVO;


//@Controller
public class MemberControllerOri {
	
	
	
	@Autowired
	private MemberService memberService;
	

//	@RequestMapping(value="/login", method = RequestMethod.GET)
	@GetMapping("/login")
	public String loginForm() {
		
		return "/login/login";
	}
	
	
//	@RequestMapping(value="/login", method = RequestMethod.POST)
	@PostMapping("/login") //form 태그만 POST 방식이다!
	public String login(MemberVO member, HttpSession session) {
	//public String login(@RequestParam("id") String id, @RequestParam("password") String password) {
		// 날라오는 parameter가 많다면, @ReqeustParam도 엄청난 노가다가 된다.
		// 그럴 때는 아예 객채로 받는 방법을 쓴다. 그냥 객체명을 쓰면, 내부적으로 setter가 작동해서 form 태그 내의 데이터를 담아오는 듯하다. 
		
		
		//System.out.println("id : " + id + " password : " + password);
		
		MemberVO loginVO = memberService.login(member);
		
		
		
		// 로그인 실패
		if(loginVO == null) {
			return "redirect:/login";
		}
		
		// mav를 이용해서 mav.addObject() 하면 request 영역에 저장된다.
		// 반면, 로그인을 할 때는 session 영역에 저장해야하는데, 어떻게 할까?
		// 우선 session 객체를 받아와야 한다.
	
		
		//HttpSession session = request.getSession();
		//파라미터에 HttpSession session 이라고 쓰면, 파라미터로 자동으로 session 객체가 날라온다. wow.
		session.setAttribute("loginVO", loginVO);

		
		// 로그인 성공
		return "redirect:/";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate(); // 세션객체 삭제
		
		return "redirect:/"; // 경로를 안써주면, welcom file list?에 의해서 index.jsp로 간다.
	}
	
}
