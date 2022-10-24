<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>listCalendarCluber</title>
    <link href="/resources/club/css/listCluber.css" rel="stylesheet" type="text/css"/>
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
<div>

    <br/>
    <br/>
</div>
<c:forEach items="${list}" var="CalendarCluber">
    <div class="card-list" style="margin-top: 30px; margin-left: 100px;">
        <div class="card shadow-lg cardBox" style=" width: 300px;">
            <input type="hidden" class="clubUserNum" name="clubUserNum" value="">
            <div class="photoBox" style=" width: 200px;  display: flex;  align-items: center;">
                <img class="bd-placeholder-img img-fluid rounded-start photo" style="width: 180px;"
                     src="/resources/${CalendarCluber.user.userImage}" alt="any">
            </div>
            <div>
                <div class="card-body" style=" margin-top: -50;">
                    <div>
                        <h4 class="card-title"> ${CalendarCluber.user.userId}</h4>
                        <div class="badge bg-primary text-wrap"></div>
                    </div>
                    <div>
                        <small class="text-muted"></small>
                        <div class="badge bg-primary text-wrap"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
<input type="button" class="listClubCalendarApply" value="참여 신청 목록">
</body>
</html>
