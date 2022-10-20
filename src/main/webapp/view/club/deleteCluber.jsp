<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>deleteCluber</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".deleteCluber").on("click",function(){
                $("form").attr("action","/club/deleteCluber").attr("method","post").submit();
            })
        })
    </script>
</head>
<body>
<form>
    <label>
        <input type="hidden" name="kickoutCheck" value="${kickoutCheck}">
        <input type="hidden" name="clubUserNum" value="${cluber.clubUserNum}">
        <input type="hidden" name="clubNum" value="${cluber.clubNum}">
        <input type="hidden" name="userId" value="${cluber.user.userId}">
        userId : ${cluber.user.userId}
        강퇴사유<input type="text" name="clubOutText">
    </label>
</form>
<input type="button" class="deleteCluber" value="탈퇴">
</body>
</html>
