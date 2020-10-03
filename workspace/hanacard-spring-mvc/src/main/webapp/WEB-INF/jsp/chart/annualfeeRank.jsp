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
		
		
		$('#searchBtn').click(function(){
			
			getTopThree();
			
		})
		
		
	});
	
	
	function getTopThree() {
		
		let category = $('#category').text();
		if(category == '연회비 1만원 미만 TOP Chart')
			category = 'from0';
		if(category == '연회비 1만원 이상 ~ 2만원 미만 TOP Chart')
			category = 'from1';
		if(category == '연회비 2만원 이상 TOP Chart')
			category = 'from2';
			
		//let year = $('#start').val().substring(2,4);
		//let month = $('#start').val().substring(5, 7);		
		
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
			//url : '${ pageContext.request.contextPath }/mypage/recocard/' + year + '/' + month,
			url : '${ pageContext.request.contextPath }/chart/annualfeerank/' + category + '/' + year + '/' + month,
			type : 'get', 
			//async : false,
			success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 
				
				//alert('연령별 alert 성공');
				//alert('data: ' + data);
				let list = JSON.parse(data);
				//alert('list: ' + list);
				
				
		        $("#topImg").empty();
		        $("#topName").empty();
		        
		        
		        var addTopImg ="";
		        addTopImg += "<br>";
			   	 if(list[0].cardName.substring(0,1) == '#'){
			   		addTopImg += "<img src=\"/hanacard-spring-mvc/resources/images/" + list[0].cardName.substring(1, list[0].cardName.length)  + ".png\" style = \"width : 198px; height : 126px;\">";
	        	 } else{
	        		 addTopImg += "<img src=\"/hanacard-spring-mvc/resources/images/" + list[0].cardName + ".png\" style = \"width : 198px; height : 126px;\">";
	        	 }		        
			   	 
		        var addTopName ="";
		        addTopName += "<div id=\"topName\" align=\"left\" style = \"width : 360px; font-size: 30px; color: #696969; font-family: HanaM; display: inline-block; float : left;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + list[0].cardName + "</div>";
		        
		        
		        $('#topImg').append(addTopImg); 
		        $('#topName').append(addTopName); 
				
				
				
		        $("#ulList").empty();
	           var addListHtml ="";
	             $(list).each(function(index){
	            	 
	            	 //alert('this.cardName.substring(0,1) ===> ' + this.cardName.substring(0,1) );
	            	 
	            	 addListHtml += "<li>";
	            	 addListHtml += "<div style = \"background-color: #E8F5FF; box-shadow: 20px 20px 20px grey;\">";
	            	 addListHtml += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	            	 addListHtml += "<span style = \"vertical-align: middle; font-weight : bold; font-size: 100px; color: #696969;\">" + (index+1) + "</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	            	 addListHtml += "<span>";
	            	 
	            	 
	            	 
	            	 if(this.cardName.substring(0,1) == '#'){
	            		 
		            	 addListHtml += "<img src=\"/hanacard-spring-mvc/resources/images/" + this.cardName.substring(1, this.cardName.length)  + ".png\" style = \"width : 132px; height : 84px;\">";
	
	            	 } else{
	            		 
		            	 addListHtml += "<img src=\"/hanacard-spring-mvc/resources/images/" + this.cardName + ".png\" style = \"width : 132px; height : 84px;\">";
	
	            	 }
	            	 
	            	 addListHtml += "</span>";
	            	 addListHtml += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	            	 addListHtml += "<span style =\"font-size: 30px; vertical-align: sub; color: #696969;\">" + this.cardName + "</span>";
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
						<%-- <p>${loginVO.name}님을 위한 차트입니다.</p> --%>
						<p>연회비별로 손님들이 선호하는 카드를 살펴보세요.</p>
					</div>
				</div>
			</div>
		</div>

		<%-- 페이지 소개 시작 --%>
		<div class="custom-breadcrumns border-bottom">
			<div class="container">
				<a href="index.html">Home</a> <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span>하나차트</span> <span class="mx-3 icon-keyboard_arrow_right"></span> 
				<span class="current">연회비별순위</span>
			</div>
		</div>
		<%-- 페이지 소개 끝 --%>


		<%-- 본문 코드 시작 : 대시보드 전체를 담고있는 컨테이너 --%>
		<!-- Begin Page Content -->
		<div class="container" align="center">
			<br>
			<br>
			<div>
				<h1 id = "category" class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub; border-bottom:  8px solid #57c4d0;">연회비 1만원 미만 TOP Chart</h1>
				<!-- <h1 class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;">연회비 </h1>
				<h1 id = "category" class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;">1만원 미만</h1>
				<h1 class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;"> TOP3</h1> --> 
				<!-- <button style = "vertical-align: super;" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">조건 변경</button> -->
				<button style = "vertical-align: sub;" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#exampleModal">조건 변경</button>
				<!-- <button style = "vertical-align: sub;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#exampleModal">조건 변경</button> -->
				
				<!-- <div>
					<input type="month" id="start" name="start" min="2018-01" value="2020-10" style ="font-size: 20px;">
					<button id = "searchBtn">조회</button>
				</div> -->
				
				<%-- 소비 패턴 버튼 시작 --%>
				<div class="d-sm-flex align-items-center justify-content-end mb-4 mt-5">
					<!-- Example single danger button -->
	
					<select class="selectpicker" data-style="btn-success" id="bottomYear" style ="font-family: sans-serif;">
						<!-- <select class="selectpicker" multiple data-max-options="2"> -->
						<option>2020년</option>
						<option>2019년</option>
						<option>2018년</option>
					</select>
					&nbsp;&nbsp;&nbsp;
					<select class="selectpicker" data-style="btn-success" id="bottomMonth" style ="font-family: sans-serif;">
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
					<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" id="searchBtn">
					<!-- <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="getBottomSpecific()"> -->
						<i class="fas fa-download fa-sm text-white-50"></i> 조회
					</button>
					<!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> 조회</a> -->
	
				</div>
				<%-- 소비 패턴 버튼 끝 --%>
				
				
				<%-- Top1 이미지 시작 --%>
				<div style = "height : 350px; vertical-align: middle; background-image: url('/hanacard-spring-mvc/resources/images/cardback2.jpg');">
					<div>
						<br>
						<br>
						<br>
						<div align="center" style = "width : 400px; font-weight : bold; font-size: 120px; color: #293250; font-family: HanaM; display: inline-block; float: left;">TOP 1</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div id="topImg" align="center" style ="width : 170px; vertical-align: middle; display: inline-block; float : left;">
							<c:choose>
								<c:when test="${ fn:substring(annualfeeSortList[0].cardName, 0, 1) == '#'  }">
									<br>
									<img src="/hanacard-spring-mvc/resources/images/${ fn:substring(annualfeeSortList[0].cardName, 1, fn:length(annualfeeSortList[0].cardName)) }.png" style = "width : 198px; height : 126px;">
								</c:when>
								<c:otherwise>
									<br>
									<img src="/hanacard-spring-mvc/resources/images/${ annualfeeSortList[0].cardName }.png" style = "width : 198px; height : 126px;">
								</c:otherwise>
							</c:choose>
						</div>
						<br>
						<br>
						<div id="topName" align="left" style = "width : 360px; font-size: 30px; color: #696969; font-family: HanaM; display: inline-block; float : left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${annualfeeSortList[0].cardName}</div>
					</div>
					
					<!-- <div>
						<button>&nbsp;&nbsp;&nbsp;카드 보러가기&nbsp;&nbsp;&nbsp;</button>
					</div> -->
					
									
				</div>
				<%-- Top1 이미지 끝 --%>
				
				
				
				
			</div>

			<!-- Modal (1)-->
			<!-- ID가 exampleModal 인 것을 참조 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">

						<!-- 이건 단순 이동이라 form 태그 필요없다. 수정 go -->
						<form name="mform">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">연회비별 순위</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<!-- X표시를 눌러도 dismiss(닫기) 되도록 -->
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('연회비 1만원 미만 TOP Chart')">1만원 미만</a></div>
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('연회비 1만원 이상 ~ 2만원 미만 TOP Chart')">1만원 이상 ~ 2만원 미만</a></div>
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('연회비 2만원 이상 TOP Chart')">2만원 이상</a></div> 
							</div>
						</form>
					</div>
				</div>
			</div>
			

			<div align="left">
				<hr size = "5">
				<ul id = "ulList" type = "none"> 
					
					<%-- <c:forEach items = "${cardList}" var ="card"> --%>
					<c:forEach items = "${annualfeeSortList}" var ="top" varStatus="loop">
						<li>
							<div style = "background-color: #E8F5FF; box-shadow: 20px 20px 20px grey;">
							<!-- <div style = "background-color: #E8F5FF;"> -->
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span style = "vertical-align: middle; font-weight : bold; font-size: 100px; color: #696969;">${loop.count}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
								<span style ="font-size: 30px; vertical-align: sub; color: #696969;">${ top.cardName }</span>
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