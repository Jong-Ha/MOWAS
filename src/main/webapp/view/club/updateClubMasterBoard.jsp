<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>updateClubMasterBoard</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateClubMasterBoard").on("click",function(){
                $("form").attr("method","post").attr("action","/club/updateClubMasterBoard").submit()
            })
        })
    </script>
</head>
<body>
<form>
    <label>
        <input type="hidden" name="boardNum" value="${clubMasterBoard.boardNum}">
        제목<input type="text" name="title" value="${clubMasterBoard.title}"><br>
        내용<input type="text" name="text" value="${clubMasterBoard.text}"><br>
        파일<input type="text" name="fileName" value="${clubMasterBoard.files[0].fileName}"><br>
        파일<input type="text" name="fileName" value="${clubMasterBoard.files[1].fileName}"><br>
        파일<input type="text" name="fileName" value="${clubMasterBoard.files[2].fileName}"><br>
        파일<input type="text" name="fileName" value="${clubMasterBoard.files[3].fileName}"><br>
        파일<input type="text" name="fileName" value="${clubMasterBoard.files[4].fileName}"><br>
        알림<input type="checkbox" name="noticeSendCheck"><br>
    </label>
</form>
<input type="button" class="updateClubMasterBoard" value="모임 공지사항 수정">
</body>
</html>
