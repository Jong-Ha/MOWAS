<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-13
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>



<body>

<script>
    window.Kakao.init('064b845197ba0a5631091cfb59197ad2'); // 사용하려는 앱의 JavaScript 키 입력

    function kakaoLogin(){
        window.Kakao.Auth.login({
            scope:'profile_image, account_email, gender',
            success : function (authObj){
                console.log(authObj);
                window.Kakao.API.request({
                    url : '/v2/user/me', //현재 로그인한 사용자의 정보를 가져오는것
                    success : res => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account);
                    }
                });
            }
        });
    }


</script>

<a href="javascript:kakaoLogin(); ">카카오 로그인 이미지</a>

</body>
</html>
