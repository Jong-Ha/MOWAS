<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>listClubCalendarApply</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            //승인 거절
            $("input[type='button']").on("click",function(){
                // alert($(this).attr("class"))
                var result = $(this).attr("class");
                // alert($(this).parents(".cluber").children("[name='clubUserNum']").val())
                var clubCalendarApplyNum = $(this).parents(".clubCalendarApply").children("[name='clubCalendarApplyNum']").val();
                var div = $(this).parent();
                $.ajax({
                    url : "/club/json/updateClubCalendarApply",
                    method : "POST",
                    data : JSON.stringify({
                        "result" : result,
                        "clubCalendarApplyNum" : clubCalendarApplyNum
                    }),
                    dataType : "JSON",
                    headers:{
                        "Accept":"application/json",
                        "Content-Type":"application/json; charset=UTF-8"
                    },
                    success: function () {
                        // alert("ajax")
                        div.html("<h4>"+result+"</h4>")
                    }
                })
            })
        })
    </script>
</head>
<body>
<c:forEach items="${list}" var="clubCalendarApply">
    <div class="clubCalendarApply">
        <span class="clubCalendarApplyData">${clubCalendarApply}</span>
        <input type="hidden" name="clubCalendarApplyNum" value="${clubCalendarApply.clubCalendarApplyNum}">
        <div>
            <input type="button" class="accept" value="승인">
            <input type="button" class="reject" value="거절">
        </div>
        <br/><br/>
    </div>
</c:forEach>
</body>
</html>
