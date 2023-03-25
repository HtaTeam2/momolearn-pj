<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="utf-8">
            <title>강사 신청서 수정</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">

            <jsp:include page="/separate/head.jsp"></jsp:include>
            <link href="${pageContext.request.contextPath}/css/at-form.css" rel="stylesheet">
        </head>

        <body>
            <jsp:include page="/separate/header3.jsp"></jsp:include>


            <!-- Header Start -->
            <div class="container-fluid bg-primary py-5 mb-5 page-header">
                <div class="container py-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-10 text-center">
                            <h1 class="display-4 text-white animated slideInDown">강사 신청서 수정</h1>
                            <!-- <nav aria-label="breadcrumb">
                                <ol class="breadcrumb justify-content-center">
                                    <li class="breadcrumb-item text-white active" aria-current="page">신청서를 작성해 주세요.</li>
                                </ol>
                            </nav> -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header End -->

            <!-- Form Start -->
            <form id="sm" name="ta" method="post" onsubmit="return allCheck()"
                action="${pageContext.request.contextPath}/applyteacher/updateform">
                <div align="center">
                    <h2>강사 등록 신청서</h2>

                    <div>
                        <div class="col-sm-5">
                            <table class="table table-bordered">

                                <tr class="tr">
                                    <!-- 첫줄 -->
                                    <td class="td" align="center" colspan="2">회원 기본 정보</td>
                                </tr>
                                <tr>
                                    <!-- 2 -->
                                    <td>내아이디</td>
                                    <td><input type="text" id="id" name="id" disabled></td>
                                </tr>
                                <tr>
                                    <!-- 6 -->
                                    <td>이름</td>
                                    <td><input type="text" id="name" name="name" disabled></td>
                                </tr>
                                <tr>
                                    <!-- 5 -->
                                    <td>메일주소</td>
                                    <td><input type="text" id="email" name="email" size="30" disabled></td>
                                </tr>


                                <tr class="tr">
                                    <!-- 첫줄 -->
                                    <td class="td" align="center" colspan="2">추가 입력 정보</td>
                                </tr>

                                <tr>
                                    <td>연락처</td>
                                    <td><input type="text" id="phonenum" name="phonenum" size="30" placeholder="연락처를 입력해주세요."></td>
                                </tr>
                                <tr>
                                    <td>포트폴리오 url</td>
                                    <td><input type="text" id="url" name="url" size="30" placeholder="포트폴리오url을 입력해주세요."></td>
                                </tr>
                                <tr>
                                    <!-- 9 -->
                                    <td>희망분야</td>
                                    <td>
                                        <input type="text" id="hope" name="hope" size="30" placeholder="희망분야를 입력해주세요.">
                                    </td>

                                </tr>
                                <tr>
                                    <!-- 9 -->
                                    <td>자기소개</td>
                                    <td><textarea id="my_intro" name="intro" cols="55" rows="5"
                                            maxlength="700" placeholder="자기소개를 입력해주세요."></textarea></td>
                                </tr>

                                <tr>
                                    <td colspan="2" align="center">
                                        <input class="button" class="btn btn-primary" type="submit" value="수정하기" onclick="alert('강사신청이 완료 되었습니다')">
                                        <input class="button" class="btn btn-primary" type="reset" value="다시입력" onclick="clear()">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Form End -->

            <!-- Back to Top -->
            <jsp:include page="/separate/script.jsp"></jsp:include>
            <jsp:include page="/separate/footer.jsp"></jsp:include>

        </body>

        </html>