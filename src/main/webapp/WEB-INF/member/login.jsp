<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="" name="keywords">
<meta content="" name="description">
<title>로그인 페이지</title>

    <jsp:include page="/separate/head.jsp"></jsp:include>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

	<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">   -->

	<script src="https://kit.fontawesome.com/f51a30e87b.js" crossorigin="anonymous"></script>

</head>
<body>
	<jsp:include page="/separate/header3.jsp"></jsp:include>

	<div class="wrap">
		<div class="login">
			<h2 id="h2" class="text-primary" >로그인</h2>
			<form name="f" action="${pageContext.request.contextPath}/member/login" method="post">
				<div class="login_id">
					<h5>아이디</h5>
					<input type="text" id="memId" name="memId" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="login_pw">
					<h5>비밀번호</h5>
					<input class="input" type="password" name="password" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="login_etc">
					<div class="checkbox">
						<input type="checkbox"> 아이디 저장<br>
						<a id="a" href="member/findIdForm">아이디 찾기</a>
						&nbsp; <a>|</a> &nbsp;
						<a id="a" href="member/findPwdForm">비밀번호 찾기</a>
					</div>
				</div>
				<div class="submit">
					<input type="button" style="background-color: #36cedb;" value="로그인" onclick="blank()" >
				</div>
				<div class="text">
					<p id="p">sns계정으로 시작하기</p>
				</div>
				<div class="login_sns">
					<li><a id="a" href=""><i class="fa-sharp fa-solid fa-n"></i></a></li>
					<li><a id="a" href=""><i class="fa-solid fa-comment"></i></a></li>
				</div>
				<div class="text">
					아직 회원이 아니신가요? &nbsp; <a href="./join.jsp"> 회원가입 하러가기</a>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="/separate/footer.jsp"></jsp:include>
	
	
	<jsp:include page="/separate/script.jsp"></jsp:include>
	
	<script>	
	function blank() {
		//아이디 빈칸이라면 경고
		if (f.memId.value == "") {
			alert("아이디를 입력하세요.");
			f.memId.focus();
			return false;

		}
		//비밀번호 빈칸이라면 경고
		if (f.password.value == "") {
			alert("비밀번호를 입력하세요.");
			f.password.focus();
			return false;
		}
		f.submit();

	}
	</script>
</body>
</html>