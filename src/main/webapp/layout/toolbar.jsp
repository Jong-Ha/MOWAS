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
               self.location = "/user/loginNow";
           }
        });
    });

function fncLogin() {
    var id = $("input:text").val();
    var pw = $("input:password").val();
    var keepId = $("#keepId").prop('checked');
    var keepLogin = $("#keepLogin").prop('checked');
    console.log("keepId =>"+keepId);
    console.log("keepLogin =>"+keepLogin);

    if (id == null || id.length < 1) {
        alert('ID를 입력하지 않으셨습니다');
        $("input:text").focus();
        return;
    }
    if (pw == null || pw.length < 1) {
        alert('패스워드를 입력하지 않으셨습니다');
        $("input:password").focus();
        return;
    }

    //$("form").attr("method", "POST").attr("action", "/user/login").submit();
    $.ajax("/user/json/login",{
        method : "POST",
        dataType : "JSON",
        data : JSON.stringify({
            userId : id,
            password : pw,
        }),
        headers : {
            "Accept" : "application/json",
            "Content-Type" : "application/json"
        },
        success : function (map){
            //alert('JSONData ==>'+JSONData);
            if(map.result){
                if(keepId){
                    $.cookie('keepId',id,{ expires : 365,path : '/'});
                }else {
                    $.removeCookie('keepId',{path : '/'})
                }
                if(keepLogin){
                    $.cookie('keepLogin',pw,{expires: 365, path: '/'});
                }else {
                    $.removeCookie('keepLogin',{path : '/'})
                }
                $(self.location).attr("href", map.uri)
            }else{
                alert('아이디, 비밀번호를 확인하세요')
            }
        },
        error : function (){
            alert("로그인 실패");
        }
    });
};

$(function (){
    $('input[name="userId"]').focus();
    console.log('keepId의 값은? : '+$.cookie('keepId'))
    if($.cookie('keepId')!=undefined){
        $('#keepId').prop('checked',true);
        $('#keepLogin').prop('disabled',!$('#keepId').prop('checked'));
        $('input[name="userId"]').val($.cookie('keepId'));
        $('input[name="password"]').focus();
    }
    console.log('keepLogin의 값은? : '+$.cookie('keepLogin'))
    if($.cookie('keepLogin')!=undefined){
        $('#keepLogin').prop('checked',true);
        $('input[name="password"]').val($.cookie('keepLogin'));
    }
    $('#keepId').on('click',function (){
        $('#keepLogin').prop('disabled', !$(this).prop('checked'));
    });

    $(".loginStart").bind('click',function (){
        fncLogin();
    });
    $('input[name="password"]').on('keydown', function (key){
        if(key.keyCode == 13){
            fncLogin();
        }
    })
});
$(function () {
    $(".addUserStart").on("click", function () {
        location.href = "/view/user/addUser.jsp"
    });
});
$(function () {
    $("#findId").on("click", function () {
        location.href = "/view/user/getMyId.jsp"
    });
});
$(function () {
    $("#findPassword").on("click", function () {
        location.href = "/view/user/getMyPassword.jsp"
    });
});

    $(function () {
        $(".kakaoImage").on("click", function () {
            window.open("https://kauth.kakao.com/oauth/authorize?client_id=6230abede953ee2dbfed27975e15f04a&redirect_uri=http://192.168.0.235:8080/user/kakaoLogin&response_type=code", "kakaoLogin", "height=900, width=600 top=100, left=550");
        });
    });

$(function (){
    $("#naverIdLogin").on("click", function (){

        var naverLogin = new naver.LoginWithNaverId(
            {
                clientId: "LVp6wWTSWO4roaPEeGxT",
                // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
                callbackUrl: "http://localhost:8080/user/callBack",
                // 본인의 callBack url로 수정하세요.
                isPopup: false,// 팝업창으로 로그인을 진행할 것인지?
                loginButton: {color: "green", type: 3, height: 70}
                // 버튼 타입 ( 색상, 타입, 크기 변경 가능 )
                // 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
            }
        );
        naverLogin.init();
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
        /*.modal{*/
        /*    position: absolute;*/
        /*    width: 100%; height: 100%;*/
        /*    background: rgba(0,0,0,0.8);*/
        /*    top:0; ldft:0;*/
        /*    display:none;*/
        /*}*/
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

        .selectedTab {
            background-size: 100% 100%;
        }

        .btn-primary {
            --bs-btn-color: #000;
            --bs-btn-bg: #f8cd07b3;
            --bs-btn-border-color: #f8cd07b3;
            --bs-btn-hover-color: #000;
            --bs-btn-hover-bg: #f8cd07;
            --bs-btn-hover-border-color: #f8cd07;
            --bs-btn-focus-shadow-rgb: 130,138,145;
            --bs-btn-active-color: #000;
            --bs-btn-active-bg: #f8cd07;
            --bs-btn-active-border-color: #f8cd07;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #fff;
            --bs-btn-disabled-bg: #6c757d;
            --bs-btn-disabled-border-color: #6c757d;
        }

        .bg-primary {
            --bs-bg-opacity: 1;
            background-color: #f8cd07b3 !important;
            --bs-badge-color: #000;
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
                                         style="font-size: 1.2em; color: #FFFFFF; " data-bs-toggle="modal" data-bs-target="#loginModal">로그인
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
