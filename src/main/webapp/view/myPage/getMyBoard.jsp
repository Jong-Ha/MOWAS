<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(".paging").on("click",function(){
            $("#currentPage").val($(this).text())
            $("form").submit()
        })
        $("form").on("submit",function(){
            $(this).attr("action","/club/listClubMasterBoard/${clubNum}").attr("method","post")
        })
    })

</script>
<body>

<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>

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

<c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
    <span class="paging">${i}</span>
</c:forEach>
<label>
    <input type="hidden" id="currentPage" name="currentPage" value="1">
    <input type="text" name="searchKeyword" value="${search.searchKeyword}">
</label>
<input type="submit" value="검색">


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
