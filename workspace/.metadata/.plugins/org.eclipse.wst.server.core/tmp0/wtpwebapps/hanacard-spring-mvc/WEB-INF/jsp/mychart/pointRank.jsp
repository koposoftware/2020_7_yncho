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
	$(document).ready(function(){
		
		
		$('#bottomBtn').click(function(){
	
			// 소비패턴 조회 버튼을 누르면 실행되어야 하는 함수들 통합(getBottomSpecific, getRecoCard)
			getBottomSpecific();
			
		})
		
		
	})
	
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	
	function getBottomSpecific() {
		
		
		//alert('getBottomSpecific()');
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
			type : 'get', // get 방식은 최초에 document.ready 했을 때 보여주는 것이고, 연도와 월을 선택하여 조회를 했을 땐 post 방식으로 보내야 함. (form 태그로 감싸야지.)
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
				
				
				
				
				
				let category = 'point';
				
				$.ajax({
					
					
					//@GetMapping("/mychart/{category}")
					//url : '${ pageContext.request.contextPath }/mypage/recocard/' + year + '/' + month,
					//url : '${ pageContext.request.contextPath }/mypage/recocard',
					url : '${ pageContext.request.contextPath }/mychart/' + category,
					type : 'get', 
					//async : false,
					success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 
						
						//alert('data : '   + data);
						//let test = JSON.parse(data);
						//alert('data : '   + data);
						//console.log(data);
						
						
						let list = JSON.parse(data);
						
						
				        $("#ulList").empty();
				        
			           var addListHtml ="";
			           for(i = 0; i < list[0].length; i++){
			        		 addListHtml += "<li>";
			            	 addListHtml += "<div style = \"background-color: #E8F5FF; box-shadow: 20px 20px 20px grey;\">";
			            	 addListHtml += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			            	 addListHtml += "<span style = \"vertical-align: middle; font-weight : bold; font-size: 100px; color: black;\">" + (i + 1) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			            	 addListHtml += "<span>";
			            	 
	 						if(list[0][i].substring(0,1) == '#'){
			            		 
				            	 addListHtml += "<img src=\"/hanacard-spring-mvc/resources/images/" + list[0][i].substring(1, list[0][i].length)  + ".png\" style = \"width : 132px; height : 84px;\">";
			
			            	 } else{
			            		 
				            	 addListHtml += "<img src=\"/hanacard-spring-mvc/resources/images/" + list[0][i] + ".png\" style = \"width : 132px; height : 84px;\">";
			
			            	 }
	 						
	 				    	 addListHtml += "</span>";
			            	 addListHtml += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			            	 addListHtml += "<span style =\"font-size: 30px; vertical-align: sub; color: black;\">" + list[0][i] + '&nbsp;&nbsp;&nbsp;￦' + numberWithCommas(parseInt(list[1][i])) + " 적립 혜택</span>";
			            	 addListHtml += "</div>";
			            	 addListHtml += "</li>";
			            	 addListHtml += "<br>";
			            	 
			           }
			           
			           $('#ulList').append(addListHtml);
			           
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
		
	};
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
				<span class="current">적립순위</span>
			</div>
		</div>
		<%-- 페이지 소개 끝 --%>


		<%-- 본문 코드 시작 : 대시보드 전체를 담고있는 컨테이너 --%>
		<div class="container" align="center">
			<br>
			<div>
				<h1 id = "category" class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;">적립 혜택</h1>
				<h1 class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;"> TOP3</h1>
				
				<div>
					<input type="month" id="start" name="start" min="2018-01" value="2020-09">
					<button id = "searchBtn">조회</button>
				</div>
				
			</div>
			
			
			<%-- 소비 패턴 버튼 시작 --%>
			<div class="d-sm-flex align-items-center justify-content-end mb-4 mt-5">
				<!-- Example single danger button -->

				<select class="selectpicker" data-style="btn-success" id="bottomYear">
					<!-- <select class="selectpicker" multiple data-max-options="2"> -->
					<option>2020년</option>
					<option>2019년</option>
					<option>2018년</option>
				</select>
				&nbsp;&nbsp;&nbsp;
				<select class="selectpicker" data-style="btn-success" id="bottomMonth">
					<!-- <select class="selectpicker" multiple data-max-options="2"> -->
					<option>전체</option>
					<option>1월</option>
					<option>2월</option>
					<option>3월</option>
					<option>4월</option>
					<option>5월</option>
					<option>6월</option>
					<option>7월</option>
					<option>8월</option>
					<option>9월</option>
					<option>10월</option>
					<option>11월</option>
					<option>12월</option>
				</select>
				&nbsp;&nbsp;&nbsp;
				<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="bottomBtn">
				<!-- <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="getBottomSpecific()"> -->
					<i class="fas fa-download fa-sm text-white-50"></i> 조회
				</button>
				<!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> 조회</a> -->

			</div>
			<%-- 소비 패턴 버튼 끝 --%>


			<%-- 세번째 로우 시작 : 소비 패턴 그래프  --%>
			<div class="row">
			
				<!-- Bar Chart -->
				<div class="col-xl-8 col-lg-7">

					<div class="card shadow mb-4">
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<!-- <div class="card-header py-3"> -->
						<!-- <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between"> -->
						
							<h6 class="m-0 font-weight-bold text-primary" style="display:inline;">영역별 소비 금액 </h6>
							<h6 id="cateSumH" class="m-0 font-weight-bold text-primary" style="display:inline;">합계 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${cateSum}"/>원</h6>
							<%-- <h6 class="m-0 font-weight-bold text-primary" style="display:inline;">합계 : ${cateSum}원</h6> --%>
							<%-- <h6 class="m-0 font-weight-bold text-primary">영역별 소비 금액 ${cateSum}</h6> --%>
						</div>
						<div class="card-body"  style ="height : 365px">
							<div class="chart-bar">
								<canvas id="myBarChart" class="chartjs-render-monitor" style="display: block; width: 281px; height: 320px;"></canvas>
							</div>

						</div>
					</div>
				</div>
				<!-- Bar Chart ends -->
				
				
				<!-- Pie Chart -->
				<div class="col-xl-4 col-lg-5">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">영역별 소비 비율</h6>
						</div>
						<!-- Card Body -->
						<div class="card-body" style ="height : 365px">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="myPieChart" class="chartjs-render-monitor" style="display: block; width: 281px; height: 270px;"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!-- Pie Chart ends -->

			</div>
			<%-- 세번째 로우 끝 : 소비 패턴  그래프 --%>
			

			<%-- 카드 리스트 나타내기 --%>
			<div align="left">
				<hr size = "5">
				<ul id = "ulList" type = "none"> 
					
					<%-- <c:forEach items = "${cardList}" var ="card"> --%>
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
			
			function number_format(number, decimals, dec_point, thousands_sep) {
				// *     example: number_format(1234.56, 2, ',', ' ');
				// *     return: '1 234,56'
				number = (number + '').replace(',', '').replace(' ', '');
				var n = !isFinite(+number) ? 0 : +number, prec = !isFinite(+decimals) ? 0
						: Math.abs(decimals), sep = (typeof thousands_sep === 'undefined') ? ','
						: thousands_sep, dec = (typeof dec_point === 'undefined') ? '.'
						: dec_point, s = '', toFixedFix = function(n, prec) {
					var k = Math.pow(10, prec);
					return '' + Math.round(n * k) / k;
				};
				// Fix for IE parseFloat(0.55).toFixed(0) = 0;
				s = (prec ? toFixedFix(n, prec) : '' + Math.round(n))
						.split('.');
				if (s[0].length > 3) {
					s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
				}
				if ((s[1] || '').length < prec) {
					s[1] = s[1] || '';
					s[1] += new Array(prec - s[1].length + 1).join('0');
				}
				return s.join(dec);
			}
			
		
			// Bar Chart Example
			var ctx = document.getElementById("myBarChart");
			var myBarChart = new Chart(
					ctx,
					{
						type : 'bar',
						data : {
							labels : [ "교통/주유", "레저/여행/항공", "마트/쇼핑", "반려동물",
									"보건/의료", "생활", "식음료", "통신" ],
							datasets : [ {
								label : "소비 금액",
								/* backgroundColor : "#4e73df", */
								backgroundColor : ["#6DC1FF", "#36b9cc", "#4e73df", "#ECD711", "#F19C1B", "#e74a3b", "#1cc88a", "#7EBE91"],
								/* backgroundColor : ["#6DC1FF", "#36b9cc", "#7462CB", "#ECD711", "#F19C1B", "#e74a3b", "#1cc88a", "#7EBE91"], */
								/* backgroundColor : ["#6DC1FF", "#B2DDFF", "#224B8B", "#ECD711", "#F19C1B", "#F17D28", "#A3D292", "#7EBE91"], */
							
								/* hoverBackgroundColor : "#2e59d9", */
								borderColor : "#4e73df",
								data : [ 0, 0, 0, 0, 0, 0, 0, 0 ],
							} ],
						},
						options : {
							maintainAspectRatio : false,
							layout : {
								padding : {
									left : 10,
									right : 25,
									top : 25,
									bottom : 0
								}
							},
							scales : {
								xAxes : [ {
									time : {
										unit : 'month'
									},
									gridLines : {
										display : false,
										drawBorder : false
									},
									ticks : {
										//maxTicksLimit : 6
										maxTicksLimit : 8,
										maxRotation: 0, // 기울기
										minRotation: 0 // 기울기
										
									},
									maxBarThickness : 25,
								} ],
								
								yAxes : [ {
									ticks : {
										//maxTicksLimit : 7,
										maxTicksLimit : 5,
										padding : 10,
										// Include a dollar sign in the ticks
										callback : function(value, index,
												values) {
											return '￦' + number_format(value);
										}
									},
									gridLines : {
										color : "rgb(234, 236, 244)",
										zeroLineColor : "rgb(234, 236, 244)",
										drawBorder : false,
										borderDash : [ 2 ],
										zeroLineBorderDash : [ 2 ]
									}
								} ],
								
							},
							legend : {
								display : false
							},
							tooltips : {
								titleMarginBottom : 10,
								titleFontColor : '#6e707e',
								titleFontSize : 14,
								backgroundColor : "rgb(255,255,255)",
								bodyFontColor : "#858796",
								borderColor : '#dddfeb',
								borderWidth : 1,
								xPadding : 15,
								yPadding : 15,
								displayColors : false,
								caretPadding : 10,
								callbacks : {
									label : function(tooltipItem, chart) {
										var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label
												|| '';
										
										return datasetLabel
												+ ': ￦'
												+ number_format(tooltipItem.yLabel);
									}
								} 
							},
						}
					});
			
			
			// Pie Chart Example
			
			//var tmpTotal = 4215 + 5312 + 6251 + 7841 + 9821 + 14984 + 8500 + 9500;
			
			var ctx = document.getElementById("myPieChart");
			var myPieChart = new Chart(
					ctx,
					{
						type : 'doughnut',
						data : {
							labels : [ "교통/주유", "레저/여행/항공", "마트/쇼핑", "반려동물", "보건/의료", "생활", "식음료", "통신" ],
							datasets : [ {
								label : "소비 비율",
								backgroundColor : [ "#6DC1FF", "#36b9cc",
										"#4e73df", "#ECD711", "#F19C1B",
										"#e74a3b", "#1cc88a", "#7EBE91" ],
								/* backgroundColor : [ '#4e73df', '#1cc88a', '#36b9cc' ], */
								/* hoverBackgroundColor : [ '#2e59d9', '#17a673', '#2c9faf' ], */
								hoverBorderColor : "rgba(234, 236, 244, 1)",
								data : [ 0, 0, 0, 0, 0, 0, 0, 0 ]
							} ],
						},
						options : {
							maintainAspectRatio : false,
							tooltips : { // 툴팁 : 차트에 hover 시 보이는 데이터
								
								backgroundColor : "rgb(255,255,255)",
								bodyFontColor : "#858796",
								borderColor : '#dddfeb',
								borderWidth : 1,
								xPadding : 15,
								yPadding : 15,
								displayColors : false,
								caretPadding : 10, 

								
							    mode: 'label',
							    
							
							
							    callbacks: {
							        label: function(tooltipItem, data) { 
							            var indice = tooltipItem.index;     
										
										var currentValue = data.datasets[0].data[indice];
										var total = data.datasets[0].data.reduce((a, b) => a + b); //화살표 이거  빨간 에러남 주석쓰는순간 사라졌네 ㅋㅋ
										var percentage = Math.floor(((currentValue / total) * 100) + 0.5);
										
										return  data.labels[indice] +': '+ percentage + '%';
							        }
							    }
			
							},
							legend : {
								//display : true,
								//position : 'bottom'
								display : false
							},

							//cutoutPercentage : 80, //도넛 굵기
							cutoutPercentage : 75
						},
					});
			
			
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
				type : 'get', // get 방식은 최초에 document.ready 했을 때 보여주는 것이고, 연도와 월을 선택하여 조회를 했을 땐 post 방식으로 보내야 함. (form 태그로 감싸야지.)
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
					
					
					
					
					let category = 'point';
					
					$.ajax({
						
						
						//@GetMapping("/mychart/{category}")
						//url : '${ pageContext.request.contextPath }/mypage/recocard/' + year + '/' + month,
						//url : '${ pageContext.request.contextPath }/mypage/recocard',
						url : '${ pageContext.request.contextPath }/mychart/' + category,
						type : 'get', 
						//async : false,
						success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 
							
							//alert('data : '   + data);
							//let test = JSON.parse(data);
							//alert('data : '   + data);
							//console.log(data);
							
							
							let list = JSON.parse(data);
							
							
					        $("#ulList").empty();
					        
				           var addListHtml ="";
				           for(i = 0; i < list[0].length; i++){
				        		 addListHtml += "<li>";
				            	 addListHtml += "<div style = \"background-color: #E8F5FF; box-shadow: 20px 20px 20px grey;\">";
				            	 addListHtml += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				            	 addListHtml += "<span style = \"vertical-align: middle; font-weight : bold; font-size: 100px; color: black;\">" + (i + 1) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				            	 addListHtml += "<span>";
				            	 
		 						if(list[0][i].substring(0,1) == '#'){
				            		 
					            	 addListHtml += "<img src=\"/hanacard-spring-mvc/resources/images/" + list[0][i].substring(1, list[0][i].length)  + ".png\" style = \"width : 132px; height : 84px;\">";
				
				            	 } else{
				            		 
					            	 addListHtml += "<img src=\"/hanacard-spring-mvc/resources/images/" + list[0][i] + ".png\" style = \"width : 132px; height : 84px;\">";
				
				            	 }
		 						
		 				    	 addListHtml += "</span>";
				            	 addListHtml += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				            	 addListHtml += "<span style =\"font-size: 30px; vertical-align: sub; color: black;\">" + list[0][i] + '&nbsp;&nbsp;&nbsp;￦' + numberWithCommas(parseInt(list[1][i])) + " 적립 혜택</span>";
				            	 addListHtml += "</div>";
				            	 addListHtml += "</li>";
				            	 addListHtml += "<br>";
				            	 
				           }
				           
				           $('#ulList').append(addListHtml);
				           
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