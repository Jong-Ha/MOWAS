<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<style>
    .tabBox {
        display: flex;
        margin: 0 15px;
    }

    .tabBox span {
        font-size: 25px;
        margin: 5px;
        font-weight: bolder;
    }

    .tabBox span.tabBtn {
        font-size: 25px;
        margin: 5px;
        font-weight: bolder;
        cursor: pointer;
    }
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(function(){
        var userId = $(".myPageUserId").val();
        $(".getMyLike").on("click", function (){
            // alert('user'+userId)
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
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>

<hr>
<div class="container">

<div class="tabBox">
    <span class="tabBtn getMyLike" >좋아요한 우리동네 게시글</span>
    <span>|</span>
    <span class="tabBtn getMyCbRvLike">좋아요한 모임 후기 게시글</span class="tabBtn">
    <span>|</span>
    <span class="tabBtn getMyDealLike" >좋아요한 판매/판매요청 게시글</span class="tabBtn">
</div>

<hr/>
<h3>좋아요한 모임 후기글</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.clubCalendarReviewLike}">
    게시판 카테고리  ${list.boardCategory}<br/>
    <a href="/clubCal/listCalenderReview?boardCategory=${list.boardCategory}"> 좋아요한 모임 후기글 제목 ${list.reviewTitle}</a><br/>
    작성날짜 ${list.regDate}<br/>
    조회수 ${list.viewCount}<br/>
    좋아요수 ${list.likeConunt}<br/>
    게시글번호 ${list.clubCalenderReviewNum}<br/>
</c:forEach>
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
