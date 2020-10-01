<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri ="http://www.springframework.org/tags/form" %>

    
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

<style>
	th{
		text-align: "center"
	}
	
	.error{
		color : red
	}
	
	
	
	h2 {
	  text-align: center;
	  padding: 20px 0;
	}
	
	.table-bordered {
	  border: 1px solid #ddd !important;
	}
	
	table caption {
		padding: .5em 0;
	}
	
	@media screen and (max-width: 767px) {
	  table caption {
	    display: none;
	  }
	}
	
	.p {
	  text-align: center;
	  padding-top: 140px;
	  font-size: 14px;
	}
</style>


<script src="/hanacard-spring-mvc/resources/js/jquery-3.3.1.min.js"></script>

<script>

	function goWriteForm() {
		//location.href = "writeForm.jsp";
		location.href = "${ pageContext.request.contextPath }/board/write";
	}
	
	function doAction(boardNO){
		//location.href = "${ pageContext.request.contextPath }/board/detail?no=" + boardNO;   ==> 이전 형태다.
		location.href = "${ pageContext.request.contextPath }/board/" + boardNO; // 이런 방식으로 해보고싶다. 근데 왜 pageContext.request.contextPath로 가져오는거지?
	}

</script>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<!-- .site-wrap starts -->
	<div class="site-wrap">
		
		
		<%-- 헤더 시작 :  header 태그가 topMenue.jsp내에 있어서 <header>로 감싸면 제대로 안나옴. --%>
		<jsp:include page="../include/topMenue.jsp" />

		<%-- 섹션 시작 : section 태그로 감싸도 제대로 안나온다. 붙이지 말자.--%>
		<div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('/hanacard-spring-mvc/resources/images/bg_1.jpg')">
			<div class="container">
				<div class="row align-items-end justify-content-center text-center">
					<div class="col-lg-7">
						<h2 class="mb-0">고객센터</h2>
						<p>${loginVO.name}님, 무엇을 도와드릴까요?</p>
					</div>
				</div>
			</div>
		</div>

		<%-- 페이지 소개 시작 --%>
		<div class="custom-breadcrumns border-bottom">
			<div class="container">
				<a href="index.html">Home</a> <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span class="current">고객센터</span> 
				<!-- <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span class="current">연회비별순위</span> -->
			</div>
		</div>
		<%-- 페이지 소개 끝 --%>


		<%-- 본문 코드 시작 : 대시보드 전체를 담고있는 컨테이너 --%>
		<!-- Begin Page Content -->
			<div align = "center">
			<hr width = "80%">
			<h2>게시물 등록폼</h2>
			<hr width = "80%">
			<br>
			
			<!-- 공유영역에 commandName이 boardVO인 객체를 찾는다. 그리고 path를 통해 getter로 가져온다.  -->
			<!-- action 속성이 없으면, 자동으로 똑같은 경로에 POST 방식으로 값이 날라감. -->
			<form:form  commandName="boardVO" method="post" >
	         <table class = "table" border="1" style="width:80%">
	            <tr>
	               <th width="23%">제목</th>
	               <td>
	                  <!-- path는 게터, 세터 역할을 함. 즉, getTitle() setTitle()이 된다.  -->
	                  <form:input path="title"/>  <form:errors path ="title" class="error"/> <!--getTitle()값이 null이면,  @NotEmpty(message = "필수항목입니다.") 에 적은 메세지가 나온다. -->
	               </td>
	            </tr>
	            <tr>
	               <th width="23%">글쓴이</th>
	               <td>
	                  <form:input path="writer"/><form:errors path ="writer" class="error"/>
	               </td>
	            </tr>
	            <tr>
	               <th width="23%">내용</th>
	               <td>
	                  <form:textarea path="content" rows="4" cols="100" /><form:errors path ="content" class="error"/>
	               </td>
	            </tr>
	         </table>
	         <button>등록</button>
	      </form:form>
			
		</div>
		
		<%-- 본문 코드 끝 : 대시보드 전체를 담고있는 컨테이너 --%>
		

		<!-- Page level plugins -->
		<script src="/hanacard-spring-mvc/resources/vendor/chart.js/Chart.min.js"></script>

		<!-- Bootstrap core JavaScript-->
		<script src="/hanacard-spring-mvc/resources/vendor/jquery/jquery.min.js"></script>
		<script src="/hanacard-spring-mvc/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="/hanacard-spring-mvc/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="/hanacard-spring-mvc/resources/js/sb-admin-2.min.js"></script>

		<!-- Page level custom scripts -->
		<!-- <script src="/hanacard-spring-mvc/resources/js/demo/chart-area-demo.js"></script> -->
		<!-- <script src="/hanacard-spring-mvc/resources/js/demo/chart-pie-demo.js"></script> -->
		<!-- <script src="/hanacard-spring-mvc/resources/js/demo/chart-bar-demo.js"></script> -->

		<!-- /.container-fluid -->
		<footer>
			<jsp:include page="../include/footer.jsp" />
		</footer>


	</div>
	<!-- .site-wrap ends -->
	
	<!-- loader -->
	<div id="loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#51be78" /></svg>
	</div>

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

	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->

	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
</body>
</html>