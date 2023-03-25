<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강좌등록</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="" name="keywords">
	<meta content="" name="description">
	
	<jsp:include page="/separate/head.jsp"></jsp:include>
	<style>
      body {
        min-height: 100vh;
  
        background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
        background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
      }
  
      .input-form {
        max-width: 680px;
  
        margin-top: 80px;
        padding: 32px;
  
        background: #fff;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
        box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
      }
    </style>
</head>
<body>
	<jsp:include page="/separate/header3.jsp"></jsp:include>
	<!-- form Start -->
    <div>
      <form name="upload" action="${pageContext.request.contextPath}/momolearn/lectures/upload-course" method="post" enctype="multipart/form-data">
        
    	<div class="container">
        <div class="input-form-backgroud row">
          <div class="input-form col-md-12 mx-auto">
            <h2 class="mb-2">강의 등록하기</h2>
            <form class="validation-form" novalidate>
              <div class="row">
                <div class="mb-3">
                  <label for="title">강의명</label>
                  <input type="text" class="form-control-plaintext form-control-sm border-bottom" name="title" placeholder="강의명을 입력해주세요." value="" required>
                </div>
              </div>
              <div class="mb-3">
                <label for="category">카테고리</label>
                <input type="text" class="form-control-plaintext form-control-sm border-bottom" name="category" id="category" placeholder="카테고리를 쉼표(,)로 구분하여 입력하세요.">
              </div>
              <div class="mb-3">
                <label for="teacher_no">강사명<br><h5>${member.name}</h5></label>
                <input type="hidden" class="form-control-plaintext form-control-sm border-bottom" name="teachersTeacherNo" value="${teacher.teacherNo}">
              </div>
              <div class="mb-3">
                <label for="image">강의 썸네일</label>
                <div class="mb-3">
                  <input class="form-control" name="image" type="file" id="image">
                </div>
              </div>
    
              <div class="mb-3 row">
                <label for="price" class="col-md-6 col-form-label">강의 가격</label>
                <div class="col-md-6 d-flex align-items-center">
                 <input type="text" class="form-control-plaintext form-control-sm border-bottom" id="price" placeholder="가격을 입력하세요." required>원
                </div>
              </div>
    
              <div class="mb-3">
                <label for="info">강의 한줄 설명<span class="text-muted">&nbsp;</span></label>
                <input type="text" class="form-control-plaintext form-control-sm border-bottom" id="info" placeholder="한줄로 강의를 어필하세요!">
              </div>

              <div class="mb-3">
                <label for="description">강의 상세설명<span class="text-muted">&nbsp;</span></label>
                <textarea class="form-control" id="description" rows="5" placeholder="강의에 대한 상세 설명을 적어주세요!"></textarea>
              </div>
              <hr class="mb-4">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="aggrement" required>
                <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
              </div>
              <div class="mb-4"></div>
              <button class="btn btn-primary btn-lg btn-block" type="submit">강좌 등록하기</button>
            </form>
          </div>
        </div>
      </form>
    </div>

	<!-- Back to Top -->
	<jsp:include page="/separate/script.jsp"></jsp:include>
	<jsp:include page="/separate/footer.jsp"></jsp:include>
</body>

</html>