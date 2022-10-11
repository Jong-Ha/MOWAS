<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Bootstrap Example</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/resources/OpenSource/js/jquery.cookie.js"></script>


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
                    console.log('JSONData ==>'+JSONData)
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
//                    $(self.location).attr("href", "/view/user/main.jsp")
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
            //alert('이건 뜨나?');
            location.href = "/view/user/addUser.jsp"
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


                    <p class="mt-5 mb-3 text-muted">&copy; 2017-2022</p>

                </div>
            </div>

        </div>
    </form>

</main>

</body>
</html>