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
        $(".paging").on("click",function(){
            $("#currentPage").val($(this).text())
            $("form").submit()
        })
        $("form").on("submit",function(){
            $(this).attr("action","/club/listClubMasterBoard/${clubNum}").attr("method","post")
        })
        $(".getMyVillBoard").on("click", function (){
            self.location="/myPage/getMyBoard?userId="+userId;
        })
        $(".getMyCbMaster").on("click", function (){
            self.location="/myPage/getMyCbMaster?userId="+userId;
        })
        $(".getMyCbReviewBoard").on("click", function (){
            self.location="/myPage/getMyCbReviewBoard?userId="+userId;
        })
        $(".getMyDealBoard").on("click", function (){
            self.location="/myPage/getMyDealBoard?userId="+userId;
        })
    })

</script>
<body>

<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>

<div class="tabBox">
    <span class="tabBtn getMyVillBoard" >우리동네 게시글</span>
    <span>|</span>
    <span class="tabBtn getMyCbMaster" >모임 공지사항 게시글</span class="tabBtn">
    <span>|</span>
    <span class="tabBtn getMyCbReviewBoard">모임 일정 후기 게시글</span class="tabBtn">
    <span>|</span>
    <span class="tabBtn getMyDealBoard" >판매/판매요청 게시글</span class="tabBtn">
</div>

<hr/>
<h4>모임 후기글</h4>
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


</body>
</html>
