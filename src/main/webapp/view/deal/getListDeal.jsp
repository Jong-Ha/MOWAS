<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 903-9
  Date: 2022-10-06
  Time: ���� 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">

<head>
  <meta charset="EUC-KR">

  <!-- ���� : http://getbootstrap.com/css/   ���� -->
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

    //============= "����"  Event ���� =============
    $(function() {
      //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( "button.btn.btn-primary" ).on("click" , function() {
        fncAddUser();
      });
    });


    //============= "���"  Event ó�� ��  ���� =============
    $(function() {
      //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("a[href='#' ]").on("click" , function() {
        $("form")[0].reset();
      });
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

<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<h1>�Խñ� ����</h1>
<form method="POST">
  <input type="hidden" name="user.userId"/>
  <div class="form-group">
    <div class="col-sm-2">
      <select class="form-control" name="board_category" id="board_category">
        <option value="8" >�Ǹ�</option>
        <option value="9" >�Ǹſ�û</option>
      </select>
    </div>
  </div>
  <p><input type="submit" value="����" />
</form>
</body>

</html>