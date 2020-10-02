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

<style>

	.modal-backdrop {
	   background-color: rgb(0,0,0,0.1);
	}
		
</style>


<script src="/hanacard-spring-mvc/resources/js/jquery-3.3.1.min.js"></script>

<script>
	$(document).ready(function(){
		
		/* $('#start').click(function(){
			alert('hello');
			
		}) */
		
		$('#searchBtn').click(function(){
			
			getTopThree();
			
		})
		
		
		/* $('#lifeA').click(function(){
			
			alert('life');
			
		})
		
		$('#mart_shoppingA').click(function(){
			
			alert('mart_shoppingA');
			
		})
		
		$('#comm_transA').click(function(){
			
			alert('comm_transA');
			
		})
		
		$('#leisure_travle_flightA').click(function(){
			
			alert('leisure_travle_flightA');
			
		}) */
		
		
		
	});
	
	
	function getTopThree() {
		
		let category = $('#category').text();
		if(category == '생활')
			category = 'life';
		if(category == '마트/쇼핑')
			category = 'mart_shopping';
		if(category == '통신/교통')
			category = 'comm_trans';
		if(category == '레저/여행/항공')
			category = 'leisure_travle_flight';
		
			
		//alert('ajax category ==> ' + category)
			
		let year = $('#start').val().substring(2,4);
		let month = $('#start').val().substring(5, 7);		
		
		//alert('year : ' + year);
		//alert('month : ' + month);
		
		
		$.ajax({
			//url : '${ pageContext.request.contextPath }/mypage/recocard/' + year + '/' + month,
			url : '${ pageContext.request.contextPath }/chart/benefitrank/' + category + '/' + year + '/' + month,
			type : 'get', 
			//async : false,
			success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 
				
				//alert('차트 alert 성공');
				//alert('data: ' + data);
				let list = JSON.parse(data);
				//alert('list: ' + list);
				
		        $("#ulList").empty();
		        
		        
		        
	           var addListHtml ="";
	             $(list).each(function(index){
	            	 
	            	 //alert('this.cardName.substring(0,1) ===> ' + this.cardName.substring(0,1) );
	            	 
	            	 addListHtml += "<li>";
	            	 addListHtml += "<div style = \"background-color: #E8F5FF; box-shadow: 20px 20px 20px grey;\">";
	            	 addListHtml += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	            	 addListHtml += "<span style = \"vertical-align: middle; font-weight : bold; font-size: 100px; color: black;\">" + (index+1) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	            	 addListHtml += "<span>";
	            	 
	            	 
	            	 
	            	 if(this.cardName.substring(0,1) == '#'){
	            		 
		            	 addListHtml += "<img src=\"/hanacard-spring-mvc/resources/images/" + this.cardName.substring(1, this.cardName.length)  + ".png\" style = \"width : 132px; height : 84px;\">";

	            	 } else{
	            		 
		            	 addListHtml += "<img src=\"/hanacard-spring-mvc/resources/images/" + this.cardName + ".png\" style = \"width : 132px; height : 84px;\">";

	            	 }
	            	 
	            	 addListHtml += "</span>";
	            	 addListHtml += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	            	 addListHtml += "<span style =\"font-size: 30px; vertical-align: sub; color: black;\">" + this.cardName + "</span>";
	            	 addListHtml += "</div>";
	            	 addListHtml += "</li>";
	            	 addListHtml += "<br>";
	            	 
	            	 /* addListHtml += this.cardName.substring(0,1);
	            	 addListHtml += this.cardName;
	            	 addListHtml += this.count; */
	            	 
	             })
	             
		        $('#ulList').append(addListHtml); // 또는 반복문 끝나고 append

		        
		        //이 이후에 다시 ul태그 내에 forEach 돌면서 li태그 추가해야 함.

			},
			error : function() {
				
				alert('차트 ajax 실패')
				
			}
		})
		
	}
	
	
	function doChangeCondition(obj){
		
		//alert('함수호출이 가능합니다.');
		//alert('obj => ' + obj);
		//$('#category').text();
		$('#category').text(obj);
		
		
		getTopThree();
		
		
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
						<h2 class="mb-0">하나차트</h2>
						<p>혜택별로 손님들이 선호하는 카드를 살펴보세요.</p>
						<%-- <p>${loginVO.name}님을 위한 차트입니다.</p> --%>
					</div>
				</div>
			</div>
		</div>

		<%-- 페이지 소개 시작 --%>
		<div class="custom-breadcrumns border-bottom">
			<div class="container">
				<a href="index.html">Home</a> <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span>하나차트</span> <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span class="current">인기혜택별순위</span>			
			</div>
		</div>
		<%-- 페이지 소개 끝 --%>


		<%-- 본문 코드 시작 : 대시보드 전체를 담고있는 컨테이너 --%>
		<!-- Begin Page Content -->
		<div class="container" align="center">
		<!-- <div class="container"> -->
			<br>
			<br>
			<div>
				<!-- <div style = "display: table-cell; vertical-align: middle;">
					<h1 class="m-0 font-weight-bold text-primary" style="display:inline;">마트/쇼핑 혜택 TOP3</h1>
					이 문서내에 id가 exampleMoal인 것을 참조
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">조건 변경</button>
				</div> -->
										
				<h1 id = "category" class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;">생활</h1>
				<h1 class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;"> 혜택 TOP3</h1>
				<button style = "vertical-align: super;" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">조건 변경</button>
				
				
				<div style = "vertical-align: high;">
				<!-- <div style = "margin-bottom: auto;"> -->
					<!-- 이 문서내에 id가 exampleMoal인 것을 참조 -->
				</div>
				
				
				<!-- <select class="form-control form-control-lg">
					<option>Large select</option>
				</select> -->
				
				<!-- <div align="center">
				<div align="center">
					<select style = "width: 200px;" class="form-control form-control-md"> lg, md, sm
						<option>2020년 9월</option>
						<option>2020년 8월</option>
						<option>2020년 7월</option>
					</select>
				</div> -->
				
				<!-- <input type="month"> -->
				
				<div>
					<input type="month" id="start" name="start" min="2018-01" value="2020-09">
					<button id = "searchBtn">조회</button>
				</div>
				
				<!-- <input type="datetime-local"> -->
				
			</div>

			<!-- Button trigger modal -->
			<!-- 이 문서내에 id가 exampleMoal인 것을 참조 -->
			<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">타사 카드 거래내역 연동</button> -->

			<!-- Modal (1)-->
			<!-- ID가 exampleModal 인 것을 참조 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">

						<!-- 이건 단순 이동이라 form 태그 필요없다. 수정 go -->
						<form name="mform">
							<%-- <form action="${ pageContext.request.contextPath }/mypage/update" method="post"> --%>
							<%-- <form action = "${ pageContext.request.contextPath }/mypage" method = "post"> --%>
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">인기 혜택별 순위</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<!-- X표시를 눌러도 dismiss(닫기) 되도록 -->
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<!-- Material unchecked -->
								
								<!-- <p>인기 혜택별 순위</p> -->
								<!-- <div class="form-check">
									<a href = "#" data-dismiss="modal">마트/쇼핑</a>
								</div> -->
								
								<!-- <p><a href = "#" data-dismiss="modal">마트/쇼핑</a></p>
								<p><a href = "#" data-dismiss="modal">교통/주유</a></p>
								<p><a href = "#" data-dismiss="modal">레저/여행/항공</a></p>
								<p><a href = "#" data-dismiss="modal">반려동물</a></p>
								<p><a href = "#" data-dismiss="modal">보건/의료</a></p>
								<p><a href = "#" data-dismiss="modal">생활</a></p>
								<p><a href = "#" data-dismiss="modal">식음료</a></p>
								<p><a href = "#" data-dismiss="modal">통신</a></p> -->
								
								
								<!-- <div><a href = "#" data-dismiss="modal">마트/쇼핑</a></div>
								<div><a href = "#" data-dismiss="modal">교통/주유</a></div>
								<div><a href = "#" data-dismiss="modal">레저/여행/항공</a></div>
								<div><a href = "#" data-dismiss="modal">반려동물</a></div>
								<div><a href = "#" data-dismiss="modal">보건/의료</a></div>
								<div><a href = "#" data-dismiss="modal">생활</a></div>
								<div><a href = "#" data-dismiss="modal">식음료</a></div>
								<div><a href = "#" data-dismiss="modal">통신</a></div> -->
								
								<!-- a태그는 .click 안먹히네 그냥 아래 onclick 하자.
								
								<div><a class = "categoryA" id = "lifeA" href = "#" data-dismiss="modal" >생활</a></div>
								<div><a class = "categoryA" id = "mart_shoppingA" href = "#" data-dismiss="modal" >마트/쇼핑</a></div>
								<div><a class = "categoryA" id = "comm_transA" href = "#" data-dismiss="modal" >통신/교통</a></div> 
								<div><a class = "categoryA" id = "leisure_travle_flightA" href = "#" data-dismiss="modal" >레저/여행/항공</a></div>  -->
								
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('생활')">생활</a></div>
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('마트/쇼핑')">마트/쇼핑</a></div>
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('통신/교통')">통신/교통</a></div> 
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('레저/여행/항공')">레저/여행/항공</a></div>  
								
								<!-- <div><button data-dismiss="modal">생활</button></div>
								<div><button data-dismiss="modal">마트/쇼핑</button></div>
								<div><button data-dismiss="modal">통신/교통</button></div> 
								<div><button data-dismiss="modal">레저/여행/항공</button></div> -->
								
								
							</div>
							
							<!-- <div class="modal-footer">
								<button type="button" class="btn btn-primary" id="modalBtn">연동하기</button>
								<button type="button" class="btn btn-primary" data-dismiss="modal" id = "modalBtn">연동하기</button>
								dismiss : 해산. 즉 버튼을 누르면 모달창을 닫음
								<button type="submit" class="btn btn-primary" id = "modalBtn">연동하기</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
								dismiss : 해산. 즉 닫는다.
								<button type="button" class="btn btn-primary">Save changes</button>
							</div> -->
							
						</form>
					</div>
				</div>
			</div>
			

			<div align="left">
			<!-- <div> -->
			<!-- <div align="left" style = "border-left:1px solid lightgrey;"> -->
			<!-- <div align="left" style = "border:1px solid gold;"> -->
				<%-- ${hanaList} --%>
				<hr size = "5">
				<ul id = "ulList" type = "none"> 
					
					<%-- <c:forEach items = "${cardList}" var ="card"> --%>
					<c:forEach items = "${benefitSortList}" var ="top" varStatus="loop">
						<li>
							<div style = "background-color: #E8F5FF; box-shadow: 20px 20px 20px grey;">
							<!-- <div style = "background-color: #E8F5FF;"> -->
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span style = "vertical-align: middle; font-weight : bold; font-size: 100px; color: black;">${loop.count}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span>
								<!-- <span style = "middlevertical-align: middle"> -->
								<!-- <span style = "display: table-cell; vertical-align: middlevertical-align: middle"> -->
									
									<c:choose>
									<%-- 	<c:when test="${ fn:substring(top.cardName, 0, 1) == # }">
											<img src="/hanacard-spring-mvc/resources/images/${ fn:substring(top.cardName, 1, fn:length(top.cardName)) }.png" style = "width : 132px; height : 84px;">
										</c:when> --%>
										<c:when test="${ fn:substring(top.cardName, 0, 1) == '#' }">
											<img src="/hanacard-spring-mvc/resources/images/${ fn:substring(top.cardName, 1, fn:length(top.cardName)) }.png" style = "width : 132px; height : 84px;">
										</c:when>
										
										<%-- <c:when test="${ fn:substring(top.cardName, 0, 1) eq '#' }">
											<img src="/hanacard-spring-mvc/resources/images/${ fn:substring(top.cardName, 1, fn:length(top.cardName)) }.png" style = "width : 132px; height : 84px;">
										</c:when> --%>
										
										<c:otherwise>
											<img src="/hanacard-spring-mvc/resources/images/${ top.cardName }.png" style = "width : 132px; height : 84px;">
										</c:otherwise>
									</c:choose>
									
									<%-- <img src="/hanacard-spring-mvc/resources/images/${ top.cardName }.png" style = "width : 132px; height : 84px;"> --%>
								</span>
								<%-- <img src="/hanacard-spring-mvc/resources/images/${ card.cardProductName }.png" style = "width : 132px; height : 84px;"> --%>
								<%-- <li><img src="/hanacard-spring-mvc/resources/images/${ card }.png" style = "width : 268px; height : 168px;"> --%>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<span style ="font-size: 30px; vertical-align: sub; color: black;">${ top.cardName }</span>
								<%-- <span style ="font-size: 30px; vertical-align: bottom;">${ card.cardProductName }</span> --%>
								<%-- <span>${ card.cardNum }</span>
								<span>${ card.regDate }</span> --%>
							</div>
						</li>
						<br>
					</c:forEach>
					
				</ul>
			</div>
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


		<script>
		
		/*
		$.ajax({
			//url : '${ pageContext.request.contextPath }/mypage/recocard/' + year + '/' + month,
			url : '${ pageContext.request.contextPath }/chart/benefitrank/life',
			type : 'get', 
			//async : false,
			success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 
				
				alert('차트 alert 성공');
				alert('data: ' + data);
	
			},
			error : function() {
				
				alert('차트 ajax 실패')
			}
		})
		*/

		
		</script>






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