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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <title>Bootstrap Example</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
  <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

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
      $(".paging").on("click",function(){

        $("#currentPage").val($(this).text())
        $("form").submit()
      })
      $("form").on("submit",function(){


        $(this).attr("action","/deal/getListDeal?${deal.boardCategory}").attr("method","post")
      })


      // //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      // $( "button.btn.btn-primary" ).on("click" , function() {
      //   self.location = "/deal/getDeal?dealBoardNum="+$(this).children().val();
      // });
      // $(".dealLogin").on("click",function(){
      //   location.href="/deal/login?userId="+$("input[name='userId']").val()
      // })


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

         location.href = "/deal/getListDeal?boardCategory="+$(".deal").val();

        //$(this).attr("action","/deal/getListDeal/08").attr("method","post")
      });

      $(".dealRequest").on("click", function () {
        alert($(".dealRequest").val());
        location.href = "/deal/getListDeal?boardCategory="+$(".dealRequest").val();

       // $(this).attr("action","/deal/getListDeal/09").attr("method","post")
      })
      $(".dealBox").on('click', function (e) {
        alert("hi")
        var dealBoardNum= $(this).find(".dealBoardNum").val()
        alert(dealBoardNum);
        location.href = "/deal/getDeal/"+dealBoardNum;

      })
      $(".addDeal").on("click", function () {
        location.href = "/deal/addDeal"
      })
    });
  </script>


  <style>
    .body {
      text-align: -webkit-center;
    }

    .wap {
      width: 1000px;
    }

    .carditem {
      height: 210px;
      display: flex;
      flex-direction: column;
    }

    .card-title {
      width: 250px;
      font-size: 1.2em;
    }

    .cardbox {
      display: flex;
      flex-direction: row;
      margin: 6px;
      float: left;
    }

    button.buttonBox {
      font-size: 0.7em;
      /* float: left; */
      /* size: b4; */
      height: 25px;
      width: 5px;
    }

    .col.dealBox {
      width: 320px;
    }

    .add {
      /*margin-right: 800px;*/
      margin-bottom: 50px;
    }

    .card-img-top {
      text-align: center;
      width: 100%;
      height: 200px;
    }

    .card-img-top > img {
      object-fit: contain;
      width: 100%;
      height: 100%;
    }

    svg {
      font-size: 40px;
    }

    .dealTag {
      height: 210px;
      --bs-btn-color: #000000;
      --bs-btn-border-color: #000000;
      --bs-btn-hover-color: #000000;
      --bs-btn-hover-bg: #fff;
      --bs-btn-hover-border-color: #000000;
      --bs-btn-focus-shadow-rgb: 13,110,253;
      --bs-btn-active-color: #000000;
      --bs-btn-active-bg: #fff;
      --bs-btn-active-border-color: #000000;
      --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
      --bs-btn-disabled-color: #000000;
      --bs-btn-disabled-bg: transparent;
      --bs-btn-disabled-border-color: #000000;
      --bs-gradient: none;
    }

  </style>

</head>


<!-- ToolBar Start /////////////////////////////////////-->

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

<input type="button" class="Login" value="로그인">
<label>
  아이디 : <input type="text" name="userId" value="user01">
</label>
${user.userId}
<!-- Example Code -->
<div class="wap">

  <%--상단 툴바--%>
  <jsp:include page="/layout/toolbar.jsp"/>

  <div class="add" style="display:flex;justify-content: space-between;align-items: center;">
    <button class="btn btn-primary addDeal">
      거래 만들기
    </button>
    <div>
      <button class="btn btn-primary deal" value="08">
        판매
      </button>
      <button class="btn btn-primary dealRequest" value="09">
        판매요청
      </button>
      <button class="btn btn-primary searchTag">
        태그
      </button>
    </div>
  </div>



    <c:forEach var="deal" items="${list}">

      <div class="row row-cols-1 row-cols-md-3 g-4 cardbox">
        <div class="col dealBox">
          <input type="hidden" name="dealBoardNum" class="dealBoardNum" value="${deal.dealBoardNum}">
          <div class="card h-100">
