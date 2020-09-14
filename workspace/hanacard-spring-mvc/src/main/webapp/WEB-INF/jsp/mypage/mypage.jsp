<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<script type="text/javascript">

	
	$(document).ready(function(){
		$('#topBtn').click(function(){
		
			getTopSpecific();
			
		})
		
		$('#bottomBtn').click(function(){

			// 소비패턴 조회 버튼을 누르면 실행되어야 하는 함수들
			
			getBottomSpecific();
			getRecoCard(); // 추천카드 갱신하는 ajax 실행 함수
			
		})
		
		$('#modalBtn').click(function(){
	
			alert('하하 모달입니다.')
			doReflect();
			
		}) 
		
	})


	function getTopSpecific() {

		//alert('getTopSpecific()');
		let year = $('#topYear').val().substring(0,4);
		//alert(year);

		$.ajax({
			url : '${ pageContext.request.contextPath }/mypage/topspecific/' + year,
			type : 'get', // get 방식은 최초에 document.ready 했을 때 보여주는 것이고, 연도와 월을 선택하여 조회를 했을 땐 post 방식으로 보내야 함. (form 태그로 감싸야지.)
			success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 

				//console.log(data);
				let list = JSON.parse(data);
				//console.log(list);

				myLineChart.data.datasets[0].data = [ list.jan, list.feb,
						list.mar, list.apr, list.may, list.jun, list.jul,
						list.aug, list.sept, list.oct, list.nov, list.dec ]

				//alert('ajax 새로고침이 update 떄문인가 => 아님.')
				myLineChart.update();

			},
			error : function() {
				
				alert('ajax 실패')
				
			}
		})
	};

	
	/* function getBottomCurrentYear(){
		alert('getBottomCurrentYear()');
	} */
	
	
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
		
		//alert(year);
		//alert(month);

		$.ajax({
			url : '${ pageContext.request.contextPath }/mypage/bottomspecific/' + year + '/' + month,
			type : 'get', // get 방식은 최초에 document.ready 했을 때 보여주는 것이고, 연도와 월을 선택하여 조회를 했을 땐 post 방식으로 보내야 함. (form 태그로 감싸야지.)
			async : false,
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
 
				
 				/* myBarChart.data.datasets[0].data = [list.trans_gas, list.leisure_travel_flight, list.mart_shopping, list.pet, list.health_medical,
					list.life, list.food_beverage, list.communication];
			
				myPieChart.data.datasets[0].data = [list.trans_gas, list.leisure_travel_flight, list.mart_shopping, list.pet, list.health_medical,
					list.life, list.food_beverage, list.communication];   */
				
					
					
				/* var tmpTotal = list.trans_gas + list.communication + list.mart_shopping + list.pet + list.health_medical + 
								list.life + list.food_beverage + list.leisure_travel_flight */
				
				/* myPieChart.options.tooltips.callbacks.label = function(tooltipItem, data) { 
														            var indice = tooltipItem.index;     
														            
														            //추가 코드
														            var dataset = myPieChart.data.datasets[tooltipItem.datasetIndex];
														            var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
																		return previousValue + currentValue;
																	});
														            
																	var currentValue = dataset.data[tooltipItem.index];
																	var percentage = Math.floor(((currentValue / total) * 100) + 0.5);
														            //추가코드
																	
																	return  data.labels[indice] +': '+data.datasets[0].data[indice] + '';
																	//return  data.labels[indice] +': '+ percentage + '%';
														        }   */
					
				    /* callbacks: {
				        label: function(tooltipItem, data) { 
				            var indice = tooltipItem.index;     
				            
				            //추가 코드
				            var dataset = data.datasets[tooltipItem.datasetIndex];
				            var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
								return previousValue + currentValue;
							});
				            
							var currentValue = dataset.data[tooltipItem.index];
							var percentage = Math.floor(((currentValue / total) * 100) + 0.5);
				            //추가코드
							
							//return  data.labels[indice] +': '+data.datasets[0].data[indice] + '';
							return  data.labels[indice] +': '+ percentage + '%';
				        }
				    } */
				
				
				
				myBarChart.update();
				myPieChart.update();

			},
			error : function() {
				
				alert('ajax 실패')
				
			}
		})
		
	};
	
	
	function doReflect(){
		alert('해 DB에 반영하고, 화면의 그래프 함수를 호출하여 (새로고침 없이) 연동된 정보로 그래프를 그립니다.');
		
		var list = [];
		list.push('hello');
		
		var chn = 'Y';
		if($("input:checkbox[id='csh']").is(":checked") == true){
			list.push('csh');
			csh = 'Y'
		}else{
			csh = 'N'
		}
		if($("input:checkbox[id='css']").is(":checked") == true){
			css = 'Y'
		}else{
			css = 'N'
		}
		if($("input:checkbox[id='chd']").is(":checked") == true){
			chd = 'Y'
		}else{
			chd = 'N'
		}
		if($("input:checkbox[id='ckm']").is(":checked") == true){
			ckm = 'Y'
			list.push('ckm');

		}else{
			ckm = 'N'
		}
		if($("input:checkbox[id='clt']").is(":checked") == true){
			clt = 'Y'
		}else{
			clt = 'N'
		}
		if($("input:checkbox[id='cwr']").is(":checked") == true){
			cwr = 'Y'
		}else{
			cwr = 'N'
		}
		if($("input:checkbox[id='cbc']").is(":checked") == true){
			cbc = 'Y'
		}else{
			cbc = 'N'
		}
		if($("input:checkbox[id='cct']").is(":checked") == true){
			cct = 'Y'
		}else{
			cct = 'N'
		}
		if($("input:checkbox[id='cnh']").is(":checked") == true){
			cnh = 'Y'
		}else{
			cnh = 'N'
		}
		if($("input:checkbox[id='cshb']").is(":checked") == true){
			cshb = 'Y'
		}else{
			cshb = 'N'
		}
		if($("input:checkbox[id='ckjb']").is(":checked") == true){
			ckjb = 'Y'
		}else{
			ckjb = 'N'
		}
		if($("input:checkbox[id='cjbb']").is(":checked") == true){
			cjbb = 'Y'
		}else{
			cjbb = 'N'
		}
		if($("input:checkbox[id='cjjb']").is(":checked") == true){
			cjjb = 'Y'
		}else{
			cjjb = 'N'
		}
		
		
		alert('list : ' + list);
		$.ajax({
			url : '${ pageContext.request.contextPath }/mypage/update',
			type : 'get', // get 방식은 최초에 document.ready 했을 때 보여주는 것이고, 연도와 월을 선택하여 조회를 했을 땐 post 방식으로 보내야 함. (form 태그로 감싸야지.)
			data : {
				chn : chn,
				csh : csh,
				css : css,
				chd : chd,
				ckm : ckm,
				clt : clt,
				cwr : cwr,
				cbc : cbc,
				cct : cct,
				cnh : cnh,
				cshb : cshb,
				ckjb : ckjb,
				cjbb : cjbb,
				cjjb : cjjb
				
			},
			success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 

				alert('ajax 성공');
			
				getTopSpecific();
				getBottomSpecific();
				

			},
			error : function() {
				
				alert('ajax 실패')
				
			}
		})
		
		
		
	} 
	
	
	function getRecoCard(){
		// 소비패턴 조회할 때마다 카드추천 ajax 실행되어야 함.

		alert('getRecoCard()')
		
		
		let year = $('#bottomYear').val().substring(0,4);
		let month = $('#bottomMonth').val();
		
		if(month == '전체'){
			month = 'all';
		} else{
			month = $('#bottomMonth').val().slice(0,-1); //끝문자부터 자르기
			if(month.length == 1)
				month = '0' + month;
		}
		
		
		//alert(year);
		//alert(month);

		$.ajax({
			//url : '${ pageContext.request.contextPath }/mypage/recocard/' + year + '/' + month,
			url : '${ pageContext.request.contextPath }/mypage/recocard',
			type : 'get', 
			async : false,
			success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 

				// data는 2차원 스트링 배열이 온다. 
				// String[][]
				
				let test = JSON.parse(data);
				
				//console.log(test);
				//console.log(test[0]);
				//console.log(test[0][0]);
				console.log(test[0][0]);
				console.log(test[1][0]);
				
				/*
				console.log(test[1][1]);
				
				console.log(data);
				console.log(data[0][0]);
				console.log(data[0][1]);
				console.log(data[1][0]);
				console.log(data[1][1]);
				*/
	
				let value = test[0][0];
				value = parseInt(value);
				let cardname = test[1][0];
				let first = cardname.substring(0, 1);
				
				//alert(value);
				//alert(cardname);
				//alert(first);
				//alert(cardname.length);
				
				if(first == '#'){
					cardname = cardname.substring(1, cardname.length)
				}
				
				//alert('변경된 카드이름 ' + cardname)
				//$('#recocard').text(data);
				
				let attr = $('#recocardImage').attr('src');
				let path = '/hanacard-spring-mvc/resources/images/';
				path = path + cardname + '.png';
				$('#recocardImage').attr('src', path);
				
				alert('추천카드 성공')
				
				$('#recocardTitle').text(test[1][0]); //#tag1 카드인 경우 # 그대로 표현하기위해
				$('#recocardText').html('소비를 통합하시면, \n' + value + '(원)의 혜택을 누리실 수 있어요!');
				//$('#recocardText').text('소비를 통합하시면, \n' + value + '(원)의 혜택을 누리실 수 있어요!');
				
				
				//alert(path);
				
				//alert(path); // /hanacard-spring-mvc/resources/images/#tag1카드 Orange.png
				//$('#recocardImage').attr('src', path);
				//$('#recocardImage').attr('src', '/hanacard-spring-mvc/resources/images/tag1카드 Orange.png');
				//$('#recocardImage').attr('src', '/hanacard-spring-mvc/resources/images/1Q My Cafe.png');
				//$('#recocardImage').attr('src', '/hanacard-spring-mvc/resources/images/#tag1카드 Orange.png');
				
				//$('#recocardImage').attr('src','/material/images/jQuery/asimo.png');
				//alert(attr);
				//#recocardImage
				//#recocardText
		

			},
			error : function() {
				
				alert('ajax 실패')
				
			}
		})
		
		
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
			<br>
			<!-- <div class="container-fluid"> -->


			<!-- Page Heading -->
			
			<!-- <div class="d-sm-flex align-items-center justify-content-between mb-4 mt-5">
				<h2 class="h3 mb-0 text-gray-800">종합 대시보드</h2>
				<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
			</div> -->

			<%-- 첫번째 로우 시작 : 4개의 작은 카드 --%>

			<!-- Content Row -->
			<div class="row">
			<!-- <div class="d-sm-flex align-items-center justify-content-between mb-12 mt-12" style ="width : 100%"> -->
			
				<!-- <div class="card" style="width: 18rem; height:18rem;">
					<img class="card-img-top" src="..." alt="Card image cap">
					<div class="card-body">
						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					</div>
				</div> -->
				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-4 col-lg-4" style = "height : 320px;" >
				<!-- <div class="col-xl-4 col-lg-4" style = "height : 300px;" > -->
				<!-- <div class="col-xl-3 col-md-6 mb-4"> -->
				<!-- col-md-6(열-디바이스크기-열크기) margin top , margin bottom , -->
					<div class="card border-left-primary shadow h-100">
					<!-- <div class="card border-left-primary shadow h-100 py-1"> -->
					<!-- <div class="card border-left-primary shadow h-100 py-2">   py-2 : 카드 상단 여백-->
					
						<!-- <div class="card-header">
							<span class="h5 mb-0 font-weight-bold text-gray-800">보유 카드</span>
							<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">보유 카드</span>
						</div> -->

						<div class ="card-header">
							<div class="h4 text-xs font-weight-bold text-primary text-uppercase mb-1">보유 카드</div> 
						</div>
						
						<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
							
									<div class="carousel-item active">
										<a  href = "${ pageContext.request.contextPath }/mypage/owncard"><img class="d-block w-100" src="/hanacard-spring-mvc/resources/images/${hanaList[0]}.png" alt="slide" style ="height: 180px;"></a>
										<%-- <img class="d-block w-100" src="/hanacard-spring-mvc/resources/images/${hanaList[0]}.png" alt="slide" style ="height: 200px;"> --%>
										<div style = "text-align: center;">${hanaList[0]}</div>
									</div>
								<c:forEach items = "${hanaList}" var ="card" varStatus = "vs" begin = "1">
									<div class="carousel-item">
										<a  href = "${ pageContext.request.contextPath }/mypage/owncard"><img class="d-block w-100" src="/hanacard-spring-mvc/resources/images/${card}.png" alt="slide" style ="height: 180px;"></a>
										<%-- <img class="d-block w-100" src="/hanacard-spring-mvc/resources/images/${hanaList[0]}.png" alt="slide" style ="height: 200px;"> --%>
										<div style = "text-align: center;">${card}</div>
									</div>
								</c:forEach>
								<%-- <div class="carousel-item active">
									<a  href = "${ pageContext.request.contextPath }/mypage/owncard"><img class="d-block w-100" src="/hanacard-spring-mvc/resources/images/${hanaList[0]}.png" alt="slide" style ="height: 180px;"></a>
									<img class="d-block w-100" src="/hanacard-spring-mvc/resources/images/${hanaList[0]}.png" alt="slide" style ="height: 200px;">
									<div style = "text-align: center;">${hanaList[0]}</div>
								</div>
								<div class="carousel-item">
									<!-- <img class="d-block w-100" src="..." alt="Second slide"> -->
									<img class="d-block w-100" src="/hanacard-spring-mvc/resources/images/${hanaList[1]}.png" alt="slide" style ="height: 180px;">
									<img class="d-block w-100" src="/hanacard-spring-mvc/resources/images/${hanaList[1]}.png" alt="slide" style ="height: 200px;">
									<div style = "text-align: center;"><a href = "${ pageContext.request.contextPath }/mypage/owncard">${hanaList[1]}</a></div>
								</div> --%>
								<!-- <div class="carousel-item">
									<img class="d-block w-100" src="..." alt="Third slide">
								</div> -->
							</div>
							<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>

						<%--보유카드 중 첫번째 카드의 이미지를 보여준다. --%>
						<%-- <a href = "${ pageContext.request.contextPath }/mypage"> </a> --%>
						<%-- <img class="card-img-top" src="/hanacard-spring-mvc/resources/images/${hanaList[0]}.png" alt="Card image cap" style="height: 100%; width: 100%; object-fit: contain"> --%> 
						<!-- <img class="card-img-top" src="/hanacard-spring-mvc/resources/images/1Q Daily+.png" alt="Card image cap" style="height: 100%; width: 100%; object-fit: contain"> --> 
						<!-- <img class="card-img-top" src="/hanacard-spring-mvc/resources/images/1Q Daily+.png" alt="Card image cap">  -->
						<!-- <img src="/hanacard-spring-mvc/resources/images/hanacard_logo_down.png" alt="Image" class="img-fluid"> -->
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
								<!-- <div class="col mr-2"> -->
									<!-- <span class="text-xs font-weight-bold text-primary text-uppercase mb-1">보유 카드</span> -->
									<!-- <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">보유 카드</div> -->
									<%-- <span> <a href = "${ pageContext.request.contextPath }/mypage">개인카드  ${hanaList.size()}개</a></span> --%>
									<%-- <c:forEach var = "item" items = "${ hanaList }">
										good~~ <span>${ item }</span>
									</c:forEach> --%>
									
									<%-- <span><a href = "${ pageContext.request.contextPath }/mypage">개인카드  ${hanaList.size()}개</a></span> --%>
									
									<!-- <div class="h5 mb-0 font-weight-bold text-gray-800">개인카드</div> -->
									<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">보유 카드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
									<span class="text-xs font-weight-normal text-primary text-uppercase mb-1"> <a href = "${ pageContext.request.contextPath }/mypage/owncard">개인카드 <span class="badge badge-dark">${hanaList.size()}</span></a></span>
									<span class="text-xs font-weight-normal text-primary text-uppercase mb-1"> <a href = "${ pageContext.request.contextPath }/mypage/owncard">가족카드 <span class="badge badge-dark">0</span></a></span>
								</div>
								<!-- <div class="col-auto">
									<i class="fas fa-calendar fa-2x text-gray-300"></i>
								</div>  -->
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-4 col-lg-4" style = "height : 320px;">
				<!-- <div class="col-xl-4 col-lg-4" style = "height : 300px;"> -->
				<!-- <div class="col-xl-3 col-md-6 mb-4"> -->
					<div class="card border-left-success shadow h-100 ">
					<!-- <div class="card border-left-success shadow h-100 py-2"> py : 카드 상단 여백! -->
					
						<div class ="card-header">
							<div class="h4 text-xs font-weight-bold text-primary text-uppercase mb-1">결제 예정 금액</div> 
						</div>
					
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<!-- <div class="h4 text-xs font-weight-bold text-primary text-uppercase mb-1">결제 예정 금액</div>  -->
									<!-- <div class="h4 text-xs font-weight-bold text-success text-uppercase mb-1">결제 예정 금액</div>  -->
									<!-- <div class="h4 text-xs font-weight-bold text-dark text-uppercase mb-1">결제 예정 금액</div> -->
									<br>
									<br>
									<br>
									<br>
									<div style = "text-align: right">
										<span class="h1 mb-0 font-weight-bold text-gray-800">${mypageVO.sept}</span>
										<%-- <span class="h1 mb-0 font-weight-bold text-gray-800 justify-content-end" >${mypageVO.sept}</span> --%>
										<span class="h3 mb-0 font-weight-bold text-gray-800 justify-content-end">원</span>
										<!-- <span class="h3 mb-0 font-weight-bold text-gray-800" style = "float : right">원</span> -->
									</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xl-4 col-lg-4" style = "height : 320px;">
				<!-- <div class="col-xl-3 col-md-6 mb-4"> -->
					<div class="card border-left-success shadow h-100 py">
					<!-- <div class="card border-left-success shadow h-100 py-2"> -->
						<div class="card-header">
							<div class="h4 text-xs font-weight-bold text-primary text-uppercase mb-1">개인 정보</div> 
						</div>
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<%-- <div class= "h4 text-xs font-weight-bold text-primary text-uppercase mb-1">결제 예정 금액</div>
									<!-- <div class= "h3 text-xs font-weight-bold text-success text-uppercase mb-1">결제 예정 금액</div> -->
									<div class="h5 mb-0 font-weight-bold text-gray-800">${mypageVO.sept}</div> --%>
									
									<div>
										<span>연락처</span>&nbsp;&nbsp;&nbsp; ${loginVO.phone}
									</div>
									<div>
										<span>이메일</span>&nbsp;&nbsp;&nbsp; ${loginVO.email}
									</div>
									<div>
										<button type="button" class="btn btn-light btn-sm">개인정보 변경</button> 
										<button type="button" class="btn btn-light btn-sm">마케팅 수신동의 변경</button>
									</div>
									<hr>
								</div>
								<div class="col-auto">
									<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<!-- <div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-info shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
									<div class="row no-gutters align-items-center">
										<div class="col-auto">
											<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
										</div>
										<div class="col">
											<div class="progress progress-sm mr-2">
												<div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div> -->

				<!-- Pending Requests Card Example -->
				<!-- <div class="col-xl-3 col-md-6 mb-4">
					col-md-6(열-디바이스크기-열크기) margin top , margin bottom ,
					<div class="card border-left-warning shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Requests</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-comments fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div> -->
			<!-- </div> -->
			</div>
			<%-- 첫번째 로우 끝 : 4개의 작은 카드 --%>

			<%-- 소비 개요 버튼 시작 --%>
			<div class="d-sm-flex align-items-center justify-content-between mb-4 mt-5">
			<!-- <div class="d-sm-flex align-items-center justify-content-end mb-4 mt-5"> -->
			
				<!-- Button trigger modal -->										<!-- 이 문서내에 id가 exampleMoal인 것을 참조 -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">타사 카드 거래내역 연동</button>
	
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
						
							<form name = "mform">
							<%-- <form action="${ pageContext.request.contextPath }/mypage/update" method="post"> --%>
							<%-- <form action = "${ pageContext.request.contextPath }/mypage" method = "post"> --%> 
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">타사 카드 거래내역 연동</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <!-- X표시를 눌러도 dismiss(닫기) 되도록 -->
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<!-- Material unchecked -->
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="csh" name ="card" value = "csh">
									    <label class="form-check-label" for="materialUnchecked">신한카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="css" name ="card" value = "css">
									    <label class="form-check-label" for="materialUnchecked">삼성카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="chd" name ="card" value = "chd">
									    <label class="form-check-label" for="materialUnchecked">현대카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="ckm" name ="card" value = "ckm">
									    <label class="form-check-label" for="materialUnchecked">국민카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="clt" name ="card" value = "clt">
									    <label class="form-check-label" for="materialUnchecked">롯데카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="cwr" name ="card" value = "cwr">
									    <label class="form-check-label" for="materialUnchecked">우리카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="cbc" name ="card" value = "cbc">
									    <label class="form-check-label" for="materialUnchecked">비씨카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="cct" name ="card" value = "cct">
									    <label class="form-check-label" for="materialUnchecked">씨티카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="cnh" name ="card" value = "cnh">
									    <label class="form-check-label" for="materialUnchecked">농협카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="cshb" name ="card" value = "cshb">
									    <label class="form-check-label" for="materialUnchecked">수협은행카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="ckjb" name ="card" value = "ckjb">
									    <label class="form-check-label" for="materialUnchecked">광주은행카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="cjbb" name ="card" value = "cjbb">
									    <label class="form-check-label" for="materialUnchecked">전북은행카드</label>
									</div>
									<div class="form-check">
									    <input type="checkbox" class="form-check-input" id="cjjb" name ="card" value = "cjjb">
									    <label class="form-check-label" for="materialUnchecked">제주은행카드</label>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" id = "modalBtn">연동하기</button>
									<!-- <button type="submit" class="btn btn-primary" id = "modalBtn">연동하기</button> -->
									<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> <!-- dismiss : 해산. 즉 닫는다. -->
									<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<div>
					<select class="selectpicker" data-style="btn-success" id ="topYear">
						<!-- <select class="selectpicker" multiple data-max-options="2"> -->
						<option>2020년</option>
						<option>2019년</option>
						<option>2018년</option>
					</select>
					&nbsp;&nbsp;
					<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id = "topBtn" style = "float :right;"> 
					<!-- <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="getTopSpecific()">  -->
						<i class="fas fa-download fa-sm text-white-50"></i> 조회
					</button>
					<!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> 조회</a> -->
				</div>
			</div>
			<%-- 소비 개요 버튼 끝 --%>
		

			<%-- 두번째 로우 시작 : 소비 개요 그래프 --%>
			<!-- Content Row -->
			<div class="row">

				<!-- Area Chart -->
				<div class="col-xl-12 col-lg-12">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">연간 소비 개요</h6>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-area">
								<canvas id="myAreaChart" style="display: block; width: 629px; height: 320px;" width="629" height="320" class="chartjs-render-monitor"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!-- Area Chart ends -->
			</div>
			<%-- 두번째 로우 끝 : 소비 개요 그래프 --%>



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
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">영역별 소비 금액</h6>
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

			<div class="d-sm-flex align-items-center justify-content-between mb-4 mt-5">
				<h2 class="h3 mb-0 text-gray-800">소비패턴 기반 추천 카드</h2>
				<!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
			</div>

			<div class="card" style="width: 18rem;">

				<div class="card-header">
					<div class="h4 text-xs font-weight-bold text-primary text-uppercase mb-1">소비패턴 기반 추천</div>
				</div>
				<img id = "recocardImage" class="card-img-top" src="/hanacard-spring-mvc/resources/images/1Q Special+.png" alt="Card image cap"> <!-- 286 x 180 오..자동으로 리사이징 된다. -->
				<div class="card-body">
					<h5 class="card-title" id = "recocardTitle">Card title</h5>
					<p class="card-text" id ="recocardText">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">카드 보러가기</a>
				</div>
			</div>

			<%-- 네번째 로우 시작 : Projects --%>
			<!-- Content Row -->
			<div class="row">

				<!-- Content Column -->
				<div class="col-lg-6 mb-4">

					<!-- Project Card Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
						</div>
						<div class="card-body">
							<h4 class="small font-weight-bold">
								Server Migration <span class="float-right">20%</span>
							</h4>
							<div class="progress mb-4">
								<div class="progress-bar bg-danger" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h4 class="small font-weight-bold">
								Sales Tracking <span class="float-right">40%</span>
							</h4>
							<div class="progress mb-4">
								<div class="progress-bar bg-warning" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h4 class="small font-weight-bold">
								Customer Database <span class="float-right">60%</span>
							</h4>
							<div class="progress mb-4">
								<div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h4 class="small font-weight-bold">
								Payout Details <span class="float-right">80%</span>
							</h4>
							<div class="progress mb-4">
								<div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<h4 class="small font-weight-bold">
								Account Setup <span class="float-right">Complete!</span>
							</h4>
							<div class="progress">
								<div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>

					<!-- Color System -->
					<div class="row">
						<div class="col-lg-6 mb-4">
							<div class="card bg-primary text-white shadow">
								<div class="card-body">
									Primary
									<div class="text-white-50 small">#4e73df</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-success text-white shadow">
								<div class="card-body">
									Success
									<div class="text-white-50 small">#1cc88a</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-info text-white shadow">
								<div class="card-body">
									Info
									<div class="text-white-50 small">#36b9cc</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-warning text-white shadow">
								<div class="card-body">
									Warning
									<div class="text-white-50 small">#f6c23e</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-danger text-white shadow">
								<div class="card-body">
									Danger
									<div class="text-white-50 small">#e74a3b</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-secondary text-white shadow">
								<div class="card-body">
									Secondary
									<div class="text-white-50 small">#858796</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-light text-black shadow">
								<div class="card-body">
									Light
									<div class="text-black-50 small">#f8f9fc</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 mb-4">
							<div class="card bg-dark text-white shadow">
								<div class="card-body">
									Dark
									<div class="text-white-50 small">#5a5c69</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="col-lg-6 mb-4">

					<!-- Illustrations -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
						</div>
						<div class="card-body">
							<div class="text-center">
								<img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="/hanacard-spring-mvc/resources/images/undraw_posting_photo.svg" alt="">
							</div>
							<p>
								Add some quality, svg illustrations to your project courtesy of <a target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a constantly updated collection of beautiful svg images that you can use completely free and without attribution!
							</p>
							<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on unDraw &rarr;</a>
						</div>
					</div>

					<!-- Approach -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
						</div>
						<div class="card-body">
							<p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce CSS bloat and poor page performance. Custom CSS classes are used to create custom components and custom utility classes.</p>
							<p class="mb-0">Before working with this theme, you should become familiar with the Bootstrap framework, especially the utility classes.</p>
						</div>
					</div>

				</div>
			</div>
			<%-- 네번째 로우 끝 : Projects --%>

		</div>
		<%-- 본문 코드 끝 : 대시보드 전체를 담고있는 컨테이너 --%>
		

		<!-- Page level plugins -->
		<script src="/hanacard-spring-mvc/resources/vendor/chart.js/Chart.min.js"></script>

		<script>
			//Area Chart Example

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

			var ctx = document.getElementById("myAreaChart");
			
			var myLineChart = new Chart(ctx, {
					type : 'line',
					data : {
						labels : [ "1월", "2월", "3월", "4월", "5월",
								"6월", "7월", "8월", "9월", "10월", "11월",
								"12월" ],
						/* labels : [ "Jan", "Feb", "Mar", "Apr", "May",
								"Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
								"Dec" ], */
						datasets : [ {
							label : "소비 금액",
							lineTension : 0.3,
							backgroundColor : "rgba(78, 115, 223, 0.05)",
							borderColor : "rgba(78, 115, 223, 1)",
							pointRadius : 3,
							pointBackgroundColor : "rgba(78, 115, 223, 1)",
							pointBorderColor : "rgba(78, 115, 223, 1)",
							pointHoverRadius : 3,
							pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
							pointHoverBorderColor : "rgba(78, 115, 223, 1)",
							pointHitRadius : 10,
							pointBorderWidth : 2,
							data : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
							/* data : [ 0, 10000, 5000, 15000, 10000, 20000,
									15000, 25000, 20000, 30000, 25000,
									40000 ] */
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
									unit : 'date'
								},
								gridLines : {
									display : false,
									drawBorder : false
								},
								ticks : {
									//maxTicksLimit : 12
									maxTicksLimit : 6
								}
							} ],
							yAxes : [ {
								ticks : {
									maxTicksLimit : 7,
									//maxTicksLimit : 5,
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
							backgroundColor : "rgb(255,255,255)",
							bodyFontColor : "#858796",
							titleMarginBottom : 10,
							titleFontColor : '#6e707e',
							titleFontSize : 14,
							borderColor : '#dddfeb',
							borderWidth : 1,
							xPadding : 15,
							yPadding : 15,
							displayColors : false,
							intersect : false,
							mode : 'index',
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
						}
					}
			});
			
		 	$.ajax({
				url : '${ pageContext.request.contextPath }/mypage/topcurrent',
				type : 'get', 
				success : function(data) { 

					//console.log(data);
					let list = JSON.parse(data);
					//console.log(list);

					//alert(list.jan);

					myLineChart.data.datasets[0].data = [ list.jan, list.feb,
							list.mar, list.apr, list.may, list.jun, list.jul,
							list.aug, list.sept, list.oct, list.nov, list.dec ]

					
					myLineChart.update();

				},
				error : function() {
					
					alert('ajax 실패')
					
				}
			})  
			
			

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
							/* 	yAxes : [ {
									ticks : {
										min : 0,
										max : 15000,
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
								} ], */
								
								
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
							            
							            //추가 코드 시작
							            
							            // 아..array에 undefinde로 들어오는구나.으로 들어오는구나.
							          /*   var dataset = data.datasets[tooltipItem.datasetIndex];
							            var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
											return previousValue + currentValue;
										}); */
							            
							            //alert('total : ' + total);
							            
										/* var currentValue = dataset.data[tooltipItem.index];
										var percentage = Math.floor(((currentValue / total) * 100) + 0.5);  */
										
										var currentValue = data.datasets[0].data[indice];
										var total = data.datasets[0].data.reduce((a, b) => a + b);
										var percentage = Math.floor(((currentValue / total) * 100) + 0.5);
										
										//alert('data.datasets[0].data : ' + data.datasets[0].data); 
							            //alert('currentValue : ' + currentValue);
							            //alert('total : ' + total);
							            //alert('percentage : ' + percentage);
							         
							            //추가코드 끝
										
										//return  data.labels[indice] +': '+data.datasets[0].data[indice] + '';
										return  data.labels[indice] +': '+ percentage + '%';
							        }
							    }
							
							    /* callbacks: {
							        label: function(tooltipItem, data) { 
							            var indice = tooltipItem.index;     
							            
							            //추가 코드
							            var dataset = data.datasets[tooltipItem.datasetIndex];
							            var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
											return previousValue + currentValue;
										});
							            
										var currentValue = dataset.data[tooltipItem.index];
										var percentage = Math.floor(((currentValue / total) * 100) + 0.5);
							            //추가코드
										
										//return  data.labels[indice] +': '+data.datasets[0].data[indice] + '';
										return  data.labels[indice] +': '+ percentage + '%';
							        }
							    } */
								
			
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
				async : false,
				success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 

					console.log('ajax===========시작')
					console.log(data);
					let list = JSON.parse(data);
					console.log(list);
					console.log('ajax===========끝')
					
					
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
					
					
					
					
					//alert('list : ' + list);
					/* myBarChart.data.datasets[0].data = [list.trans_gas, list.leisure_travel_flight, list.mart_shopping, list.pet, list.health_medical,
						list.life, list.food_beverage, list.communication];
				
					myPieChart.data.datasets[0].data = [list.trans_gas, list.leisure_travel_flight, list.mart_shopping, list.pet, list.health_medical,
						list.life, list.food_beverage, list.communication];  */
					 
					
					
					/* myBarChart.options.tooltips.callbacks.label = function(tooltipItem, chart) {
																		var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
																  return datasetLabel + ': ￦' + number_format(tooltipItem.yLabel);
																} */
					
					myBarChart.update();
					myPieChart.update();

				},
				error : function() {
					
					alert('ajax 실패')
					
				}
			})
			
			
			// javascript 에서 el 사용하기   <c:out value='${loginVO}'/>
			
			/* if("${ not empty loginVO }"){
				alert('good'); */
			
			
			if("${loginVO.csh}" == 'Y')
				$("input:checkbox[id='csh']").prop("checked", true);
			
			if("${loginVO.css}" == "Y")
				$("input:checkbox[id='css']").prop("checked", true);
				
			if("${loginVO.chd}" == "Y")
				$("input:checkbox[id='chd']").prop("checked", true);
				
			if("${loginVO.ckm}" == 'Y')
				$("input:checkbox[id='ckm']").prop("checked", true);
				
			if("${loginVO.clt}" == 'Y')
				$("input:checkbox[id='clt']").prop("checked", true);
				
			if("${loginVO.cwr}" == 'Y')
				$("input:checkbox[id='cwr']").prop("checked", true);
			
			if("${loginVO.cbc}" == 'Y')
				$("input:checkbox[id='cbc']").prop("checked", true);
			
			if("${loginVO.cct}" == 'Y')
				$("input:checkbox[id='cct']").prop("checked", true);
			
			if("${loginVO.cnh}" == 'Y')
				$("input:checkbox[id='cnh']").prop("checked", true);
			
			if("${loginVO.cshb}" == 'Y')
				$("input:checkbox[id='cshb']").prop("checked", true);
			
			if("${loginVO.ckjb}" == 'Y')
				$("input:checkbox[id='ckjb']").prop("checked", true);
			
			if("${loginVO.cjbb}" == 'Y')
				$("input:checkbox[id='cjbb']").prop("checked", true);
			
			if("${loginVO.cjjb}" == 'Y')
				$("input:checkbox[id='cjjb']").prop("checked", true);
			
			
			/* mypage/owncard로 포워딩만 해주기 때문에 ajax 필요없다.
			
			$.ajax({
				url : '${ pageContext.request.contextPath }/mypage/owncard',
				type : 'get', // get 방식은 최초에 document.ready 했을 때 보여주는 것이고, 연도와 월을 선택하여 조회를 했을 땐 post 방식으로 보내야 함. (form 태그로 감싸야지.)
				success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 

					alert('ajax 성공')
					//alert(data);
             
				},
				error : function() {
					
					alert('ajax 실패')
					
				}
			})
			*/
			
			
			$.ajax({
				//url : '${ pageContext.request.contextPath }/mypage/recocard/' + year + '/' + month,
				url : '${ pageContext.request.contextPath }/mypage/recocard',
				type : 'get', 
				async : false,
				success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 

					// data는 2차원 스트링 배열이 온다. 
					// String[][]
					
					let test = JSON.parse(data);
					
					console.log(test[0][0]);
					console.log(test[1][0]);
		
					let value = test[0][0];
					value = parseInt(value);
					let cardname = test[1][0];
					let first = cardname.substring(0, 1);
					
					if(first == '#'){
						cardname = cardname.substring(1, cardname.length)
					}
					
					//alert('변경된 카드이름 ' + cardname)
					//$('#recocard').text(data);
					
					let attr = $('#recocardImage').attr('src');
					let path = '/hanacard-spring-mvc/resources/images/';
					path = path + cardname + '.png';
					$('#recocardImage').attr('src', path);
					
					alert('추천카드 성공')
					
					$('#recocardTitle').text(test[1][0]); //#tag1 카드인 경우 # 그대로 표현하기위해
					$('#recocardText').html('소비를 통합하시면, \n' + value + '(원)의 혜택을 누리실 수 있어요!');
					//$('#recocardText').text('소비를 통합하시면, \n' + value + '(원)의 혜택을 누리실 수 있어요!');
			
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