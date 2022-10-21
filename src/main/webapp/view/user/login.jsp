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
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/resources/OpenSource/js/jquery.cookie.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

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

       // 선언된 naverLogin 을 이용하여 유저 (사용자) 정보를 불러오는데
        // 함수 내부에서 naverLogin을 선언하였기에 지역변수처리가 되어
        // userinfo 정보를 추출하는 것은 지역변수와 같은 함수에서 진행주어야한다.
        // 아래와 같이 로그인한 유저 ( 사용자 ) 정보를 직접 접근하여 추출가능하다.
        // 이때, 데이터는 첫 연동시 정보 동의한 데이터만 추출 가능하다.
        // 백엔드 개발자가 정보를 전달해준다면 아래 요기! 라고 작성된 부분까지는
        // 코드 생략이 가능하다.
    // 네이버 소셜 로그인 (네아로) 는 URL 에 엑세스 토큰이 붙어서 전달된다.
    // 우선 아래와 같이 토큰을 추출 할 수 있으며,
    // 3부에 작성 될 Redirect 페이지를 통해 빠르고, 깨끗하게 처리가 가능하다.

        // console.log, alert 창을 통해 토큰이 잘 추출 되는지 확인하자!

        // 이후 로컬 스토리지 또는 state에 저장하여 사용하자!
        // localStorage.setItem('access_token', token)
        // setGetToken(token)

    // 화면 첫 렌더링이후 바로 실행하기 위해 useEffect 를 사용하였다.


// var naver_id_login = new naver_id_login("LVp6wWTSWO4roaPEeGxT", "http://localhost:8080/user/login");
// var state = naver_id_login.getUniqState();
// naver_id_login.setButton("white", 2,40);
// naver_id_login.setDomain("http://localhost:8080/user/login");
// naver_id_login.setState(state);
// naver_id_login.setPopup();
// naver_id_login.init_naver_id_login();

/*
    $(function (){
        $(".kakao").on("click", function (){
         Kakao.Auth.authorize({
              redirectUri: '${'http://localhost:8080/view/user/login.jsp'}',
         });

            Kakao.Auth.setAccessToken('${ACCESS_TOKEN}');

            Kakao.API.request({
                url: '/v2/user/me',
            })
                .then(function(response) {
                    console.log(response);
                })
                .catch(function(error) {
                    console.log(error);
                });

        });
    });

    */
/*
///자바스크립트 펑션
 $(function (){
     $(".kakao").on("click", function (){

             window.Kakao.init('064b845197ba0a5631091cfb59197ad2');

             window.Kakao.Auth.login({
                 scope: 'profile_image, account_email, gender', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                 success: function(response) {
                     console.log(response) // 로그인 성공하면 받아오는 데이터
                     window.Kakao.API.request({ // 사용자 정보 가져오기
                         url: '/v2/user/me',
                         success: (res) => {
                             const kakao_account = res.kakao_account;
                             console.log(kakao_account)
                         }
                     });
                     //window.location.href='http://localhost:8080/view/user/login.jsp' //리다이렉트 되는 코드
                 },
                 fail: function(error) {
                     console.log(error);
                 }
             });
         });
     });

    $(function (){
        $(".kakaologout").on("click", function (){
            alert('bbbb');
            window.Kakao.init('064b845197ba0a5631091cfb59197ad2');
            function kakaoLogout() {
                if (!Kakao.Auth.getAccessToken()) {
                    console.log('Not logged in.');
                    return;
                }
                Kakao.Auth.logout(function(response) {
                    alert(response +' logout');
                    window.location.href='/'
                });
            };

        });
    });

    $(function (){
        $(".kakaodelete").on("click", function (){
            alert('cccc');
            function secession() {
                Kakao.API.request({
                    url: '/v1/user/unlink',
                    success: function(response) {
                        console.log(response);
                        //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
                        window.location.href='/'
                    },
                    fail: function(error) {
                        console.log('탈퇴 미완료')
                        console.log(error);
                    },
                });
            };

        });
    });
*/
    /*
     ///카카오레스트 펑션
       $(function () {
          $("#kakaoLogin").on("click", function () {

       //카카오로그인
        $(function kakaoLogin() {

           $.ajax({
               url: '/user/json/login/getKakaoAuthUrl',
               type: 'get',
               async: false,
               dataType: 'text',
               success: function (res) {
                   location.href = res;
               }
           });

         })
        });
       });

       $(document).ready(function() {

           var kakaoInfo = '${kakaoInfo}';

        if(kakaoInfo != ""){
            var data = JSON.parse(kakaoInfo);

            alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
            alert(
                "user : \n" + "email : "
                + data['email']
                + "\n nickname : "
                + data['nickname']);
        }
    })
*/
    /*
    var naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "LVp6wWTSWO4roaPEeGxT", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
            callbackUrl: "http://localhost:8080/view/user/main.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
            isPopup: false,
            callbackHandle: true
        }
    );

    naverLogin.init();

    window.addEventListener('load', function () {
        naverLogin.getLoginStatus(function (status) {
            if (status) {
                var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.

                console.log(naverLogin.user);

                if( email == undefined || email == null) {
                    alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                    naverLogin.reprompt();
                    return;
                }
            } else {
                console.log("callback 처리에 실패하였습니다.");
            }
        });
    });


    var testPopUp;
    function openPopUp() {
        testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
    }
    function closePopUp(){
        testPopUp.close();
    }

    function naverLogout() {
        openPopUp();
        setTimeout(function() {
            closePopUp();
        }, 1000);


    }

*/


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
                        <label for="keepId"> <input type="checkbox" id="keepId" name="keepId" value="keepId"> 아이디 저장</label></div>
                    <div class="checkbox mb-3">
                        <label for="keepLogin"> <input type="checkbox" id="keepLogin" name="keepLogin" disabled="disabled" value=keepLogin"> 자동 로그인
                        </label>
                    </div>
                    <button class="btn btn-outline-primary btnlf addUserStart" type="button"> 회원 가입</button>
                    <button class="btn btn-outline-info btnlf loginStart" type="button">login</button>

                    <!-- 카카오 로그인 -->
                    <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=6230abede953ee2dbfed27975e15f04a&redirect_uri=http://localhost:8080/user/kakaoLogin&response_type=code">
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
                        var naver_id_login =  new window.naver_id_login("LVp6wWTSWO4roaPEeGxT", "http://localhost:8080/user/callBack");
                        var state = naver_id_login.getUniqState();
                        naver_id_login.setButton("white", 2,40);
                        naver_id_login.setDomain("http://localhost:8080/");
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
</body>
</html>