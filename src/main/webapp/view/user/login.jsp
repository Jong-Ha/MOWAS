<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         import="java.text.DateFormat, java.util.Date"
%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Bootstrap Example</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/OpenSource/js/jquery.cookie.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
    .wap {
        width: 400px;
        margin-top: 100px;
    }
    .loginbox {
        border-radius: 10px;
        width: 500px;
        padding: 15px;
    }
    .loginbnt {
        margin-bottom: 10px;
    }
</style>
<!-- Custom styles for this template -->
<link href="" rel="stylesheet">
<script type="text/javascript">


    $("#userId").focus();

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
                success : function (result){
                    //alert('JSONData ==>'+JSONData);
                    if(result){
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
                    $(self.location).attr("href", "/view/user/main.jsp")
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
    $(function (){
        $("#naverIdLogin").on("click", function (){

      var naverLogin = new naver.LoginWithNaverId(
         {
            clientId: "LVp6wWTSWO4roaPEeGxT",
            // 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
            callbackUrl: "http://192.168.0.235:8080/user/callBack",
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


</script>
</head>
<body class="text-center" style="background-color: #dee2e6;">

<main class="form-signin w-100 m-auto" style="text-align: -webkit-center;">

    <form>

        <div class="wap">
            <div class="wap">

                <div class="shadow-lg loginbox">
                    <img class="mb-4" width="72" height="57">
                    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

                    <div class="form-floating">
                        <input type="text" class="form-control userId" id="userId" placeholder="Id" name="userId">
                        <label for="userId" >ID</label>
                    </div>
                    <!--<div class="form-floating">
                        <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                        <label for="floatingInput">Email address</label>
                    </div>-->
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password" placeholder="Password" name="password" >
                        <label for="password">Password</label>
                    </div>

                    <div class="checkbox mb-3">
                        <label for="findId"> <input type="checkbox" id="findId" name="findId" value="findId">아이디 찾기</label></div>
                    <div class="checkbox mb-3">
                        <label for="findPassword"> <input type="checkbox" id="findPassword" name="findPassword" value=findPassword">비밀번호 찾기
                        </label>
                    </div>

                    <div class="checkbox mb-3">
                        <label for="keepId"> <input type="checkbox" id="keepId" name="keepId" value="keepId"> 아이디 저장</label></div>
                    <div class="checkbox mb-3">
                        <label for="keepLogin"> <input type="checkbox" id="keepLogin" name="keepLogin" disabled="disabled" value=keepLogin"> 자동 로그인
                        </label>
                    </div>
                    <button class="btn btn-outline-primary btnlf addUserStart" type="button"> 회원 가입</button>
                    <button class="btn btn-outline-info btnlf loginStart" type="button">login</button>

                    <!-- 카카오 로그인 -->
                    <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=6230abede953ee2dbfed27975e15f04a&redirect_uri=http://192.168.0.235:8080/user/kakaoLogin&response_type=code">
                        <!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정하세요 -->
                        <!-- 저는 redirect_uri을 http://localhost:8080/member/kakaoLogin로 했습니다. -->
                        <!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->

                        <img src="/resources/images/kakao_login_medium_wide.png" style="height:50px">
                        <!-- 이미지는 카카오 개발자센터에서 제공하는 login 이미지를 사용했습니다. -->
                    </a>


                    <div id="naverIdLogin" >
                        <img src="/resources/images/naverLogin.png" style="height:50px; width: 70%;">
                    </div>

                    <div id="naver_id_login"></div>
                    <!-- //네이버 로그인 버튼 노출 영역 -->
                    <script type="text/javascript">
                        var naver_id_login =  new window.naver_id_login("LVp6wWTSWO4roaPEeGxT", "http://192.168.0.235:8080/user/callBack");
                        var state = naver_id_login.getUniqState();
                        naver_id_login.setButton("white", 2,40);
                        naver_id_login.setDomain("http://192.168.0.235:8080/");
                        naver_id_login.setState(state);
                        naver_id_login.setPopup(false);
                        naver_id_login.init_naver_id_login();
                    </script>



                    <!--<div id="naver_id_login"></div>
                        <div id="naverIdLogin"></div>-->
                <%--
                    String clientId = "LVp6wWTSWO4roaPEeGxT";//애플리케이션 클라이언트 아이디값";
                    String redirectURI = URLEncoder.encode("http://localhost:8080/user/login", "UTF-8");
                    SecureRandom random = new SecureRandom();
                    String state = new BigInteger(130, random).toString();
                    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
                    apiURL += "&client_id=" + clientId;
                    apiURL += "&redirect_uri=" + redirectURI;
                    apiURL += "&state=" + state;
                    session.setAttribute("state", state);
                --%>

                    <p class="mt-5 mb-3 text-muted">&copy; 2017-2022</p>

                </div>
            </div>

        </div>
    </form>

</main>
<script>

    $(document).ready(function (){
        var id = $("input:text").val();
        var pw = $("input:password").val();
        var keepId = $("#keepId").prop('checked');
        var keepLogin = $("#keepLogin").prop('checked');
        console.log('자동로그인keepId'+keepId);
        console.log('자동로그인keeplogin'+keepLogin);
        if (keepId && keepLogin ) {
            fncLogin();
        }

    })
</script>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>