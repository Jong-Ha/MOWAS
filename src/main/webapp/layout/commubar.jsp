<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-10-05
  Time: 오전 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
        $(function () {

            $(".clubCalenderReview").on("click", function () {
                location.href = "/clubCal/listCalenderReview?boardCategory=" + 1
            });

            $(".clubCalenderReviewShort").on("click", function () {
                location.href = "/clubCal/listCalenderReview?boardCategory=" + 2
            })

            $(".villBoard").on("click", function () {
                location.href = "/commu/villBoardList?villCode=" + "창원" + "&boardCategory=" + 3;
            });

            $(".publicText").on("click", function () {
                location.href = "/commu/main"
            });

            $(".clubPage").on("click", function () {
                location.href = "/view/community/clubPage.jsp"
            });

            $(".calender").on("click", function () {
                location.href = "/view/community/calender.jsp";
            })

        });
    </script>

    <style>
        .commuBox {
            margin-bottom: 50px;
            justify-content: center;
        }


    </style>

</head>
<body>

<nav class="shadow-lg navbar navbar-expand-lg bg-light commuBox">

        <button type="button" class="btn btn-outline-primary btnlf publicText">인기 모임글</button>
        <button type="button" class="btn btn-outline-secondary btnlf calender">캘린더</button>
        <button type="button" class="btn btn-outline-warning btnlf clubCalenderReview">모임 일정 후기</button>
        <button class="btn btn-outline-success btnlf clubCalenderReviewShort" type="submit">모임 일정 쇼츠</button>
        <button type="button" class="btn btn-outline-danger btnlf villBoard">우리 동네 게시글</button>
        <button type="button" class="btn btn-outline-danger btnlf clubPage">클럽</button>

</nav>

</body>
</html>
