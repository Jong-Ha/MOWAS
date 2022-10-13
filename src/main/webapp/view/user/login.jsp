<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"
         import="java.text.DateFormat, java.util.Date"
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
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



    $("#floatingInput").focus();

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
                    password : pw
                }),
                headers : {
                    "Accept" : "application/json",
                    "Content-Type" : "application/json"
                },
                success : function (JSONData){
                    alert('JSONData ==>'+JSONData);
                    if(keepId){
                        $.cookie('keepId',id,{ expires : 365,path : '/'});
                    }else {
                        $.removeCookie('keepId',{paht : '/'})
                    }
                    if(keepLogin){
                        $.cookie('keepLogin',pw,{expires: 365, paht: '/'});
                    }else {
                        $.removeCookie('keepLogin',{path : '/'})
                    }
                    $(self.location).attr("href", "/view/user/main.jsp")
                },
                error : function (){
                    alert("로그인 실패");
                }
            });
    };

    $(function (){
        $('input[name="userId"]').focus();
        console.log('keepId : '+$.cookie('keepId'))
        if($.cookie('keepId')!=undefined){
            $('#keepId').prop('checked',true);
            $('#keepLogin').prop('disabled',!$('#keepId').prop('checked'));
            $('input[name="userId"]').val($.cookie('keepId'));
            $('input[name="password"]').focus();
        }
        console.log('keepLogin : '+$.cookie('keepLogin'))
        if($.cookie('keepLogin')!=undefined){
            $('#keepLogin').prop('checked',true);
            $('input[name="password"]').val($.cookie('keepLogin'));
        }
        $('#keepId').on('click',function (){
            $('#keepLogin').prop('disabled', !$(this).prop('checked'));
        });
        $(".loginStart").bind('click',function (){
            alert('로그인버튼클릭');
            fncLogin();
        });
        $('input[name="password"]').on('keydown', function (key){
            if(key.keyCode == 4){
                fncLogin();
            }
        })
    });
    $(function () {
        $(".addUserStart").on("click", function () {
            location.href = "/view/user/addUser.jsp"
        });
    });



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
                        <input type="text" class="form-control userId" id="floatingInput" placeholder="Id" name="userId">
                        <label for="floatingInput" >ID</label>
                    </div>
                    <!--<div class="form-floating">
                        <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                        <label for="floatingInput">Email address</label>
                    </div>-->
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" >
                        <label for="floatingPassword">Password</label>
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

                    <!--<button class="btn btn-outline-info btnlf kakao"  type="button">카카오로그인</button>
                    <button class="btn btn-outline-info btnlf kakaologout"  type="button">카카오로그아웃</button>
                    <button class="btn btn-outline-info btnlf kakaodelete"  type="button">카카오삭제</button>-->


                    <p class="mt-5 mb-3 text-muted">&copy; 2017-2022</p>

                </div>
            </div>

        </div>
    </form>

</main>

</body>
</html>