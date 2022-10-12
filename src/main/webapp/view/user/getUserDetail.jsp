<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-10
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<body>
유저 상세정보
${user.userId}
<br>
${user.userStatus}
${user.userName}
${user.rrd}
${user.gender}
${user.email}
${user.phone}
${user.villCode}
${user.userImage}
${user.lcd}
${user.psd}
${user.ped}
${user.ppt}
${user.reviewPt}
${interList.interList}
<button type="button"><a href="updateUser">수정하기</a></button>
<button type="button"><a href="deleteUser">강퇴하기</a></button>
</body>
</html>
