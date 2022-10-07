<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>listClubBlacklist</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateClubBlacklist").on("click",function(){
                var process = "F"
                if($(this).val()=='등록'){
                    process = "T";
                }
                $("form").attr("method","post").attr("action","/club/updateClubBlacklist/"+process).submit()
            })
        })
    </script>
</head>
<body>
<form>
<c:forEach items="${list}" var="clubBlacklist">
    <label>
        <input type="checkbox" name="clubUserNum" value="${clubBlacklist.clubUserNum}">
        ${clubBlacklist}
    </label>
    <br/><br/>
</c:forEach>
    <input type="hidden" name="clubNum" value="${clubNum}">
</form>
<input type="button" class="updateClubBlacklist" value="등록">
<input type="button" class="updateClubBlacklist" value="취소">
</body>
</html>
