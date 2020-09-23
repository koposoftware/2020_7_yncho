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
		if(category == '전 연령')
			category = 'all';
		if(category == '20대')
			category = '20';
		if(category == '30대')
			category = '30';
		if(category == '40대')
			category = '40';
		if(category == '50대')
			category = '50';
		if(category == '60대 이상')
			category = '60';
			
			
		let year = $('#start').val().substring(2,4);
		let month = $('#start').val().substring(5, 7);		
		
		
		$.ajax({
			//url : '${ pageContext.request.contextPath }/mypage/recocard/' + year + '/' + month,
			url : '${ pageContext.request.contextPath }/chart/agerank/' + category + '/' + year + '/' + month,
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
		
		alert('함수호출이 가능합니다.');
		alert('obj => ' + obj);
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
						<p>연령대별로 손님들이 선호하는 카드를 살펴보세요.</p>
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
				<span class="current">연령대별순위</span>					
			</div>
		</div>
		<%-- 페이지 소개 끝 --%>


		<%-- 본문 코드 시작 : 대시보드 전체를 담고있는 컨테이너 --%>
		<!-- Begin Page Content -->
		<div class="container" align="center">
			<br>
			<div>
				<h1 id = "category" class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;">전 연령</h1>
				<h1 class="m-0 font-weight-bold text-primary" style="display:inline; vertical-align: sub;"> TOP3</h1>
				<button style = "vertical-align: super;" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">조건 변경</button>
				
				<div>
					<input type="month" id="start" name="start" min="2018-01" value="2020-09">
					<button id = "searchBtn">조회</button>
				</div>
				
			</div>

			<!-- Modal (1)-->
			<!-- ID가 exampleModal 인 것을 참조 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">

						<!-- 이건 단순 이동이라 form 태그 필요없다. 수정 go -->
						<form name="mform">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">연령대별 순위</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<!-- X표시를 눌러도 dismiss(닫기) 되도록 -->
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('전 연령')">전 연령</a></div>
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('20대')">20대</a></div>
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('30대')">30대</a></div> 
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('40대')">40대</a></div>  
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('50대')">50대</a></div>  
								<div><a href = "#" data-dismiss="modal" onclick ="doChangeCondition('60대 이상')">60대 이상</a></div>  
							</div>
						</form>
					</div>
				</div>
			</div>
			

			<div align="left">
				<hr size = "5">
				<ul id = "ulList" type = "none"> 
					
					<%-- <c:forEach items = "${cardList}" var ="card"> --%>
					<c:forEach items = "${ageSortList}" var ="top" varStatus="loop">
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