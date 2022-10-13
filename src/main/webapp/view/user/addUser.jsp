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
        alert('�̸���������ư?');
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
        alert('ajax ����');
        //$("form").attr("method", "POST").attr("action", "/user/mailSender").submit();
         // self.location="/user/mailSender";
      });
      $(".smsKey").on("click",function (){
        alert('����������ư?');
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
        alert('ajax ����');
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
          alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
          return;//�ش� �޼���(���)�� �����Ѵ�
        }
        if(pw == null || pw.length <1){
          alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
          return;
        }
        if(pw2 == null || pw2.length <1){
          alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
          return;
        }
        if(name == null || name.length <1){
          alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
          return;
        }

        if( pw != pw2 ) {
          alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
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
                    $(".rrdtext").html('ȸ�������� �� �ֽ��ϴ�');
                  } else {
                    $(".rrdtext").show();
                    $(".rrdtext").html('�̹� ������ ȸ���Դϴ�');
                  }
                }
                });
         alert('�̰ǵǳ�?')
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
              alert('������强��');

            }
          });
          alert('ajax����');
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
              alert('����������');

            }
          });
          alert('ajax����');
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
  var mapContainer = document.getElementById('map'), // ������ ǥ���� div
          mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
            level: 3 // ������ Ȯ�� ����
          };

  var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

  // ��Ŀ�� ǥ�õ� ��ġ�Դϴ�
  var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);

  // ��Ŀ�� �����մϴ�
  var marker = new kakao.maps.Marker({
    position: markerPosition
  });

  // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
  marker.setMap(map);


  if (navigator.geolocation) {

    // GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
    navigator.geolocation.getCurrentPosition(function(position) {

      var lat = position.coords.latitude, // ����
              lon = position.coords.longitude; // �浵

      var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
              message = '<div style="padding:5px;">���⿡ ��Ű���?!</div>'; // ���������쿡 ǥ�õ� �����Դϴ�

      // ��Ŀ�� ���������츦 ǥ���մϴ�
      displayMarker(locPosition, message);

      // self.location = "/map/json/myLocation?longitude=" + lon + "&latitude=" + lat;

    });

  } else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�

    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation�� ����Ҽ� �����..'

    displayMarker(locPosition, message);
  }

  function displayMarker(locPosition, message) {

    // ��Ŀ�� �����մϴ�
    var marker = new kakao.maps.Marker({
      map: map,
      position: locPosition
    });

    var iwContent = message, // ���������쿡 ǥ���� ����
            iwRemoveable = true;

    // ���������츦 �����մϴ�
    var infowindow = new kakao.maps.InfoWindow({
      content : iwContent,
      removable : iwRemoveable
    });

    // ���������츦 ��Ŀ���� ǥ���մϴ�
    infowindow.open(map, marker);

    // ���� �߽���ǥ�� ������ġ�� �����մϴ�
    map.setCenter(locPosition);
  }
</script>
 <body class="bg-light">
    
