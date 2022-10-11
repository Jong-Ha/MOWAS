<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-10
  Time: 오후 5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function (){
    $(".listUser").on("click",function (){
        self.location="/user/listUser";
    });
});

</script>
<body>
마이페이지
<button type="button" class="listUser">회원목록조회</button>

</body>
</html>
