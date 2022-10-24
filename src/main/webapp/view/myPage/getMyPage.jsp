<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style>
        .wap {
            display: flex;
            flex-direction: column;
            margin-top: 70px;

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
        $("#getMyNotice").on("click", function () {
            self.location = "/myPage/getMyNotice?userId=" + userId;
        });
        $("#getMyCalendar").on("click", function () {
            self.location = "/myPage/getMyCalendar?userId=" + userId;
        });

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
    });

</script>
<body>
<button type="button" class="mainPage" id="mainPage">메인페이지</button>
<br>
<h2>마이페이지</h2>

<div class="myPageButton" style="display: flex; align-items: center; justify-content: center; margin-top: 50px;">
    <button type="button" class="listUser" id="listUser">회원목록조회</button>
    <button type="button" class="getMyInfor" id="getMyInfor">내 정보 보기</button>
    <button type="button" class="getMyBoard" id="getMyBoard">작성글</button>
    <button type="button" class="getMyComment" id="getMyComment">작성 댓글, 대댓글</button>
    <button type="button" class="getMyLike" id="getMyLike">좋아요</button>
    <button type="button" class="getMyClub" id="getMyClub">모임</button>
    <button type="button" class="getMyDeal" id="getMyDeal">거래</button>
    <button type="button" class="getMyReport" id="getMyReport">신고</button>
    <button type="button" class="getMyPpt" id="getMyPpt">벌점</button>
    <button type="button" class="getMyNotice" id="getMyNotice">알림</button>
    <button type="button" class="getMyCalendar" id="getMyCalendar">일정</button>
</div>

<input type="hidden" id="userId" name="userId" value="${user.userId}">


<div class="wap">

    <div class="myPage-top" style=" display: flex; padding: 10px">

        <div class="userInfo shadow-lg" style=" width: 30%; height: 300px;  padding: 10px;  margin-right: 30px;">

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
            <div>아이디 ${user.email}</div>
            <c:if test="${user.loginType=='1'}">

<span class="aaa">회원 사진
    <img id="userImage1" style="width : 15%;" src="/resources/${user.userImage}">
    <input type="hidden" class="userPhoto1" value="${user.userImage}">
</span>
            </c:if>
            <c:if test="${user.loginType=='2'}">
<span class="bbb">회원 사진
    <img id="userImage2" style="width : 15%;" src="${user.userImage}">
    <input type="hidden" class="userPhoto2" value="${user.userImage}">
</span>
            </c:if>
            <c:if test="${user.loginType=='3'}">
<span class="ccc">회원 사진
    <img id="userImage3" style="width : 15%;" src="${user.userImage}">
    <input type="hidden" class="userPhoto3" value="${user.userImage}">
</span>
            </c:if>
        </div>

        <div class="userCalender shadow-lg" style=" height: 600px; overflow: scroll; padding: 10px;">
            <jsp:include page="/view/user/userCalender.jsp"/>

        </div>
    </div>





</div>
</body>
</html>
