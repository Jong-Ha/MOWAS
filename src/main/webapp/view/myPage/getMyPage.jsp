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
            transition: 0.3s;
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
        @keyframes typing {
            from {
                width: 0
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

        $(".myBoard").on("click",()=>{

            $(".myPageTogle2").slideToggle();
        })

    });

</script>
<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
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

        <div class="userInfo shadow-lg" style=" text-align:center; width: 20%; height: 400px;  padding: 10px;  margin-right: 30px;margin-left: 30px;">

            <c:if test="${user.loginType=='1'}">
                <span class="aaa">
                <img id="userImage1" style="width : 60%;" src="/resources/${user.userImage}">
                <input type="hidden" class="userPhoto1" value="${user.userImage}">
                </span>
            </c:if>
            <c:if test="${user.loginType=='2'}">
                <span class="bbb">회원 사진
                <img id="userImage2" style="width : 60%;" src="${user.userImage}">
                <input type="hidden" class="userPhoto2" value="${user.userImage}">
                </span>
            </c:if>
            <c:if test="${user.loginType=='3'}">
                <span class="ccc">회원 사진
                  <img id="userImage3" style="width : 60%;" src="${user.userImage}">
                   <input type="hidden" class="userPhoto3" value="${user.userImage}">
                </span>
            </c:if>

            <div >

                <div>
                    아이디
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
                이메일 ${user.email}
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
