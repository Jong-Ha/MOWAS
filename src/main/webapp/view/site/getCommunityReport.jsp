<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-14
  Time: 오후 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
  <title>Get Community Report</title>
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
    <%--background-image: url(https://bootdey.com/img/Content/bg1.jpg);--%>
    background-image: url('/resources/images/pngwing.com.png');
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
    background-color: rgba(231, 219, 224, 0.4);
  }
  .account-block .account-testimonial {
    text-align: center;
    color: #111111;
    position: absolute;
    margin: 0 auto;
    padding: 0 1.75rem;
    top: 10rem;
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
    width: 22ch;
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
      $( "button:contains('처리')" ).on("click" , function() {
        self.location = "/site/updateCommunityReport/${communityReport.reportNo}"
      });

      $( "button:contains('확인')" ).on("click" , function() {
        self.location = "/site/listCommunityReport"
      });

      $( "button:contains('삭제')" ).on("click" , function() {
        self.location = "/site/deleteCommunityReport/${communityReport.reportNo}"
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
        커뮤니티 신고 상세보기</h4>
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
                  <h3 class="h4 font-weight-bold text-theme">커뮤니티 신고 상세 보기</h3>
                </div>

                <h7 class="h5 mb-0">신고 번호</h7>
                <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i>  ${communityReport.reportNo}</p>

                <h7 class="h5 mb-0">신고한 회원 ID</h7>
                <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i>  ${communityReport.reportId}</p>

                <h7 class="h5 mb-0">신고 받은 회원 ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn" style="background-color: #F8CD07;">처리</button></h7>
                <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i>  ${communityReport.reportedId}</p>

                <h7 class="h5 mb-0">신고 날짜</h7>
                <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i>  ${communityReport.reportDate}</p>

                <h7 class="h5 mb-0">신고 상세 내용</h7>
                <p class="text-danger mt-2 mb-3"><i class="bi bi-info-square-fill"></i>  ${communityReport.reportText}</p>

                <button type="button" class="btn" style="background-color: #F8CD07;">확인</button>
                <button type="button" class="btn btn-secondary">삭제</button>

              </div>
            </div>

            <div class="col-lg-6 d-none d-lg-inline-block">
              <div class="account-block rounded-right">
                <div class="overlay rounded-right"></div>
                <div class="account-testimonial">
                  <h4 class="mb-0">게시판 종류</h4>
                  <p class="mt-2 mb-3">
                    <c:choose>
                    <c:when test="${! empty communityReport.boardCategory && communityReport.boardCategory eq '1 '}">
                      ▶ 모임 일정 후기글
                    </c:when>
                    <c:when test="${! empty communityReport.boardCategory && communityReport.boardCategory eq '2 '}">
                      ▶ 모임 일정 후기 쇼츠
                    </c:when>
                    <c:when test="${! empty communityReport.boardCategory && communityReport.boardCategory eq '3 '}">
                      ▶ 우리 동네 게시글
                    </c:when>
                    <c:when test="${! empty communityReport.boardCategory && communityReport.boardCategory eq '10'}">
                      ▶ 댓글
                    </c:when>
                    <c:when test="${! empty communityReport.boardCategory && communityReport.boardCategory eq '11'}">
                      ▶ 대댓글
                    </c:when>
                  </c:choose>
                  </p>
                  <h4 class="mb-0">게시판 제목</h4>
                  <p class="mt-2 mb-3">
                    <c:if test="${villBoard.villTitle ne null}">
                      ▶ ${villBoard.villTitle}
                    </c:if>
                    <c:if test="${villBoard.villTitle == null}">
                      ▶ 게시글을 찾을 수 없습니다.
                    </c:if>
                  </p>

                  <h4 class="mb-0">게시판 내용</h4>
                  <p class="mt-2 mb-3">
                    <c:if test="${villBoard.villText ne null}">
                      ▶ ${villBoard.villText}
                    </c:if>
                    <c:if test="${villBoard.villText == null}">
                      ▶ 게시글을 찾을 수 없습니다.
                    </c:if>
                  </p>

                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- end card-body -->
      </div>
      <!-- end card -->
      <!-- end row -->

    </div>
    <!-- end col -->
  </div>
  <!-- Row -->
</div>
</body>
</html>
