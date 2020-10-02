<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<link rel="stylesheet" href="/hanacard-spring-mvc/resources/css/fonts.css">

<script src="/hanacard-spring-mvc/resources/js/jquery-3.3.1.min.js"></script> 


<!-- <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> -->
<style>
.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.accordion:after {
	content: '\002B';
	color: #777;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}

.panel {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}
</style>
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

	<!-- <script type="text/javascript">
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				/* Toggle between adding and removing the "active" class,
				to highlight the button that controls the panel */
				this.classList.toggle("active");

				/* Toggle between hiding and showing the active panel */
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script> -->

	<!-- .site-wrap starts -->
	<div class="site-wrap">
		
		
		<%-- 헤더 시작 :  header 태그가 topMenue.jsp내에 있어서 <header>로 감싸면 제대로 안나옴. --%>
		<jsp:include page="../include/topMenue.jsp" />

		<%-- 섹션 시작 : section 태그로 감싸도 제대로 안나온다. 붙이지 말자.--%>
		<div class="site-section ftco-subscribe-1 site-blocks-cover pb-4" style="background-image: url('/hanacard-spring-mvc/resources/images/bg_1.jpg')">
			<div class="container">
				<div class="row align-items-end justify-content-center text-center">
					<div class="col-lg-7">
						<h2 class="mb-0">마이페이지</h2>
						<p>나만의 카드 생활</p>
					</div>
				</div>
			</div>
		</div>

		
		<%-- 페이지 소개 시작 --%>
		<div class="custom-breadcrumns border-bottom">
			<div class="container">
				<a href="index.html">Home</a> <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span>마이페이지</span> <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span class="current">보유카드정보</span>
			</div>
		</div>
		<%-- 페이지 소개 끝 --%>
			
		<%-- 본문 코드 시작 : 대시보드 전체를 담고있는 컨테이너 --%>
		<!-- Begin Page Content -->
		<div class="container">
			<br>
			<br>

			<div align="center">
				<h1 id = "category" class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;">보유카드정보</h1>
			</div>
			<br>
			

			<div>
				<%-- ${hanaList} --%>
				<!-- <hr size = "5"> -->
				<ul type = "none">
					<%-- <c:forEach items = "${cardList}" var ="card"> --%>
					<hr>
					<c:forEach items = "${hanaList}" var ="card">
						<li>
							<div style = "display: inline-block;">
							<!-- <div style = "display: inline-block; width: 30%;"> -->
								<img src="/hanacard-spring-mvc/resources/images/${ card.cardProductName }.png" style = "width : 268px; height : 168px;">
								<%-- <li><img src="/hanacard-spring-mvc/resources/images/${ card }.png" style = "width : 268px; height : 168px;"> --%>
							</div>
						
							<div style = "display: inline-block; vertical-align: middle; margin-left: 30px;" >
							<!-- <div style = "display: inline-block; height : 168px;"> -->
							<!-- <div style = "display: inline-block; margin-left: 5px;"> -->
							
								<div>
								<!-- <div style ="height : 100px; vertical-align: bottom;"> -->
									<c:set var="TextValue" value="${ card.cardNum }"/>
									<span>${ fn:substring(TextValue, 0,4) } </span>
									<span>-****-****-</span>
									<span>${ fn:substring(TextValue, 12,16) } </span>
									<a href="#" class="btn btn-dark btn-sm" style ="text-align: center;">카드번호/유효기간 보기</a>
									
									<%-- <span>${ card.cardNum }</span> --%>
								</div>
								<div>
								<!-- <div style="height : 100px; vertical-align: middle;"> -->
									<span>${ card.cardProductName } | </span>
									<span>서울교통(후불) | </span>
									<c:set var="TextValue2" value="${ card.regDate }"/>
									<%-- <span>${ card.regDate }</span> --%>
									<span>신청일 ${ fn:substring(TextValue2, 0,4) }. </span>
									<span>${ fn:substring(TextValue2, 5,7) }. </span>
									<span>${ fn:substring(TextValue2, 8,10) } | 정상</span>
								</div>
							
							
							</div>
							
							<%-- <div>${ card }</div>
							<div>${ cardNum }</div> --%>
						
						</li>
						<hr>
						<%-- <li><img src="/hanacard-spring-mvc/resources/images/${ card }.png" style = "width : 134px; height : 84px;">${ card }</li> --%>
						<%-- <li><img src="/hanacard-spring-mvc/resources/images/${ card }.png" style = "width : 67px; height : 42px;">${ card }</li> --%>
						<!-- <li style = "display: inline-block; height: y; list-style-image: url('/hanacard-spring-mvc/resources/images/1Q Special+.png')"> -->
						<!-- <li style = "display: inline-block;">  -->
						<!-- <li style = "display: inline-block; height: y; list-style-image: url('/hanacard-spring-mvc/resources/images/1Q Special+.png')"> -->
						
						<!-- <img class="ui-li-icon" src="/hanacard-spring-mvc/resources/images/1Q Special+.png" style = "width : 67px; height : 42px;">  -->
			
							<%-- <span><img src="/hanacard-spring-mvc/resources/images/1Q Special+.png" style = "width : 67px; height : 42px;"></span> 
							<span>${loginVO.id} | 신청일 2020.00.00 | 정상</span> --%>
							<%-- <span>
								<dt>${hanaList[0]}</dt>
								<dd>${loginVO.id} | 신청일 2020.00.00 | 정상</dd>
							</span> --%>
						</li>
						<!-- <br> -->
					</c:forEach>
					<br>
					
											<!-- 	<div style = "background-color: #E8F5FF; box-shadow: 20px 20px 20px grey;"> -->
					
					<button class="accordion" style = "height : 80px; font-size: 20px; background-color: #F8F8F8; box-shadow: 5px 5px 5px grey; ">&nbsp;&nbsp;&nbsp;보유카드 정보 안내</button>
					<div class="panel">
						<ul>
							<br>
							<li>고객이 발급받으신 카드 중 사용이 가능한 유효카드정보입니다. (본인 및 가족카드)</li>
							<li>고객 명의의 법인카드는 홈페이지 "법인"회원으로 가입하여 조회하실 수 있습니다.</li>
							<li>보유하신 카드의 상세 혜택은 목록 중 카드별 "혜택보기" 버튼을 클릭하시면 됩니다.</li>
						</ul>
					</div>
				</ul>
			</div>



			<!-- <button class="accordion">&nbsp;&nbsp;&nbsp;보유카드 정보 안내</button>
			<div class="panel">
				<ul>
					<li>고객이 발급받으신 카드 중 사용이 가능한 유효카드정보입니다. (본인 및 가족카드)</li>
					<li>고객 명의의 법인카드는 홈페이지 "법인"회원으로 가입하여 조회하실 수 있습니다.</li>
					<li>보유하신 카드의 상세 혜택은 목록 중 카드별 "혜택보기" 버튼을 클릭하시면 됩니다.</li>
				</ul>
			</div> -->
			
			<br>

		
		</div>
		<%-- 본문 코드 끝 : 대시보드 전체를 담고있는 컨테이너 --%>


		<script>
			var acc = document.getElementsByClassName("accordion");
			var i;

			for (i = 0; i < acc.length; i++) {
				acc[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var panel = this.nextElementSibling;
					if (panel.style.maxHeight) {
						panel.style.maxHeight = null;
					} else {
						panel.style.maxHeight = panel.scrollHeight + "px";
					}
				});
			}
		</script>




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