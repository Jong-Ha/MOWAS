<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Insert title here</title>
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
  var naverLogin = new naver.LoginWithNaverId({
    clientId: "LVp6wWTSWO4roaPEeGxT", // 본인걸로 수정, 띄어쓰기 금지.
    callbackUrl: "http://192.168.0.235:8080/user/callBack", // 아무거나 설정
    isPopup: false,
    callbackHandle: true
  });
  naverLogin.init();

  window.addEventListener('load', function () {
    naverLogin.getLoginStatus(function (status) {

      if (status) {
         console.log(naverLogin.user);
        //var id = naverLogin.user.getId();
        var name = naverLogin.user.getName();
        var email = naverLogin.user.getEmail();
        var profilImage = naverLogin.user.getProfileImage();
        var gender = naverLogin.user.getGender();
        //var birthday = naverLogin.user.getBirthday();
        //var birthyear = naverLogin.user.getBirthyear();
        //var phone = naverLogin.user.getMobile();



        $.ajax({
          type: 'post',
          url: '/user/json/naverSave',
          data: {'n_name':name, 'n_email':email, 'n_profilImage': profilImage,
            'n_gender':gender},
          dataType: 'text',
          success: function(result) {
            if(result=='ok') {
              console.log('성공')
              location.replace("http://192.168.0.235:8080/view/user/updateSNSUserInfor.jsp")
            } else if(result=='no') {
              console.log('실패')
              location.replace("http://192.168.0.235:8080/user/json/naverSave")
            }
          },
          error: function(result) {
            console.log('오류 발생')
          }
        })

      } else {
        console.log("callback 처리에 실패하였습니다.");
      }
    });
  });
</script>
</body>
</html>