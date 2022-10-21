<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-09-29
  Time: 오후 6:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.project.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
  <script type="text/javascript" src="/resources/OpenSource/js/jquery.cookie.js"></script>
<script type="text/javascript">

  $(function () {
    $("#login1").on("click", function () {
        self.location = "/view/user/login.jsp";
    });
  });
  $(function () {
    $("#logout").on("click", function () {
      self.location = "/user/logout";
    });
  });
  $(function () {
    $("#myPage").on("click", function () {
      var userId = $("#modelUser").val();
      self.location = "/myPage/getMyPage?userId="+userId;
    });
  });
</script>
<html>
<head>
    <title>Title</title>

  <style>
    .topbar{
      margin-bottom: 70px;
    }
    .navbar{
      justify-content: center;
    }
    .btnlf{
      margin-left: 20px;

    }
    .textint{
      font-size: 0.2em;
      margin-top: -20px;
    }
    .login{
      float: left;
      margin-right: 20px;
    }
    .alrim{
      font-size: 0.1rem;
      width: 45px;
    }
    .loginbox{
      width: 80px;
      font-size: 0.1rem;
    }

  </style>
</head>
<body>
<div class="topbar">
  <nav class="shadow-lg navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar scroll</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarScroll">
        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Link
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled">Link</a>
          </li>
        </ul>
        <img src="${pageContext.request.contextPath}/resources/images/pngwing.png" style="width: 30px; margin-right: 10px;">
        <div class="login">
          <div class="d-grid gap-2">
            <%
              User users =(User)session.getAttribute("user");

              if(users==null){%>
            <button type="button" class="btn btn-outline-primary btnlf loginbox" id="login1" style="font-size: 0.5em;">로그인</button>
            <%}else{%>
            <button type="button" class="btn btn-outline-primary btnlf loginbox" id="logout">로그아웃</button>
            <button class="btn btn-outline-success btnlf loginbox" style="font-size: 0.5em;" id="myPage" type="button">마이페이지</button>
            <%}%>


          </div>
        </div>
      </div>
      <div><input type="hidden" id="modelUser" name="userId" value="${user.userId}"></div>
      <div style="display: none">
        <input type="checkbox" id="keepId" name="keepId" value="$.cookie('keepId')">
        <input type="checkbox" id="keepLogin" name="keepLogin" value="${user.userId}">
      </div>
    </div>
        <button type="button" class="btn btn-primary position-relative alrim" style="font-size: 0.5em;">
          Inbox
          <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
          99+</span>

        </button>
  </nav>
  </div>
    </div>
</div>

</body>
</html>
