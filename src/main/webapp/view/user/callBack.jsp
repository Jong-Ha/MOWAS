<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>NaverLoginSDK</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>



<!-- (1) LoginWithNaverId Javscript SDK -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
<script>
  var naverLogin = new naver.LoginWithNaverId(
          {
            clientId: "LVp6wWTSWO4roaPEeGxT",
            callbackUrl: "http://192.168.0.235:8080//view/user/callBack.jsp",
            isPopup: true,
            callbackHandle: true
            /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
          }
  );

  /* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
  naverLogin.init();

  /* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
  window.addEventListener('load', function () {
    naverLogin.getLoginStatus(function (status) {
      if (status) {
        /* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
        var name = naverLogin.user.getName();
        var email = naverLogin.user.getEmail();
        var profilImage = naverLogin.user.getProfileImage();
        var gender = naverLogin.user.getGender();
        console.log(name); // 사용자 이메일 정보를 받을수 있습니다.
        console.log(email); // 사용자 이메일 정보를 받을수 있습니다.
        console.log(profilImage); // 사용자 이메일 정보를 받을수 있습니다.
        console.log(gender); // 사용자 이메일 정보를 받을수 있습니다.
        console.log(naverLogin.user); //사용자 정보를 받을수 있습니다.
        if( email == undefined || email == null) {
          alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
          /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
          naverLogin.reprompt();
          return;
        }
        if( name == undefined || name == null) {
          alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
          /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
          naverLogin.reprompt();
          return;
        }
        if( profilImage == undefined || profilImage == null) {
          alert("프로필 이미지는 필수정보입니다. 정보제공을 동의해주세요.");
          /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
          naverLogin.reprompt();
          return;
        }
        if( gender == undefined || gender == null) {
          alert("성별은 필수정보입니다. 정보제공을 동의해주세요.");
          /* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
          naverLogin.reprompt();
          return;
        }

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




<!--<!DOCTYPE html>
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
</html>-->