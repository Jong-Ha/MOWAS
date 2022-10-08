<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            //승인 거절
            $("input[type='button']").on("click",function(){
                // alert($(this).attr("class"))
                var result = $(this).attr("class");
                // alert($(this).parents(".cluber").children("[name='clubUserNum']").val())
                var clubUserNum = $(this).parents(".cluber").children("[name='clubUserNum']").val();
                var clubNum = $(this).parents(".cluber").children("[name='clubNum']").val();
                var div = $(this).parent();
                $.ajax({
                    url : "/club/json/processCluberApply",
                    method : "POST",
                    data : JSON.stringify({
                        "result" : result,
                        "clubUserNum" : clubUserNum,
                        "clubNum" : clubNum
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

            //자기소개 조회
            $(".cluberData").on("click",function(){
                var clubUserNum = $(this).parents(".cluber").children("[name='clubUserNum']").val();
                var div = $(this).parents(".cluber").find(".cluberText");
                $.ajax({
                    url : "/club/json/getCluberApply",
                    method : "POST",
                    data : JSON.stringify({
                        "clubUserNum" : clubUserNum
                    }),
                    dataType : "JSON",
                    headers:{
                        "Accept":"application/json",
                        "Content-Type":"application/json; charset=UTF-8"
                    },
                    success: function (map) {
                        // alert(map.cluberText)
                        div.html("<h4>"+map.cluberText+"</h4>")
                    }
                })
            })
        })
    </script>
</head>
<body>

<c:forEach items="${list}" var="cluber">
    <div class="cluber">
        <span class="cluberData">${cluber}</span>
        <input type="hidden" name="clubUserNum" value="${cluber.clubUserNum}">
        <input type="hidden" name="clubNum" value="${cluber.clubNum}">
            <div class="cluberText">
            </div>
            <div>
                <input type="button" class="accept" value="승인">
                <input type="button" class="reject" value="거절">
            </div>
        <br/><br/>
    </div>
</c:forEach>
</body>
</html>
