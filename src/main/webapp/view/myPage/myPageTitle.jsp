<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-11
  Time: 오후 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    ul li {
        list-style: none;
    }
    li{
        margin-bottom: 10px;
        cursor: pointer;
    }

    .wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .navbar {
        justify-content: center;
    }

    .myPageBox {
        margin-bottom: 50px;
        justify-content: center;
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

    .abc {
        width: 50px;
    }

    .liTag:after{
        border-bottom: 1px solid black;
        transition: all 0.5s;
    }

    .liTag:hover:after{
        transition: all 0.5s;
    }

    .myBoard .sub {
        display: none;
        position: absolute;
        height: 160px;
        z-index: 2;
        padding: 20px;
        transition: all 1s;
        background: #eee;
        border-radius: 10px;
    }

    .myBoard:hover .sub {
        display: block;
        transition: all 1s;

    }

    .MyClub .sub {
        font-size: 0.7em;
        font-weight: normal;
        display: none;
        position: absolute;
        height: 100px;
        z-index: 2;
        padding: 20px;
        border-radius: 10px;
        transition: all 1s;
        background: #eee;
    }

    .MyClub:hover .sub {
        display: block;
        transition: all 1s;
    }

    .MyDeal .sub {
        font-size: 0.7em;
        font-weight: normal;
        display: none;
        position: absolute;
        height: 100px;
        z-index: 2;
        padding: 20px;
        border-radius: 10px;
        transition: all 1s;
        background: #eee;
    }

    .MyDeal:hover .sub {
        display: block;
        transition: all 1s;
    }

    .MyPpt .sub{
        font-size: 0.7em;
        font-weight: normal;
        display: none;
        position: absolute;
        height: 100px;
        width: 150px;
        z-index: 2;
        padding: 20px;
        border-radius: 10px;
        transition: all 1s;
        background: #eee;
    }
    .MyPpt:hover .sub{
        display: block;
        transition: all 1s;
    }



</style>

<head>

    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

    $(function () {
        var userId = $(".myPageUserId").val();

        $("#listUser").on("click", function () {
            self.location = "/user/listUser";
        });
        $("#getMyInfor").on("click", function () {
            self.location = "/myPage/getMyInfor?userId=" + userId;
        });
        $(".getMyBoard").on("click", function () {
            alert('userId' + userId);
            self.location = "/myPage/getMyBoard?userId=" + userId;
        });
        $(".getMyComment").on("click", function () {
            alert('1234');
            self.location = "/myPage/getMyComment?userId=" + userId;
        });

        $(".getMyBoardLike").on("click", function () {
            self.location = "/myPage/getMyLike?userId=" + userId;
        });
        $(".getMyClub").on("click", function () {
            self.location = "/myPage/getMyClub?userId=" + userId;
        });
        $(".getMyDeal").on("click", function () {
            self.location = "/myPage/getMyDeal?userId=" + userId;
        });
        $(".getMyDealReview").on("click", function () {
            self.location = "/myPage/getMyDealReview?userId=" + userId;
        });
        $(".getMyReport").on("click", function () {
            self.location = "/myPage/getMyReport?userId=" + userId;
        });
        $(".getMyPpt").on("click", function () {
            self.location = "/myPage/getMyPpt?userId=" + userId;
        });

    });


    $(function () {
        $("#mainPage").on("click", function () {
            self.location = "/view/user/main.jsp";
        });
        /*
                $(".myBoard").on("click",function (){

                    $(".myPageTogle1").slideToggle();
                })
                $(".MyClub").on("click",function (){

                    $(".myPageTogle2").slideToggle();
                })
                $(".MyDeal").on("click",function (){

                    $(".myPageTogle3").slideToggle();
                })
                $(".MyPpt").on("click",function (){

                    $(".myPageTogle4").slideToggle();
                })*/

    });

</script>
<body>
<input type="hidden" class="myPageUserId" id="userId" name="userId" value="${user.userId}">
<header class="tool-bar con-min-width">
    <div class="con">
        <nav class="top-bar__menu-box-1">

        </nav>
    </div>
</header>
<button type="button" class="mainPage" id="mainPage">메인페이지</button>
<br>


<div class="wrapper">


    <nav class="navbar navbar-expand-lg myPageBox">
        <div class="myBoard">
            <div class="underline yellow">
                작성 게시글
            </div>
            <div class=" myPageTogle1">
                <ul class="shadow-lg sub">
                    <li class="getMyBoard liTag">내가 작성한 게시글</li>
                    <li class="getMyComment liTag">내가 작성한 댓글</li>
                    <li class="getMyBoardLike liTag">좋아요한 게시글</li>
                    <li class="getMyCommentLike liTag">좋아요한 댓글</li>

                </ul>
            </div>
        </div>


        <div class="abc"></div>


        <div>
            <div class="underline yellow MyClub">모임

                <div class="myPageTogle2">
                    <ul class="shadow-lg sub">
                        <li class="getMyClub liTag">가입한 모임</li>
                        <li class="getMyComment liTag">가입신청한 모임</li>

                    </ul>
                </div>
            </div>
        </div>


        <div class="abc"></div>


        <div>
            <div class="underline yellow  MyDeal">
                거래

                <div class=" myPageTogle3">
                    <ul class="shadow-lg sub">
                        <li class="getMyDeal liTag">거래 내역</li>
                        <li class="getMyDealReview liTag">거래 후기</li>

                    </ul>
                </div>
            </div>
        </div>


        <div class="abc"></div>


        <div>
            <div class="underline yellow MyPpt">벌점/신고
                <div class=" myPageTogle4">
                    <ul class="shadow-lg sub">
                        <li class="getMyPpt liTag" >받은 벌점 내역</li>
                        <li class="getMyReport liTag">신고한 내역</li>

                    </ul>
                </div>
            </div>
        </div>


    </nav>
    <hr>
</div>
</body>
</html>
