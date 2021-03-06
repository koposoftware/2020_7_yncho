package kr.co.hanacard.mypage.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hanacard.member.service.MemberService;
import kr.co.hanacard.member.vo.MemberVO;
import kr.co.hanacard.member.vo.OwncardVO;
import kr.co.hanacard.mypage.service.MypageService;
import kr.co.hanacard.mypage.vo.CardTransactionVO;
import kr.co.hanacard.mypage.vo.MypageVO;

@SessionAttributes({"mypageVO", "cardList"})// mav.addObject() 메소드로 저장하는 객체이름이 mypageVO라면, 세션에 등록하라!
@Controller
public class MypageController {
	
	@Autowired //MypageService 클래스 위에 어노테이션이 있기 때문에, 빈이 생성되기 때문에 Autowired 하면 자동으로 그것을 여기에 자동으로 넣는다.
	private MypageService mypageService;
	
	@Autowired
	private MemberService memberService;
	
	
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
				
		long yearSum = 0;
		
		//GetMapping이므로, 현재년도의 자료를 조회하는 것이다.
		if(cardList.isEmpty()) {
			System.out.println("하나카드 외 연동된 카드사가 없습니다.");
			mypageVO = mypageService.getTopCurrentYear(resiNum);
			
			yearSum = mypageVO.getJan() + mypageVO.getFeb() + mypageVO.getMar() + mypageVO.getApr() + mypageVO.getMay() + mypageVO.getJun() 
							+ mypageVO.getJul() + mypageVO.getAug() + mypageVO.getSept() + mypageVO.getOct() + mypageVO.getNov() + mypageVO.getDec();
			
			session.setAttribute("yearSum", yearSum); // 굳이 addObject로 등록했다가 @SessionAttributes에 적을필요가 없이 이렇게 하면 되네..

			
			
		} else {
			System.out.println("/mypage/topcurrent");
			System.out.println("타 카드사와 연동되어 있습니다.");
			String cardListString = String.join(",", cardList); // 똑똑하군. element가 하나만 있으면, 콤마를 붙이지 않고 그요소 그대로를내보낸다. "신한카드" 처럼
			System.out.println("cardListString : " + cardListString);
			mypageVO = mypageService.getTopCurrentYear(resiNum, cardListString);
			
			yearSum = mypageVO.getJan() + mypageVO.getFeb() + mypageVO.getMar() + mypageVO.getApr() + mypageVO.getMay() + mypageVO.getJun() 
			+ mypageVO.getJul() + mypageVO.getAug() + mypageVO.getSept() + mypageVO.getOct() + mypageVO.getNov() + mypageVO.getDec();
			
			session.setAttribute("yearSum", yearSum); // 굳이 addObject로 등록했다가 @SessionAttributes에 적을필요가 없이 이렇게 하면 되네..

			
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
				
		
		long yearSum = 0;
		
		//PostMapping이므로 특정 연도를 조회
		if(cardList.isEmpty()) {
			System.out.println("하나카드 외 연동된 카드사가 없습니다.");
			mypageVO = mypageService.getTopSpecific(resiNum, year);

			yearSum = mypageVO.getJan() + mypageVO.getFeb() + mypageVO.getMar() + mypageVO.getApr() + mypageVO.getMay() + mypageVO.getJun() 
			+ mypageVO.getJul() + mypageVO.getAug() + mypageVO.getSept() + mypageVO.getOct() + mypageVO.getNov() + mypageVO.getDec();

			session.setAttribute("yearSum", yearSum); // 굳이 addObject로 등록했다가 @SessionAttributes에 적을필요가 없이 이렇게 하면 되네..
			
		} else {
			System.out.println("/mypage/topspecific/${year}");
			System.out.println("타 카드사와 연동되어 있습니다.");
			System.out.println("year 값이 제대로 들어오나요? : " + year);

			String cardListString = String.join(",", cardList); // 똑똑하군. element가 하나만 있으면, 콤마를 붙이지 않고 그요소 그대로를내보낸다. "신한카드" 처럼
			System.out.println("cardListString : " + cardListString);
			mypageVO = mypageService.getTopSpecific(resiNum, cardListString, year);
			//mypageVO = mypageService.getTopCurrentYear(resiNum, cardListString);
			
			yearSum = mypageVO.getJan() + mypageVO.getFeb() + mypageVO.getMar() + mypageVO.getApr() + mypageVO.getMay() + mypageVO.getJun() 
			+ mypageVO.getJul() + mypageVO.getAug() + mypageVO.getSept() + mypageVO.getOct() + mypageVO.getNov() + mypageVO.getDec();

			session.setAttribute("yearSum", yearSum); // 굳이 addObject로 등록했다가 @SessionAttributes에 적을필요가 없이 이렇게 하면 되네..
			
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
				
		
		long cateSum = 0;

		
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

			cateSum = mypageVO.getI1() + mypageVO.getI2() + mypageVO.getI3() + mypageVO.getI4() + mypageVO.getI5() + mypageVO.getI6() + mypageVO.getI7() + mypageVO.getI8()
			+ mypageVO.getI9() + mypageVO.getI10() + mypageVO.getI11() + mypageVO.getI12() + mypageVO.getI13();
			
			session.setAttribute("cateSum", cateSum); // 굳이 addObject로 등록했다가 @SessionAttributes에 적을필요가 없이 이렇게 하면 되네..

			
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
			
			

			cateSum = mypageVO.getI1() + mypageVO.getI2() + mypageVO.getI3() + mypageVO.getI4() + mypageVO.getI5() + mypageVO.getI6() + mypageVO.getI7() + mypageVO.getI8()
			+ mypageVO.getI9() + mypageVO.getI10() + mypageVO.getI11() + mypageVO.getI12() + mypageVO.getI13();
			
			session.setAttribute("cateSum", cateSum); // 굳이 addObject로 등록했다가 @SessionAttributes에 적을필요가 없이 이렇게 하면 되네..

		}
		
		
		session.setAttribute("recocard", mypageVO); // 굳이 addObject로 등록했다가 @SessionAttributes에 적을필요가 없이 이렇게 하면 되네..
		
		return mypageVO;
	}
	
