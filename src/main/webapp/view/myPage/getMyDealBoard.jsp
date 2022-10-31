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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
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

    .searchBox {
        margin: 20px;
    }

    .searchBox .searchIcon {
        border: 1px solid rgb(118, 118, 118);
        padding: 3.5px;
        margin-right: -7px;
    }

    .searchBox .searchInput {
        width: 150px;
        height: 30px;
    }

    .goods_wrapper {
        height: 50%;
        overflow-y: auto;
        padding: 15px;
    }

    .goods_wrapper .tit_month {
        width: 100%;
        height: 39px;
        margin: -9px 0;
        background: url(./bg_tit_month.gif) repeat-x;
        text-align: center;
    }

    .goods_wrapper .tit_month h4 {
        width: 110px;
        height: 39px;
        margin: 0 auto;
        background: url(./bg_tit_month2.gif) no-repeat;
        line-height: 39px;
        font-family: Tahoma,Geneva,sans-serif;
        font-size: 16px;
        font-weight: normal;
        color: #000;
    }

    .goods_wrapper .goods_group .goods_item {
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    .goods_wrapper .goods_group .goods_item > img {
        width: 100px;
        height: 100px;
        margin: 10px;
    }

    .goods_wrapper .goods_group .goods_item .goods_info > ul {
        margin: 0;
        padding: 0;
    }

    .goods_wrapper .goods_group .goods_item .goods_info > ul > li.goods_name {
        font-weight: bold;
    }
    </style>


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
<h4>판매/판매요청 게시글</h4>
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
