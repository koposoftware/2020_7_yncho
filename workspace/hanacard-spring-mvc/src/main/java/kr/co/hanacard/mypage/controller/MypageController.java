package kr.co.hanacard.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.mypage.service.MypageService;
import kr.co.hanacard.mypage.vo.MypageVO;

@SessionAttributes({"mypageVO", "cardList"})// mav.addObject() 메소드로 저장하는 객체이름이 mypageVO라면, 세션에 등록하라!
@Controller
public class MypageController {
	
	@Autowired //MypageService 클래스 위에 어노테이션이 있기 때문에, 빈이 생성되기 때문에 Autowired 하면 자동으로 그것을 여기에 자동으로 넣는다.
	private MypageService mypageService;
	
	
	@GetMapping("/mypage")
	public ModelAndView loginForm(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		MypageVO mypageVO;
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		String resiNum = loginVO.getResiNum();
		
		
		List<String> cardList = new ArrayList<>();
		
		if(loginVO.getCbc().equals("Y")) 
			cardList.add("'비씨카드'");
		if(loginVO.getCct().equals("Y")) 
			cardList.add("'씨티카드'");
		if(loginVO.getChd().equals("Y"))
			cardList.add("'현대카드'");
		if(loginVO.getCjbb().equals("Y"))
			cardList.add("'전북은행카드'");
		if(loginVO.getCjjb().equals("Y"))
			cardList.add("'제주은행카드'");
		if(loginVO.getCkjb().equals("Y"))
			cardList.add("'광주은행카드'");
		if(loginVO.getCkm().equals("Y"))
			cardList.add("'국민카드'");
		if(loginVO.getClt().equals("Y"))
			cardList.add("'롯데카드'");
		if(loginVO.getCnh().equals("Y"))
			cardList.add("'농협카드'");
		if(loginVO.getCsh().equals("Y"))
			cardList.add("'신한카드'");
		if(loginVO.getCshb().equals("Y"))
			cardList.add("'수협은행카드'");
		if(loginVO.getCss().equals("Y"))
			cardList.add("'삼성카드'");
		if(loginVO.getCwr().equals("Y"))
			cardList.add("'우리카드'");
		
		mav.addObject("cardList", cardList);
		
		if(cardList.isEmpty()) {
			mypageVO = mypageService.getTopCurrentYear(resiNum);
			
		} else {
			String cardListString = String.join(",", cardList); // 똑똑하군. element가 하나만 있으면, 콤마를 붙이지 않고 그요소 그대로를내보낸다. "신한카드" 처럼
			mypageVO = mypageService.getTopCurrentYear(resiNum, cardListString);
		}
			
		mav.setViewName("/mypage/mypage");
		mav.addObject("mypageVO", mypageVO);
		//return "/mypage/mypage";
		return mav;
	}
	
