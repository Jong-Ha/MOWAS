<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-12
  Time: 오후 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Get Master Board</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">
    <script type="text/javascript">


    //============= 회원정보수정 Event  처리 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( "button:contains('수정')" ).on("click" , function() {
        self.location = "/site/updateMasterBoard/${masterBoard.masterBoardNo }"
      });

      $( "button:contains('확인')" ).on("click" , function() {
        self.location = "/site/listMasterBoard"
      });

      $( "button:contains('삭제')" ).on("click" , function() {
         self.location = "/site/deleteMasterBoard/${masterBoard.masterBoardNo }"
      });
    });

    </script>
<style>
    body{
    margin-top:20px;
    background:#f3f3f3;
    }
    .gradient-brand-color {
    background-image: -webkit-linear-gradient(0deg, #376be6 0%, #6470ef 100%);
    background-image: -ms-linear-gradient(0deg, #376be6 0%, #6470ef 100%);
    color: #fff;
    }
    .contact-info__wrapper {
    overflow: hidden;
    border-radius: .625rem .625rem 0 0
    }

    @media (min-width: 1024px) {
    .contact-info__wrapper {
    border-radius: 0 .625rem .625rem 0;
    padding: 5rem !important
    }
    }
    .contact-info__list span.position-absolute {
    left: 0
    }
    .z-index-101 {
    z-index: 101;
    }
    .list-style--none {
    list-style: none;
    }
    .contact__wrapper {
    background-color: #fff;
    border-radius: 0 0 .625rem .625rem
    }

    @media (min-width: 1024px) {
    .contact__wrapper {
    border-radius: .625rem 0 .625rem .625rem
    }
    }
    @media (min-width: 1024px) {
    .contact-form__wrapper {
    padding: 5rem !important
    }
    }
    .shadow-lg, .shadow-lg--on-hover:hover {
    box-shadow: 0 1rem 3rem rgba(132,138,163,0.1) !important;
    }

    .typing {
        width: 20ch;
        animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;
        white-space: nowrap;
        overflow: hidden;
        border-right: 3px solid;
        font-size: 2em;
        height: 2ch;
    }

    .mbBox {
        margin-bottom: 50px;
        justify-content: center;
    }
    .underline {
        line-height: 1.2;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 1.5em;
        font-weight: 700;
        background-image: linear-gradient(transparent calc(100% - 3px), #000 3px);
        background-repeat: no-repeat;
        background-size: 0% 100%;
        transition: background-size 0.2s;
        color: #000;
        cursor: pointer;
        margin-right: 25px;
    }
    @media (min-width: 1000px) {
        .underline {
            font-size: 1.5em;
        }
    }
    .underline.yellow {
        background-image: linear-gradient(transparent 60%, #F8CD07 40%);
    }

    @keyframes typing {
        from {
            width: 0
        }
    }

    @keyframes blink {
        80% {
            border-color: transparent
        }
    }
</style>

</head>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

<jsp:include page="/layout/toolbar.jsp"/>
<br>
<br>
<div class="page-header text-center">
    <div class="wrapper">
        <div class="typing">
            <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
                공 지 사 항 상 세 보 기</h4>
        </div>
    </div>
</div>

     <div class="container">
         <hr>
        <div class="contact__wrapper shadow-lg mt-n9">
            <div class="row no-gutters">
                <div class="col-lg-5 contact-info__wrapper gradient-brand-color p-5 order-lg-2">
                    <h3 class="color--white mb-5">Get in Touch</h3>

                    <ul class="contact-info__list list-style--none position-relative z-index-101">
                        <li class="mb-4 pl-4">
                            <span class="position-absolute"><i class="fas fa-envelope"></i></span> admin@mowas.com
                        </li>
                        <li class="mb-4 pl-4">
                            <span class="position-absolute"><i class="fas fa-phone"></i></span> (010)-1234-1234
                        </li>
                        <li class="mb-4 pl-4">
                            <span class="position-absolute"><i class="fas fa-map-marker-alt"></i></span> MOWAS Technologies Inc.
                            <br> 서울특별시 강남구 역삼동 819-3 삼오빌딩 5-9층
                            <br> 비트캠프

                            <div class="mt-3">
                                <a href="https://www.google.com/maps" target="_blank" class="text-link link--right-icon text-white">Get directions <i class="link__icon fa fa-directions"></i></a>
                            </div>
                        </li>
                    </ul>

                    <figure class="figure position-absolute m-0 opacity-06 z-index-100" style="bottom:0; right: 10px">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="400px" height="498px">
                            <defs>
                                <linearGradient id="PSgrad_1" x1="0%" x2="81.915%" y1="57.358%" y2="0%">
                                    <stop offset="0%" stop-color="rgb(255,255,255)" stop-opacity="1"></stop>
                                    <stop offset="100%" stop-color="rgb(0,54,207)" stop-opacity="0"></stop>
                                </linearGradient>

                            </defs>
                            <path fill-rule="evenodd" opacity="0.302" fill="rgb(72, 155, 248)" d="M816.210,-41.714 L968.999,111.158 L-197.210,1277.998 L-349.998,1125.127 L816.210,-41.714 Z"></path>
                            <path fill="url(#PSgrad_1)" d="M816.210,-41.714 L968.999,111.158 L-197.210,1277.998 L-349.998,1125.127 L816.210,-41.714 Z"></path>
                        </svg>
                    </figure>
                </div>



                <div class="col-lg-7 contact-form__wrapper p-5 order-lg-1">
                        <div class="row">
                            <form class="form-horizontal" name="detailForm">
                            <div class="col-sm-12 mb-3">

                                <div class="form-group">
                                    <label class="required-field" for="title">제  목</label>
                                    <input type="text" class="form-control" id="title" name="title" rows="4" placeholder="${masterBoard.mbTitle}">
                                </div>
                            </div>

                            <div class="col-sm-12 mb-3">
                                <div class="form-group">
                                    <label class="required-field" for="text">내  용</label>
                                    <input type="text" class="form-control" id="text" name="text" rows="4" placeholder="${masterBoard.mbText}">
                                </div>
                            </div>

                            <div class="col-sm-12 mb-3">
                                <div class="form-group">
                                    <label class="required-field" for="date">날  짜</label>
                                    <input type="text" class="form-control" id="date" name="date" rows="4" placeholder="${masterBoard.mbRegDate}">
                                </div>
                            </div>

                            <div class="col-sm-12 mb-3">
                                <button type="button" class="btn btn-primary">확인</button>
                                <button type="button" class="btn btn-primary">삭제</button>
                            </div>
                            </form>
                        </div>

                </div>
                <!--End Contact Form Wrapper -->

        </div>
    </div>
   </div>

<%--관리자 아이디 : ${masterBoard.adminId} </br>--%>
<%--
<form class="form-horizontal" name="detailForm">

제목 : ${masterBoard.mbTitle} </br>
내용 : ${masterBoard.mbText} </br>
날짜 : ${masterBoard.mbRegDate} </br>
이미지 <c:forEach items="${masterBoard.files}" var="i">
    <img src="/resources/${i.fileName}" alt="공지사항"><br>
    <br>
</c:forEach>


  <div class="col-md-4 text-center col-md-offset-1">
      <button type="button" class="btn btn-primary">수정</button>
      <button type="button" class="btn btn-primary">확인</button>
      <button type="button" class="btn btn-primary">삭제</button>
  </div>
</form>
--%>
</body>
</html>
