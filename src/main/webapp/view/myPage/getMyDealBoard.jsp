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

    /*.searchBox {*/
    /*    margin: 20px;*/
    /*}*/

    /*.searchBox .searchIcon {*/
    /*    border: 1px solid rgb(118, 118, 118);*/
    /*    padding: 3.5px;*/
    /*    margin-right: -7px;*/
    /*}*/

    /*.searchBox .searchInput {*/
    /*    width: 150px;*/
    /*    height: 30px;*/
    /*}*/

    /*.goods_wrapper {*/
    /*    height: 50%;*/
    /*    overflow-y: auto;*/
    /*    padding: 15px;*/
    /*}*/

    /*.goods_wrapper .tit_month {*/
    /*    width: 100%;*/
    /*    height: 39px;*/
    /*    margin: -9px 0;*/
    /*    background: url(./bg_tit_month.gif) repeat-x;*/
    /*    text-align: center;*/
    /*}*/

    /*.goods_wrapper .tit_month h4 {*/
    /*    width: 110px;*/
    /*    height: 39px;*/
    /*    margin: 0 auto;*/
    /*    background: url(./bg_tit_month2.gif) no-repeat;*/
    /*    line-height: 39px;*/
    /*    font-family: Tahoma,Geneva,sans-serif;*/
    /*    font-size: 16px;*/
    /*    font-weight: normal;*/
    /*    color: #000;*/
    /*}*/

    /*.goods_wrapper .goods_group .goods_item {*/
    /*    display: flex;*/
    /*    justify-content: flex-start;*/
    /*    align-items: center;*/
    /*}*/

    /*.goods_wrapper .goods_group .goods_item > img {*/
    /*    width: 100px;*/
    /*    height: 100px;*/
    /*    margin: 10px;*/
    /*}*/

    /*.goods_wrapper .goods_group .goods_item .goods_info > ul {*/
    /*    margin: 0;*/
    /*    padding: 0;*/
    /*}*/

    /*.goods_wrapper .goods_group .goods_item .goods_info > ul > li.goods_name {*/
    /*    font-weight: bold;*/
    /*}*/
    /*.body {*/
    /*    text-align: -webkit-center;*/
    /*}*/

    /*.wap {*/
    /*    margin-top: 70px;*/
    /*    font-size: 1em;*/
    /*    width: 1030px;*/
    /*    padding: 5px 5px;*/
    /*    height: 580px;*/
    /*    border-radius: 10px;*/
    /*}*/


    /*.card-title {*/
    /*    width: 250px;*/
    /*    font-size: 1em;*/
    /*}*/

    /*.cardbox {*/
    /*    display: flex;*/
    /*    flex-direction: row;*/
    /*    margin-bottom: 30px;*/

    /*    transition: all 0.2s linear;*/
    /*}*/

    /*button.buttonBox {*/
    /*    font-size: 0.7em;*/
    /*    !* float: left; *!*/
    /*    !* size: b4; *!*/
    /*    height: 25px;*/
    /*    width: 5px;*/
    /*}*/

    /*.col.dealBox {*/
    /*    width: 320px;*/
    /*    !*margin-right: 30px;*!*/
    /*}*/

    /*.like {*/
    /*    font-size: 0.1rem;*/
    /*    width: 45px;*/
    /*    outline: 0;*/
    /*    border: none;*/
    /*    background-color: #fff;*/
    /*}*/

    /*.addBox {*/
    /*    display: flex;*/
    /*    justify-content: space-between;*/
    /*    align-items: center;*/
    /*    margin-bottom: 50px;*/
    /*}*/

    /*.add {*/
    /*    margin-right: -700px;*/
    /*}*/

    /*.update,*/
    /*.delete {*/
    /*    font-size: 0.5em;*/
    /*}*/

    /*.get {*/
    /*    width: 100px;*/
    /*    height: 200px;*/
    /*    overflow: hidden;*/
    /*}*/


    /*.carditem {*/
    /*    display: flex;*/
    /*    flex-direction: column;*/
    /*}*/

    /*.card-title {*/
    /*    width: 250px;*/
    /*    font-size: 1em;*/
    /*}*/

    /*.cardbox {*/
    /*    display: flex;*/
    /*    flex-direction: row;*/
    /*    margin-bottom: 40px;*/

    /*    float: left;*/
    /*    transition: all 0.2s linear;*/
    /*}*/

    /*.cardbox:hover {*/
    /*    transform: scale(1.12);*/
    /*}*/

    /*.potoBox {*/
    /*    cursor: pointer;*/
    /*    padding: 1px;*/
    /*    width: 294px;*/
    /*    height: 200px;*/
    /*    overflow: hidden;*/
    /*    border-radius: 0 0 5px 5px;*/
    /*    border-bottom: 2px solid #0a090945*/
    /*}*/

    /*.text {*/
    /*    white-space: nowrap;*/
    /*    overflow: hidden;*/
    /*    text-overflow: ellipsis;*/
    /*}*/

    /*.allFlex {*/
    /*    display: flex;*/
    /*}*/

    /*.cartFont {*/
    /*    font-size: 0.8em;*/
    /*}*/

    /*.wrapper {*/
    /*    height: 13ch;*/
    /*    display: grid;*/
    /*    place-items: center;*/
    /*}*/

    /*.typing {*/
    /*    width: 9ch;*/
    /*    animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;*/
    /*    white-space: nowrap;*/
    /*    overflow: hidden;*/
    /*    border-right: 3px solid;*/
    /*    font-size: 2em;*/
    /*    height: 2ch;*/
    /*}*/

    /*@keyframes typing {*/
    /*    from {*/
    /*        width: 0*/
    /*    }*/
    /*}*/

    /*.btn-primary {*/
    /*    --bs-btn-color: #000;*/
    /*    --bs-btn-bg: #f8cd07b3;*/
    /*    --bs-btn-border-color: #f8cd07b3;*/
    /*    --bs-btn-hover-color: #000;*/
    /*    --bs-btn-hover-bg: #f8cd07;*/
    /*    --bs-btn-hover-border-color: #f8cd07;*/
    /*    --bs-btn-focus-shadow-rgb: 130, 138, 145;*/
    /*    --bs-btn-active-color: #000;*/
    /*    --bs-btn-active-bg: #f8cd07;*/
    /*    --bs-btn-active-border-color: #f8cd07;*/
    /*    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);*/
    /*    --bs-btn-disabled-color: #fff;*/
    /*    --bs-btn-disabled-bg: #6c757d;*/
    /*    --bs-btn-disabled-border-color: #6c757d;*/
    /*}*/

    /*!*deallistBox 시작*!*/
    /*.deallistBox {*/
    /*    margin-bottom: 50px;*/
    /*    justify-content: center;*/
    /*}*/


    /*a {*/
    /*    text-decoration: none;*/
    /*}*/

    /*.underline {*/
    /*    line-height: 1.2;*/
    /*    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";*/
    /*    font-size: 1.5em;*/
    /*    font-weight: 700;*/
    /*    background-image: linear-gradient(transparent calc(100% - 3px), #000 3px);*/
    /*    background-repeat: no-repeat;*/
    /*    background-size: 0% 100%;*/
    /*    transition: background-size 0.2s;*/
    /*    color: #000;*/
    /*    cursor: pointer;*/
    /*    margin-right: 25px;*/
    /*}*/

    /*@media (min-width: 1000px) {*/
    /*    .underline {*/
    /*        font-size: 1.5em;*/
    /*    }*/
    /*}*/

    /*.underline.yellow {*/
    /*    background-image: linear-gradient(transparent 60%, #F8CD07 40%);*/
    /*}*/

    /*.underline:hover {*/
    /*    background-size: 100% 100%;*/
    /*}*/

    /*.wrapper {*/
    /*    height: 13ch;*/
    /*    display: grid;*/
    /*    place-items: center;*/
    /*}*/

    /*.typing {*/
    /*    width: 14ch;*/
    /*    animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;*/
    /*    white-space: nowrap;*/
    /*    overflow: hidden;*/
    /*    border-right: 3px solid;*/
    /*    font-size: 2em;*/
    /*    height: 2ch;*/
    /*}*/

    /*@keyframes typing {*/
    /*    from {*/
    /*        width: 0*/
    /*    }*/
    /*}*/

    /*@keyframes blink {*/
    /*    80% {*/
    /*        border-color: transparent*/
    /*    }*/
    /*}*/
    <style>
     .body {
         text-align: -webkit-center;
     }

    .wap {
        margin-top: 70px;
        font-size: 1em;
        width: 1030px;
        padding: 5px 5px;
        height: 580px;
        border-radius: 10px;
    }


    .card-title {
        width: 250px;
        font-size: 1em;
    }

    .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 30px;

        transition: all 0.2s linear;
    }

    button.buttonBox {
        font-size: 0.7em;
        /* float: left; */
        /* size: b4; */
        height: 25px;
        width: 5px;
    }

    .col.dealBox {
        width: 320px;
        /*margin-right: 30px;*/
    }

    .like {
        font-size: 0.1rem;
        width: 45px;
        outline: 0;
        border: none;
        background-color: #fff;
    }

    .addBox {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 50px;

    }
    /*.addBox {*/
    /*    width: 100%;*/
    /*    display: flex;*/
    /*    flex-direction: row-reverse;*/
    /*    margin-bottom: 100px;*/
    /*}*/

    .add {
        margin-right: -700px;
    }

    .update,
    .delete {
        font-size: 0.5em;
    }

    .get {
        width: 100px;
        height: 200px;
        overflow: hidden;
    }


    .carditem {
        display: flex;
        flex-direction: column;
    }

    .card-title {
        width: 250px;
        font-size: 1em;
    }

    .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 40px;
        width: 360px;
        height: 400px;
        float: left;
        transition: all 0.2s linear;
    }

    .cardbox:hover {
        transform: scale(1.12);
    }

    .potoBox {
        cursor: pointer;
        padding: 1px;
        width: 360px;
        height: 250px;
        overflow: hidden;
        border-radius: 0 0 5px 5px;
        border-bottom: 2px solid #0a090945
    }

    .text {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .allFlex {
        display: flex;
    }

    .cartFont {
        font-size: 0.8em;
    }

    .wrapper {
        height: 13ch;
        display: grid;
        place-items: center;
    }

    .typing {
        width: 9ch;
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

    .btn-primary {
        --bs-btn-color: #000;
        --bs-btn-bg: #f8cd07b3;
        --bs-btn-border-color: #f8cd07b3;
        --bs-btn-hover-color: #000;
        --bs-btn-hover-bg: #f8cd07;
        --bs-btn-hover-border-color: #f8cd07;
        --bs-btn-focus-shadow-rgb: 130, 138, 145;
        --bs-btn-active-color: #000;
        --bs-btn-active-bg: #f8cd07;
        --bs-btn-active-border-color: #f8cd07;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #fff;
        --bs-btn-disabled-bg: #6c757d;
        --bs-btn-disabled-border-color: #6c757d;
    }

    /*deallistBox 시작*/
    .deallistBox {
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

    .addlistbox {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: space-around;
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

<div class="container">
    <div class="addlistbox">
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.dealBoard}"><br/>
    <div class="cardbox">
        <div class="col dealBox">
            <input type="hidden" name="dealBoardNum" class="dealBoardNum" value="${list.dealBoardNum}">
            <div class="card h-100 shadow-lg">
                <div class="card-footer"
                     style=" border-bottom: 1px solid; display: flex; font-weight: bold">
                        ${list.dealTitle}
                    <p class="allFlex " style="position: absolute; right: 10px;">
                        <c:if test="${list.dealStatus == 0}">
                        거래전
                    </c:if>
                        <c:if test="${list.dealStatus ==1}">
                            거래중
                        </c:if>
                        <c:if test="${list.dealStatus ==2}">
                            거래완료
                        </c:if></p>
                </div>
                    <%--  <div id="carouselExampleSlidesOnly" class="carousel potoBox" data-bs-ride="carousel">--%>
                <div class="potoBox">
                        <%--    <div class="carousel-inner">--%>
                        <%--      <div class="carousel-item active get">--%>
                    <img class="poto" width="100%" height="100%" src="/resources/${list.files[0].fileName}"
                         alt="any">
                        <%--      </div>--%>
                        <%--    </div>--%>
                </div>
                <div class="cardM " style="display: flex; padding: 10px 0 0 10px; height: 120px;; ">
                        <%--                            <div class="card-text text allFlex" style="width: 50%; ">--%>
                        <%--                                    ${deal.productName}--%>
                        <%--                            </div>--%>

                    <div class="dealinfo cartFont" style="flex: 1; width: 50%;">
                        <p class="allFlex" style="font-size: 1.3em; font-weight: bold"> ${list.price} 원 </p>
                        <p class="allFlex" style="font-size: 1.3em; font-weight: bold">${list.villCode}∙ ${list.dealRegDate}</p>
                        <p class="allFlex" style="font-size: 1em"> 좋아요 ${list.likeCount} ∙
                            조회수 ${list.viewCount} </p>

                    </div>
                </div>

            </div>
        </div>
    </div>
<%--    <a href="/deal/getDeal/${list.dealBoardNum}">제목${list.dealTitle}</a><br/>--%>
<%--    회원아이디 ${list.user.userId}<br/>--%>
<%--    작성날짜 ${list.dealRegDate}<br/>--%>
<%--    조회수 ${list.viewCount}<br/>--%>
<%--    게시글번호 ${list.dealBoardNum}<br/>--%>
</c:forEach> <br/>



</body>
</html>
