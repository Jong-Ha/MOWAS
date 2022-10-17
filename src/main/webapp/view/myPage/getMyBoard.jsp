<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">


</script>
<body>
내가 쓴 글<br/>
우리동네 게시글<br/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.myVillBoard}">
제목${list.villTitle}<br/>
   조회수 ${list.viewCount}<br/>
    좋아요수${list.likeCount}<br/>
</c:forEach> <br/>

모임장 작성글<br/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.clubBoard}">
    모임번호${list.club_num}<br/>
    제목 ${list.title}<br/>
    회원아이디 ${list.user_id}<br/>
    작성날짜 ${list.reg_date}<br/>
</c:forEach> <br/>


</body>
</html>
