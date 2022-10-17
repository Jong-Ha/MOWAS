<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>listCalendarCluber</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".addVote").on("click",function(){
                location.href="/club/addVote/${roomId}"
            })
            $(".getChat").on("click",function(){
                location.href="/club/getClub/10000"
            })
        })
    </script>
</head>
<body>
<c:forEach items="${list}" var="vote">
    <div>
        <a href="/club/getVote/${vote.voteNum}">${vote}</a>
        <br/>
        <br/>
    </div>
</c:forEach>
<input type="button" class="addVote" value="투표 등록">
<input type="button" class="getChat" value="채팅방으로">
</body>
</html>
