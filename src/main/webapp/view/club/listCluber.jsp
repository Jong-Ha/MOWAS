<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>listCluber</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".listCluberApply").on("click",function(){
                location.href="/club/listCluberApply/${clubNum}"
            })
            $(".addClubBlacklist").on("click",function(){
                location.href="/club/addClubBlacklist/${clubNum}"
            })
            $(".listClubBlacklist").on("click",function(){
                location.href="/club/listClubBlacklist/${clubNum}"
            })
        })
    </script>
</head>
<body>
<input type="button" class="listCluberApply" value="가입 신청 조회">
<input type="button" class="addClubBlacklist" value="블랙리스트 등록">
<input type="button" class="listClubBlacklist" value="블랙리스트 목록 조회">
<c:forEach items="${list}" var="cluber">
    <a href="/club/getCluber/${cluber.clubUserNum}">${cluber}</a>
    <br/><br/>
</c:forEach>
</body>
</html>
