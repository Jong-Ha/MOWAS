
<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-12
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>List MasterBoard</title>
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        .container {
            width: 70%;
            margin: 0 auto;			/* 가로로 중앙에 배치 */
            padding-top: 10%;		/* 테두리와 내용 사이의 패딩 여백 */
        }

        #list {
            text-align: center;
        }

        #write {
            text-align: right;
        }

        /* Bootstrap 수정 */
        .table > thead {
            background-color: #b3c6ff;
        }
        .table > thead > tr > th {
            text-align: center;
        }
        .table-hover > tbody > tr:hover {
            background-color: #e6ecff;
        }
        .table > tbody > tr > td {
            text-align: center;
        }
        .table > tbody > tr > #title {
            text-align: left;
        }

        div > #paging {
            text-align: center;
        }

        .hit {
            animation-name: blink;
            animation-duration: 1.5s;
            animation-timing-function: ease;
            animation-iteration-count: infinite;
            /* 위 속성들을 한 줄로 표기하기 */
            /* -webkit-animation: blink 1.5s ease infinite; */
        }

        /* 애니메이션 지점 설정하기 */
        /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
        @keyframes blink {
            from {color: white;}
            30% {color: yellow;}
            to {color: red; font-weight: bold;}
            /* 0% {color:white;}
            30% {color: yellow;}
            100% {color:red; font-weight: bold;} */
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        function fncGetClubReportList(currentPage) {
            /* 	document.getElementById("currentPage").value = currentPage;
                   document.detailForm.submit();	 */
            $("#currentPage").val(currentPage)
            $("form").attr("method" , "POST").attr("action" , "/site/listClubReport?clubNum=${param.clubNum}").submit();
        }


        $(function() {

            //==> 검색 Event 연결처리부분
            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            //==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.

            //$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
            $( "button.btn.btn-default" ).on("click" , function() {
                fncGetClubReportList(1);
            });

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $( ".addCr" ).on("click" , function() {
               $("form").attr("method" , "POST").attr("action" , "/site/addClubReport").submit();
            });

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $("a[href='#' ]").on("click" , function() {
                $("form")[0].reset();
            });
        });

    </script>

</head>

<body>
<div class="container">

    <div class="page-header text-info">
        <h3>모임 신고 리스트</h3>
    </div>

    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
    <div class="row">

        <div class="col-md-6 text-left">
            <p class="text-primary">
                전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
            </p>
        </div>

        <div class="col-md-6 text-right">
            <form class="form-inline" name="detailForm">

                <div class="form-group">
                    <select class="form-control" name="searchCondition" >
                        <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>번호</option>
                        <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
                        <option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>내용</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="sr-only" for="searchKeyword">검색어</label>
                    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
                           value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
                </div>

                <button type="submit" class="btn btn-secondary">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
                    <input type="hidden" id="currentPage" name="currentPage" value=""/>

            </form>
        </div>

    </div>
    <!-- table 위쪽 검색 Start /////////////////////////////////////-->


    <!--  table Start /////////////////////////////////////-->
    <table class="table table-hover table-striped table-bordered" >
        <thead>
            <tr>
                <th width="10%">번호</th>
                <th width="30%" >모임 번호</th>
                <th width="20%">모임신고기준</th>
                <th width="15%">신고한 아이디</th>
                <th width="15%">신고날짜</th>
                <th width="10%">처리여부</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="i" value="0" />
            <c:forEach var="cr" items="${list}">
                <c:set var="i" value="${ i+1 }" />
                <tr>
                    <td><a href="/site/getClubReport/${cr.clubReportNo}/${cr.clubNum}">${ i }</a>
                        <input id="crNo" type="hidden" value="${cr.clubReportNo }"/>
                        <input type="hidden" name="clubNum" value="${cr.clubNum}"></td>
                    </td>
                    <td>${cr.clubNum}
                    <td>${cr.crBasis}</td>
                    <td>${cr.reportId}</td>
                    <td>${cr.reportDate}</td>
                    <td>${cr.reportResult}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!--  table End /////////////////////////////////////-->

    <div id ="paging">
        <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
            <span class="paging">${i}</span>
        </c:forEach>
    </div>
    </div>

    <div class="col-md-12 text-center ">
        <button type="button" class="newCr btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addClubReport">
        신고 </button>
        <a class="btn btn-default btn" href = "#" role="button">취 소 </a>
    </div>

<%-- 모달창 시작--%>
<div class="modal model-center fade" id="addClubReport" tabindex="-1" aria-labelledby="addCrLabel" aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" >
                <h3 class="modal-title text-danger fs-5" id="addCrLabel">모임 신고</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="addCrForm" enctype="multipart/form-data">

                    <input type="hidden" name="clubNum" value="10000">
                    <input type="hidden" name="reportId" value="user01">

                      <div class="input-group mb-3 mt-3">
                        <div class="form-floating">
                            <select class="form-select" id="crBasis" name="crBasis" required>
                                <option value="0" selected>선택하세요</option>
                                <option value="1">목적과 다른 모임</option>
                                <option value="2">상업적 모임</option>
                                <option value="3">정치적 성향의 모임</option>
                                <option value="4">도박 모임</option>
                                <option value="5">다단계 판매</option>
                            </select>
                            <label for="crBasis">카테고리</label>
                        </div>
                    </div>

                    <div class="input-group mb-3 mt-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id=reportText name="reportText" placeholder="상세신고내용"
                                   required>
                            <label for="reportText">상세신고내용</label>
                        </div>
                    </div>

                    <div class="mb-3 mt-3">
                        <label for="file" class="form-label" style="display: none"></label>
                        <input class="form-control" type="file" id="file" name="file">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger addCr" data-bs-dismiss="modal" style="margin-right: 185px">신 고</button>
            </div>
        </div>
    </div>
</div>
<%-- 모달창 끝--%>
</body>
</html>
