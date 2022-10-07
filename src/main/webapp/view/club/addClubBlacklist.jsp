<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>addClubBlacklist</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".addClubBlacklist").on("click",function(){
                $("form").attr("action","/club/addClubBlacklist").attr("method","post").submit();
            })
        })
    </script>
</head>
<body>
<form>
    <label>
        대상 아이디
        <input type="text" name="userId" value="${userId}">
        <input type="hidden" name="clubNum" value="${clubNum}">
        <br>
        등록 사유
        <input type="text" name="blacklistText" value="">
    </label>
</form>
<input type="button" class="addClubBlacklist" value="블랙리스트 등록">
</body>
</html>
