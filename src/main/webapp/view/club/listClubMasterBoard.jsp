<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
<c:forEach items="${list}" var="clubMasterBoard">
    <a href="/club/getClubMasterBoard/${clubMasterBoard.boardNum}">${clubMasterBoard}</a>
    <br/>
</c:forEach>
</body>
</html>
