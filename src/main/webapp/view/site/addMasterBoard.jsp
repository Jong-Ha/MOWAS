<%--
  Created by IntelliJ IDEA.
  Date: 2022-10-12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Add MasterBoard</title>
  <!-- include libraries(jQuery, bootstrap) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

  <!--  ///////////////////////// CSS ////////////////////////// -->
  <style>
    body {
      padding-top: 50px;
    }
    .wap {
      width: 700px;
      font-size: 0.9em;
    }
    .check {
      height: 20px;
      width: 35px;
    }
  </style>

    <script type="text/javascript">
      $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $( "button.btn.btn-primary" ).on("click" , function() {

            $("form").attr("method" , "POST").attr("action" , "/site/addMasterBoard").submit();
        });
      });

      $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("a[href='#' ]").on("click" , function() {
          $("form")[0].reset();
        });
      });

    </script>


</head>
<body>

  <form enctype="multipart/form-data">
    <div class="wap">
      <div class="container">
    <!--<form class="form-horizontal" name="detailForm">-->
       <%--<input type="hidden" name="adminId" value="${user.userId}">--%>
        <input type="hidden" name="adminId" value="admin">

        <div class="page-header">
          <h3 class=" text-info">공지 사항 작성</h3>
        </div>

        <div class="row">
          <div class="col-xs-4 col-xs-2"><strong>제 목</strong></div>
          <div class="col-xs-8 col-xs-4">
            <input type="text" class="form-control mbTitle" name="mbTitle" value=""/>
          </div>
        </div>

        <hr/>
           <h6>카테고리 선택</h6>

          <ul>

              <input type="radio" id="f-option" name="mbCategory" value = '1'>
              <label for="f-option">회원</label>

              <div class="check"></div>

              <input type="radio" id="s-option" name="mbCategory" value = '2'>
              <label for="s-option">모임</label>

              <div class="check"><div class="inside"></div></div>

              <input type="radio" id="t-option" name="mbCategory" value = '3'>
              <label for="t-option">신고</label>

              <div class="check"><div class="inside"></div></div>

          </ul>
        </div>
      <hr/>

      <div class="row">
        <div class="col-xs-4 col-xs-2"><strong>내 용</strong></div>
        <div class="col-xs-8 col-xs-4">
                    <textarea class="form-control mbText" name="mbText"
                              style=" height: 200px;  width: 500px; margin-left: 10px; margin-bottom: 20px;"></textarea>
        </div>
      </div>

      <hr/>

      <div class="row">
        <div class="col-xs-4 col-xs-2 ">
          <strong> 파 일
            <input id="file" type="file" multiple class="file" value="파일 첨부">
          </strong>
        </div>
      </div>

      <hr/>

      <div class="row">

  <div class="col-md-12 text-center ">
    <button type="button" class="btn btn-primary btn-lg submit" >등 록</button>
    <a class="btn btn-primary btn" href = "#" role="button">취 소 </a>
  </div>
      </div>

      <br/>
    </div>

    </form>

</body>
</html>