	@ResponseBody
	@GetMapping("/mypage/update") 	
	public MemberVO doUpdateLink(MemberVO cardList, HttpSession session) {	
		// 날라오는 parameter가 많다면, @ReqeustParam도 엄청난 노가다가 된다.
		// 그럴 때는 아예 객채로 받는 방법을 쓴다. 그냥 객체명을 쓰면, 내부적으로 setter가 작동해서 form 태그 내의 데이터를 담아오는 듯하다. 
		System.out.println("member : " + cardList);
		
		ModelAndView mav = new ModelAndView();

		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		String id = loginVO.getId();
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("chn", "Y");
		map.put("csh", cardList.getCsh());
		map.put("css", cardList.getCss());
		map.put("chd", cardList.getChd());
		map.put("ckm", cardList.getCkm());
		map.put("clt", cardList.getClt());
		map.put("cwr", cardList.getCwr());
		map.put("cbc", cardList.getCbc());
		map.put("cct", cardList.getCct());
		map.put("cnh", cardList.getCnh());
		map.put("cshb", cardList.getCshb());
		map.put("ckjb", cardList.getCkjb());
		map.put("cjbb", cardList.getCjbb());
		map.put("cjjb", cardList.getCjjb());
		
		// DB에 사용자의 카드 연동정보를 변경해야 함.
		loginVO = mypageService.doUpdateLink(map, loginVO);
		System.out.println("업데이트된 loginVO : " + loginVO);
		//업데이트된 정보로 다시 loginVO 세션에 등록.
		session.setAttribute("loginVO", loginVO); // 굳이 addObject로 등록했다가 @SessionAttributes에 적을필요가 없이 이렇게 하면 되네..
		//mav.addObject("loginVO", loginVO);
		
		return null;
	}
	
	
		
		
	@GetMapping("/mypage/owncard")
	public ModelAndView getMyCard() {
	//public ModelAndView getMyCard(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/card"); //jsp 경로. View resolver의 suffix 등등 설정에 의해 이렇게만 써도 됨. 
		
		return mav;
	}
	
	
	
