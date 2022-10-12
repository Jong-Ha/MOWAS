<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>getClubMasterBoard</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateClubMasterBoard").on("click",function(){
                location.href="/club/updateClubMasterBoard/${clubMasterBoard.boardNum}"
            })
            $(".deleteClubMasterBoard").on("click",function(){
                location.href="/club/deleteClubMasterBoard/${clubMasterBoard.boardNum}/${clubMasterBoard.clubNum}"
            })
        })
    </script>
</head>
<body>
<c:forEach items="${clubMasterBoard.files}" var="i">
    <img src="/resources/${i.fileName}" alt="모임 공지사항"><br>
    <br>
</c:forEach>
${clubMasterBoard}
<input type="button" class="updateClubMasterBoard" value="수정">
<input type="button" class="deleteClubMasterBoard" value="삭제">
</body>
</html>
