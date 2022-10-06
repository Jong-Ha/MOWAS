<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>addCluberApply</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".addCluberApply").on("click",function(){
                $("form").attr("action","/club/addCluberApply").attr("method","post").submit();
            })
        })
    </script>
</head>
<body>
<form>
    <label>
        <input type="hidden" name="clubNum" value="${club.clubNum}">
        userId : ${user.userId}<br>
        clubName : ${club.clubName}<br>
        cluberText : <input type="text" name="cluberText" value=""><br>
        <input type="button" class="addCluberApply" value="모임 가입 신청">
    </label>
</form>
</body>
</html>
