<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

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
            transform: scale(2);
        }
        #userImage2:hover {
            transform: scale(2);
        }
        #userImage3:hover {
            transform: scale(2);
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
    </style>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(function () {
        var userId = $("#userId").val();
        $("#listUser").on("click", function () {
            self.location = "/user/listUser";
        });
        $("#getMyInfor").on("click", function () {
            self.location = "/myPage/getMyInfor?userId=" + userId;
        });
        $("#getMyBoard").on("click", function () {
            self.location = "/myPage/getMyBoard?userId=" + userId;
        });
        $("#getMyComment").on("click", function () {
            self.location = "/myPage/getMyComment?userId=" + userId;
        });
        $("#getMyLike").on("click", function () {
            self.location = "/myPage/getMyLike?userId=" + userId;
        });
        $("#getMyClub").on("click", function () {
            self.location = "/myPage/getMyClub?userId=" + userId;
        });
        $("#getMyDeal").on("click", function () {
            self.location = "/myPage/getMyDeal?userId=" + userId;
        });
        $("#getMyReport").on("click", function () {
            self.location = "/myPage/getMyReport?userId=" + userId;
        });
        $("#getMyPpt").on("click", function () {
            self.location = "/myPage/getMyPpt?userId=" + userId;
        });
 /*       $("#getMyNotice").on("click", function () {
            self.location = "/myPage/getMyNotice?userId=" + userId;
        });
        $("#getMyCalendar").on("click", function () {
            self.location = "/myPage/getMyCalendar?userId=" + userId;
        });*/

        $(".aaa").on("click", function () {
            var userPhoto = $(".userPhoto1").val();
            window.open("/resources/" + userPhoto + "", "userPhoto",
                "height=500, width=500");
        })
        $(".aaa").on("click", function () {
            var userPhoto = $(".userPhoto1").val();
            window.open("/resources/" + userPhoto + "", "userPhoto",
                "height=500, width=500");
        })
        $(".bbb").on("click", function () {
            var userPhoto = $(".userPhoto2").val();
            window.open("" + userPhoto + "", "userPhoto",
                "height=500, width=500");
        })
        $(".ccc").on("click", function () {
            var userPhoto = $(".userPhoto3").val();
            window.open("" + userPhoto + "", "userPhoto",
                "height=500, width=500");
        })
    });
    $(function () {
        $("#mainPage").on("click", function () {
            self.location = "/view/user/main.jsp";
        });

        $(".publicText").on("click",()=>{

            $(".myPageTogle1").slideToggle();
        })

        $(".calender").on("click",()=>{

            $(".myPageTogle2").slideToggle();
        })

    });

</script>
<body>

<header class="tool-bar con-min-width">
    <div class="con">
        <nav class="top-bar__menu-box-1">

        </nav>
    </div>
</header>
<button type="button" class="mainPage" id="mainPage">메인페이지</button>
<br>


<div class="wrapper">
    <div class="typing">
        <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
            마이페이지</h4>
    </div>

    <nav class="navbar navbar-expand-lg myPageBox">



    <div>
        <div class="underline yellow calender">작성 게시글</div>
        <div class="shadow-lg myPageTogle2" style="display: none; border: 1px solid; width: 100px; height: 200px; background: #1817174d; position: absolute">
            <ul>
                <li>내가 작성한 글</li>
                <li>내가 작성한 댓글</li>
                <li>좋아요한 게시글</li>
                <li>좋아요한 댓글</li>

            </ul>
        </div>
    </div>

    <div>
        <div class="underline yellow clubCalenderReview">모임</div>
        <div class="shadow-lg myPageTogle2" style="display: none; border: 1px solid; width: 100px; height: 200px; background: #1817174d; position: absolute">
            <ul>
                <li>1</li>
                <li>2</li>
                <li>3</li>

            </ul>
        </div>
    </div>

    <div>
        <div class="underline yellow  clubCalenderReviewShort">거래</div>
        <div class="shadow-lg myPageTogle2" style="display: none; border: 1px solid; width: 100px; height: 200px; background: #1817174d; position: absolute">
            <ul>
                <li>1</li>
                <li>2</li>
                <li>3</li>

            </ul>
        </div>
    </div>

    <div>
        <div class="underline yellow villBoard">벌점/신고 </div>
        <div class="shadow-lg myPageTogle2" style="display: none; border: 1px solid; width: 100px; height: 200px; background: #1817174d; position: absolute">
            <ul>
                <li>1</li>
                <li>2</li>
                <li>3</li>

            </ul>
        </div>
    </div>



</nav>
<hr>
</div>
<div class="myPageButton" style="display: flex; align-items: center; justify-content: center; margin-top: 50px;">
<c:if test="${user.userId=='admin'}">
    <button type="button" class="listUser" id="listUser">회원목록조회</button>
</c:if>

    <button type="button" class="getMyBoard" id="getMyBoard">작성글</button>
    <button type="button" class="getMyComment" id="getMyComment">작성 댓글, 대댓글</button>
    <button type="button" class="getMyLike" id="getMyLike">좋아요</button>
    <button type="button" class="getMyClub" id="getMyClub">모임</button>
    <button type="button" class="getMyDeal" id="getMyDeal">거래</button>
    <button type="button" class="getMyReport" id="getMyReport">신고</button>
    <button type="button" class="getMyPpt" id="getMyPpt">벌점</button>

</div>

<input type="hidden" id="userId" name="userId" value="${user.userId}">


<div class="wap">

    <div class="myPage-top" style=" display: flex; padding: 10px">

        <div class="userInfo shadow-lg" style=" width: 30%; height: 300px;  padding: 10px;  margin-right: 30px;">

            <c:if test="${user.loginType=='1'}">
                <span class="aaa">
                <img id="userImage1" style="width : 50%;" src="/resources/${user.userImage}">
                <input type="hidden" class="userPhoto1" value="${user.userImage}">
                </span>
            </c:if>
            <c:if test="${user.loginType=='2'}">
                <span class="bbb">회원 사진
                <img id="userImage2" style="width : 50%;" src="${user.userImage}">
                <input type="hidden" class="userPhoto2" value="${user.userImage}">
                </span>
            </c:if>
            <c:if test="${user.loginType=='3'}">
                <span class="ccc">회원 사진
                  <img id="userImage3" style="width : 50%;" src="${user.userImage}">
                   <input type="hidden" class="userPhoto3" value="${user.userImage}">
                </span>
            </c:if>

            <div style="display: flex">

                <div>
                    아이디
                </div>

                <div>
                    ${user.userId}
                </div>
            </div>

            <div>
                <div>
                    이름
                    ${user.userName}
                </div>
            </div>
            <div>
                아이디 ${user.email}
            </div>

            <br>
            <button type="button" class="getMyInfor" id="getMyInfor">내 정보 보기</button>
        </div>

        <div class="userCalender shadow-lg" style=" height: 600px; overflow: scroll; padding: 10px;">
            <jsp:include page="/view/user/userCalender.jsp"/>
        </div>
</div>




</div>
</body>
</html>
