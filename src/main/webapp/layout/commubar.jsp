<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-10-05
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <title>Bootstrap Example</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

  <script type="text/javascript">
    $(function () {

      $(".villBoard").on("click", function () {
        alert("우리 동네 게시판으로 이동");
        location.href = "/commu/villBoardList?villCode="+"창원";
      });

      $(".clubCalenderReview").on("click", function () {
        alert("모임 일정 후기글 게시판으로 이동")
        location.href = "/clubCal/listCalenderReview?boardCategory="+1
      });

      $(".clubCalenderReviewShort").on("click", function () {
        alert("모임 일정 쇼츠 게시판으로 이동")
        location.href = "/clubCal/listCalenderReview?boardCategory="+2
      })

      $(".publicText").on("click", function () {
        alert("인기글 목록으로 이동");
        location.href = "/commu/"
      });

      $(".clubPage").on("click", function () {
        location.href = "/view/community/clubPage.jsp"
      });

      $(".calender").on("click", function () {
        location.href="/view/community/calender.jsp";
      })

    });
  </script>

  <style>
  .commuBox{
    margin-bottom: 50px;
    justify-content: center;
  }

  </style>

</head>
<body>

<nav class="shadow-lg navbar navbar-expand-lg bg-light commuBox">
  <button type="button" class="btn btn-primary btnlf publicText">인기 모임글</button>
  <button type="button" class="btn btn-outline-secondary btnlf calender">캘린더</button>
  <button type="button" class="btn btn-outline-warning btnlf clubCalenderReview">모임 일정 후기</button>
  <button class="btn btn-outline-success btnlf clubCalenderReviewShort" type="submit">모임 일정 쇼츠</button>
  <button type="button" class="btn btn-outline-danger btnlf villBoard">우리 동네 게시글</button>
  <button type="button" class="btn btn-outline-danger btnlf clubPage">클럽</button>

</nav>

</body>
</html>
