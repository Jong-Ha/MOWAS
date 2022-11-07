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

    ul li {
        list-style: none;
    }

    li {
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
        margin-top: 50px;
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

    .liTag:after {
        border-bottom: 1px solid black;
        transition: all 0.5s;
    }

    .liTag,.sub {
        text-align: left;
    }

    .liTag:hover:after {
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

    .MyPpt .sub {
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

    .MyPpt:hover .sub {
        display: block;
        transition: all 1s;
    }


    .typing {
        width: 11ch;
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

<head>

    <title>Title</title>
</head>

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
            self.location = "/myPage/getMyVillBoardLike?userId=" + userId;
        });


        $(".getMyCommentLike").on("click", function () {
            self.location = "/myPage/getMyCommentLike?userId=" + userId;
        });

        $(".getMyClub").on("click", function () {
            self.location = "/myPage/getMyClub?userId=" + userId;
        });


        $(".getMyClubApply").on("click", function () {
            self.location = "/myPage/getMyClubApply?userId=" + userId;
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


        $(function () {
            $("#myPageMain").on("click", function () {
                self.location = "/view/myPage/getMyPage.jsp"
            });
        });
    });


</script>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<input type="hidden" class="myPageUserId" id="userId" name="userId" value="${user.userId}">

<div class="wrapper">

    <div class="typing mb-5" id="myPageMain" style="cursor: pointer; ">

        <h4 style="font-weight: bolder;  font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
            마이페이지</h4>
    </div>

    <nav class="navbar navbar-expand-lg myPageBox" style="margin-top: -8px;">

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

        <div class="underline yellow MyClub">모임
            <div class=" myPageTogle2">
                <ul class="shadow-lg sub">
                    <li class="getMyClub">가입한 모임</li>
                    <li class="getMyClubApply">가입신청한 모임</li>

                </ul>
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
                        <li class="getMyPpt liTag">받은 벌점 내역</li>
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
