<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>addCluberApply</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateCluberApply").on("click",function(){
                $("form").attr("action","/club/updateCluberApply").attr("method","post").submit();
            })
            $(".deleteCluberApply").on("click",function(){
                $("form").attr("action","/club/deleteCluberApply").attr("method","post").submit();
            })
        })
    </script>
</head>
<body>
<form>
    <label>
        <input type="hidden" name="clubUserNum" value="${cluber.clubUserNum}">
        <input type="hidden" name="clubNum" value="${club.clubNum}">
        userId : ${user.userId}<br>
        clubName : ${club.clubName}<br>
        cluberText : <input type="text" name="cluberText" value="${cluber.cluberText}"><br>
        <input type="button" class="updateCluberApply" value="모임 가입 수정">
        <input type="button" class="deleteCluberApply" value="모임 가입 삭제">
    </label>
</form>
</body>
</html>
