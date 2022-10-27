<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(function(){
        var userId = $(".myPageUserId").val();

    $(".getMyComment").on("click", function (){
        self.location="/myPage/getMyComment?userId="+userId;
    })

    $(".getMyRecomment").on("click", function (){
        alert('adsfadsf');
        alert(userId);
        location.href="getMyRecomment?userId="+userId;
    })
    })

</script>
<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
내가 쓴 댓글
<hr/>
<div>
    <h3 class="getMyComment">댓글</h3>
    <h3 class="getMyRecomment">대댓글</h3>
</div>
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

</body>
</html>
