<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter"%>    
<%@ page import="com.momolearn.model.entity.Members" %>
<%@ page import="com.momolearn.model.MembersRepository" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>MOMOLEARN</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link rel="shortcut icon" href="../../img/favicon.ico" type="image/x-icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
    
    <link href="../../css/teacherForm.css" rel="stylesheet">
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
			<a href="../index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
				<h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>MOMOLEARN</h2>
			</a>
			<button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav ms-auto p-4 p-lg-0">
					<!-- <a href="index.html" class="nav-item nav-link active">홈</a> -->
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search" placeholder="강의 검색" aria-label="Search">
						<button class="btn btn-outline-primary" type="submit">Search</button>
					</form> &nbsp;&nbsp;&nbsp;&nbsp;
				</div>
					<a href="../lecture/lectures.html" class="nav-item nav-link">강의</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<a href="../community/community.html" class="nav-item nav-link">커뮤니티</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<a href="../notice/notice.html" class="nav-item nav-link">공지사항</a> &nbsp;&nbsp;&nbsp;&nbsp;
					<!--로그인 여부에 따라서 달라짐 Start-->
					<a href="../member/login.jsp" class="btn btn-primary">로그인</a>&nbsp;&nbsp;&nbsp;
					<a href="../member/join.jsp" class="btn btn-primary">가입하기</a>&nbsp;&nbsp;&nbsp;
					 <!--로그인 여부에 따라서 달라짐 End-->
			</div>
		</nav>
	<!-- Navbar End -->
	
    <!-- Header Start -->
    <div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-4 text-white animated slideInDown">회원가입 정보</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item text-white active" aria-current="page"></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
	
	<!-- Info Start -->
	    <!-- Form Start -->
    <form id="sm" name="pej" method="post" onsubmit="return allCheck()" action="">
        <div align="center">
            <h2>내 정보</h2> <!-- class="nav-item nav-link" -->

            <div>
                <div class="col-sm-5">
                    <table class="table table-bordered">

                        <tr>
                            <!-- 1 -->
                            <td>아이디</td>
                            <td>${members.memId }</td>

                        </tr>
                        
                        <tr>
                            <!-- 2 -->
                            <td>비밀번호</td>
                            <td>${members.pw}</td>

                        </tr>
                        
                        <tr>
                            <!-- 3 -->
                            <td>이름</td>
                            <td>${members.name }</td>
                        </tr>
                        <tr>
                            <!-- 4 -->
                            <td>이메일</td>
                            <td>${members.email }</td>
                        </tr>
                        
                       <tr>
                       		<!-- 5 -->
                            <td>등급</td>
                            <td>${members.grade }</td>
                        </tr>
                        
                       <tr>
                       		<!-- 5 -->
                            <td>프로필사진</td>
                            <td>${members.profile }</td>
                        </tr>                        


                        <tr>
                            <td colspan="2" align="center">
                                <a href="login.jsp">로그인 하러가기</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
	</form>
    <!-- Form End -->
	<!-- Info End -->

    

    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-6">
                <div class="col-lg col-md">
                    <div class="flex">
                        <a href="../index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
                            <h2 class="m-0 text-primary"><i class="fa fa-book me-10"></i>MOMOLEARN</h2>
                        </a>
                        <a class="info" href="../about.html" class="text-primary align-items-right">사이트소개<i class="fa fa-arrow-right ms-3"></i></a> 
                    </div>
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

                        <!--/*** This template is free as long as you keep the footer memberor’s credit link/attribution link/backlink. If you'd like to use the template without the footer memberor’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a><br><br>
                        Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <!-- <div class="footer-menu">
                            <a href="">Home</a>
                            <a href="">Cookies</a>
                            <a href="">Help</a>
                            <a href="">FQAs</a>
                        </div> -->
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
    <script src="../../lib/wow/wow.min.js"></script>
    <script src="../../lib/easing/easing.min.js"></script>
    <script src="../../lib/waypoints/waypoints.min.js"></script>
    <script src="../../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../../js/main.js"></script>
    
    	<!-- axios 사용을 위한 추가 설정 -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</body>

</html>