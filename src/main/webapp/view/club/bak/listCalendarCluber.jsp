<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>listCalendarCluber</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".listClubCalendarApply").on("click",function(){
                location.href="/club/listClubCalendarApply/${clubCalendarNum}"
            })
        })
    </script>
</head>
<body>
<c:forEach items="${list}" var="CalendarCluber">
    <div>
        ${CalendarCluber}
        <br/>
        <br/>
    </div>
</c:forEach>
<input type="button" class="listClubCalendarApply" value="참여 신청 목록">
</body>
</html>
