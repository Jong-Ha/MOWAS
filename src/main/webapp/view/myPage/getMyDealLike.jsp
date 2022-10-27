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
        $(".getMyLike").on("click", function (){
            alert('user'+userId)
            self.location="/myPage/getMyLike?userId="+userId;
        })
        $(".getMyCbRvLike").on("click", function (){
            self.location="/myPage/getMyCbRvLike?userId="+userId;
        })

        $(".getMyDealLike").on("click", function (){
            location.href="/myPage/getMyDealLike?userId="+userId;
        })
    })

</script>
<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr/>
<div>
    <h3 class="getMyLike">좋아요한 우리동네 게시글</h3>
    <h3 class="getMyCbRvLike">좋아요한 모임 후기 게시글</h3>
    <h3 class="getMyDealLike">좋아요한 판매/판매요청 게시글</h3>
</div>
<hr/>
<hr/>
<h3>좋아요한 판매/판매요청 게시글</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.dealBoardLike}"><br/>
    게시판 카테고리  ${list.boardCategory}<br/>
<a href="/deal/getDeal/${list.dealBoardNum}">좋아요한 판매/판매요청 게시글 제목 ${list.dealTitle}</a><br/>
    작성날짜 ${list.dealRegDate}<br/>
    조회수 ${list.viewCount}<br/>
    게시글번호 ${list.dealBoardNum}<br/>
</c:forEach> <br/>

</body>
</html>
