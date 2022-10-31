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
    ul li{
        list-style:none;
    }
    .wap {
        display: flex;
        flex-direction: column;
        margin-top: 70px;
    }
    .wrapper{
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    .aaa{
        transition: 0.2s;
    }

    #userImage1{
        transition: all 0.2s linear;
    }

    #userImage1:hover {
        transform: scale(5);
    }
    .navbar {
        justify-content: center;
    }
    .navCenter {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 1200px;
        margin: auto;
        color: #fff;
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
    .abc{
        width: 50px;
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
</style>

<head>

    <title>Title</title>
</head>

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
        self.location = "/myPage/getMyInfor?userId="+userId;
    });
        $(".getMyBoard").on("click", function () {
            alert('userId'+userId);
        self.location = "/myPage/getMyBoard?userId="+userId;
    });
        $(".getMyComment").on("click", function () {
            alert('1234');
        self.location = "/myPage/getMyComment?userId="+userId;
    });

        $(".getMyBoardLike").on("click", function () {
        self.location = "/myPage/getMyLike?userId="+userId;
    });
         $(".getMyCommentLike").on("click", function () {
             self.location = "/myPage/getMyCommentLike?userId="+userId;
         });
        $(".getMyClub").on("click", function () {
        self.location = "/myPage/getMyClub?userId="+userId;
    });
         $(".getMyClubApply").on("click", function () {
             self.location = "/myPage/getMyClubApply?userId="+userId;
         });
        $(".getMyDeal").on("click", function () {
        self.location = "/myPage/getMyDeal?userId="+userId;
    });
        $(".getMyDealReview").on("click", function () {
        self.location = "/myPage/getMyDealReview?userId="+userId;
    });
        $(".getMyReport").on("click", function () {
        self.location = "/myPage/getMyReport?userId="+userId;
    });
        $(".getMyPpt").on("click", function () {
        self.location = "/myPage/getMyPpt?userId="+userId;
    });

  });
     $(function (){
         $("#myPageMain").on("click" , function (){
             self.location = "/view/myPage/getMyPage.jsp"
         });
     });


    $(function () {
        $("#mainPage").on("click", function () {
            self.location = "/view/user/main.jsp";
        });

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
        })

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
    <div class="typing" id="myPageMain" style="cursor: pointer">

        <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
            마이페이지</h4>
    </div>

    <nav class="navbar navbar-expand-lg myPageBox">
        <div>
            <div class="underline yellow myBoard">
                작성 게시글
            </div>
            <div class="shadow-lg myPageTogle1" style="display: none;  width: 200px; height: 200px;  position: absolute;">
                <ul>
                    <li class="getMyBoard" >내가 작성한 게시글</li>
                    <li class="getMyComment">내가 작성한 댓글</li>
                    <li class="getMyBoardLike">좋아요한 게시글</li>
                    <li class="getMyCommentLike">좋아요한 댓글</li>

                </ul>
            </div>
        </div>


            <div class="abc"></div>



        <div>
            <div class="underline yellow MyClub">모임</div>
            <div class="shadow-lg myPageTogle2" style="display: none;  width: 200px; height: 200px;  position: absolute;">
                <ul>
                    <li class="getMyClub">가입한 모임</li>
                    <li class="getMyClubApply">가입신청한 모임</li>


                </ul>
            </div>
        </div>


        <div class="abc"></div>





        <div>
            <div class="underline yellow  MyDeal">거래</div>
            <div class="shadow-lg myPageTogle3" style="display: none;  width: 200px; height: 200px;  position: absolute;">
                <ul>
                    <li class="getMyDeal">거래 내역</li>
                    <li class="getMyDealReview">거래 후기</li>

                </ul>
            </div>
        </div>




        <div class="abc"></div>



        <div>
            <div class="underline yellow MyPpt">벌점/신고 </div>
            <div class="shadow-lg myPageTogle4" style="display: none;  width: 200px; height: 200px;  position: absolute;">
                <ul>
                    <li class="getMyPpt">받은 벌점 내역</li>
                    <li class="getMyReport">신고한 내역</li>

                </ul>
            </div>
        </div>



    </nav>
    <hr>
</div>
</body>
</html>
