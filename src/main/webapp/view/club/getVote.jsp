<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>getCluber</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            <%--$(".addVoter").on("click",function(){--%>
            <%--    location.href="/club/addVoter/${cluber.clubUserNum}"--%>
            <%--})--%>
            <%--$(".updateVoter").on("click",function(){--%>
            <%--    location.href="/club/updateVoter/${cluber.clubUserNum}"--%>
            <%--})--%>
            <%--$(".endVote").on("click",function(){--%>
            <%--    location.href="/club/endVote/${cluber.clubUserNum}"--%>
            <%--})--%>


            $(".updateVote").on("click",function(){
                location.href="/club/updateVote/${voteNum}"
            })
            $(".listVote").on("click",function(){
                <%--location.href="/club/listVote/${roomId}"--%>
                location.href="/club/listVote/${vote.roomId}"
            })
        })
    </script>
</head>
<body>
${vote}<br><br>
<input type="button" class="addVoter" value="투표 하기">
<input type="button" class="updateVoter" value="다시 투표 하기">
<input type="button" class="updateVote" value="투표 수정">
<input type="button" class="endVote" value="투표 마감">
<input type="button" class="listVote" value="투표 목록">
</body>
</html>
