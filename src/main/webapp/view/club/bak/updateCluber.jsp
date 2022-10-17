<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>updateCluber</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateCluber").on("click",function(){
                $("form").attr("action","/club/updateCluber").attr("method", "post").submit();
            })
        })
    </script>
</head>
<body>
<form>
    <label>
        자기소개
        <input type="hidden" name="clubUserNum" value="${cluber.clubUserNum}">
        <input type="text" name="cluberText" value="${cluber.cluberText}">
    </label>
</form>
<input type="button" class="updateCluber" value="자기소개 수정">
</body>
</html>
