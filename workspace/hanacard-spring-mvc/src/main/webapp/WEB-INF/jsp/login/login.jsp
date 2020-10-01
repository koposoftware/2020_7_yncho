<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>하나카드</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/fonts/icomoon/style.css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/jquery-ui.css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/aos.css">
  <link href="/hanacard-spring-mvc/resources/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/style.css">
<link rel="icon" type="image/png" sizes="16x16" href ="/hanacard-spring-mvc/resources/images/favicon16.png">

<script>

	/* 
	1. js 파일 내에 checkData.js 으로 옮겼음!! 
	2. <script src = "~"> 등 으로 해당 js파일을 import 했다.  
	*/
	
	function isNull(obj, msg){
		if(obj.value ==''){
			alert(msg);
			obj.focus();
			return true;
		}
		return false;
	} 
	

	function checkForm(){
		var f = document.lform;
		
		if(isNull(f.id, '아이디를 입력하지 않았습니다.'))
			return false;

		if(isNull(f.password, '비밀번호를 입력하지 않았습니다.'))
			return false;
		
		/*
		if(f.id.value ==''){
			alert('아이디를 입력해주세요')
			f.id.focus();
			return false;
		}
		
		if(f.password.value == ''){
			alert('패스워드를 입력해주세요');
			f.password.focus();
			return false;
		}
		*/
		
		return true; 
		
	}
	
	
	function fnUpper(){
		
		
		  var value = $('#id').val().toUpperCase();
		  $('#id').val(value); 
          
			/* var obj = document.getElementById("id");
	        obj.value = obj.value.toUpperCase(); */
          
          
          
      }    // end function fnUpper()

	
	
	
	
</script>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">

	<%-- 
	
	
	<header>
		<%@include file="/WEB-INF/jsp/include/topMenu.jsp" %>
	</header> 
	
	아래 헤더의 include 경로에 WEB-INF를 추가해야 하는듯!
	
	
	--%>

	<%-- header 태그가 topMenue.jsp내에 있어서 <header>로 감싸면 제대로 안나옴. --%>
	<jsp:include page="../include/topMenue.jsp"/>
    
	    <div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('/hanacard-spring-mvc/resources/images/bg_1.jpg')">
	        <div class="container">
	          <div class="row align-items-end justify-content-center text-center">
	            <div class="col-lg-7">
	              <h2 class="mb-0">로그인</h2>
	              <p>Smart Life를 선도하는 Smart 금융, Hana Card</p>
	            </div>
	          </div>
	        </div>
	      </div> 
	    
	    <div class="custom-breadcrumns border-bottom">
	      <div class="container">
	        <a href="index.html">Home</a>
	        <span class="mx-3 icon-keyboard_arrow_right"></span>
	        <span class="current">Login</span>
	      </div>
	    </div>
	
	    <div class="site-section">
	        <div class="container">
				
				<form action = "${ pageContext.request.contextPath }/login" method ="post" onsubmit ="return checkForm()" name = "lform">
		            <div class="row justify-content-center">
		                <div class="col-md-5">
		                    <div class="row">
		                        <div class="col-md-12 form-group">
		                            <label for="id">아이디</label>
		                            <input type="text" autocomplete="off" id="id" class="form-control form-control-lg" name = "id" onkeyup="fnUpper()">
		                        </div>
		                        <div class="col-md-12 form-group">
		                            <label for="password">비밀번호</label>
		                            <input type="password" id="password" class="form-control form-control-lg" name = "password">
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col-12">
		                            <input type="submit" value="Log In" class="btn btn-primary btn-lg px-5">
		                        </div>
		                    </div>
		                </div>
		            </div>
	   			</form>
	          
	        </div>
	    </div>
	    
	    
		<!-- 하나카드 로그인 실패시 뜨는 모달
		
		<div id="error01_wrapper" class="popup_wrapper" style="opacity: 0; visibility: hidden; position: fixed; overflow: auto; z-index: 2001; transition: all 0.3s ease 0s; top: 0px; right: 0px; left: 0px; bottom: 0px; text-align: center; display: none;"><section class="modal popup_content" id="error01" data-popup-initialized="true" aria-hidden="true" role="dialog" tabindex="-1" style="opacity: 0; visibility: hidden; display: inline-block; outline: none; transition: all 0.3s ease 0s; text-align: left; position: relative; vertical-align: middle;">
		  <div class="modal_wrap">
		    modal_header
		    <div class="modal_header">
		      <h2>알림</h2>
		    </div>
		    //modal_header
		
		    modal_body
		    <div class="modal_body pop_ty">
		      17.06.02 수정
		      <article class="cont">
		        notice_area
		        <div class="notice_area">
		          <h3 class="w_tit">아이디 또는 비밀번호가<br>올바르지 않습니다.</h3>
		          <p class="s_txt">확인 후 로그인해주세요.</p>
		          <div class="txt_box">
		            비밀번호 5회 연속 오류 시 로그인이 제한됩니다.
		          </div>
		          btn_area
		          <ul class="btn_area">
		            <li>
		              <a href="javascript:void(0);" class="btn_m btn_ty02" onclick="jQuery('#error01').popup('hide'); return false;">확인</a>
		            </li>
		          </ul>
		          //btn_area
		        </div>
		        //notice_area
		      </article>
		      //17.06.02 수정
		    </div>
		    //modal_body
		    <button class="btn_pop_close" onclick="jQuery('#error01').popup('hide'); return false;">팝업 닫기</button>
		  </div>
		</section><div class="popup_align" style="display: inline-block; vertical-align: middle; height: 100%;"></div></div> 
		-->
	

	<footer>
		<jsp:include page="../include/footer.jsp"/>
	</footer>
    

  </div>
  <!-- .site-wrap -->

  <!-- loader -->
  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#51be78"/></svg></div>

  <script src="/hanacard-spring-mvc/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/jquery-ui.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/popper.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/bootstrap.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/owl.carousel.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/jquery.stellar.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/jquery.countdown.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/bootstrap-datepicker.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/jquery.easing.1.3.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/aos.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/jquery.fancybox.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/jquery.sticky.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/jquery.mb.YTPlayer.min.js"></script>
  <script src="/hanacard-spring-mvc/resources/js/main.js"></script>

</body>
</html>