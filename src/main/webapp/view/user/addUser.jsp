<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

    <style>
    .wap{
    	width: 800px;
    }
    tr { height:30px; }
    td { border-bottom:1px solid #CCC; font-size:12px; }
    span { cursor:pointer }


    </style>
  <script type="text/javascript">

    $(function (){
      $(".emailKey").on("click",function (){
        alert('이메일인증버튼?');
        $.ajax({
          url: "/user/json/mailSender",
          method :"POST",
          data: {
            email : $(".userEmail").val()
          },
          dataType :"json",
          success : function ({JSONData, status}){
            alert(status);
            $(".emailYC").css("display",'');
          }
        });
        alert('ajax 종료');
        //$("form").attr("method", "POST").attr("action", "/user/mailSender").submit();
         // self.location="/user/mailSender";
      });
      $(".smsKey").on("click",function (){
        alert('문자인증버튼?');
        $.ajax({
          url : "/user/json/smsSend",
          method: "POST",
          data : {
            phone : $(".userPhone").val()
          },
          dataType: "json",
          success : function (){
            $(".smsYC").css("display",'');
          }
        });
        alert('ajax 종료');
        //$("form").attr("method", "POST").attr("action", "/user/smsSend").submit();
        // self.location="/user/mailSender";
      });

      $(".CheckEmailKey2").on("click",function (){
        var CheckEmailKey = $(".CheckEmailKey").val();
         alert(CheckEmailKey);
        if(CheckEmailKey!=1234){
          $('.emailInfor').css('display','');
        }else{
          $(".emailInforYes").css('display','');
        }
      });
      $(".CheckSmsKey").on("click",function (){
        var CheckSms = $("#CheckSms").val();
        alert(CheckSms);
        if(CheckSms!=1234){
          $('.smsNo').css('display','');
        }else{
          $(".smsYes").css('display','');
        }
      });


      $(".addUser").on("click",function (){
        var id=$("input[name='id']").val();
        var pw=$("input[name='password']").val();
        var pw2=$("input[name='password2]").val();
        var name=$("input[name='username']").val();

        var gender=$("input[name='gender']").val();
        var email=$("input[id='CheckEamil']").val();
        var phone=$("input[id='CheckPhone']").val();

        if(id == null || id.length <1){
          alert("아이디는 반드시 입력하셔야 합니다.");
          return;//해당 메서드(펑션)을 종료한다
        }
        if(pw == null || pw.length <1){
          alert("패스워드는  반드시 입력하셔야 합니다.");
          return;
        }
        if(pw2 == null || pw2.length <1){
          alert("패스워드 확인은  반드시 입력하셔야 합니다.");
          return;
        }
        if(name == null || name.length <1){
          alert("이름은  반드시 입력하셔야 합니다.");
          return;
        }

        if( pw != pw2 ) {
          alert("비밀번호 확인이 일치하지 않습니다.");
          $("input:text[name='password2']").focus();
          return;
        }


        $("form").attr("method","POST").attr("action","/user/addUser").submit();

      });



       $(".CheckRrd").on("click",function (){
         var rrdCheck=$("input[name='rrd']").val();
         alert(rrdCheck)
           $.ajax({
                     url: "/user/json/checkDupRrd",
                   method : "POST",
                  data :{
                  rrd : rrdCheck
                    },
             dataType: "json",
             success :
                function (map) {
                  alert(map)
                  if (map.result) {
                    $(".rrdtext").show();
                    $(".rrdtext").html('회원가입할 수 있습니다');
                  } else {
                    $(".rrdtext").show();
                    $(".rrdtext").html('이미 가입한 회원입니다');
                  }
                }
                });
         alert('이건되낭?')
              });

      $(".addInter").on("click", function (){
        $("#oridata input[type=checkbox]:checked").filter(function() {
          alert('aaaaa');
          $("#movedata").append("<tr>" + $(this).parent().parent().html() + "</tr>");
          alert('bbbbb');
          $(this).parent().parent().remove();
          $.ajax({
            url : "/user/json/interListControl",
            method : "POST",

            data : JSON.stringify({

              userId : $(".userId").val(),
              interList : $('#oridata input[type=checkbox]:checked').val()
            }),
            contentType : "application/json",
            dataType : "json",
            success : function (){
              alert('디비저장성공');

            }
          });
          alert('ajax종료');
        });
      });

      $(".removeInter").on("click", function () {
        $("#movedata input[type=checkbox]:checked").filter(function() {
          alert('ccccc');
          $("#oridata").append("<tr>" + $(this).parent().parent().html() + "</tr>");
          alert('dddddd');
          $(this).parent().parent().remove();
          $.ajax({
            url : "/user/json/deleteInter",
            method : "POST",

            data : JSON.stringify({

              userId : $(".userId").val(),
              interList : $('#oridata input[type=checkbox]:checked').val()
            }),
            contentType : "application/json",
            dataType : "json",
            success : function (){
              alert('디비삭제성공');

            }
          });
          alert('ajax종료');
        });
      });

      $(function (){
        $(".cancle").on("click",function (){
          $("form")[0].reset();
        });
      });

    });

  </script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=064b845197ba0a5631091cfb59197ad2&libraries=services"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  // 마커가 표시될 위치입니다
  var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);

  // 마커를 생성합니다
  var marker = new kakao.maps.Marker({
    position: markerPosition
  });

  // 마커가 지도 위에 표시되도록 설정합니다
  marker.setMap(map);


  if (navigator.geolocation) {

    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {

      var lat = position.coords.latitude, // 위도
              lon = position.coords.longitude; // 경도

      var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
              message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

      // 마커와 인포윈도우를 표시합니다
      displayMarker(locPosition, message);

      // self.location = "/map/json/myLocation?longitude=" + lon + "&latitude=" + lat;

    });

  } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation을 사용할수 없어요..'

    displayMarker(locPosition, message);
  }

  function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      map: map,
      position: locPosition
    });

    var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
      content : iwContent,
      removable : iwRemoveable
    });

    // 인포윈도우를 마커위에 표시합니다
    infowindow.open(map, marker);

    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);
  }
