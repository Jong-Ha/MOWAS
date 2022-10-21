<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/club/js/listCluber.js"></script>
    <link href="/resources/club/css/listCluber.css" rel="stylesheet" type="text/css"/>

    <script>
        $(function(){
            //승인 거절
            $("input[type='button']").on("click",function(){
                // alert($(this).attr("class"))
                var result = $(this).attr("class");
                // alert($(this).parents(".cluber").children("[name='clubUserNum']").val())
                var clubUserNum = $(this).parents(".cluber").children("[name='clubUserNum']").val();
                var clubNum = $(this).parents(".cluber").children("[name='clubNum']").val();
                var userId = $(this).parents(".cluber").children("[name='userId']").val();
                var div = $(this).parent();
                $.ajax({
                    url : "/club/json/processCluberApply",
                    method : "POST",
                    data : JSON.stringify({
                        "result" : result,
                        "clubUserNum" : clubUserNum,
                        "clubNum" : clubNum,
                        "userId" : userId
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

<jsp:include page="backClose.jsp"/>

<c:forEach items="${list}" var="cluber">
    <div class="cluber">
        <span class="cluberData">${cluber}</span>
        <input type="hidden" name="clubUserNum" value="${cluber.clubUserNum}">
        <input type="hidden" name="clubNum" value="${cluber.clubNum}">
        <input type="hidden" name="userId" value="${cluber.user.userId}">
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
