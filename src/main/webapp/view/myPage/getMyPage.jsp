<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style>
        ul li {
            list-style: none;
        }


        #userImage1 {
            border-radius: 50%;
            width: 60%;
            border: 1px solid #00000024;
        }

        #userImage2 {
            border-radius: 50%;
            width: 60%;
            border: 1px solid #00000024;
        }

        #userImage3 {
            border-radius: 50%;
            width: 60%;
            border: 1px solid #00000024;
        }

        .userInfo {
            text-align: center;
            width: 20%;
            height: 352px;
            padding: 10px;
            margin-right: 30px;
            margin-left: 30px;
            border-radius: 10px;

        }

        .userText {
            height: 36%;
            text-align: left;
            margin-top: 37px;
            font-size: 1.2em;
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

    </style>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(function () {
        var userId = $("#userId").val();


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

        $(".myBoard").on("click", () => {

            $(".myPageTogle2").slideToggle();
        })

    });

</script>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr>
<div class="container">
<div class="myPageButton" style="display: flex; align-items: center; justify-content: center; margin-top: 50px;">
    <c:if test="${user.userId=='admin'}">
        <button type="button" class="listUser" id="listUser">회원목록조회</button>
    </c:if>


</div>

<input type="hidden" id="userId" name="userId" value="${user.userId}">


<div class="container" style="padding-bottom: 250px">

    <div class="myPage-top" style=" display: flex; padding: 10px">

        <div class="userInfo shadow-lg" style="height: 350px;">

            <c:if test="${user.loginType=='1'}">
                <span class="aaa">
                <img id="userImage1" class="userImgae1" src="/resources/${user.userImage}">
                <input type="hidden" class="userPhoto1" value="${user.userImage}">
                </span>
            </c:if>

            <c:if test="${user.loginType=='2'}">
                <img id="userImage2" style="width : 60%;" src="${user.userImage}">
                <input type="hidden" class="userPhoto2" value="${user.userImage}">
            </c:if>

            <c:if test="${user.loginType=='3'}">
                <img id="userImage3" style="width : 60%;" src="${user.userImage}">
                <input type="hidden" class="userPhoto3" value="${user.userImage}">
            </c:if>

            <div class="userText">

                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-person" viewBox="0 0 16 16">
                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                    </svg>
                    ${user.userId}
                </div>


                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-card-text" viewBox="0 0 16 16">
                        <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                        <path d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8zm0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                    ${user.userName}
                </div>

                <c:if test="${user.email ne null}">
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                         class="bi bi-envelope" viewBox="0 0 16 16">
                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                    </svg>
                    ${user.email}
                </div>
                </c:if>

                <br>
            </div>

            <button type="button" class="getMyInfor btn btn-primary" id="getMyInfor">내 정보 보기</button>
            <br>
        </div>


        <div class="userCalender shadow-lg" style=" height: 600px; overflow: scroll; padding: 10px;">
            <jsp:include page="/view/user/userCalender.jsp"/>
        </div>
    </div>
</div>
</div>


<jsp:include page="/layout/chatIcon.jsp"/>


<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
