
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
    <title>List Community Report Process</title>
    <!-- Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">

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

        function fncGetClubReportProcessList(currentPage) {
            /* 	document.getElementById("currentPage").value = currentPage;
                   document.detailForm.submit();	 */
            var clubNum = $(this).data('param1');
            $("#currentPage").val(currentPage)
            $("form").attr("method" , "POST").attr("action" , "/site/listClubReportProcess?clubNum="+clubNum).submit();
        }


        $(function() {

            //==> 검색 Event 연결처리부분
            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            //==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.

            //$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
            $( ".listCrProcess" ).on("click" , function() {

                fncGetClubReportProcessList(1);
            });

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)


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
        <h3>모임 신고 처리 리스트</h3>
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

                <button type="button" class="btn btn-default">검색</button>

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
                <th width="10%" >모임 번호</th>
                <th width="20%">모임명</th>
                <th width="15%">모임장 아이디</th>
                <th width="15%">이의제출여부</th>
                <th width="15%">신고날짜</th>
                <th width="15%">처리결과</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="i" value="0" />
            <c:forEach var="cr" items="${list}">
                <c:set var="i" value="${ i+1 }" />
                <tr>
                    <td><a href="/site/getClubReport/${cr.clubReportNo}">${ i }</a>
                        <input id="crNo" type="hidden" value="${cr.clubReportNo }"/>
                     </td>
                    <td>${cr.clubNum}
                        <input id="clubNo" type="hidden" data-param1="${cr.clubNum}"/>
                    </td>
                    <td>${club.clubName}</td>
                    <td>${club.clubMasterId}</td>
                    <td>${cr.rereportApplyCheck}</td>
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
        <button type="button" class="listCrProcess" >확인</button>
        <a class="btn btn-default btn" href = "#" role="button">취 소 </a>
    </div>

    </body>
</html>
