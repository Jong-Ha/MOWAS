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

    $(function () {
        $(".loginStart").on("click", function () {
            var id = $("input:text").val();
            var pw = $("input:password").val();

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
            //alert('로그인?');
            $("form").attr("method", "POST").attr("action", "/user/login").submit();

        })
    })

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
                        <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                        <label for="floatingPassword">Password</label>
                    </div>

                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" value="remember-me"> 자동 로그인
                            <input type="checkbox" value="remember-me"> 아이디 저장
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