<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 903-9
  Date: 2022-10-06
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
  <meta charset="EUC-KR">

  <!-- 참조 : http://getbootstrap.com/css/   참조 -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

  <!--  ///////////////////////// CSS ////////////////////////// -->
  <style>
    body > div.container{
      border: 3px solid #D6CDB7;
      margin-top: 10px;
    }
  </style>

  <!--  ///////////////////////// JavaScript ////////////////////////// -->
  <script type="text/javascript">

    // ============= "가입"  Event 연결 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( "button.btn.btn-primary" ).on("click" , function() {
        self.location = "/deal/getDeal?dealBoardNum="+$(this).children().val();
      });
      $(".dealLogin").on("click",function(){
        location.href="/deal/login?userId="+$("input[name='userId']").val()
      })


    });


    // $(function() {
    //   //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
    //   $( .addDeal ).on("click" , function() {
    //     self.location = "/deal/dd="+$(this).children().val();
    //   });
    // });

    // //============= "취소"  Event 처리 및  연결 =============
    // $(function() {
    //   //==> 추가된부분 : "addUser"  Event 연결
    //   $("a[href='#' ]:contains('상세 보기')").on("click", function() {
    //     self.location = "/deal/getDeal?dealBoardNum="+$(this).children().val();
    //   });
    // });
    $(function () {
      $(".deal").on("click", function () {
        location.href = "/deal/getListDeal?boardCategory=08";
      });

      $(".dealRequest").on("click", function () {
        location.href = "/deal/getListDeal?boardCategory=09";
      })
    });
  </script>



</head>

<body>

<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-default">
  <div class="container">
    <a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
  </div>
</div>
<!-- ToolBar End /////////////////////////////////////-->
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
          <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제품명</option>
          <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>태그</option>
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

<!--  화면구성 div Start /////////////////////////////////////-->


  <div class="form-group">
    <div class="col-sm-2">
      <button type="button" class="deal">판매</button>
      <button type="button" class="dealRequest">판매요청</button>

    </div>
  </div>
  <table class="table table-hover table-striped" >

    <thead>
    <tr>
      <th align="left">번호</th>
      <th align="left">제목</th>
      <th align="left">내용</th>
    </tr>
    </thead>

    <tbody>

    <c:set var="i" value="0" />
    <c:forEach items="${list}" var="deal">

    <tr>

      <td align="left">   ${deal.dealBoardNum}</td>
      <td align="left">    ${deal.dealTitle}</td>
      <td align="left">    ${deal.dealText}</td>
      <td align="left"><a href="/deal/getDeal/${deal.dealBoardNum}">상세보기</a></td>

    </c:forEach>
      <a href="/deal/addDeal"> <input type="button" class="addDeal" value="거래 만들기"></a>
    </tbody>

  </table>
<input type="button" class="clubLogin" value="로그인">
<label>
  아이디 : <input type="text" name="userId" value="">
</label>
${user.userId}
</body>

</html>