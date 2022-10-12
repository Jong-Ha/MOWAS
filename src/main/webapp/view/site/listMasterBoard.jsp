
<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-12
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List MasterBoard</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        body {
            padding-top : 50px;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        function fncGetMasterBoardList(currentPage) {
            /* 	document.getElementById("currentPage").value = currentPage;
                   document.detailForm.submit();	 */
            $("#currentPage").val(currentPage)
            $("form").attr("method" , "POST").attr("action" , "/site/listMasterBoard").submit();
        }


        $(function() {

            //==> 검색 Event 연결처리부분
            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            //==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.

            //$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
            $( "button.btn.btn-default" ).on("click" , function() {
                fncGetMasterBoardList(1);
            });

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $( "button.btn.btn-primary" ).on("click" , function() {

                $(self.location).attr("href", "/site/addMasterBoard");
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
        <h3>공지사항</h3>
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
                        <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>공지번호</option>
                        <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>공지제목</option>
                        <option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>공지내용</option>
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
    <table class="table table-hover table-striped" >

        <thead>

        <tr>

            <th align="left">No</th>
            <th align="left" >제목</th>
            <th align="left">내용</th>
            <th align="left">작성자</th>
            <th align="left">날짜</th>

        </tr>
        </thead>

        <tbody>

        <c:set var="i" value="0" />
        <c:forEach var="mb" items="${list}">
            <c:set var="i" value="${ i+1 }" />
            <tr>
                <td align="center">${ i }</td>
                <td align="left"  title="Click : 제목">
                ${mb.mbTitle}
                    <input id="mbNo" type="hidden" value="${mb.masterBoardNo }"/>
                </td>
                <td align="left">${mb.mbText}</td>
                <td align="left">${mb.adminId}</td>
                <td align="left">${mb.mbRegDate}</td>
            </tr>
        </c:forEach>

        </tbody>


    </table>
    <!--  table End /////////////////////////////////////-->

    <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
        <span class="paging">${i}</span>
    </c:forEach>
    </div>

    <div class="col-md-12 text-center ">
        <button type="button" class="btn btn-primary" >추 가</button>
        <a class="btn btn-default btn" href = "#" role="button">취 소 </a>
    </div>

    </body>
</html>