</script>
 <body class="bg-light">
    
<div class="container" style="text-align: -webkit-center;">
<div class="wap">

  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4"  alt="" width="72" height="57">
      <h2>회원가입</h2>
      <p class="lead">정보를 입력해주세요</p>
    </div>

      <hr>

      <div class="col-md-7 col-lg-8">

        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm">
              <label for="id" class="form-label">아이디</label>
              <input type="text" class="form-control userId" id="Id" name="userId" maxLength="20" required>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-12">
              <label for="password" class="form-label">비밀번호</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="password" name="password" minLength="8" maxLength="20" required>
                <div class="invalid-feedback"></div>
              </div>
            </div>
            <div class="col-12">
              <label for="password2" class="form-label">비밀번호 확인</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="password2" name="password2" minLength="8" maxLength="20" required>
                <div class="invalid-feedback"></div>
              </div>
            </div>


            <div class="col-12">
              <label for="username" class="form-label">이름</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" name="userName"  required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12 ">
              <label for="rrd" class="form-label">주민등록번호</label>
              <div input="hidden" class="rrdtext" ></div>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="rrd" name="rrd"  required>
                <div class="invalid-feedback"></div>
              </div>
              <button type="button" class="btn btn-primary btn-sm CheckRrd">중복 확인</button>
            </div>


            <div class="col-12">
              성별
                <input type="radio" class="form-check-input" id="male" name="gender" value="male" checked required>남자
                <input type="radio" class="form-check-input" id="female" name="gender" value="female" required>여자
                <div class="invalid-feedback"></div>

            </div>
            <h6>이메일 또는 휴대폰번호 인증하기(택1)</h6>
            <div class="col-12">
              <label for="CheckEamil" class="form-label"><input type="radio" class="form-check-input" id="CheckEamil" required>
              이메일</label>
              <input type="email" class="form-control userEmail" id="email" name="email" >
              <input type="text" class="form-control CheckEmailKey" value="인증번호 입력" >
              <button type="button" class="btn btn-primary btn-sm emailKey">인증번호 요청</button>
              <button type="button" class="btn btn-secondary btn-sm CheckEmailKey2">인증 확인</button>
              <span class="emailInfor" style="display: none;">
                <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
              <span class="emailYC" style="display: none">인증번호가 발송되었습니다</span>
              <span class="emailInforYes" style="display: none;">
                인증되었습니다
              </span>
            </div>

            <div class="col-12">
              <label for="CheckPhone" class="form-label"><input type="radio" class="form-check-input" id="CheckPhone" required>
              휴대폰번호</label>
            <input type="tel" class="form-control userPhone" name="phone" >
            <input type="text" class="form-control" id="CheckSms" value="인증번호 입력" >
            <button type="button" class="btn btn-primary btn-sm smsKey">인증번호 요청</button>
              <button type="button" class="btn btn-secondary btn-sm CheckSmsKey">인증 확인</button>
              <span class="smsNo" style="display: none;">
              <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
              <span class="smsYC" style="display: none">인증번호가 발송되었습니다</span>
              <span class="smsYes" style="display: none;">
                인증되었습니다
              </span>
            </div>
          </div>

            <div class="col-12">
              <label for="address" class="form-label">동네인증</label>
              <br>서울특별시</br>
              <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  무슨구
                </button>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" >성동구</a></li>
                  <li><a class="dropdown-item" >중구</a></li>
                  <li><a class="dropdown-item" >광진구</a></li>
                </ul>
                <input type="text" id="ssv3-location-label" name="villCode" required>
                <button type="button" class="btn btn-primary btn-sm">동네인증 요청</button>

              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

              <div  id="map" style="width:500px;height:400px;"></div>

              동네인증 결과
              <input type="text" class="form-control" id="address"  required>

              <div class="col-12">
                관심목록 선택(최대 13개)
              </div>


              <div style="float:left; padding:5px; border:1px solid #000; width:140px; height:400px;">
                <table id="oridata" class="interList" cellspacing="0" cellpadding="0" width="100%">
                  <tr>
                    <td><input type="checkbox"  class="list1"/></td>
                    <td>스포츠</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list2"/></td>
                    <td>반려동물</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list3"/></td>
                    <td>음악</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list4"/></td>
                    <td>독서</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list5"/></td>
                    <td>게임</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list6"/></td>
                    <td>육아</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list7"/></td>
                    <td>공연</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list8"/></td>
                    <td>공예</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list9"/></td>
                    <td>댄스</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list10"/></td>
                    <td>자동차</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list11"/></td>
                    <td>사진</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list12"/></td>
                    <td>여행</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list13"/></td>
                    <td>기타</td>
                  </tr>
                </table>
              </div>

              <div style="float:left; padding:5px; padding-top:130px;">
                <span input="button" class="addInter">▶</span>
                <br />
                <span input="button" class="removeInter">◀</span>
              </div>

              <div style="float:left; padding:5px; border:1px solid #000; width:140px; height:400px;">
                <table id="movedata" cellspacing="0" cellpadding="0" width="100%">
                </table>
              </div>






              <div class="col-md-4">
              <label for="userImage" class="form-label">회원 사진 등록</label>
              <input type="file" id="userImage" name="userImage">
            </div>

              <div class="hiddem">
            <input type="hidden" class="masterCheck" name="masterCheck" value="0">
            <input type="hidden" class="userStatus" name="userStatus" value="0">
            <input type="hidden" class="lcd" name="lcd" value="2022-10-10">
              <input type="hidden" class="loginCheck" name="loginCheck" value="0">
              <input type="hidden" class="psd" name="psd" value="">
              <input type="hidden" class="ped" name="ped" value="">
              <input type="hidden" class="ppt" name="ppt" value="0">
              <input type="hidden" class="reviewPt" name="reviewPt" value="0">
      </div>


          </div>
            <hr>
            <div class="col-12">
            <button class="w-100 btn btn-primary btn-lg cancle" type="button"> 취소</button>
            <button class="w-100 btn btn-primary btn-lg addUser" type="submit"> 회원가입</button>
              <div class="invalid-feedback">
            </div>
          </div>

        </form>
      </div>
  </main>
    </div>

</div>


  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2017-2022 Company Name</p>
    <ul class="list-inline">
      <li class="list-inline-item"><a href="#">Privacy</a></li>
      <li class="list-inline-item"><a href="#">Terms</a></li>
      <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
  </footer>
</div>
</body>
</html>