	/* bottomchart reco카드 별도로 구성하려고 만들던 코드
	@ResponseBody
	@GetMapping("/mypage/recocard")
	public String[][] getBestOneCard(HttpSession session) {
	
		MypageVO recocard = (MypageVO)session.getAttribute("recocard"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		// 아.. 왜 자꾸 java.lang.NullPointerException 나는거지. => ajax 비동기통신 특성 때문임. async = fale 하면 그 문제는 해결됨. 속도문제가... => ajax 내에 ajax
		// 그냥 bottomspecific이랑 별도로 쿼리 가져와서 처리하자 ㅠㅠ
		// 그러면 bottomspecific은 이전의 IN(i1, i2) 쿼리가 더 빠르니까 그렇게 해도 되겠는데?
		
		
		
		
		long i1 = recocard.getI1();
		long i2 = recocard.getI2();
		long i3 = recocard.getI3();
		long i4 = recocard.getI4();
		long i5 = recocard.getI5();
		long i6 = recocard.getI6();
		long i7 = recocard.getI7();
		long i8 = recocard.getI8();
		long i9 = recocard.getI9();
		long i10 = recocard.getI10();
		long i11 = recocard.getI11();
		long i12 = recocard.getI12();
		long i13 = recocard.getI13();
		
		RConnection rconn = null;
		
		try {
			
			rconn = new RConnection("34.64.132.162", 6311);
			rconn.login("rserv", "rserv");
			rconn.eval("library(recocard)");
			

			System.out.println("*********************");
			System.out.println("*********************");
			System.out.println("i1: " + i1 + "  i2: " +  i2 + "  i3: " +  i13 + "  i4 : " + i4);
			System.out.println("*********************");
			System.out.println("*********************");
			
			//rconn.eval("result <- getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			rconn.eval("result <- getBestOneCard(" + i1 + "," + i2 + "," + i3 + "," + i4 + "," + i5 + "," + i6 + "," 
					+ i7 + "," + i8 + "," + i9 + "," +  i10 + "," + i11 + "," + i12 + "," + i13 + ")");
			

			
			RList table = rconn.eval("result").asList();
			
			int cols = table.size();
			int rows = table.at(0).length();

			String[][] s = new String[cols][];

			for (int i = 0; i < cols; i++) {
				s[i] = table.at(i).asStrings();
			}
			
			
			return s;

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rconn.close();
		}
		
		return null;
	}
	*/
	
	
	//recocard : bottomchart 결과를 세션에 등록하고, 그걸 받아서 추천카드 처리하는 로직. (asyn = false를 사용하면 되나, 화면이 멈춰서 답답함.)
	@ResponseBody
	@GetMapping("/mypage/recocard")
	public String[][] getBestOneCard(HttpSession session) {
		
		MypageVO recocard = (MypageVO)session.getAttribute("recocard"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		// 아.. 왜 자꾸 java.lang.NullPointerException 나는거지.
		// 그냥 bottomspecific이랑 별도로 쿼리 가져와서 처리하자 ㅠㅠ
		// 그러면 bottomspecific은 이전의 IN(i1, i2) 쿼리가 더 빠르니까 그렇게 해도 되겠는데?
		
		long i1 = recocard.getI1();
		long i2 = recocard.getI2();
		long i3 = recocard.getI3();
		long i4 = recocard.getI4();
		long i5 = recocard.getI5();
		long i6 = recocard.getI6();
		long i7 = recocard.getI7();
		long i8 = recocard.getI8();
		long i9 = recocard.getI9();
		long i10 = recocard.getI10();
		long i11 = recocard.getI11();
		long i12 = recocard.getI12();
		long i13 = recocard.getI13();
		
		RConnection rconn = null;
		
		try {
			
//			  Create a connection to Rserve instance running IP Addr, UserID, Password
//			  required (/etc/Ruser.txt)
//			 
//			
//			
//			
//			rconn = new RConnection("34.64.132.162", 6311);
//			rconn.login("rserv", "rserv");
//			rconn.eval("library(recocard)");
//			
//			rconn.eval("result <- getBestOneCard(" + i1 + "," + i2 + "," + i3 + "," + i4 + "," + i5 + "," + i6 + "," 
//													+ i7 + "," + i8 + "," + i9 + "," +  i10 + "," + i11 + "," + i12 + "," + i13 + ")");
			
			
			// 이런식으로 i1
			//rconn.eval("result <- getBestOneCard('" + type1 + ", " + type2.. ,2,3,4,5,6,7,8,9,10,11,12,13)");
			
			
			
			//rconn.eval("result <- getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			//rconn.eval("result <- getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			//rconn.eval("df <- doReadCSV('"+ dataPath + upFileNm+ "')");
			
//			RList table = rconn.eval("result").asList();
//			
//			
//			int cols = table.size();
//			int rows = table.at(0).length();
//
//			String[][] s = new String[cols][];
//
//			for (int i = 0; i < cols; i++) {
//				s[i] = table.at(i).asStrings();
//			}
//
//			for (int i = 0; i < cols; i++) {
//				for (int j = 0; j < rows; j++) {
//					System.out.println(s[i][j]);
//				}
//			}
//			
//			System.out.println("total num : " + s[0][0]);
//			System.out.println("best card : " + s[1][0]);
//			
//			
//			
//			return s;
			 
			
			
			
			
			
			rconn = new RConnection("34.64.132.162", 6311);
			rconn.login("rserv", "rserv");
			rconn.eval("library(recocard)");
			
			
			System.out.println("*********************");
			System.out.println("*********************");
			System.out.println("i1: " + i1 + "  i2: " +  i2 + "  i3: " +  i13 + "  i4 : " + i4);
			System.out.println("*********************");
			System.out.println("*********************");
			
			//rconn.eval("result <- getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			rconn.eval("result <- getBestOneCard(" + i1 + "," + i2 + "," + i3 + "," + i4 + "," + i5 + "," + i6 + "," 
					+ i7 + "," + i8 + "," + i9 + "," +  i10 + "," + i11 + "," + i12 + "," + i13 + ")");
			
			
			
//			rconn.eval("df <- doReadCSV('"+ dataPath + csvFileNm+ "')");			
//			rconn.eval("doSaveRDS(df, '"+ dataPath +"','"+ fileSaveName+"')");
//			
//			rconn.assign("colname", colName); //결측치가 있는 컬럼명
			
			
			//c.eval("result <- getBestOneCard(1,2,3,4,5,6,7,8,9,10,11,12,13)");
			//c.eval("df <- doReadCSV('"+ dataPath + upFileNm+ "')");
			
			RList table = rconn.eval("result").asList();
			
			
			int cols = table.size();
			int rows = table.at(0).length();
			
			String[][] s = new String[cols][];
			
			for (int i = 0; i < cols; i++) {
				s[i] = table.at(i).asStrings();
			}
			
			return s;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rconn.close();
		}
		
		return null;
	}
	
	
	
	
	