	/**
	 * 마이페이지 화면 로딩 후 자동으로 현재 연도의 월별 소비 합계를 가져온다. 이후 top chart(area chart)에서 데이터를 받아서 화면에 뿌림.
	 * @param session
	 * @return
	 */
	@ResponseBody // ajax 사용할 때 쓰는 어노테이션(forward 시킬 주소가 필요없음)
	@GetMapping("/mypage/topcurrent") // 해당 주소로 get 방식으로 request가 왔을 때 아래의 메소드가 실행된다.
	public MypageVO getTopCurrentYear(HttpSession session) {
		MypageVO mypageVO;
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		String resiNum = loginVO.getResiNum();
		
	
		List<String> cardList = new ArrayList<>();
		
		// 하.. 문자열 비교는 equals 잖아 ㅠㅠ
		if(loginVO.getCbc().equals("Y")) 
			cardList.add("'비씨카드'");
		if(loginVO.getCct().equals("Y")) 
			cardList.add("'씨티카드'");
		if(loginVO.getChd().equals("Y"))
			cardList.add("'현대카드'");
		if(loginVO.getCjbb().equals("Y"))
			cardList.add("'전북은행카드'");
		if(loginVO.getCjjb().equals("Y"))
			cardList.add("'제주은행카드'");
		if(loginVO.getCkjb().equals("Y"))
			cardList.add("'광주은행카드'");
		if(loginVO.getCkm().equals("Y"))
			cardList.add("'국민카드'");
		if(loginVO.getClt().equals("Y"))
			cardList.add("'롯데카드'");
		if(loginVO.getCnh().equals("Y"))
			cardList.add("'농협카드'");
		if(loginVO.getCsh().equals("Y"))
			cardList.add("'신한카드'");
		if(loginVO.getCshb().equals("Y"))
			cardList.add("'수협은행카드'");
		if(loginVO.getCss().equals("Y"))
			cardList.add("'삼성카드'");
		if(loginVO.getCwr().equals("Y"))
			cardList.add("'우리카드'");
				
		
		//GetMapping이므로, 현재년도의 자료를 조회하는 것이다.
		if(cardList.isEmpty()) {
			System.out.println("하나카드 외 연동된 카드사가 없습니다.");
			mypageVO = mypageService.getTopCurrentYear(resiNum);
			
		} else {
			System.out.println("/mypage/topcurrent");
			System.out.println("타 카드사와 연동되어 있습니다.");
			String cardListString = String.join(",", cardList); // 똑똑하군. element가 하나만 있으면, 콤마를 붙이지 않고 그요소 그대로를내보낸다. "신한카드" 처럼
			System.out.println("cardListString : " + cardListString);
			mypageVO = mypageService.getTopCurrentYear(resiNum, cardListString);
			
		}
		
			
		
		
		
		System.out.println("mapping은 되는건가?");
		// 왜 null 찍히지. 아 dao단에서 처리안했음. 디버깅의 중요성! 디버깅을 단계별로 하니 금방 잡힌다.
		// 이제부터 jUnit 테스트를 활용해보자!
		
		return mypageVO;
		// ajax를 사용한 jsp로 날라가며, ajax의 success 부분에서 이를 받아 처리한다. 
		// String 형태로 날라가기 때문에, JSON 형태로 parsing이 필요하다.
	}
	
	
	@ResponseBody // ajax 사용할 때 쓰는 어노테이션(forward 시킬 주소가 필요없음)
	@GetMapping("/mypage/topspecific/{year}") // 해당 주소로 post 방식으로 request가 왔을 때 아래의 메소드가 실행된다.
	//@GetMapping("/mypage/topspecific/${year}") // 해당 주소로 post 방식으로 request가 왔을 때 아래의 메소드가 실행된다.
	public MypageVO getTopSpecific(@PathVariable("year") String year, HttpServletRequest request, HttpSession session) {
	//public MypageVO getTopSpecific(@PathVariable("year") String year, HttpSession session) {
		//String uri = request.getRequestURI();
		
		
		// request 매개변수 필요없네. 지우자.
		
		
		//System.out.println("요청 uri : " + uri);
		System.out.println("들어오긴 하는가 /mypage/topspecific/{year}");
		
		//String year = request.getParameter("year");
		System.out.println("year : " + year);
		
		//String year = "2019";
		
		
		
		MypageVO mypageVO;
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		String resiNum = loginVO.getResiNum();
		
	
		List<String> cardList = new ArrayList<>();
		
		// 하.. 문자열 비교는 equals 잖아 ㅠㅠ
		if(loginVO.getCbc().equals("Y")) 
			cardList.add("'비씨카드'");
		if(loginVO.getCct().equals("Y")) 
			cardList.add("'씨티카드'");
		if(loginVO.getChd().equals("Y"))
			cardList.add("'현대카드'");
		if(loginVO.getCjbb().equals("Y"))
			cardList.add("'전북은행카드'");
		if(loginVO.getCjjb().equals("Y"))
			cardList.add("'제주은행카드'");
		if(loginVO.getCkjb().equals("Y"))
			cardList.add("'광주은행카드'");
		if(loginVO.getCkm().equals("Y"))
			cardList.add("'국민카드'");
		if(loginVO.getClt().equals("Y"))
			cardList.add("'롯데카드'");
		if(loginVO.getCnh().equals("Y"))
			cardList.add("'농협카드'");
		if(loginVO.getCsh().equals("Y"))
			cardList.add("'신한카드'");
		if(loginVO.getCshb().equals("Y"))
			cardList.add("'수협은행카드'");
		if(loginVO.getCss().equals("Y"))
			cardList.add("'삼성카드'");
		if(loginVO.getCwr().equals("Y"))
			cardList.add("'우리카드'");
				
		
		//PostMapping이므로 특정 연도를 조회
		if(cardList.isEmpty()) {
			System.out.println("하나카드 외 연동된 카드사가 없습니다.");
			mypageVO = mypageService.getTopSpecific(resiNum, year);

			
		} else {
			System.out.println("/mypage/topspecific/${year}");
			System.out.println("타 카드사와 연동되어 있습니다.");
			System.out.println("year 값이 제대로 들어오나요? : " + year);

			String cardListString = String.join(",", cardList); // 똑똑하군. element가 하나만 있으면, 콤마를 붙이지 않고 그요소 그대로를내보낸다. "신한카드" 처럼
			System.out.println("cardListString : " + cardListString);
			mypageVO = mypageService.getTopSpecific(resiNum, cardListString, year);
			//mypageVO = mypageService.getTopCurrentYear(resiNum, cardListString);
			
		}
		
			
		
		
		
		System.out.println("mapping은 되는건가?");
		// 왜 null 찍히지. 아 dao단에서 처리안했음. 디버깅의 중요성! 디버깅을 단계별로 하니 금방 잡힌다.
		// 이제부터 jUnit 테스트를 활용해보자!
		
		return mypageVO;
		// ajax를 사용한 jsp로 날라가며, ajax의 success 부분에서 이를 받아 처리한다. 
		// String 형태로 날라가기 때문에, JSON 형태로 parsing이 필요하다.
	}
	
	
		
