<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


	$(document).ready(function() {
		
		alert('jquery 테스트'); // 맨 밑의 slim 버전 때문에 안됐었음. 주석처리하여 해결(jquery-3.5.1.slim.min.js)
		
		getTopCurrentYear(); // (로그인 전제, JAVA단 인터셉터 추가 필요) 문서 로딩 후 현재년도 버전으로 연소비개요 그래프를 보여준다.
		getBottomCurrentYear(); // (로그인 전제, JAVA단 인터셉터 추가 필요) 문서 로딩 후 현재년도 버전으로 소비패턴 그래프를 보여준다. (도넛차트, 막대그래프)
		
	})
	
	
	function getTopCurrentYear(){
		
		//alert('getTopCurrentYear()');
		
		$.ajax({
			url : '${ pageContext.request.contextPath }/mypage/topcurrent',
			type : 'get', // get 방식은 최초에 document.ready 했을 때 보여주는 것이고, 연도와 월을 선택하여 조회를 했을 땐 post 방식으로 보내야 함. (form 태그로 감싸야지.)
			success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 

				alert('ajax 성공');
				//alert(data);
				// console.log('하하하하');

				console.log(data);
				let list = JSON.parse(data);
				console.log(list);

				alert(list.jan);

				//myLineChart.data.datasets[0].data = [ 0, 552, 30, 120, 10, 20000, 45, 440, 50, 70, 4504, 578 ];
				myLineChart.data.datasets[0].data = [ list.jan, list.feb,
						list.mar, list.apr, list.may, list.jun, list.jul,
						list.aug, list.sept, list.oct, list.nov, list.dec ]

				myLineChart.update();

				//$('#replyList').empty();
				// jQuery 삭제
				// remove : 셀렉터까지 지운다.
				//empty : 셀렉터는 두고, 자식들만 지움

				// $('#replyList').html('');

				/*
				$(list).each(function(){
				   console.log(this)
				   let str='';
				   str += '<hr>'
				   str += '<div>'
				   str+= '<strong>'+this.content+'</strong>';
				   str+= '  ('+ this.writer +')';
				   str+= '  '+ this.regDate;
				   str+= '  '+ '<button class = "delBtn" id ='  + this.no + '>삭제</button>'
				   str += '</div>'
				   $('#replyList').append(str);
				})
				 */

			},
			error : function() {
				
				alert('ajax 실패')
				
			}
		})
	}
	
	
	function getBottomCurrentYear(){
		alert('getBottomCurrentYear()');
	}
	

	function getTopSpecific() {

		alert('getTopSpecific()')

		$.ajax({
			url : '${ pageContext.request.contextPath }/mypage/topspecific',
			type : 'get', // get 방식은 최초에 document.ready 했을 때 보여주는 것이고, 연도와 월을 선택하여 조회를 했을 땐 post 방식으로 보내야 함. (form 태그로 감싸야지.)
			success : function(data) { // data의 type : string --> json으로 바꾸자  ::  이용~ 

				alert('ajax 성공');
				//alert(data);
				// console.log('하하하하');

				console.log(data);
				let list = JSON.parse(data);
				console.log(list);

				alert(list.jan);

				//myLineChart.data.datasets[0].data = [ 0, 552, 30, 120, 10, 20000, 45, 440, 50, 70, 4504, 578 ];
				myLineChart.data.datasets[0].data = [ list.jan, list.feb,
						list.mar, list.apr, list.may, list.jun, list.jul,
						list.aug, list.sept, list.oct, list.nov, list.dec ]

				myLineChart.update();

				//$('#replyList').empty();
				// jQuery 삭제
				// remove : 셀렉터까지 지운다.
				//empty : 셀렉터는 두고, 자식들만 지움

				// $('#replyList').html('');

				/*
				$(list).each(function(){
				   console.log(this)
				   let str='';
				   str += '<hr>'
				   str += '<div>'
				   str+= '<strong>'+this.content+'</strong>';
				   str+= '  ('+ this.writer +')';
				   str+= '  '+ this.regDate;
				   str+= '  '+ '<button class = "delBtn" id ='  + this.no + '>삭제</button>'
				   str += '</div>'
				   $('#replyList').append(str);
				})
				 */

			},
			error : function() {
				
				alert('ajax 실패')
				
			}
		})
	};

	function getBottomSpecific() {
		
		alert('getBottomSpecific()');
		
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


			<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4 mt-5">
				<h2 class="h3 mb-0 text-gray-800">종합 대시보드</h2>
				<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
			</div>

			<%-- 첫번째 로우 시작 : 4개의 작은 카드 --%>
			<!-- Content Row -->
			<div class="row">

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-primary shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Earnings (Monthly)</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-calendar fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-success shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-success text-uppercase mb-1">Earnings (Annual)</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
								</div>
								<div class="col-auto">
									<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
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
				</div>

				<!-- Pending Requests Card Example -->
				<div class="col-xl-3 col-md-6 mb-4">
					<!-- col-md-6(열-디바이스크기-열크기) margin top , margin bottom , -->
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
				</div>
			</div>
			<%-- 첫번째 로우 끝 : 4개의 작은 카드 --%>


			<%-- 소비 개요 버튼 시작 --%>
			<div class="d-sm-flex align-items-center justify-content-end mb-4 mt-5">
				<!-- Example single danger button -->
				<!-- <div class="btn-group">
				  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    Year
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="#">2020년</a>
				    <a class="dropdown-item active" href="#">2020년</a>
				    <a class="dropdown-item" href="#">2019년</a>
				    <a class="dropdown-item" href="#">2018년</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Separated link</a>
				  </div>
				</div>  -->

				<select class="selectpicker" data-style="btn-success">
					<!-- <select class="selectpicker" multiple data-max-options="2"> -->
					<option>2020년</option>
					<option>2019년</option>
					<option>2018년</option>
				</select>
				&nbsp;&nbsp;&nbsp;

				<!-- <select class="selectpicker" data-style="btn-success">
			  <select class="selectpicker" multiple data-max-options="2">
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
			  </select>&nbsp;&nbsp;&nbsp; -->
				<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="getTopSpecific()">
					<i class="fas fa-download fa-sm text-white-50"></i> 조회
				</button>
				<!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> 조회</a> -->

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
							<h6 class="m-0 font-weight-bold text-primary">${ year }년소비개요</h6>




							<!-- <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div> -->


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
				<!-- <div class="btn-group">
				  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    Year
				  </button>
				  <div class="dropdown-menu">
				    <a class="dropdown-item" href="#">2020년</a>
				    <a class="dropdown-item active" href="#">2020년</a>
				    <a class="dropdown-item" href="#">2019년</a>
				    <a class="dropdown-item" href="#">2018년</a>
				    <div class="dropdown-divider"></div>
				    <a class="dropdown-item" href="#">Separated link</a>
				  </div>
				</div>  -->

				<select class="selectpicker" data-style="btn-success">
					<!-- <select class="selectpicker" multiple data-max-options="2"> -->
					<option>2020년</option>
					<option>2019년</option>
					<option>2018년</option>
				</select>
				&nbsp;&nbsp;&nbsp;
				<select class="selectpicker" data-style="btn-success">
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
				<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="getBottomSpecific()">
					<i class="fas fa-download fa-sm text-white-50"></i> 조회
				</button>
				<!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> 조회</a> -->

			</div>
			<%-- 소비 패턴 버튼 끝 --%>


			<%-- 세번째 로우 시작 : 소비 패턴 그래프  --%>
			<div class="row">
				<!-- Pie Chart -->
				<div class="col-xl-4 col-lg-5">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
							<div class="dropdown no-arrow">
								<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
									<div class="dropdown-header">Dropdown Header:</div>
									<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="chart-pie pt-4 pb-2">
								<canvas id="myPieChart" class="chartjs-render-monitor" style="display: block; width: 281px; height: 245px;"></canvas>
							</div>
							<div class="mt-4 text-center small">
								<span class="mr-2"> <i class="fas fa-circle text-primary"></i> Direct
								</span> <span class="mr-2"> <i class="fas fa-circle text-success"></i> Social
								</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i> Referral
								</span>
							</div>
						</div>
					</div>
				</div>
				<!-- Pie Chart ends -->

				<!-- Bar Chart -->
				<div class="col-xl-8 col-lg-7">

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
						</div>
						<div class="card-body">
							<div class="chart-bar">
								<canvas id="myBarChart" width="281" height="245" class="chartjs-render-monitor" style="display: block; width: 281px; height: 245px;"></canvas>
							</div>

							<!-- <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i>
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i>
                    </span>
                  </div> -->

						</div>
					</div>
				</div>
				<!-- Bar Chart ends -->

			</div>
			<%-- 세번째 로우 끝 : 소비 패턴  그래프 --%>


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
					labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
							"Aug", "Sep", "Oct", "Nov", "Dec" ],
					datasets : [ {
						label : "Earnings",
						/* lineTension : 0.3,
						backgroundColor : "rgba(78, 115, 223, 0.05)",
						borderColor : "rgba(78, 115, 223, 1)",
						pointRadius : 3,
						pointBackgroundColor : "rgba(78, 115, 223, 1)",
						pointBorderColor : "rgba(78, 115, 223, 1)",
						pointHoverRadius : 3,
						pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
						pointHoverBorderColor : "rgba(78, 115, 223, 1)",
						pointHitRadius : 10,
						pointBorderWidth : 2, */
						data : [ 0, 10000, 5000, 15000, 10000, 20000, 15000,
								25000, 20000, 30000, 25000, 40000 ],
					} ],
				}
			/* ,
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
													maxTicksLimit : 7
												}
											} ],
											yAxes : [ {
												ticks : {
													maxTicksLimit : 5,
													padding : 10,
													// Include a dollar sign in the ticks
													callback : function(value, index,
															values) {
														return '$' + number_format(value);
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
															+ ': $'
															+ number_format(tooltipItem.yLabel);
												}
											}
										}
									}  */
			});
		</script>


		<!-- Bootstrap core JavaScript-->
		<script src="/hanacard-spring-mvc/resources/vendor/jquery/jquery.min.js"></script>
		<script src="/hanacard-spring-mvc/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="/hanacard-spring-mvc/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="/hanacard-spring-mvc/resources/js/sb-admin-2.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="/hanacard-spring-mvc/resources/js/demo/chart-area-demo.js"></script>
		<script src="/hanacard-spring-mvc/resources/js/demo/chart-pie-demo.js"></script>
		<script src="/hanacard-spring-mvc/resources/js/demo/chart-bar-demo.js"></script>

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