package kr.co.hanacard.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.hanacard.board.service.BoardService;
import kr.co.hanacard.board.vo.BoardVO;


@Controller
public class BoardController {

	@Autowired //BoardService 클래스 위에 어노테이션이 있기 때문에, 빈이 생성되기 때문에 Autowired 하면 자동으로 그것을 여기에 자동으로 넣는다.
	private BoardService boardService;
	
	@RequestMapping("/board")
	public ModelAndView list() {
		
		List<BoardVO> boardList = boardService.selectAllBoard();
		
		ModelAndView mav = new ModelAndView("board/list"); //spring-mvc.xml에 view-resolvers 태그에 정해둠.
		mav.addObject("boardList", boardList); //HttpServletRequest. request영역에 올림.
		
		return mav;
	}
	
	//http://localhost:9999/Mission-Spring/board/25
	@RequestMapping("/board/{no}") // { } 내의 이름은 임의로 본인이 정하는 것.
	public ModelAndView detail(@PathVariable("no") int boardNo) {  
		//PathVariable 어노테이션을 활용해서 url에서 넘어오는 {no} 값을  int boardNo에 넣겠다.
		
		
		BoardVO board = boardService.selectByNo(boardNo);
		
		
		System.out.println("boardNo : " + boardNo);
		ModelAndView mav = new ModelAndView("board/detail");
		mav.addObject("board", board);
		return mav;
	}
	
	/*
	//http://localhost:9999/Mission-Spring/board/detail?no=25
	@RequestMapping("/board/detail")
	public ModelAndView detail(@RequestParam("no") int boardNo) { //@RequestParam 하면, 자동으로 뒤에 있는 자료형으로 가져온다.
		
		//public ModelAndView detail(HttpServletRequest request) {
		//int boardNo = Integer.parseInt(request.getParameter("no"));
		System.out.println("boardNo : " + boardNo);
		
		ModelAndView mav = new ModelAndView("board/detail");
		
		return mav;
	}
	*/
}
