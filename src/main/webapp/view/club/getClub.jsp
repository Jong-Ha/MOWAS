<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".updateClub").on("click",function(){
                location.href="/club/updateClub/${club.clubNum}"
            })
            $(".deleteClub").on("click",function(){
                var check = confirm("진짜 삭제?");
                if(check==true){
                    location.href="/club/deleteClub/${club.clubNum}"
                }
            })
        })
    </script>
</head>
<body>
${club}<br>
<input type="button" class="updateClub" value="모임 수정">
<input type="button" class="deleteClub" value="모임 삭제">
</body>
</html>
