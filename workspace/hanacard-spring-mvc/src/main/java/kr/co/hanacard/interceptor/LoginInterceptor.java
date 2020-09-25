package kr.co.hanacard.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.hanacard.member.vo.MemberVO;


public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//<mvc:mapping path="/board/write"/> 으로 설정한 경우, @RequestMapping("/board/write") 아래에 있는 메소드가 실행되기 전에 prehandle() 실행된다. 
		// 즉, 핸들러(컨트롤러를 포함하는 개념)를 호출하기 이전에 실행되는 인터셉터
		System.out.println("prehandle()");
		
		HandlerMethod method = (HandlerMethod)handler;
		System.out.println("HandlerMethod method : " + method);
		System.out.println("Controller : " + method.getBean());
		System.out.println("로그4J 활용해서 로그를 남길수도 있음!");
		
		// 로그인 여부 체크
		// loginVO는 세션에 있기 때문에, 세션객체를 가져와야 한다.
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
		
		if(loginVO == null) {
			//return false; // return 값이 false 이면, @RequestMapping("/board/write")아래에 있는 메소드를 실행하지 않는다.
			// 즉, 로그인 안한 상태로, http://localhost:9999/Mission-Spring/board/write/ 경로에 들어가면 화면에 아무것도 뜨지 않는다!
			// 하지만, 이것을 원한게 아니다. board/write 경로에 임의로 쳐서 들어왔을 때 로그인이 안되어 있으면 login 화면으로 redirect 해주는게 필요함!

			
			// + 세부 게시물 눌러서 로그인을 한뒤 다시 세부게시물로 가게 해야함. 
			String uri = request.getRequestURI();
			System.out.println("request.getRequestURI() : " + uri);
			uri = uri.substring(request.getContextPath().length());
			System.out.println(uri);
			
			
			// 쿼리는 물음표로 날라가는 것. 그래서 REST 방식을 쓰면 null이 나오게 된다.
			String query = request.getQueryString();
			System.out.println("query : " + query);
			
			//이건 왜하는건지 다시 알아봐야함. 놓침 ==> 아 ㅇㅋ
			if(query != null && query.length() != 0) {
				uri = uri +"?" + query;
			}
			System.out.println(uri);
			
			session.setAttribute("dest", uri); 
			// 다시 세부 게시물로 가게 하려면, login으로 redirect 한 후에 이뤄져야 한다.
			// MemberController 가서, @PostMapping("/login") 아래에 있는 메소드.
			
			
			response.sendRedirect(request.getContextPath() + "/login");
			// 그런데, 위에서 sendRedirect 했기때문에 아래의 false 결과가 의미 없다. (화면에 아무 내용이 안떠도 됨)
			return false; // 해당 컨트롤러 실행 못함. 화면이 텅비어 있음.
		}
		
		return true; //로그인vo 객체가 세션에 등록되어 있으면,  @RequestMapping("/board/write")아래에 있는 메소드를 실행.
	}

//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		
//		// 즉, 핸들러(컨트롤러를 포함하는 개념)를 호출한 이후에 실행되는 인터셉터
//		System.out.println("posthandle()");
//		super.postHandle(request, response, handler, modelAndView);
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		
//		//핸들러(컨트롤러를 포함하는 개념) 호출이 종료된 후에 실행되는 인터셉터
//		System.out.println("afterCompletion()");
//		super.afterCompletion(request, response, handler, ex);
//	}
	
	

}