<%--            <c:forEach var="File" items="${Deal.files}">--%>
<%--              <div class="carousel-inner">--%>
<%--                <div class="carousel-item active get">--%>
<%--                  <img class="poto" width="100%" height="100%"  src="/resources/${File.fileName }" alt="any">--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </c:forEach>--%>


  <div class="card-img-top" style="cursor: pointer">
    <img src="/resources/${deal.files[0].fileName}" alt="거래이미지">
  </div>



            <div class="card-body carditem">
              <h3 class="card-title">${deal.dealTitle}</h3>
              <div class="row g-3">
                <div class="col-6">
                  <div class="badge bg-primary text-wrap" style="width: 6rem;">
                      <c:if test="${deal.dealStatus == 0}">
                            거래전
                      </c:if>
                    <c:if test="${deal.dealStatus ==1}">
                      거래중
                    </c:if>
                    <c:if test="${deal.dealStatus ==2}">
                      거래완료
                    </c:if>
                  </div>
                  <div class="badge bg-primary text-wrap" style="width: 6rem;">
                      ${deal.villCode}
                  </div>
                  <div class="badge bg-primary text-wrap" style="width: 6rem;">
                  ${deal.price}
                  </div>
                </div>

              </div>
              <button type="button" class="btn btn-outline-primary dealTag">${deal.tag}</button>
            </div>

              <%--<div class="card-footer">
                  <small class="text-muted">Last updated 3 mins ago</small>
              </div>--%>
          </div>
        </div>
      </div> </c:forEach>



  </div>


</body>


</html>



<%--<jsp:include page="/layout/toolbar.jsp"/>--%>

<%--<form>--%>
<%--<div class="form-group">--%>
<%--  <nav class="shadow-lg navbar navbar-expand-lg bg-light commuBox">--%>

<%--    <button type="button" class="btn btn-outline-primary btnlf deal" value="08">판매</button>--%>
<%--    <button type="button" class="btn btn-outline-secondary btnlf dealRequest" value="09">판매요청</button>--%>
<%--  </nav>--%>

<%--</div>--%>

<%--  <table class="table table-hover table-striped" >--%>

<%--    <thead>--%>
<%--    <tr>--%>
<%--      <th align="left">번호</th>--%>
<%--      <th align="left">제목</th>--%>
<%--      <th align="left">내용</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>

<%--    <tbody>--%>

<%--    <c:set var="i" value="0" />--%>
<%--    <c:forEach items="${list}" var="deal">--%>

<%--    <tr>--%>
<%--      <input type="hidden" name="dealBoardNum" value="${deal.dealBoardNum}">--%>
<%--      <td align="left">   ${deal.dealBoardNum}</td>--%>
<%--      <td align="left">    ${deal.dealTitle}</td>--%>
<%--      <td align="left">    ${deal.dealText}</td>--%>
<%--      <td align="left"><a href="/deal/getDeal/${deal.dealBoardNum}">상세보기</a></td>--%>

<%--      </c:forEach>--%>
<%--      <a href="/deal/addDeal"> <input type="button" class="addDeal" value="거래 만들기"></a>--%>
<%--    </tbody>--%>

<%--  </table>--%>
<%--  <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">--%>
<%--    <span class="paging">${i}</span>--%>
<%--  </c:forEach>--%>
<%--  <label>--%>
<%--    <input type="hidden" id="currentPage" name="currentPage" value="1">--%>
<%--    <input type="text" name="searchKeyword" value="${search.searchKeyword}">--%>
<%--  </label>--%>
<%--  <input type="submit" value="검색">--%>
<%--</form>--%>




<%--<input type="button" class="clubLogin" value="로그인">--%>
<%--<label>--%>
<%--  아이디 : <input type="text" name="userId" value="">--%>
<%--</label>--%>
<%--${user.userId}--%>

<%--</body>--%>


<%--</html>--%>