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
내가 쓴 댓글, 대댓글
<hr/>
<h3>댓글</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.myComment}"><br/>

<a href="/commu/getVillBoard?villBoardNum=${list.boardNum}&boardCategory=${list.boardCategory}">댓글내용${list.commentText}</a><br/>

게시글 번호${list.boardNum}<br/>
    작성날짜 ${list.regDate}<br/>
    게시글 카테고리${list.boardCategory}<br/>
    댓글 번호${list.commentNum}<br/>
    모임 번호${list.clubNum}<br/>
    회원 아이디${list.userId}<br/>
    댓글 체크${list.commentCheck}<br/>


</c:forEach> <br/>
<hr/>
<h3>대댓글</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.myRecomment}"><br/>
    대댓글 내용${list.recommentText}<br/>
    작성날짜 ${list.regDate}<br/>
    게시글 카테고리 ${list.boardCategory}<br/>
    댓글 번호${list.recommentNum}<br/>
</c:forEach> <br/>
</body>
</html>
