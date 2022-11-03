<%--
  Created by IntelliJ IDEA.
  User: BACK
  Date: 2022-09-29
  Time: 오후 6:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="/resources/OpenSource/js/jquery.cookie.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
        charset="utf-8"></script>


<script type="text/javascript">


    $(function () {

        $("#login1").on("click", function () {
            console.log('${sessionScope.user.userId}')
            console.log($.cookie("keepLogin"))
            if ($.cookie('keepLogin') != undefined) {
                self.location = "/user/loginNow";
            }
        });
    });

    function fncLogin() {
        var id = $("#loginModal input:text").val().trim();
        var pw = $("#loginModal input:password").val().trim();
        var keepId = $("#keepId").prop('checked');
        var keepLogin = $("#keepLogin").prop('checked');
        console.log("keepId =>" + keepId);
        console.log("keepLogin =>" + keepLogin);

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
        $.ajax("/user/json/login", {
            method: "POST",
            dataType: "JSON",
            data: JSON.stringify({
                userId: id,
                password: pw,
            }),
            headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
            },
            success: function (map) {
                //alert('JSONData ==>'+JSONData);
                if (map.result) {
                    if (keepId) {
                        $.cookie('keepId', id, {expires: 365, path: '/'});
                    } else {
                        $.removeCookie('keepId', {path: '/'})
                    }
                    if (keepLogin) {
                        $.cookie('keepLogin', pw, {expires: 365, path: '/'});
                    } else {
                        $.removeCookie('keepLogin', {path: '/'})
                    }
                    $(self.location).attr("href", map.uri)
                } else {
                    alert('아이디, 비밀번호를 확인하세요')
                }
            },
            error: function () {
                alert("로그인 실패");
            }
        });
    };

    $(function () {
        $('#userId').focus();
        console.log('keepId의 값은? : ' + $.cookie('keepId'))
        if ($.cookie('keepId') != undefined) {
            $('#keepId').prop('checked', true);
            $('#keepLogin').prop('disabled', !$('#keepId').prop('checked'));
            $('#userId').val($.cookie('keepId'));
            $('#password').focus();
        }
        console.log('keepLogin의 값은? : ' + $.cookie('keepLogin'))
        if ($.cookie('keepLogin') != undefined) {
            $('#keepLogin').prop('checked', true);
            $('#password').val($.cookie('keepLogin'));
        }
        $('#keepId').on('click', function () {
            $('#keepLogin').prop('disabled', !$(this).prop('checked'));
        });

        $(".loginStart").on('click', function () {
            fncLogin();

            setTimeout(function () {
                location.reload();
            }, 1000);
        });
        $('#password').on('keydown', function (key) {
            if (key.keyCode == 13) {
                fncLogin();
                setTimeout(function () {
                    location.reload();
                }, 1000);
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


    // const { naver } = window as any;
    //
    // function fncLogin(props: any) {
    //     const initializeNaverLogin = () => {
    //         const naverLogin = new naver.LoginWithNaverId({
    //             clientId: "LVp6wWTSWO4roaPEeGxT",
    //             callbackUrl: "http://192.168.0.235:8080/user/callBack",
    //             isPopup: true, // popup 형식으로 띄울것인지 설정
    //             loginButton: { color: 'white', type: 1, height: '47' }, //버튼의 스타일, 타입, 크기를 지정
    //         });
    //         naverLogin.init();
    //     };
    //
    //     useEffect(() => {
    //         initializeNaverLogin();
    //     }, []);
    //
    //     return (
    // ...
    //     <div id='naverIdLogin' /> { /* id 꼭 입력해주어야 함 */}
    // ...
    // )
    // }


    // $(function () {
    //     $(".naverIdLogin").on("click", function () {
    //         alert('asdfdf');
    //
    //         var naverLogin = new naver.LoginWithNaverId(
    //             {
    //                 clientId: "LVp6wWTSWO4roaPEeGxT",
    //                 // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
    //                 callbackUrl: "http://192.168.0.235:8080/user/callBack",
    //                 // 본인의 callBack url로 수정하세요.
    //                 isPopup: true,// 팝업창으로 로그인을 진행할 것인지?
    //                 loginButton: {color: "green", type: 3, height: 70}
    //                 // 버튼 타입 ( 색상, 타입, 크기 변경 가능 )
    //                 // 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
    //             }
    //         );
    //         naverLogin.init();
    //     });
    // });


    $(function () {
        $("#logout").on("click", function () {
            self.location = "/user/logout";
        });
    });
    $(function () {
        $("#myPage").on("click", function () {
            self.location = "/myPage/getMyPage?userId=${sessionScope.user.userId}";
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
            display: flex;
        }

        .nav-link.underline.yellow.toolbar_nav{
            margin-right: 25px;
            color : #ffffff;
            font-size: 20px;
        }

        @font-face {
            font-family: 'MaplestoryOTFBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
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
            --bs-btn-focus-shadow-rgb: 130, 138, 145;
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
    <nav class="shadow-lg navbar navbar-expand-lg " style=" background: #333333;;  border-radius: 5px;padding: 0;">
        <div class="navCenter">

            <a class="navbar-brand " href="#" style="color : #ffffff; font-size: 2em">
                <img src="/resources/images/MOWAS_T_2.png" alt="MOWAS" style="height: 100px;width: 100px;object-fit: cover;">
            </a>

            <div class="container-fluid">

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
                        aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                            <a class="nav-link active  underline yellow toolbar_nav" aria-current="page"
                               onclick="location.href='/site/listMasterBoard'">공지 사항</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active  underline yellow toolbar_nav" aria-current="page"
                               onclick="location.href='/club/listClub'">모임
                                게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link  underline yellow toolbar_nav" href="#"
                               onclick="location.href='/clubCal/listCalenderReview?boardCategory='+1+'&reviewRange='+1">커뮤니티
                                게시판</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link  underline yellow toolbar_nav"
                               onclick="location.href='/deal/getListDeal?boardCategory=99'">중고 거래 게시판</a>
                        </li>

                        <c:if test="${sessionScope.user.masterCheck eq 2}">
                            <li class="nav-item">
                                <div class="dropdown">
                                    <a class="nav-link  underline yellow dropdown-toggle toolbar_nav"
                                       role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
                                       aria-expanded="false">
                                        관리자 게시판
                                    </a>

                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <li><a class="dropdown-item" href="/user/listUsers">회 원 관 리</a></li>
                                        <li><a class="dropdown-item" href="/site/listCommunityReport">커뮤니티 신고</a></li>
                                        <li><a class="dropdown-item" href="/site/listCommunityReportProcess">커뮤니티 신고
                                            처리</a></li>
                                        <li><a class="dropdown-item" href="/site/listClubReport">모임 신고</a></li>
                                        <li><a class="dropdown-item" href="/site/listClubReportProcess">모임 신고 처리</a>
                                        </li>

                                    </ul>
                                </div>
                            </li>
                        </c:if>

                    </ul>
                    <div class="logitem" style="align-items: center;">

                        <c:if test="${sessionScope.user.userImage ne null}">

                            <img src="/resources/${sessionScope.user.userImage}"
                                 style="width: 50px;margin-right: 10px; border-radius: 40px; height: 50px;background-color: #FFFFFF;object-fit: contain;">

                        </c:if>
                        <c:if test="${sessionScope.user.userImage eq null}">

                            <img src="${pageContext.request.contextPath}/resources/images/proplePoto.png"
                                 style="width: 50px;margin-right: 10px; border-radius: 40px; height: 50px;background-color: #FFFFFF;object-fit: contain;">

                        </c:if>

                        <div class="login ">
                            <div class="d-grid gap-2">

                                <c:if test="${sessionScope.user.userId eq null}">

                                    <div class="loginbox login underline yellow" id="login1"
                                         style="font-size: 1.2em; color: #FFFFFF; " data-bs-toggle="modal"
                                         data-bs-target="#loginModal">로그인
                                    </div>


                                </c:if>

                                <c:if test="${sessionScope.user.userId ne null}">

                                <div class="loginbox login underline yellow" style="font-size: 1.2em; color: #FFFFFF;"
                                     id="logout">로그아웃
                                </div>

                                <div class=" loginbox login underline yellow" style="font-size: 1.2em; color: #FFFFFF;"
                                     id="myPage" type="button">마이페이지
                                </div>

                            </c:if>
                            </div>

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

<%--로그인 모달창 시작--%>

<div class="modal model-center fade" id="loginModal" tabindex="-1" aria-labelledby="addLoginLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="addLoginLabel">로그인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="loginbody"
                         style="display: flex; align-items: center;  justify-items: center;  flex-direction: column;">

                        <div class="input-group mb-3 mt-3"
                             style="display: flex;align-items: center; justify-content: center;">
                            <div class="logo">
                                <img class="mb-4" src="/resources/images/MOWAS_W.png" width="160" height="120"
                                     style="border-radius: 20px; height: 124px; object-fit: contain;">
                            </div>
                        </div>


                        <div class="input-group mb-3 mt-3">
                            <div class="form-floating">
                                <input type="text" class="form-control userId" id="userId" placeholder="Id"
                                       name="userId">
                                <label for="userId">ID</label>
                            </div>
                        </div>


                        <!--<div class="form-floating">
                            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                            <label for="floatingInput">Email address</label>
                        </div>-->
                        <div class="input-group mb-3 mt-3">
                            <div class="form-floating">
                                <input type="password" class="form-control" id="password" placeholder="Password"
                                       name="password">
                                <label for="password">Password</label>
                            </div>
                        </div>
                    </div>

                    <div>
                        <label for="findId">
                            <div id="findId" style="font-weight: bold; font-size: 1.2rem; cursor: pointer">아이디 찾기</div>
                        </label>

                        <label for="findPassword">
                            <div id="findPassword"
                                 style=" margin-left: 13px; font-weight: bold; font-size: 1.2rem; cursor: pointer">비밀번호
                                찾기
                            </div>
                        </label>
                    </div>

                    <div class="md-3"
                         style=" margin-top: 10px;justify-content: center;display: flex;margin-bottom: 20px;">

                        <div class="form-check">
                            <input class="form-check-input checkbox" type="checkbox" value="keepId" name="keepId"
                                   id="keepId">
                            <label class="form-check-label" for="keepId">
                                아이디 저장
                            </label>
                        </div>

                        <div class="form-check" style="margin-left: 20px;">
                            <input class="form-check-input checkbox" type="checkbox" disabled="disabled"
                                   value="keepLogin" name="keepLogin" id="keepLogin">
                            <label class="form-check-label" for="keepLogin">
                                로그인 저장
                            </label>
                        </div>

                    </div>

                    <div>

                        <button class="btn btn-outline-primary btnlf addUserStart" type="button"> 회원 가입</button>
                        <button class="btn btn-outline-info btnlf loginStart" style="margin-right: 39px;" type="button">
                            로그인
                        </button>

                    </div>

                    <div class="snsLogin"
                         style="    display: flex;justify-content: center;align-items: center;flex-direction: column;">

                        <!-- 카카오 로그인 -->
                        <a class="p-2"
                           href="https://kauth.kakao.com/oauth/authorize?client_id=6230abede953ee2dbfed27975e15f04a&redirect_uri=http://192.168.0.235:8080/user/kakaoLogin&response_type=code"> </a>
                        <!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정하세요 -->
                        <!-- 저는 redirect_uri을 http://localhost:8080/member/kakaoLogin로 했습니다. -->
                        <!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->
                        <img class="kakaoImage" src="/resources/images/kakao_login_medium_wide.png"
                             style="height:50px; width:255px; cursor:pointer">
                        <!-- 이미지는 카카오 개발자센터에서 제공하는 login 이미지를 사용했습니다. -->

                        <!--<img class="naverIdLogin" src="/resources/images/naverLogin.png" style="height: 50px;width: 71.2%; margin-top: 10px;cursor:pointer">-->

                        <div id="naverIdLogin"></div>
                    </div>

                    <script type="text/javascript">
                        var naverLogin = new naver.LoginWithNaverId(
                            {
                                clientId: "LVp6wWTSWO4roaPEeGxT",
                                callbackUrl: "http://192.168.0.235:8080//view/user/callBack.jsp",
                                isPopup: true, /* 팝업을 통한 연동처리 여부 */
                                loginButton: {color: "green", type: 3, height: 55} /* 로그인 버튼의 타입을 지정 */
                            }
                        );

                        /* 설정정보를 초기화하고 연동을 준비 */
                        naverLogin.init();

                    </script>
                    <!-- // 네이버아이디로로그인 초기화 Script -->


                    <!-- //네이버 로그인 버튼 노출 영역
                    <script type="text/javascript">
                        var naver_id_login = new window.naver_id_login("LVp6wWTSWO4roaPEeGxT", "http://192.168.0.235:8080/user/callBack");
                        var state = naver_id_login.getUniqState();
                        naver_id_login.setButton("white", 2, 40);
                        naver_id_login.setDomain("http://192.168.0.235:8080/");
                        naver_id_login.setState(state);
                        naver_id_login.setPopup(false);
                        naver_id_login.init_naver_id_login();
                    </script>-->
                </form>
            </div>
        </div>

    </div>

</div>


<%--로그인 모달창 끝--%>
</body>
</html>
