<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>MOMOLEARN</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <jsp:include page="../../separate/head.jsp"></jsp:include>
</head>

<body>

<jsp:include page="../../separate/header2.jsp"></jsp:include>

    <!-- 블로그 시작-->
    <div class="blog-single gray-bg">
        <div class="container">
            <div class="row align-items-start">
                <div class="col-lg-8 m-15px-tb" style="margin-left: 230px;">
                    <article class="article">
                        <div class="article-title">
                            <h6><a href="#">${dto.subject}</a></h6>
                            <span id="id" style="display: none">${dto.comNo}</span>
                            <h2>${dto.comTitle }</h2>
                            <div class="media">
                                <div class="avatar">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" title="" alt="">
                                </div>
                                <div class="media-body">
                                    <label>${dto.membersMemId}</label>
                                </div>
                                <div class="detail">
                                    <span>작성일 <tf:formatDateTime value="${dto.comRegdate}" pattern="yyyy-MM-dd HH:mm" /></span>
                                    <span style="float: right;">댓글 0</span>
                                    <span style="float: right;">추천 0</span>
                                    <span style="float: right;">조회 ${dto.comViewCount }</span>
                                </div>
                            </div>
                        </div>
                        <div class="article-content">
                            <p>${dto.comContent}</p>
                        </div>
                    </article>
                    <div class="contact-form article-comment">
                        
                        <div class="container">
                            <div class="be-comment-block">
                                <h1 class="comments-title">댓글 (3)</h1>
                                <div class="be-comment">
                                    <div class="be-img-comment">	
                                        <a href="blog-detail-2.html">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="be-ava-comment">
                                        </a>
                                    </div>
                                    <div class="be-comment-content">
                                        
                                            <span class="be-comment-name">
                                                <a href="blog-detail-2.html">Ravi Sah</a>
                                                </span>
                                            <span class="be-comment-time">
                                                <i class="fa fa-clock-o"></i>
                                                May 27, 2015 at 3:14am
                                            </span>
                            
                                        <p class="be-comment-text">
                                            Pellentesque gravida tristique ultrices. 
                                            Sed blandit varius mauris, vel volutpat urna hendrerit id. 
                                            Curabitur rutrum dolor gravida turpis tristique efficitur.
                                        </p>
                                    </div>
                                </div>
                                <div class="be-comment">
                                    <div class="be-img-comment">	
                                        <a href="blog-detail-2.html">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="be-ava-comment">
                                        </a>
                                    </div>
                                    <div class="be-comment-content">
                                        <span class="be-comment-name">
                                            <a href="blog-detail-2.html">Phoenix, the Creative Studio</a>
                                        </span>
                                        <span class="be-comment-time">
                                            <i class="fa fa-clock-o"></i>
                                            May 27, 2015 at 3:14am
                                        </span>
                                        <p class="be-comment-text">
                                            Nunc ornare sed dolor sed mattis. In scelerisque dui a arcu mattis, at maximus eros commodo. Cras magna nunc, cursus lobortis luctus at, sollicitudin vel neque. Duis eleifend lorem non ant. Proin ut ornare lectus, vel eleifend est. Fusce hendrerit dui in turpis tristique blandit.
                                        </p>
                                    </div>
                                </div>
                                <div class="be-comment">
                                    <div class="be-img-comment">	
                                        <a href="blog-detail-2.html">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="be-ava-comment">
                                        </a>
                                    </div>
                                    <div class="be-comment-content">
                                        <span class="be-comment-name">
                                            <a href="blog-detail-2.html">Cüneyt ŞEN</a>
                                        </span>
                                        <span class="be-comment-time">
                                            <i class="fa fa-clock-o"></i>
                                            May 27, 2015 at 3:14am
                                        </span>
                                        <p class="be-comment-text">
                                            Cras magna nunc, cursus lobortis luctus at, sollicitudin vel neque. Duis eleifend lorem non ant
                                        </p>
                                    </div>
                                </div>
                                <form class="form-block">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6">
                                            <div class="form-group fl_icon">
                                                <div class="icon"><i class="fa fa-user"></i></div>
                                                <input class="form-input" type="text" placeholder="Your name">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 fl_icon">
                                            <div class="form-group fl_icon">
                                                <div class="icon"><i class="fa fa-envelope-o"></i></div>
                                                <input class="form-input" type="text" placeholder="Your email">
                                            </div>
                                        </div>
                                        <div class="col-xs-12">									
                                            <div class="form-group">
                                                <textarea class="form-input" required="" placeholder="내용 입력"></textarea>
                                            </div>
                                        </div>
                                        <a class="btn btn-primary pull-right">댓글 등록</a>
                                    </div>
                                </form>
                            </div>
                            </div>
                    </div>

                    <button type="button" class="btn btn-primary" style="margin-top: 15px;" onclick="location.href='../board/'">목록</button>
                    <div class="text-right mt-3" style="float: right;">
                        <button type="button" class="btn btn-primary" onclick="location.href='../board/updateForm/${dto.comNo}'">수정</button>&nbsp;
                        <!-- <button id="btn-delete" class="btn btn-danger" >삭제</button>&nbsp; -->
                        <form id="delete_form" action="../board/${dto.comNo}" method="post"  style="float:left;margin:0;">
					    <input type="hidden" name="_method" value="delete"/>
					    <a onclick="if (confirm('정말로 삭제하시겠습니까?')) document.getElementById('delete_form').submit();" class="btn btn-danger">삭제</a>&nbsp;
						</form>
                        <!-- <button type="button" class="btn btn-default">Cancel</button>&nbsp; -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 블로그 끝 -->
 

    <!-- Back to Top -->
	<jsp:include page="../../separate/script.jsp"></jsp:include>
	<jsp:include page="../../separate/footer.jsp"></jsp:include>
</body>

</html>