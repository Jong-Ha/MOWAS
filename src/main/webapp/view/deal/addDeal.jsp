<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 903-9
  Date: 2022-10-06
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


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

    //============= "가입"  Event 연결 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( "button.btn.btn-primary" ).on("click" , function() {
        fncAddUser();
      });
    });


    //============= "취소"  Event 처리 및  연결 =============
    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("a[href='#' ]").on("click" , function() {
        $("form")[0].reset();
      });
    });

    function fncAddUser() {
        $("form").attr("method" , "POST").attr("action" , "/deal/addDeal").submit();
    }
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

<!--  화면구성 div Start /////////////////////////////////////-->
<h1>게시글 생성</h1>
<form method="POST">
 <input type="hidden" name="user.userId"/>
  <div class="form-group">
    <div class="col-sm-2">
      <select class="form-control" name="board_category" id="board_category">
        <option value="8" >판매</option>
        <option value="9" >판매요청</option>
      </select>
    </div>
  </div>
  <p>제목 : <input type="text" name="deal_title" /></p>
  <p>카테고리 : <input type="text" name="board_category" /></p>
  <p>가격 : <input type="text" name="price" /></p>
  <p>상품명 : <input type="text" name="product_name" /></p>
  <p>내용 : <input type="text" name="deal_text" /></p>
  <p>태그 : <input type="text" name="tag" /></p>
  <p><input type="submit" value="저장" class="btn btn-primary"/>
</form>
</body>

</html>