<div class="container" style="text-align: -webkit-center;">
<div class="wap">

  <main>
    <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4"  alt="" width="72" height="57">
      <h2>ȸ������</h2>
      <p class="lead">������ �Է����ּ���</p>
    </div>

      <hr>

      <div class="col-md-7 col-lg-8">

        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm">
              <label for="id" class="form-label">���̵�</label>
              <input type="text" class="form-control userId" id="Id" name="userId" maxLength="20" required>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-12">
              <label for="password" class="form-label">��й�ȣ</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="password" name="password" minLength="8" maxLength="20" required>
                <div class="invalid-feedback"></div>
              </div>
            </div>
            <div class="col-12">
              <label for="password2" class="form-label">��й�ȣ Ȯ��</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="password2" name="password2" minLength="8" maxLength="20" required>
                <div class="invalid-feedback"></div>
              </div>
            </div>


            <div class="col-12">
              <label for="username" class="form-label">�̸�</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="username" name="userName"  required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12 ">
              <label for="rrd" class="form-label">�ֹε�Ϲ�ȣ</label>
              <div input="hidden" class="rrdtext" ></div>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="rrd" name="rrd"  required>
                <div class="invalid-feedback"></div>
              </div>
              <button type="button" class="btn btn-primary btn-sm CheckRrd">�ߺ� Ȯ��</button>
            </div>


            <div class="col-12">
              ����
                <input type="radio" class="form-check-input" id="male" name="gender" value="male" checked required>����
                <input type="radio" class="form-check-input" id="female" name="gender" value="female" required>����
                <div class="invalid-feedback"></div>

            </div>
            <h6>�̸��� �Ǵ� �޴�����ȣ �����ϱ�(��1)</h6>
            <div class="col-12">
              <label for="CheckEamil" class="form-label"><input type="radio" class="form-check-input" id="CheckEamil" required>
              �̸���</label>
              <input type="email" class="form-control userEmail" id="email" name="email" >
              <input type="text" class="form-control CheckEmailKey" value="������ȣ �Է�" >
              <button type="button" class="btn btn-primary btn-sm emailKey">������ȣ ��û</button>
              <button type="button" class="btn btn-secondary btn-sm CheckEmailKey2">���� Ȯ��</button>
              <span class="emailInfor" style="display: none;">
                <strong class="text-danger" >������ȣ�� Ʋ�Ƚ��ϴ�</strong>
              </span>
              <span class="emailYC" style="display: none">������ȣ�� �߼۵Ǿ����ϴ�</span>
              <span class="emailInforYes" style="display: none;">
                �����Ǿ����ϴ�
              </span>
            </div>

            <div class="col-12">
              <label for="CheckPhone" class="form-label"><input type="radio" class="form-check-input" id="CheckPhone" required>
              �޴�����ȣ</label>
            <input type="tel" class="form-control userPhone" name="phone" >
            <input type="text" class="form-control" id="CheckSms" value="������ȣ �Է�" >
            <button type="button" class="btn btn-primary btn-sm smsKey">������ȣ ��û</button>
              <button type="button" class="btn btn-secondary btn-sm CheckSmsKey">���� Ȯ��</button>
              <span class="smsNo" style="display: none;">
              <strong class="text-danger" >������ȣ�� Ʋ�Ƚ��ϴ�</strong>
              </span>
              <span class="smsYC" style="display: none">������ȣ�� �߼۵Ǿ����ϴ�</span>
              <span class="smsYes" style="display: none;">
                �����Ǿ����ϴ�
              </span>
            </div>
          </div>

            <div class="col-12">
              <label for="address" class="form-label">��������</label>
              <br>����Ư����</br>
              <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                  ������
                </button>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" >������</a></li>
                  <li><a class="dropdown-item" >�߱�</a></li>
                  <li><a class="dropdown-item" >������</a></li>
                </ul>
                <input type="text" id="ssv3-location-label" name="villCode" required>
                <button type="button" class="btn btn-primary btn-sm">�������� ��û</button>

              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

              <div  id="map" style="width:500px;height:400px;"></div>

              �������� ���
              <input type="text" class="form-control" id="address"  required>

              <div class="col-12">
                ���ɸ�� ����(�ִ� 13��)
              </div>


              <div style="float:left; padding:5px; border:1px solid #000; width:140px; height:400px;">
                <table id="oridata" class="interList" cellspacing="0" cellpadding="0" width="100%">
                  <tr>
                    <td><input type="checkbox"  class="list1"/></td>
                    <td>������</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list2"/></td>
                    <td>�ݷ�����</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list3"/></td>
                    <td>����</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list4"/></td>
                    <td>����</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list5"/></td>
                    <td>����</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list6"/></td>
                    <td>����</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list7"/></td>
                    <td>����</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list8"/></td>
                    <td>����</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list9"/></td>
                    <td>��</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list10"/></td>
                    <td>�ڵ���</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list11"/></td>
                    <td>����</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list12"/></td>
                    <td>����</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" class="list13"/></td>
                    <td>��Ÿ</td>
                  </tr>
                </table>
              </div>

              <div style="float:left; padding:5px; padding-top:130px;">
                <span input="button" class="addInter">��</span>
                <br />
                <span input="button" class="removeInter">��</span>
              </div>

              <div style="float:left; padding:5px; border:1px solid #000; width:140px; height:400px;">
                <table id="movedata" cellspacing="0" cellpadding="0" width="100%">
                </table>
              </div>






              <div class="col-md-4">
              <label for="userImage" class="form-label">ȸ�� ���� ���</label>
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
            <button class="w-100 btn btn-primary btn-lg cancle" type="button"> ���</button>
            <button class="w-100 btn btn-primary btn-lg addUser" type="submit"> ȸ������</button>
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