	@ResponseBody
	@GetMapping("/mypage/transaction/more/{transPeriod}/{lastNum}")
	public List<CardTransactionVO> getMoreList(@PathVariable("transPeriod") String transPeriod, @PathVariable("lastNum") String lastNum,  HttpSession session) {	
		
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); 
		
		// 거래내역 데이터 더보기 누를 시 AJAX로 15건 더 가져오기 
		// 요청하고자 하는 기간 : ROWNUM <= lastNum + 15
		
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
				
		
		//처음 보여주는 데이터는 현재 달이다. 사용자가 선택하는 기간을 처리하는 것은 mypage.jsp에서 ajax로 처리
		//현재 월 구하기 => 필요없다. DB단에서 처리하면 된다.
		
//		System.out.println(transPeriod);
//		
//		Calendar cal = Calendar.getInstance();
//		String year = Integer.toString(cal.get( cal.YEAR ));
//		String month = Integer.toString(cal.get( cal.MONTH ) + 1);
				
//		if(transPeriod.equals("thisMonth")) {
//			if(month.length() == 1) {
//				month = "0" + month;
//			}
//			period = year + month;
//		}
//		if(transPeriod.equals("2weeks")) {
//			if(month.length() == 1) {
//				month = "0" + month;
//			}
//		}
//		if(transPeriod.equals("1month")) {
//			if(month.length() == 1) {
//				month = "0" + month;
//			}
//		}
//		if(transPeriod.equals("3month")) {
//			if(month.length() == 1) {
//				month = "0" + month;
//			}
//		}
		
		
//		if(month.length() == 1) {
//			month = "0" + month;
//		}
//		
//		String period = year + month;
//		System.out.println("period : " + period);

		String resiNum = loginVO.getResiNum();
		List<CardTransactionVO> cardTrans;
		
		if(cardList.isEmpty()) {
			
			System.out.println("하나카드 외 연동된 카드사가 없습니다.");
			cardTrans = mypageService.getCardTrans(resiNum, transPeriod, lastNum);

			
		} else {
			
			String cardListString = String.join(",", cardList); // 똑똑하군. element가 하나만 있으면, 콤마를 붙이지 않고 그요소 그대로를내보낸다. "신한카드" 처럼
			cardTrans = mypageService.getCardTransOpen(resiNum, cardListString, transPeriod, lastNum);
			
		}
		
		
		return cardTrans;
		
	}
	
	
	//   /mypage/transaction/' + transPeriod
	@ResponseBody
	@GetMapping("/mypage/transaction/{transPeriod}")
	public List<CardTransactionVO> getPeriodList(@PathVariable("transPeriod") String transPeriod, HttpSession session) {	
		
		
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); 
		
		// 이번 달(thisMonth), 2주(2weeks), 1개월(1month), 3개월(3month)로 transPeriod 날라온다.
		// 무조건 15건만 가져오면 되고, 더보기는 다른 ajax로 처리한다.
		
		
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
				

		//String transPeriod = "thisMonth";
		
		
		String resiNum = loginVO.getResiNum();
		List<CardTransactionVO> cardTrans;
		
		if(cardList.isEmpty()) {
			
			System.out.println("하나카드 외 연동된 카드사가 없습니다.");
			cardTrans = mypageService.getCardTrans(resiNum, transPeriod, "0");

			
		} else {
			
			String cardListString = String.join(",", cardList); // 똑똑하군. element가 하나만 있으면, 콤마를 붙이지 않고 그요소 그대로를내보낸다. "신한카드" 처럼
			cardTrans = mypageService.getCardTransOpen(resiNum, cardListString, transPeriod, "0");
			
		}
		
		return cardTrans;
	}
	
	
	@GetMapping("/mypage/transaction")
	public ModelAndView getMyTransaction() {
	//public ModelAndView getMyCard(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mypage/transaction"); //jsp 경로. View resolver의 suffix 등등 설정에 의해 이렇게만 써도 됨. 
		
		return mav;
	}
	
	
}
