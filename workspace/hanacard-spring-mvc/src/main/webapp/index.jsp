<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>   

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
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-9 d-none d-lg-block">
            <a href="#" class="small mr-3"><span class="icon-question-circle-o mr-2"></span> Have a questions?</a> 
            <a href="#" class="small mr-3"><span class="icon-phone2 mr-2"></span> 10 20 123 456</a> 
            <a href="#" class="small mr-3"><span class="icon-envelope-o mr-2"></span> info@mydomain.com</a> 
          </div>
          <div class="col-lg-3 text-right">
          
          	<c:choose>
          		<c:when test="${ empty loginVO }">
		            <a href = "${ pageContext.request.contextPath }/login" class="small mr-3"><span class="icon-unlock-alt"></span> 로그인</a>
		            <a href="register.html" class="small btn btn-primary px-4 py-2 rounded-0"><span class="icon-users"></span> 회원가입</a>
          		</c:when>
          		<c:otherwise>
		            <a href = "${ pageContext.request.contextPath }/logout" class="small mr-3"><span class="icon-unlock-alt"></span> 로그아웃</a>
          		</c:otherwise>
          	</c:choose>
          </div>
        </div>
      </div>
    </div>
    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="d-flex align-items-center">
          <div class="site-logo">
            <a href="${ pageContext.request.contextPath }/index.jsp" class="d-block">
              <img src="/hanacard-spring-mvc/resources/images/hanacard_logo_down.png" alt="Image" class="img-fluid">
            </a>
          </div>
          <div class="mr-auto">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li class="has-children">
                <!-- <li class="active"> -->
                  <a href = "${ pageContext.request.contextPath }/mypage" class="nav-link text-left">마이페이지</a>
                  <ul class="dropdown">
                    <li><a href="${ pageContext.request.contextPath }/mypage">종합 대시보드</a></li>
                    <li><a href="${ pageContext.request.contextPath }/mypage/owncard">보유카드정보</a></li>
                  </ul>
                </li>
                <li class="has-children">
                  <a href="about.html" class="nav-link text-left">하나차트</a>
                  <ul class="dropdown">
                    <!-- <li><a href="teachers.html">카드타입별순위</a></li> -->
                    <li><a href="about.html">인기혜택별순위</a></li>
                    <li><a href="about.html">연회비별순위</a></li>
                    <li><a href="about.html">전월실적별순위</a></li>
                    <!-- <li><a href="about.html">전월실적별순위</a></li> -->
                  </ul>
                </li>
                
                <li class="has-children">
                  <a href="about.html" class="nav-link text-left">검색/추천</a>
                  <ul class="dropdown">
                    <li><a href="teachers.html">조건별검색</a></li>
                    <li><a href="about.html">키워드검색</a></li>
                    <li><a href="about.html">개인화추천</a></li>
                  </ul>
                </li>
                
                <!-- <li>
                  <a href="admissions.html" class="nav-link text-left">검색/비교</a>
                </li> -->
                <li>
                  <a href="courses.html" class="nav-link text-left">고객센터</a>
                </li>
                <!-- <li>
                    <a href="contact.html" class="nav-link text-left">Contact</a>
                  </li> -->
              </ul>                                                                                                                                                                                                                                                                                          </ul>
            </nav>

          </div>
          <div class="ml-auto">
            <div class="social-wrap">
              <a href="#"><span class="icon-facebook"></span></a>
              <a href="#"><span class="icon-twitter"></span></a>
              <a href="#"><span class="icon-linkedin"></span></a>

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
              <h1>Academics University</h1>
            </div>
          </div>
        </div>
      </div>

      <div class="intro-section" style="background-image: url('/hanacard-spring-mvc/resources/images/hero_1.jpg');">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-12 mx-auto text-center" data-aos="fade-up">
              <h1>You Can Learn Anything</h1>
            </div>
          </div>
        </div>
      </div>

    </div>
    


    <div class="site-section">
      <div class="container">
        <div class="row mb-5 justify-content-center text-center">
          <div class="col-lg-4 mb-5">
            <h2 class="section-title-underline mb-5">
              <span>Why Academics Works</span>
            </h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">

            <div class="feature-1 border">
              <div class="icon-wrapper bg-primary">
                <span class="flaticon-mortarboard text-white"></span>
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
    </div>


    <div class="site-section">
      <div class="container">


        <div class="row mb-5 justify-content-center text-center">
          <div class="col-lg-6 mb-5">
            <h2 class="section-title-underline mb-3">
              <span>Popular Courses</span>
            </h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia, id?</p>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
              <div class="owl-slide-3 owl-carousel">
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/course_1.jpg" alt="Image" class="img-fluid"></a>
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
                  </div>
      
                  <div class="course-1-item">
                    <figure class="thumnail">
                      <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/course_2.jpg" alt="Image" class="img-fluid"></a>
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
                      <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/course_3.jpg" alt="Image" class="img-fluid"></a>
                      <div class="price">$99.00</div>
                      <div class="category"><h3>Arithmetic</h3></div>  
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
                      <p><a href="courses-single.html" class="btn btn-primary rounded-0 px-4">Enroll In This Course</a></p>
                    </div>
                  </div>

                  <div class="course-1-item">
                    <figure class="thumnail">
                        <a href="course-single.html"><img src="/hanacard-spring-mvc/resources/images/course_4.jpg" alt="Image" class="img-fluid"></a>
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
                  </div>
      
                  <div class="course-1-item">
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
                  </div>
      
              </div>
      
          </div>
        </div>

        
        
      </div>
    </div>

	


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