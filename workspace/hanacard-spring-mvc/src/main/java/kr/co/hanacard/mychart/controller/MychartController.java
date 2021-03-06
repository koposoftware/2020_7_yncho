package kr.co.hanacard.mychart.controller;

import javax.servlet.http.HttpSession;

import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hanacard.mypage.vo.MypageVO;


//@SessionAttributes({"loginVO", "hanaList"}) // mav.addObject() 메소드로 저장하는 객체이름이 loginVO라면, 세션에 등록하라!
@Controller
public class MychartController {

	@GetMapping("/mychart")
	public String baseChart() {
		
		return "/mychart/totalRank";
	}
	
	@GetMapping("/mychart/totalRank")
	public String totalChart() {
		
		return "/mychart/totalRank";
	}
	
	@GetMapping("/mychart/discountRank")
	public String discountChart() {
		
		return "/mychart/discountRank";
	}
	
	@GetMapping("/mychart/pointRank")
	public String pointChart() {
		
		return "/mychart/pointRank";
	}
	
	@GetMapping("/mychart/mileRank")
	public String mileChart() {
		
		return "/mychart/mileRank";
	}
	
//	@ResponseBody
//	@GetMapping("/mypage/bottomspecific/{year}/{month}")
//	public MypageVO getBottomSpecific(@PathVariable("year") String year, @PathVariable("month") String month, HttpSession session) {	
		
	
	
	//recocard : bottomchart 결과를 세션에 등록하고, 그걸 받아서 추천카드 처리하는 로직. (asyn = false를 사용하면 되나, 화면이 멈춰서 답답함.)
	@ResponseBody
	@GetMapping("/mychart/{category}")
	public String[][] getTopList(@PathVariable("category") String category, HttpSession session) {
		
		MypageVO recocard = (MypageVO)session.getAttribute("recocard"); // 매개변수에 HttpSession session 써서 사용할 수 있는 것임.
		
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
			
			
			if(category.equals("total")) {
				
				rconn.eval("result <- getTopTotalList(" + i1 + "," + i2 + "," + i3 + "," + i4 + "," + i5 + "," + i6 + "," 
						+ i7 + "," + i8 + "," + i9 + "," +  i10 + "," + i11 + "," + i12 + "," + i13 + ")");
				
			} else if(category.equals("discount")) {
				
				rconn.eval("result <- getTopDisList(" + i1 + "," + i2 + "," + i3 + "," + i4 + "," + i5 + "," + i6 + "," 
						+ i7 + "," + i8 + "," + i9 + "," +  i10 + "," + i11 + "," + i12 + "," + i13 + ")");
				
			} else if(category.equals("point")) {
				
				rconn.eval("result <- getTopPointList(" + i1 + "," + i2 + "," + i3 + "," + i4 + "," + i5 + "," + i6 + "," 
						+ i7 + "," + i8 + "," + i9 + "," +  i10 + "," + i11 + "," + i12 + "," + i13 + ")");
				
			} else if(category.equals("mile")) {
				
				rconn.eval("result <- getTopMileList(" + i1 + "," + i2 + "," + i3 + "," + i4 + "," + i5 + "," + i6 + "," 
						+ i7 + "," + i8 + "," + i9 + "," +  i10 + "," + i11 + "," + i12 + "," + i13 + ")");
				
			}
				
			
			RList table = rconn.eval("result").asList();
			
			int cols = table.size();
			//int rows = table.at(0).length();
			
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
	
	
}
