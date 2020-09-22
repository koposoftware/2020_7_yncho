<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>   

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
          			<span class="small mr-3">${loginVO.name}님</span>
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
                    <li><a href="${ pageContext.request.contextPath }/mypage/transaction">카드이용내역</a></li>
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
                  <ul class="dropdown">
                    <!-- <li><a href="teachers.html">카드타입별순위</a></li> -->
                    <li><a href="${ pageContext.request.contextPath }/chart/benefitRank">인기혜택별순위</a></li>
                    <li><a href="${ pageContext.request.contextPath }/chart/annualfeeRank">연회비별순위</a></li>
                    <li><a href="${ pageContext.request.contextPath }/chart/performRank">카드타입별순위</a></li>
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
