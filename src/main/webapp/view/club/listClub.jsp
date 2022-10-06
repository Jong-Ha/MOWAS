<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".addClub").on("click",function(){
                location.href="/club/addClub"
            })
            $(".clubLogin").on("click",function(){
                location.href="/club/login?userId="+$("input[name='userId']").val()
            })
        })
    </script>
</head>
<body>
<c:forEach items="${list}" var="club">
    <a href="/club/getClub/${club.clubNum}">${club}</a>
    <br/>
    <br/>
</c:forEach>

<input type="button" class="addClub" value="모임 만들기">
<input type="button" class="clubLogin" value="로그인">
<label>
    아이디 : <input type="text" name="userId" value="">
</label>
${user.userId}
<br>
</body>
</html>
