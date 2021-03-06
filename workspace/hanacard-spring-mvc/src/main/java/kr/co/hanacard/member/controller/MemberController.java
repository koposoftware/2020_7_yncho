package kr.co.hanacard.member.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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

import kr.co.hanacard.chart.service.ChartService;
import kr.co.hanacard.chart.vo.ChartVO;
import kr.co.hanacard.member.service.MemberService;
import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.member.vo.OwncardVO;
import kr.co.hanacard.mypage.service.MypageService;
import kr.co.hanacard.mypage.vo.CardTransactionVO;


//@SessionAttributes({"loginVO", "boardVO"}) 식으로 배열로 만들 수 있다.
@SessionAttributes({"loginVO", "hanaList", "cardTrans", "benefitSortList", "ageSortList", "annualfeeSortList", "typeSortList"}) // mav.addObject() 메소드로 저장하는 객체이름이 loginVO라면, 세션에 등록하라!
//@SessionAttributes("loginVO") // mav.addObject() 메소드로 저장하는 객체이름이 loginVO라면, 세션에 등록하라!
@Controller
public class MemberController {
	
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private ChartService chartService;
	
	
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
		
//		System.out.println("========login 시작========");
//		System.out.println("toString의 힘! loginVO : " + loginVO);
//		System.out.println("아이디 : " + loginVO.getId());
//		System.out.println("하나카드 연동 : " + loginVO.getChn());
//		System.out.println("신한카드 연동 : " + loginVO.getCsh());
//		System.out.println("현대카드 연동 : " + loginVO.getChd());
//		System.out.println("========login 완료========");
		
		ModelAndView mav = new ModelAndView();
		
		// 로그인 실패
		if(loginVO == null) {
			mav.setViewName("redirect:/login");
		} else {
			// 로그인 성공
			
			
			String dest = (String) session.getAttribute("dest");
			System.out.println("dest ========> " + dest);
			System.out.println("dest ========> " + dest);
			System.out.println("dest ========> " + dest);
			System.out.println("dest ========> " + dest);
			
			if(dest==null) {
				
				mav.setViewName("redirect:/"); // ModelAndView 생성자에 넣으면 자동으로 setViewName이 되는거였겠군?
				
			} else {
				mav.setViewName("redirect:" + dest); // dest 값은 이런 식이다. /board/2   즉 => http://localhost:9999/Mission-Spring/board/2
				session.removeAttribute("dest"); //이제 이 정보가 필요 없기 때문에 세션에 등록된 dest 객체를 지운다.
			}
			
			mav.addObject("loginVO", loginVO);
			// 이렇게 하면 사용자 정보가 세션에 저장되지 않는다. 왜? addObject() 하면 request 영역에 저장되기 때문이다.
			// 그렇게 하려면 어떻게 해야하는가 : 클래스 위에 @SessionAttributes 어노테이션을 붙인다.
			// 그런데, sessionAttributes에 저장한 세션은 session.invalidate로 세션을 삭제할 수 없다!
			// 이때는, SessionStatus.setComplete() 메소드로 지워야 한다.
			

			// 로그인 시 하나카드 보유 목록 가져오기 & 공유영역(세션)에 등록하여 jsp에서 보유카드에 나타내기
			List<OwncardVO> hanaList = memberService.getHanaList(loginVO.getResiNum());
			//List<String> hanaList = memberService.getHanaList(loginVO.getResiNum());
			System.out.println("hanaList : " + hanaList);
			mav.addObject("hanaList", hanaList);
			
			
			// 로그인 시 거래내역 데이터 가져오기(최근 1개월) & 세션에 미리 등록해서 마이페이지 누를 시 부하 줄이기
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
					
			
			
//			//처음 보여주는 데이터는 현재 달이다. 사용자가 선택하는 기간을 처리하는 것은 mypage.jsp에서 ajax로 처리
//			//현재 월 구하기
//			Calendar cal = Calendar.getInstance();
//			String year = Integer.toString(cal.get( cal.YEAR ));
//			String month = Integer.toString(cal.get( cal.MONTH ) + 1);
//			if(month.length() == 1) {
//				month = "0" + month;
//			}
//			String period = year+month;
//			System.out.println("period : " + period);

			String transPeriod = "thisMonth";
			
			
			String resiNum = loginVO.getResiNum();
			if(cardList.isEmpty()) {
				
				System.out.println("하나카드 외 연동된 카드사가 없습니다.");
				List<CardTransactionVO> cardTrans = mypageService.getCardTrans(resiNum, transPeriod, "0");
				mav.addObject("cardTrans", cardTrans);
				
//				List<ChartVO> benefitSortList = chartService.getBenefitSortList("life", "20", "09");
//				mav.addObject("benefitSortList", benefitSortList);
//				System.out.println("benefitSortList ===> " + benefitSortList);

				
			} else {
				
				String cardListString = String.join(",", cardList); // 똑똑하군. element가 하나만 있으면, 콤마를 붙이지 않고 그요소 그대로를내보낸다. "신한카드" 처럼
				List<CardTransactionVO> cardTrans = mypageService.getCardTransOpen(resiNum, cardListString, transPeriod, "0");
				mav.addObject("cardTrans", cardTrans);
				
//				List<ChartVO> topList = chartService.getTopLife();
//				mav.addObject("topList", topList);
				
//				List<ChartVO> benefitSortList = chartService.getBenefitSortList("life", "20", "09");
//				mav.addObject("benefitSortList", benefitSortList);
//				System.out.println("benefitSortList ===> " + benefitSortList);

				
			}
			
			
			List<ChartVO> benefitSortList = chartService.getBenefitSortList("life", "2020", "all"); // 생활 / 20년 /all
			//List<ChartVO> benefitSortList = chartService.getBenefitSortList(category, year, month);
			
			mav.addObject("benefitSortList", benefitSortList);
			System.out.println("benefitSortList ===> " + benefitSortList);
			
			List<ChartVO> ageSortList = chartService.getAgeSortList("all", "2020", "all"); // 전연령 / 20년 / all
			mav.addObject("ageSortList", ageSortList);
			
			List<ChartVO> annualfeeSortList = chartService.getAnnualfeeSortList("from0", "2020", "all"); // 연회비 없음 ~ 1만원 / 20년 / all
			mav.addObject("annualfeeSortList", annualfeeSortList);
			
			List<ChartVO> typeSortList = chartService.getTypeSortList("1q", "2020", "all"); // 1Q+카드 / 20년 / all
			mav.addObject("typeSortList", typeSortList);

			
			
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
