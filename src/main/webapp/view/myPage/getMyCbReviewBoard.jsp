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
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>

<div class="tabBox">
    <span class="tabBtn getMyVillBoard" >우리동네 게시글</span>
    <span>|</span>
    <span class="tabBtn getMyCbReviewBoard">모임 일정 후기 게시글</span class="tabBtn">
    <span>|</span>
    <span class="tabBtn getMyDealBoard" >판매/판매요청 게시글</span class="tabBtn">
</div>

<hr/>
<h4>모임 후기글</h4>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.clubCalendarReview}">


<div class="row row-cols-1 row-cols-md-3 g-4 cardbox" style=" margin-left: 66px;">
    <div class="col reviewBox">
        <input hidden class="CalenderReviewNum" value="10159">
        <input hidden class="boardCategory" value="1">
        <input hidden class="SUserId" value="user01">
        <input hidden class="clubNum" value="10061">
        <div class="card h-100 shadow-lg" style="width: 100% ">

            <div class="card-top" style=" border-bottom: 1px solid; display: flex; font-weight: bold">
                <div class="userImg">
                    <img src="/resources/uploadFiles\userImages\37b973dd.jpg" alt=""
                         style="border-radius: 10px; width: 100%; height: 100%;">
                </div>
                <div class="userInfo">
                    <div>
                        ${list.userId}
                    </div>
                    <div style="font-size: 0.7em; margin-top: 5px">
                        ${list.reviewRange}
                    </div>
                </div>
                <div style="width: 56%;">
                    <div class="user_manu">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-three-dots" viewBox="0 0 16 16">
                            <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                        </svg>

                    </div>
                    <div class="user_hidden_manu" style="display: none">
                        <ul class=" shadow-lg">
                            <li class="getClub">
                                모임 방문하기
                            </li>



                        </ul>
                    </div>

                </div>
            </div>

            <div id="carouselExampleSlidesOnly" class="carousel slide potoBox getPage" data-bs-ride="carousel">


                <div class="carousel-inner">
                    <div class="carousel-item active get">
                        <img class="poto" width="100%" height="100%" src="/resources//uploadFiles/clubCalendarReviewFiles/23da5057-87fc-418d-b8a4-ea39f22fde82maxresdefault.jpg"
                             alt="any">
                    </div>
                </div>

                <div class="carousel-inner">
                    <div class="carousel-item active get">
                        <img class="poto" width="100%" height="100%" src="/resources//uploadFiles/clubCalendarReviewFiles/0b554e19-b3c7-407c-bd0e-eb955c1430c12020082603175_0.jpg"
                             alt="any">
                    </div>
                </div>

                <div class="carousel-inner">
                    <div class="carousel-item active get">
                        <img class="poto" width="100%" height="100%" src="/resources//uploadFiles/clubCalendarReviewFiles/6f891f4b-de62-49f3-9f27-2ad2361f1297913cc03107b58.jpg"
                             alt="any">
                    </div>
                </div>

            </div>


            <div class="card-footer">
                <div class="card-body carditem" style="padding: 0;">

                    <div class="itemBox">

                        <div class="clickBox">

                            <div class="btn btn-primary position-relative  buttonBox  likeButton">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                     fill="currentColor"
                                     class="bi bi-hand-thumbs-up" viewBox="0 0 16 16" style="font-size: 1.7em;">
                                    <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                </svg>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText"
                                      style=" z-index: 1; font-size: 0.5em;">0</span>
                            </div>

                            <div class="btn btn-secondary position-relative position-relative buttonBox">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                     fill="currentColor"
                                     class="bi bi-eye" viewBox="0 0 16 16" style="font-size: 1.7em">
                                    <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                    <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                </svg>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                                      style="z-index: 1; font-size: 0.5em;">0</span>
                            </div>

                            <div class="btn btn-danger buttonBox report">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                     fill="currentColor"
                                     class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16"
                                     style="font-size: 1.7em">
                                    <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
                                </svg>
                            </div>
                        </div>

                        <div class="reviewTitle">
                            <a href="/clubCal/listCalenderReview?boardCategory=${list.boardCategory}">    ${list.reviewTitle}</a>
                        </div>

                        <div class="reviewText">
                            ${list.reviewText}
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

</c:forEach>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
