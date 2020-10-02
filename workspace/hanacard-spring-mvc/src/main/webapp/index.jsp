<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>   

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
    
  <!-- <style>
  	body { font-family: 'Times New Roman', Times, Arial, Helvetica, sans-serif; }
  </style> -->
  
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>


    <div class="py-2 bg-light">
    <!-- <div class="py-2 bg-light" style = "font-family: HanaUL; font-size: 20px;"> -->
    <!-- <div class="py-2 bg-light"> -->
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-9 d-none d-lg-block">
            <!-- <a href="#" class="small mr-3"><span class="icon-question-circle-o mr-2"></span> Have a questions?</a> 
            <a href="#" class="small mr-3"><span class="icon-phone2 mr-2"></span> 10 20 123 456</a> 
            <a href="#" class="small mr-3"><span class="icon-envelope-o mr-2"></span> info@mydomain.com</a>  -->
          </div>
          <div class="col-lg-3 text-right">
          
          	<c:choose>
          		<c:when test="${ empty loginVO }">
		            <a href = "${ pageContext.request.contextPath }/login" class="small mr-3"><span class="icon-unlock-alt"></span> 로그인</a>
		            <a href="register.html" class="small btn btn-primary px-4 py-2 rounded-0"><span class="icon-users"></span> 회원가입</a>
          		</c:when>
          		<c:otherwise>
          			<span class="small mr-3">${loginVO.name}님</span>
		            <a href = "${ pageContext.request.contextPath }/logout" class="small mr-3"><span class="icon-unlock-alt"></span> 로그아웃</a>
          		</c:otherwise>
          	</c:choose>
          </div>
        </div>
      </div>
    </div>
    
    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">
    <!-- <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner" style = "font-family: HanaL; font-size: 22px;"> -->
    <!-- <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner"> -->

      <div class="container">
        <div class="d-flex align-items-center">
          <div class="site-logo">
            <a href="${ pageContext.request.contextPath }/index.jsp" class="d-block">
              <img src="/hanacard-spring-mvc/resources/images/hanacard_logo_down3.png" alt="Image" class="img-fluid">
              <!-- <img src="/hanacard-spring-mvc/resources/images/hanacard_logo_down.png" alt="Image" class="img-fluid"> -->
            </a>
          </div>
          <div class="mr-auto">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li class="has-children">
                <!-- <li class="active"> -->
                  <a href = "${ pageContext.request.contextPath }/mypage" class="nav-link text-left">마이페이지</a>
                  <ul class="dropdown">
                  <!-- <ul class="dropdown" style = "font-family: HanaL; font-size: 50px;"> -->
                  <!-- <ul class="dropdown"> -->
                    <li><a href="${ pageContext.request.contextPath }/mypage">종합 대시보드</a></li>
                    <li><a href="${ pageContext.request.contextPath }/mypage/owncard">보유카드정보</a></li>
                    <%-- <li><a href="${ pageContext.request.contextPath }/mypage/transaction">카드이용내역</a></li> --%>
                  </ul>
                </li>
                <li class="has-children">
                  <a href="${ pageContext.request.contextPath }/mychart" class="nav-link text-left">나만의차트</a>
                  <ul class="dropdown">
                    <!-- <li><a href="teachers.html">카드타입별순위</a></li> -->
                    <li><a href="${ pageContext.request.contextPath }/mychart/totalRank">통합순위</a></li>
                    <li><a href="${ pageContext.request.contextPath }/mychart/discountRank">할인순위</a></li>
                    <li><a href="${ pageContext.request.contextPath }/mychart/pointRank">적립순위</a></li>
                    <li><a href="${ pageContext.request.contextPath }/mychart/mileRank">마일리지순위</a></li>
                    <!-- <li><a href="about.html">전월실적별순위</a></li> -->
                  </ul>
                </li>
                <li class="has-children">
                  <a href="${ pageContext.request.contextPath }/chart" class="nav-link text-left">하나차트</a>
                  <!-- <a href="about.html" class="nav-link text-left">나만의 차트</a> -->
                  <ul class="dropdown">
                    <!-- <li><a href="teachers.html">카드타입별순위</a></li> -->
                    <li><a href="${ pageContext.request.contextPath }/chart/benefitRank">인기혜택별순위</a></li>
                    <li><a href="${ pageContext.request.contextPath }/chart/ageRank">연령대별순위</a></li>
                    <li><a href="${ pageContext.request.contextPath }/chart/annualfeeRank">연회비별순위</a></li>
                    <li><a href="${ pageContext.request.contextPath }/chart/typeRank">카드타입별순위</a></li>
                    <%-- <li><a href="${ pageContext.request.contextPath }/chart/performRank">전월실적별순위</a></li> --%>
                    <!-- <li><a href="about.html">전월실적별순위</a></li> -->
                  </ul>
                </li>
                
                <li>
                <!-- <li class="has-children"> -->
                  <a href="${ pageContext.request.contextPath }/search" class="nav-link text-left">검색/비교</a>
                  <!-- <ul class="dropdown">
                    <li><a href="teachers.html">조건별검색</a></li>
                    <li><a href="about.html">키워드검색</a></li>
                    <li><a href="about.html">개인화추천</a></li>
                  </ul> -->
                </li>
                
                <!-- <li>
                  <a href="admissions.html" class="nav-link text-left">검색/비교</a>
                </li> -->
                <li>
                  <a href="${ pageContext.request.contextPath }/board" class="nav-link text-left">고객센터</a>
                </li>
                <!-- <li>
                    <a href="contact.html" class="nav-link text-left">Contact</a>
                  </li> -->
              </ul>                                                                                                                                                                                                                                                                                          </ul>
            </nav>

          </div>
          <div class="ml-auto">
            <div class="social-wrap">
              <a href="https://www.facebook.com/hanacard"><span class="icon-facebook"></span></a>
              <!-- <a href="#"><span class="icon-twitter"></span></a>
              <a href="#"><span class="icon-linkedin"></span></a> -->
              <a href="https://www.instagram.com/global_must_have/"><span class="icon-instagram"></span></a>
              <a href="https://www.youtube.com/channel/UCsnlgvmpylLeDhxPQvUcMCA"><span class="icon-youtube"></span></a>

              <a href="#" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                class="icon-menu h3"></span></a>
            </div>
          </div>
         
        </div>
      </div>

    </header>

    
    <div class="hero-slide owl-carousel site-blocks-cover">
      <div class="intro-section" style="background-image: url('/hanacard-spring-mvc/resources/images/hero_1.jpg');">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-12 mx-auto text-center" data-aos="fade-up">
              <!-- <h1>Smart Life를 선도하는 Smart 금융 </h1> -->
              <!-- <h1>Smart Life</h1>
              <h1>Smart Finance</h1> -->
              <h1>SMART LIFE</h1>
              <h1>SMART FINANCE</h1>
              <!-- <h3>Smart Life를 선도하는 Smart 금융 </h3> -->
              <!-- <h5>INNOVATOR by KEB Hana Card</h5> -->
            </div>
          </div>
        </div>
      </div>

      <div class="intro-section" style="background-image: url('/hanacard-spring-mvc/resources/images/hero_1.jpg');">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-12 mx-auto text-center" data-aos="fade-up">
              <h1>INNOVATOR by</h1>
              <h1>Hana Card</h1>
            
              <!-- <h1>고객님과 함께 하나카드의 새로운 도전을 시작합니다.</h1> -->
              <!-- <h1>INNOVATOR by KEB Hana Card</h1> -->
            </div>
          </div>
        </div>
      </div>

    </div>
    


    <!-- <div class="site-section">
      <div class="container">
        <div class="row mb-5 justify-content-center text-center">
          <div class="col-lg-4 mb-5">
            <h2 class="section-title-underline mb-5">
              <span>전체 BEST 3 CARD</span>
              <span>Why Academics Works</span>
            </h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">

            <div class="feature-1 border">
              <div class="icon-wrapper bg-primary">
                <span class="flaticon-mortarboard text-white"></span>
                <span style ="color: white; font-size: 40px;">1</span>
              </div>
              <div class="feature-1-content">
                <h2>Personalize Learning</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit morbi hendrerit elit</p>
                <p><a href="#" class="btn btn-primary px-4 rounded-0">Learn More</a></p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
            <div class="feature-1 border">
              <div class="icon-wrapper bg-primary">
                <span class="flaticon-school-material text-white"></span>
                <span style ="color: white; font-size: 40px;">2</span>
              </div>
              <div class="feature-1-content">
                <h2>Trusted Courses</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit morbi hendrerit elit</p>
                <p><a href="#" class="btn btn-primary px-4 rounded-0">Learn More</a></p>
              </div>
            </div> 
          </div>
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
            <div class="feature-1 border">
              <div class="icon-wrapper bg-primary">
                <span class="flaticon-library text-white"></span>
                <span style ="color: white; font-size: 40px;">3</span>
              </div>
              <div class="feature-1-content">
                <h2>Tools for Students</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit morbi hendrerit elit</p>
                <p><a href="#" class="btn btn-primary px-4 rounded-0">Learn More</a></p>
              </div>
            </div> 
          </div>
        </div>
      </div>
    </div> -->


    <div class="site-section">
      <div class="container">


        <div class="row mb-5 justify-content-center text-center">
          <div class="col-lg-6 mb-5">
          	<br>
          	<br>
          	<br>
          	<br>
          	<br>
          	<br>
            <h1 class="section-title-underline mb-3">
            	<div style ="border-bottom: 1px solid #bcbcbc; font-family : HanaCM; font-weight: bold;">혜택별 BEST CARD</div>
              <!-- <span style ="font-weight: bold;">혜택별 BEST CARD</span> -->
            </h1>
            <p>이번 달 혜택별 BEST CARD를 살펴보세요!</p>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
              <div class="owl-slide-3 owl-carousel">
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/Any PLUS 카드.png" alt="Image" class="img-fluid"></a>
                      <!-- <div class="price">연 ￦5,000</div> -->
                      <div class="category"><h3>SMART ANY(스마트 애니)카드</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2 style = "font-family: HanaUL">생활 혜택 BEST</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">모든 가맹점 0.8% 청구할인</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">카드 보러가기</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/모두의 쇼핑.png" alt="Image" class="img-fluid"></a>
                      <!-- <div class="price">$99.00</div> -->
                      <div class="category"><h3>모두의 쇼핑</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2 style = "font-family: HanaUL">마트/쇼핑 혜택 BEST</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">모바일 전용 카드로 즐기는 쇼핑 혜택!</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">카드 보러가기</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/CLUB SK(클럽 SK)카드.png" alt="Image" class="img-fluid"></a>
                      <!-- <div class="price">$99.00</div> -->
                      <div class="category"><h3>CLUB SK(클럽 SK)카드</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2 style = "font-family: HanaUL">통신/교통 혜택 BEST</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">100만 고객이 선택한 SK의 모든 혜택</p>
                      <p><a href="courses-single.html" class="btn btn-primary rounded-0 px-4">카드 보러가기</a></p>
                    </div>
                  </div>

                  <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/My Trip 1Q Global VIVA.png" alt="Image" class="img-fluid"></a>
                      <!-- <div class="price">$99.00</div> -->
                      <div class="category"><h3>My Trip 1Q Global VIVA</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2 style = "font-family: HanaUL">레저/여행/항공 BEST</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">해외여행을 위한 MUST HAVE 카드</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">카드 보러가기</a></p>
                    </div>
                  </div>
      
                  <!-- <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/course_5.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">$99.00</div>
                      <div class="category"><h3>Web Design</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>How To Create Mobile Apps Using Ionic</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Similique accusantium ipsam.</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Course</a></p>
                    </div>
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/course_6.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">$99.00</div>
                      <div class="category"><h3>Mobile Application</h3></div>  
                    </figure>
                    <div class="course-1-content pb-4">
                      <h2>How To Create Mobile Apps Using Ionic</h2>
                      <div class="rating text-center mb-3">
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                        <span class="icon-star2 text-warning"></span>
                      </div>
                      <p class="desc mb-4">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Similique accusantium ipsam.</p>
                      <p><a href="course-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Course</a></p>
                    </div>
                  </div> -->
      
              </div>
      
          </div>
        </div>

      
        
      </div>
    </div>
    
	  <br>
      <br>
      <br>
      <br>
      <br>
	


	<footer>
		<!-- WEB-INF 폴더는 보안이라, 프론트에서는 접근할 수 없다 -->
		<!-- 다만 백엔드에서는 접근 가능하다. (jsp 등) -->
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp"/>
	</footer>

    

  </div>
  <!-- .site-wrap -->

  <!-- loader -->
  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#51be78"/></svg></div>

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
  
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  

</body>
</html>