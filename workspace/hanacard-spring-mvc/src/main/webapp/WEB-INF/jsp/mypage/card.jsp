<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Academics &mdash; Website by Colorlib</title>
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
<script src="/hanacard-spring-mvc/resources/js/jquery-3.3.1.min.js"></script>

<script>

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
						<h2 class="mb-0">마이페이지</h2>
						<p>나만의 카드 생활</p>
					</div>
				</div>
			</div>
		</div>

		<%-- 페이지 소개 시작 --%>
		<div class="custom-breadcrumns border-bottom">
			<div class="container">
				<a href="index.html">Home</a> <span class="mx-3 icon-keyboard_arrow_right"></span> <span class="current">마이페이지</span>
			</div>
		</div>
		<%-- 페이지 소개 끝 --%>


		<%-- 본문 코드 시작 : 대시보드 전체를 담고있는 컨테이너 --%>
		<!-- Begin Page Content -->
		<div class="container">
			<!-- <div class="container-fluid"> -->

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
</body>
</html>