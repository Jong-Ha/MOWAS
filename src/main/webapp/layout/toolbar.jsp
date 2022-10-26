<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-09-29
  Time: 오후 6:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript" src="/resources/OpenSource/js/jquery.cookie.js"></script>

<script type="text/javascript">


    $(function () {

        $("#login1").on("click", function () {
            console.log('${user.userId}')
            console.log($.cookie("keepLogin"))
            if( $.cookie('keepLogin')!=undefined){

                self.location = "/user/login";
            }else {

                self.location = "/view/user/login.jsp";
            }
        });
    });
    $(function () {
        $("#logout").on("click", function () {
            self.location = "/user/logout";
        });
    });
    $(function () {
        $("#myPage").on("click", function () {
            var userId = $("#modelUser").val();
            self.location = "/myPage/getMyPage?userId=" + userId;
        });
    });


</script>
<html>

<head>
    <title>Title</title>

    <style>
        .color {
            color: #ffff;
        }

        .topbar {
            margin-bottom: 20px;
        }

        .navbar {
            justify-content: center;
        }

        .btnlf {
            margin-left: 20px;
        }

        .textint {
            font-size: 0.2em;
            margin-top: -20px;
        }

        .login {
            float: left;
            margin-right: 20px;
            width: 120px;
        }

        .alrim {
            font-size: 0.1rem;
            width: 45px;
        }

        .loginbox {
            color: #FFFFFF;
            width: 100px;
        }

        .navCenter {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 1200px;
            margin: auto;
            color: #fff;
        }

        .logitem {
            margin-top: -20px;
            display: flex;
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


</head>
<body>

<div class="topbar">
    <nav class="shadow-lg navbar navbar-expand-lg " style=" background: #000000c7;;  border-radius: 5px;">
        <div class="navCenter">
            <div class="container-fluid">

                <a class="navbar-brand " href="#" style="color : #ffffff; font-size: 2em">MOWAS</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                        aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                            <a class="nav-link active  underline yellow" aria-current="page" href="#"
                               style="color : #ffffff; font-size: 1.5em;">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link  underline yellow" href="#" style="color : #ffffff; ">Link</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link  underline yellow" style="color : #ffffff; font-size: 1.5em;">Link</a>
                        </li>
                    </ul>
                    <div class="logitem">
                        <img src="${pageContext.request.contextPath}/resources/images/proplePoto.png"
                             style="width: 60px;margin-right: 10px; border-radius: 40px; height: 50px;">

                        <div class="login ">
                            <div class="d-grid gap-2">

                                <c:if test="${user.userId eq null}">

                                    <div class="loginbox login underline yellow" id="login1"
                                         style="font-size: 1.2em; color: #FFFFFF; ">로그인
                                    </div>

                                </c:if>

                                <c:if test="${user.userId ne null}">

                                <div class="loginbox login underline yellow" style="font-size: 1.2em; color: #FFFFFF;"
                                     id="logout">로그아웃
                                </div>

                                <div class=" loginbox login underline yellow" style="font-size: 1.2em; color: #FFFFFF;"
                                     id="myPage" type="button">마이페이지
                                </div>
                            </div>

                            </c:if>

                        </div>
                    </div>
                </div>

           <%--     <button type="button" class="btn btn-primary position-relative alrim" style="font-size: 0.5em;">
                    Inbox
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"> </span>

                </button>--%>

            </div>
        </div>
    </nav>
</div>
</body>
</html>
