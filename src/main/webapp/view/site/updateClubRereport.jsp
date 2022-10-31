<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-17
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update Community Report</title>

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <style>
        body{
            margin-top:20px;
            background: #f6f9fc;
            margin-bottom: 40px;
        }
        .account-block {
            padding: 0;
            background-image: url(https://bootdey.com/img/Content/bg1.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            height: 100%;
            position: relative;
        }
        .account-block .overlay {
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.4);
        }
        .account-block .account-testimonial {
            text-align: center;
            color: #fff;
            position: absolute;
            margin: 0 auto;
            padding: 0 1.75rem;
            bottom: 3rem;
            left: 0;
            right: 0;
        }

        .text-theme {
            color: #5369f8 !important;
        }

        .btn-theme {
            background-color: #5369f8;
            border-color: #5369f8;
            color: #fff;
        }

        .wrapper {
            height: 13ch;
            display: grid;
            place-items: center;
        }

        .typing {
            width: 18ch;
            animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;
            white-space: nowrap;
            overflow: hidden;
            border-right: 3px solid;
            font-size: 2em;
            height: 2ch;
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

  <script type="text/javascript">

    //============= 회원정보수정 Event  처리 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
   <%--   $( "button:contains('알림')" ).on("click" , function() {
        self.location = "/deal/notice/${communityReport.reportNo}"
      }); --%>

      $( "button:contains('알림')" ).on("click" , function() {
        self.location = "/site/listCommunityReport"
          //커뮤니티 게시글 확인 컨트롤러 호출
      });

      $( "button:contains('확인')" ).on("click" , function() {
          $("form").attr("method","post").attr("action","/site/listClubReportProcess").submit();

      });

      $( "button:contains('취소')" ).on("click" , function() {
        self.location = "/site/listClubReport"
      });
    });

  </script>
</head>
<body>
<jsp:include page="/layout/toolbar.jsp"/>

<div class="page-header text-center">
    <div class="wrapper">
        <div class="typing">
            <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
                모임 신고 이의 처리</h4>
        </div>
    </div>
</div>
<hr>
<div id="main-wrapper" class="container">
    <div class="row justify-content-center">
        <div class="shadow-lg col-xl-10">
            <div class="card border-0">
                <div class="card-body p-0">
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="mb-5">
                                    <h3 class="h4 font-weight-bold text-theme">모임 이의 신고 처리</h3>
                                </div>

<form class="form-horizontal" name="detailForm">

    <input type="hidden" name="clubReportNo" value="${clubReport.clubReportNo}">

    <h7 class="h5 mb-0">모 임 번 호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn " style="background-color: #F8CD07;">알림</button></h7>
    <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i>  ${clubReport.clubNum}</p>

    <input type="hidden" name="clubNum" value="${clubReport.clubNum}">
    <h7 class="h5 mb-0">모 임 명</h7>
    <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i> ${clubReport.club.clubName}</p>
    <h7 class="h5 mb-0">모임장 아이디</h7>
    <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i> ${clubReport.club.clubMasterId}</p>
    <h7 class="h5 mb-0">신고 날짜</h7>
    <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i> ${clubReport.reportDate}</p>
    <h7 class="h5 mb-0">신고 상세 내용</h7>
    <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i> ${clubReport.reportText}</p>
    <h7 class="h5 mb-0">이의 제출 여부</h7>
    <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i> ${clubReport.rereportApplyCheck}</p>
    <h7 class="h5 mb-0">이의 내용</h7>
    <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i> ${clubReport.rereportText}</p>
    <h7 class="h5 mb-0">관리자아이디</h7>
    <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i> ${clubReport.adminId}</p>
    <h7 class="h5 mb-3">신고 이의 처리</h7>
    <input type="text" class="form-control mt-2 mb-3" name="rereportResult" value="${clubReport.rereportResult}">
    <button type="button" class="btn" style="background-color: #F8CD07;">확인</button>
    <button type="button" class="btn btn-secondary">취소</button>
    </form>
    </div>
      </div>
        <div class="col-lg-6 d-none d-lg-inline-block">
          <div class="account-block rounded-right">
             <div class="overlay rounded-right"></div>
             <div class="account-testimonial">
                <h4 class="text-white mb-4">모임 신고 처리 기준은 다음과 같습니다.</h4>
                <p class="lead text-white">▶ 목적과 다른 모임 - 경고 </p>
                <p class="lead text-white">▶ 상업적 모임 - 경고 </p>
                <p class="lead text-white">▶ 정치적 성향의 모임 - 경고 </p>
                <p class="lead text-white">▶ 도박 모임 - 폐쇄 </p>
                <p class="lead text-white">▶ 다단계 판매 - 폐쇄 </p>
                <h4 class="text-white mb-4">모임 신고 처리 이의기준은 다음과 같습니다.</h4>
                <p class="lead text-white">▶ 사유가 정당할 경우 : 수락 </p>
                <p class="lead text-white">▶ 사유가 황당할 경우 : 거절 </p>
                <p>- Admin -</p>
               </div>
              </div>
             </div>
            </div>

           </div>
         </div>
        </div>
        <!-- end col -->
    </div>
    <!-- Row -->
  </div>
</body>
</html>
