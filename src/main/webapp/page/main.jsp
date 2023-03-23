<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
session.setAttribute("id", "test04");
session.setAttribute("name", "강사1");
session.setAttribute("profile", "test04.jpg");
session.setAttribute("grade", "teacher");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>MOMOLEARN</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    


    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<!-- Spinner Start -->
<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<!-- Spinner End -->


<!-- Navbar Start navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0-->
<nav class="navbar navbar-expand-lg bg-body-tertiary shadow">
    <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>MOMOLEARN</h2>
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <!-- <a href="index.html" class="nav-item nav-link active">홈</a> -->
          <input id="searchLecture" class="form-control me-2" type="search" placeholder="강의 검색" aria-label="Search">
          <button id="btn" class="btn btn-outline-primary" type="submit">Search</button>
        </div>
        <a href="../page/lecture/lectures.jsp" class="nav-item nav-link">강의</a> &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/board/list" class="nav-item nav-link">커뮤니티</a> &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/notice/" class="nav-item nav-link">공지사항</a> &nbsp;&nbsp;&nbsp;&nbsp;
        <!-- 세션ID 존재할 경우 나오는 메뉴 Start-->
        <a href="" class="nav-item nav-link"><i class="fa fa-shopping-cart" style="font-size:24px;color:#06BBCC"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
        <div class="nav-item dropdown">
        <a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
            <img class="profile-image rounded-circle" src="${pageContext.request.contextPath}/img/profile/${sessionScope.profile}" style="width: 50px; height: 50px; border: 2px solid #06BBCC;">&nbsp;&nbsp;${sessionScope.name}</a>
        <div class="dropdown-menu fade-down">
            <a href="" class="dropdown-item">내 정보</a>
            <a href="" class="dropdown-item">내 강의</a>
            <c:choose>
                <c:when test="${sessionScope.grade == 'admin'}">
                    <a href="" class="dropdown-item">관리자메뉴</a>
                </c:when>
                <c:when test="${sessionScope.grade == 'teacher'}">
                    <a href="${pageContext.request.contextPath}/lectures/uploadcheck" class="dropdown-item">강의 등록</a>
                </c:when>
            </c:choose>
            <a href="" class="dropdown-item">로그아웃</a>
        </div>
        <!-- 세션ID 존재할 경우 나오는 메뉴 End-->

            
        </div>
        <!-- <a href="login.html" class="btn btn-primary">로그인</a>&nbsp;&nbsp;&nbsp;
        <a href="join.html" class="btn btn-primary">가입하기</a>&nbsp;&nbsp;&nbsp; -->
    </div>
</nav>
<!-- Navbar End -->
<!-- searchList: 스터디 검색시 비동기로 출력-->
<div id="searchList">
	<!-- Carousel Start -->
	<div class="container-fluid p-0 mb-5">
	    <div class="owl-carousel header-carousel position-relative">
	        <div class="owl-carousel-item position-relative">
	            <img class="img-fluid" src="../img/carousel-1.jpg" alt="">
	            <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
	                <div class="container">
	                    <div class="row justify-content-start">
	                        <div class="col-sm-10 col-lg-8">
	                            <h5 class="text-primary text-uppercase mb-3 animated slideInDown">왜 모모런인가?</h5>
	                            <h1 class="display-5 text-white animated slideInDown">오직 모모런에서만 만날 수 있는 강의!</h1>
	                            <p class="fs-5 text-white mb-4 pb-2">모두에게 배움의 기회를!</p>
	                            <a href="about.html" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">모모런 알아보기</a>
	                            <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="owl-carousel-item position-relative">
	            <img class="img-fluid" src="../img/carousel-2.jpg" alt="">
	            <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
	                <div class="container">
	                    <div class="row justify-content-start">
	                        <div class="col-sm-10 col-lg-8">
	                            <h5 class="text-primary text-uppercase mb-3 animated slideInDown">입문자 강의</h5>
	                            <h1 class="display-3 text-white animated slideInDown">누구나 입문할 수 있다는 문구</h1>
	                            <p class="fs-5 text-white mb-4 pb-2">카테고리명: 입문</p>
	                            <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Read More</a>
	                            <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="owl-carousel-item position-relative">
	            <img class="img-fluid" src="../img/carousel-3.jpg" alt="">
	            <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
	                <div class="container">
	                    <div class="row justify-content-start">
	                        <div class="col-sm-10 col-lg-8">
	                            <h5 class="text-primary text-uppercase mb-3 animated slideInDown">이달의 신규강의</h5>
	                            <h1 class="display-3 text-white animated slideInDown">남궁성 강사님 모모런 도착!</h1>
	                            <p class="fs-5 text-white mb-4 pb-2">자바의 정석 홍보문구</p>
	                            <a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">강의 들으러가기</a>
	                            <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- Carousel End -->
	
	<!-- Start -->
	<div>
	
	</div>
	<!-- End -->
</div>
<!-- Footer Start -->
<div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
<div class="container py-5">
    <div class="row g-6">
        <div class="col-lg col-md">
            <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
                <h2 class="m-0 text-primary"><i class="fa fa-book me-10"></i>MOMOLEARN</h2>
            </a>
            &nbsp;&nbsp;&nbsp;&nbsp;<a href="about.html" class="text-primary align-items-right">사이트소개<i class="fa fa-arrow-right ms-3"></i></a> 
            <p class="mb-2"><i class="fa fa-map-marker-alt me-10"></i> 서울시 강남구 강남대로 420 역삼빌딩 1205호</p>
            <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>02) 1234 - 5678</p>
            <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@momolearn.com</p>
            <div class="d-flex pt-2">
                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="copyright">
        <div class="row">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                &copy; <a class="border-bottom" href="#">Your Site Name</a><br> 
                (주)모모랩 | 대표자: 김누구 | 사업자번호: 123-45-67890 <br>
                개인정보보호책임자: 이누구 | 이메일: info@momolearn.com
                주소:서울시 강남구 강남대로 420 역삼빌딩 1205호

                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a><br><br>
                Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
            </div>
            <div class="col-md-6 text-center text-md-end">
            </div>
        </div>
    </div>
</div>
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../lib/wow/wow.min.js"></script>
<script src="../lib/easing/easing.min.js"></script>
<script src="../lib/waypoints/waypoints.min.js"></script>
<script src="../lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="../js/main.js"></script>
<!-- axios 사용을 위한 추가 설정 -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="../js/search.js"></script>
</body>

</html>