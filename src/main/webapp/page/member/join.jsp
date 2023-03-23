<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.momolearn.model.entity.Members"%>
<%@ page import="com.momolearn.model.MembersRepository"%>
<%@ page import="com.momolearn.controller.MemberSignUpController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>회원가입 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <link href="../../css/join.css" rel="stylesheet">

	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://kit.fontawesome.com/f51a30e87b.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="../../header4.jsp"></jsp:include>
	<div class="wrap">
		
			<div class="join">
				<h2 class="text-primary">회원가입</h2>
				<span  style="font-weight: bold; color: navy;">* 필수입력</span>
				<!-- 파일업로드를 먼저 해주기 위함 -->
				<form name="f" action="${pageContext.request.contextPath}/member/join" method="post" enctype="multipart/form-data">
					<div class="join_a">
						<h4>*아이디</h4>
						<input type="text" name="memId" id="memId" placeholder="아이디를 입력해주세요."
							minlength="5" maxlength="20" onsubmit="return checkId(this)">
						<input type="button" style="background-color: #78d5e7; color: white; font-weight: bolder;" value="ID중복확인" onclick="dedupId()" >
					</div>
					<div class="join_a">
						<h4>*비밀번호</h4>
						<input type="password"  name="password" placeholder="비밀번호를 입력해주세요."
							maxlength="16">
					</div>
					<div class="join_a">
						<h4>*이메일</h4>
						<input type="text" name="email" placeholder="이메일을 입력해주세요."
							maxlength="100">
					</div>
					<!-- <div class="join_grade">
						<h4>등급</h4>
						<label>
							<input type="radio" name="grade" value="student" checked>학생 &nbsp;&nbsp;
						</label> 
						<label>
							<input type="radio" name="grade" value="teacher">강사 &nbsp;&nbsp;
						</label>
						<label>
							<input type="radio" name="grade" value="amdin">관리자 
						</label>
					</div> -->
					<div class="join_a">
						<h4>*이름</h4>
						<input type="text" name="name" placeholder="이름을 입력해주세요."
							minlength="1" maxlength="5">
					</div>
					<!--사진 업로드: https://getbootstrap.com/docs/5.3/forms/form-control/?#file-input-->
					<br>
					<div class="">
						<h4>*프로필사진</h4>
						<div class="mb-3">
							<input class="form-control" type="file" id="profile" name="file">
						</div>
					</div>
					<div class="submit">
						<input type="button" style="background-color: #78d5e7;" value="회원가입" onclick="blank()">
					</div>

					<div class="text">
						<p id="p">sns계정으로 시작하기</p>
					</div>
					<div class="join_sns">
						<li><a href="" id="a"><i class="fa-sharp fa-solid fa-n"></i></a></li>
						<li><a href="" id="a"><i class="fa-solid fa-comment"></i></a></li>
					</div>

				</form>
			</div>
		
	</div>
	<jsp:include page="../../footer.jsp"></jsp:include>


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
    
    <script>
    
    var check ; // 중복 체크 여부 확인 
    
	//id 중복체크
	function dedupId() {
		
		
		axios.post('${pageContext.request.contextPath}/member/checkOk', {}, {
			params : {
				memId : document.getElementById("memId").value
			}
		})
		 .then(function (resData) {
			 validate(resData['data']);
		 })
	}
	//사용여부
	function validate(val) {
		const memId = document.getElementById("memId").value;
		
	
		if (memId.length < 5) {
			alert("아이디는 5자 이상 입력해주세요.");
			
		}else{
			if(memId == ""){
				alert('아이디를 입력하세요.');
				return;
				
			}else if(val == true) {
				alert('사용가능한 아이디 입니다.')
				document.getElementById("submit").disabled=false;
				document.getElementById("memId").readOnly=true;
				check = true;
				
			}else {
				alert('이미 존재하는 아이디 입니다.');
				check = false;
			}
		}
		
	}

	
	//입력 태그 null값 경고
	function blank() {
		//아이디
		if(f.memId.value==""){
			alert("아이디를 입력하세요..");
			f.memId.focus();
			return false;
		}
		//비밀번호
		if(f.password.value==""){
			alert("비밀번호를 입력하세요.");
			f.password.focus();
			return false;
		}
		
		//이메일
		if(f.email.value==""){
			alert("이메일을 입력하세요.");
			f.email.focus();
			return false;
		}
		//이름
		if(f.name.value==""){
			alert("이름을 입력하세요.");
			f.name.focus();
			return false;
		}
		
		//중복 체크 확인
		if(check ==false){
			alert("아이디 중복확인 해주세요.");
		}
		
		f.submit();
		
	}
</script>
</body>
</html>