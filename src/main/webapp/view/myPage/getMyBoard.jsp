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

    ul li {
        list-style: none;
        cursor: pointer;
    }

    .wap {
        width: 1000px;
        height: 1500px;
    }

    .carditem {
        display: flex;
        flex-direction: column;
        float: left;
    }



    .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 30px;
        float: left;
        width: 442px;
        transition: all 0.1s linear;
    }

    .cardbox:hover {
        transform: scale(1.12);
    }

    .itemBox {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .clickBox {
        padding: 10px;
        display: flex;
        float: left;
        text-align: right;
        width: 100%;
        margin-right: 39px;
        margin-bottom: 11px;
    }

    .buttonBox {
        margin-left: 10px;
        cursor: pointer;
        height: 28px;
        width: 39px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .col.reviewBox {
        width: 100%;
        margin-right: 30px;
    }



    .addBox {
        width: 100%;
        display: flex;
        flex-direction: row-reverse;
        margin-bottom: 100px;
    }


    .get {
        width: 100%;
        height: 100%;
        overflow: hidden;
    }

    .carousel-inner {
        width: 100%;
        height: 100%;
    }

    .potoBox {
        cursor: pointer;
        padding: 1px;
        width: 100%;
        height: 361px;
        overflow: hidden;
        border-radius: 0 0 5px 5px;
        border-bottom: 2px solid #0a090912;
    }

    .userImg {
        width: 60px;
        height: 60px;
        padding: 5px;
    }

    .userInfo {
        padding: 6px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .user_manu {
        padding: 14px;
        display: flex;
        width: 101%;
        font-size: 1.9em;
        flex-direction: row-reverse;
    }

    .user_hidden_manu {
        width: 100px;
        height: 75px;
        position: absolute;
        z-index: 2;
        margin-top: -14px;
        margin-left: 111px;

    }

    .user_hidden_manu > ul {
        width: 125px;
        border: 1px solid #0000001a;
        padding: 10px;
        border-radius: 5px;
        background: #ffff;
    }
    .reviewTitle{
        text-align: left;
        width: 100%;
        margin-bottom: 20px;
        font-size: 1.3em;
    }
    .reviewText{
        width: 100%;
        text-align: left;
        font-size: 0.1em;
    }

    .card-top {
        border-bottom: 1px solid;
        display: flex;
        font-weight: bold
    }


    .card-footer {
        height: 208px;
    }
    .commuBox {
        margin-bottom: 50px;
        justify-content: center;
    }


    a {
        text-decoration: none;
    }

    .underline {
        line-height: 1.2;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 1.5em;
        font-weight: 700;
        background-image: linear-gradient(transparent calc(100% - 3px), #000 3px);
        background-repeat: no-repeat;
        background-size: 0% 100%;
        transition: background-size 0.2s;
        color: #000;
        cursor: pointer;
        margin-right: 25px;
    }
    @media (min-width: 1000px) {
        .underline {
            font-size: 1.5em;
        }
    }
    .underline.yellow {
        background-image: linear-gradient(transparent 60%, #F8CD07 40%);
    }
    .underline:hover {
        background-size: 100% 100%;
    }

    .wrapper {
        height: 13ch;
        display: grid;
        place-items: center;
    }

    .typing {
        width: 14ch;
        animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;
        white-space: nowrap;
        overflow: hidden;
        border-right: 3px solid;
        font-size: 2em;
        height: 2ch;
    }

    @keyframes typing {
        from {
            width: 0
        }
    }

    @keyframes blink {
        80% {
            border-color: transparent
        }
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
<h4>우리동네 게시글</h4>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.myVillBoard}"><br/>
<a href="/commu/getVillBoard?villBoardNum=${list.villBoardNum}&boardCategory=${list.boardCategory}">제목${list.villTitle}</a><br/>
   조회수 ${list.viewCount}<br/>
    좋아요수${list.likeCount}<br/>
    게시글번호${list.villBoardNum}<br/>
    게시글카테고리${list.boardCategory}<br/>

</c:forEach> <br/>

<div id="villBoardUserId" name="villBoardUserId" value="${user.userId}"/>
</body>
</html>
