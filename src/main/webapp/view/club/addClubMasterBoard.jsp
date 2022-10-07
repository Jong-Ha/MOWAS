<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>addClubMasterBoard</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".addClubMasterBoard").on("click",function(){
                $("form").attr("method","post").attr("action","/club/addClubMasterBoard").submit()
            })
        })
    </script>
</head>
<body>
<form>
    <label>
        <input type="hidden" name="clubNum" value="${clubNum}">
        <input type="hidden" name="userId" value="${user.userId}">
        제목<input type="text" name="title" value=""><br>
        내용<input type="text" name="text" value=""><br>
        파일<input type="text" name="fileName" value=""><br>
        파일<input type="text" name="fileName" value=""><br>
        파일<input type="text" name="fileName" value=""><br>
        파일<input type="text" name="fileName" value=""><br>
        파일<input type="text" name="fileName" value=""><br>
        알림<input type="checkbox" name="noticeSendCheck"><br>
    </label>
</form>
<input type="button" class="addClubMasterBoard" value="모임 공지사항 작성">
</body>
</html>
