<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
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
						<h2 class="mb-0">나만의 차트</h2>
						<p>${loginVO.name}님을 위한 차트입니다.</p>
					</div>
				</div>
			</div>
		</div>

		<%-- 페이지 소개 시작 --%>
		<div class="custom-breadcrumns border-bottom">
			<div class="container">
				<a href="index.html">Home</a> <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span>나만의차트</span> <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span class="current">할인순위</span>
			</div>
		</div>
		<%-- 페이지 소개 끝 --%>


		<%-- 본문 코드 시작 : 대시보드 전체를 담고있는 컨테이너 --%>
		<!-- Begin Page Content -->
		<div class="container" align="center">
			<br>
			<div>
				<h1 id = "category" class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;">할인 카드</h1>
				<h1 class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;"> TOP3</h1>
				
				<div>
					<input type="month" id="start" name="start" min="2018-01" value="2020-09">
					<button id = "searchBtn">조회</button>
				</div>
				
			</div>


			<div align="left">
				<hr size = "5">
				<ul id = "ulList" type = "none"> 
					
					<%-- <c:forEach items = "${ageSortList}" var ="top" varStatus="loop">
						<li>
							<div style = "background-color: #E8F5FF; box-shadow: 20px 20px 20px grey;">
							<!-- <div style = "background-color: #E8F5FF;"> -->
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span style = "vertical-align: middle; font-weight : bold; font-size: 100px; color: black;">${loop.count}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span>
									<c:choose>
										<c:when test="${ fn:substring(top.cardName, 0, 1) == '#' }">
											<img src="/hanacard-spring-mvc/resources/images/${ fn:substring(top.cardName, 1, fn:length(top.cardName)) }.png" style = "width : 132px; height : 84px;">
										</c:when>
										<c:otherwise>
											<img src="/hanacard-spring-mvc/resources/images/${ top.cardName }.png" style = "width : 132px; height : 84px;">
										</c:otherwise>
									</c:choose>
								</span>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<span style ="font-size: 30px; vertical-align: sub; color: black;">${ top.cardName }</span>
							</div>
						</li>
						<br>
					</c:forEach> --%>
					
				</ul>
			</div>

		</div>
		<%-- 본문 코드 끝 : 대시보드 전체를 담고있는 컨테이너 --%>
		

		<!-- Page level plugins -->
		<script src="/hanacard-spring-mvc/resources/vendor/chart.js/Chart.min.js"></script>
		
		
		<script>
		
			let year = $('#bottomYear').val().substring(0,4);
			let month = $('#bottomMonth').val();
			
			if(month == '전체'){
				month = 'all';
			} else{
				month = $('#bottomMonth').val().slice(0,-1); //끝문자부터 자르기
				if(month.length == 1)
					month = '0' + month;
			}
			
	
			$.ajax({
				url : '${ pageContext.request.contextPath }/mypage/bottomspecific/' + year + '/' + month,
				type : 'get', 
				//async : false,
				success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 
	
					console.log('==========getBotttomSpecific===========')
					console.log(data);
					let list = JSON.parse(data);
					console.log(list);
					console.log('==========getBotttomSpecific===========')
					
					
			 		let trans_gas = list.i1 + list.i2;
					let leisure_travel_flight = list.i4 + list.i5 + list.i6;
					let mart_shopping = list.i7 + list.i8;
					let pet = list.i9;
					let health_medical = list.i10;
					let life = list.i11;
					let food_beverage = list.i12;
					let communication = list.i13;
					
	
					myBarChart.data.datasets[0].data = [trans_gas, leisure_travel_flight, mart_shopping, pet, health_medical,
						life, food_beverage, communication];
				
					myPieChart.data.datasets[0].data = [trans_gas, leisure_travel_flight, mart_shopping, pet, health_medical,
						life, food_beverage, communication];
	 
					myBarChart.update();
					myPieChart.update();
					
					
					// 영역별 소비 합계금액 ajax 반영
					let cateSum = trans_gas + leisure_travel_flight + mart_shopping + pet + health_medical + life + food_beverage + communication;
					cateSum = numberWithCommas(cateSum);
					$('#cateSumH').text("합계 : " + cateSum + "원");
					
					$.ajax({
						//url : '${ pageContext.request.contextPath }/mypage/recocard/' + year + '/' + month,
						url : '${ pageContext.request.contextPath }/mypage/recocard',
						type : 'get', 
						//async : false,
						success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 
							
							let test = JSON.parse(data);
						
							let totalValue = parseInt(test[0][0]);
							let totalCardName = test[1][0];
							let firstTotal = totalCardName.substring(0, 1);
							
							if(firstTotal == '#'){
								totalCardName = totalCardName.substring(1, totalCardName.length)
							}
							
							
							let disValue = parseInt(test[2][0]);
							let disCardName = test[3][0];
							let firstDis = disCardName.substring(0, 1);
							
							if(firstDis == '#'){
								disCardName = disCardName.substring(1, disCardName.length)
							}
							
							
							let pointValue = parseInt(test[4][0]);
							let pointCardName = test[5][0];
							let firstPoint = pointCardName.substring(0, 1);
							
							if(firstPoint == '#'){
								pointCardName = pointCardName.substring(1, pointCardName.length)
							}
							
							
							let mileValue = parseInt(test[6][0]);
							let mileCardName = test[7][0];
							let firstMile = mileCardName.substring(0, 1);
							
							if(firstMile == '#'){
								mileCardName = mileCardName.substring(1, mileCardName.length)
							}
							
							
							
							//let attr = $('#recocardImage').attr('src');
							let path = '/hanacard-spring-mvc/resources/images/';
							path = path + totalCardName + '.png';
							$('#recocardImageTotal').attr('src', path);
							
							$('#recocardTitleTotal').text(test[1][0]); //#tag1 카드인 경우 # 그대로 표현하기위해
							$('#recocardTextTotal').html('소비를 통합하시면, \n' + numberWithCommas(totalValue) + '(원)의 혜택을 누리실 수 있어요!');
							//$('#recocardTextTotal').html('소비를 통합하시면, \n' + totalValue + '(원)의 혜택을 누리실 수 있어요!');
							//$('#recocardText').text('소비를 통합하시면, \n' + value + '(원)의 혜택을 누리실 수 있어요!');
							
							
							
							path = '/hanacard-spring-mvc/resources/images/';
							path = path + disCardName + '.png';
							$('#recocardImageDis').attr('src', path);
							
							$('#recocardTitleDis').text(test[3][0]); //#tag1 카드인 경우 # 그대로 표현하기위해
							$('#recocardTextDis').html('소비를 통합하시면, \n' + numberWithCommas(disValue) + '(원)의 혜택을 누리실 수 있어요!');
						
							
							
							path = '/hanacard-spring-mvc/resources/images/';
							path = path + pointCardName + '.png';
							$('#recocardImagePoint').attr('src', path);
							
							$('#recocardTitlePoint').text(test[5][0]); //#tag1 카드인 경우 # 그대로 표현하기위해
							$('#recocardTextPoint').html('소비를 통합하시면, \n' + numberWithCommas(pointValue) + '(원)의 혜택을 누리실 수 있어요!');
							
							
							
							path = '/hanacard-spring-mvc/resources/images/';
							path = path + mileCardName + '.png';
							$('#recocardImageMile').attr('src', path);
							
							$('#recocardTitleMile').text(test[7][0]); //#tag1 카드인 경우 # 그대로 표현하기위해
							$('#recocardTextMile').html('소비를 통합하시면, \n' + numberWithCommas(mileValue) + '(마일)의 혜택을 누리실 수 있어요!');
	
							
	
						},
						error : function() {
							
							alert('ajax 실패')
							
						}
					})
					
	
				},
				error : function() {
					
					alert('ajax 실패')
					
				}
			})
		
		</script>
		
		

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