	@ResponseBody
	@GetMapping("/mypage/bottomspecific/{year}/{month}")
	public MypageVO getBottomSpecific(@PathVariable("year") String year, @PathVariable("month") String month, HttpSession session) {	
		
		System.out.println("들어오나요 /mypage/bottomspecific/{year}/{month} ");
		
		MypageVO mypageVO;
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		String resiNum = loginVO.getResiNum();
		
	
		List<String> cardList = new ArrayList<>();
		
		if(loginVO.getCbc().equals("Y")) 
			cardList.add("'비씨카드'");
		if(loginVO.getCct().equals("Y")) 
			cardList.add("'씨티카드'");
		if(loginVO.getChd().equals("Y"))
			cardList.add("'현대카드'");
		if(loginVO.getCjbb().equals("Y"))
			cardList.add("'전북은행카드'");
		if(loginVO.getCjjb().equals("Y"))
			cardList.add("'제주은행카드'");
		if(loginVO.getCkjb().equals("Y"))
			cardList.add("'광주은행카드'");
		if(loginVO.getCkm().equals("Y"))
			cardList.add("'국민카드'");
		if(loginVO.getClt().equals("Y"))
			cardList.add("'롯데카드'");
		if(loginVO.getCnh().equals("Y"))
			cardList.add("'농협카드'");
		if(loginVO.getCsh().equals("Y"))
			cardList.add("'신한카드'");
		if(loginVO.getCshb().equals("Y"))
			cardList.add("'수협은행카드'");
		if(loginVO.getCss().equals("Y"))
			cardList.add("'삼성카드'");
		if(loginVO.getCwr().equals("Y"))
			cardList.add("'우리카드'");
				
		
		//PostMapping이므로 특정 연,월을 조회
		if(cardList.isEmpty()) {
			System.out.println("하나카드 외 연동된 카드사가 없습니다.");
			
//			if(month.equals("all"))
//				//month = "01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12";
//				month = null;
				
			mypageVO = mypageService.getBottomSpecific(resiNum, year, month); 
			// WHERE 연도 == YEAR AND 월 == MONTH 여야함
			// 근데 월이 all로 넘어오면..흠
			// 마이바티스는 동적으로 작동해서  MONTH 부분 all이면 처리안되게 해볼까. 그럼 all이 null로 들어가야하네.

			
		} else {

			System.out.println("연동된 카드사가 있습니다.");
			String cardListString = String.join(",", cardList); // 똑똑하군. element가 하나만 있으면, 콤마를 붙이지 않고 그요소 그대로를내보낸다. "신한카드" 처럼
//			if(month.equals("all"))
//				//month = "01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12";
//				month = null;
			
			System.out.println("resiNum : " + resiNum);
			System.out.println("cardListString : " + cardListString);
			System.out.println("year : " + year);
			System.out.println("month : " + month);
			mypageVO = mypageService.getBottomSpecific(resiNum, cardListString, year, month);
			//mypageVO = mypageService.getTopCurrentYear(resiNum, cardListString);
			
		}
		
		
		return mypageVO;
	}
}
