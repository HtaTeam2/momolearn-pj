<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의목록</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <jsp:include page="/separate/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/separate/header.jsp"></jsp:include>
<!-- searchList: 스터디 검색시 비동기로 출력-->
<div id="searchList">

<!-- Categories Start -->
    <div class="container-xxl py-5 category">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Categories</h6>
            </div>
            <div class="">
            	<!-- 조회한 카테고리 반복문 돌려주자 -->
                <button id="catebtn2" type="button" class="btn btn-outline-primary">전체강의</button>
                <c:if test="${not empty category}">
	                <c:forEach var="cate" items="${category}">
					    <button id="catebtn" type="button" class="btn btn-outline-primary" value="${cate.cateId}">${cate.cateName}</button>
					</c:forEach>
                </c:if>
            </div>
        </div>
    </div>
    <!-- Categories End -->
    <!-- 강의 리스트 Start -->
    <div id="lectureList"></div>
    <!-- 강의 리스트 End -->

</div>



<!-- Back to Top -->
<jsp:include page="/separate/script.jsp"></jsp:include>
<jsp:include page="/separate/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/list.js"></script>
</body>
</body>
</html>