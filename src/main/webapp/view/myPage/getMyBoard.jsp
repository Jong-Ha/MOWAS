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
<hr/>
<h3>우리동네 게시글</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.myVillBoard}"><br/>
<a href="/commu/getVillBoard?villBoardNum=${list.villBoardNum}&boardCategory=${list.boardCategory}">제목${list.villTitle}</a><br/>
   조회수 ${list.viewCount}<br/>
    좋아요수${list.likeCount}<br/>
    게시글번호${list.villBoardNum}<br/>
    게시글카테고리${list.boardCategory}<br/>

</c:forEach> <br/>
<hr/>
<h3>모임장 작성글</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.myclubBoard}"><br/>
    모임번호${list.clubNum}<br/>
    <a href="/club/getClubMasterBoard/${list.boardNum}">제목 ${list.title}</a><br/>
    회원아이디 ${list.userId}<br/>
    작성날짜 ${list.regDate}<br/>
    게시글번호${list.boardNum}<br/>
</c:forEach> <br/>
<hr/>
<h3>모임 후기글</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.clubCalendarReview}"><br/>
   <a href="/clubCal/listCalenderReview?boardCategory=${list.boardCategory}"> 제목 ${list.reviewTitle}</a><br/>
    회원아이디 ${list.userId}<br/>
    작성날짜 ${list.regDate}<br/>
    조회수 ${list.viewCount}<br/>
    좋아요수 ${list.likeConunt}<br/>
    게시글번호 ${list.clubCalenderReviewNum}<br/>
    카테고리번호 ${list.boardCategory}<br/>
</c:forEach> <br/>
<hr/>
<h3>판매/판매요청 게시글</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.dealBoard}"><br/>
    <a href="/deal/getDeal/${list.dealBoardNum}">제목${list.dealTitle}</a><br/>
    회원아이디 ${list.user.userId}<br/>
    작성날짜 ${list.dealRegDate}<br/>
    조회수 ${list.viewCount}<br/>
    게시글번호 ${list.dealBoardNum}<br/>
</c:forEach> <br/>


</body>
</html>