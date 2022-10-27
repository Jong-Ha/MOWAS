<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-13
  Time: 오후 7:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title> club Map</title>
  <meta charset="EUC-KR">

  <!-- 참조 : http://getbootstrap.com/css/   참조 -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

  <!-- Bootstrap Dropdown Hover CSS -->
  <link href="/css/animate.min.css" rel="stylesheet">
  <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

  <!-- Bootstrap Dropdown Hover JS -->
  <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

  <script type="text/javascript">

    function getClubVilCode(longitude, latitude) {
      var sendData = "longitude=" + longitude + "&latitude=" + latitude;

      $.ajax({
        url: '/site/json/clubMap',
        method: 'POST',
        data: sendData,
        success: function (vilCode) {
          //$(".searchLocation").html(vilCode);
          alert(vilCode);
          $(".villCode").val(vilCode)
        }
      })
    }

    $(function() {
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( "button:contains('확인')" ).on("click" , function() {
          $(opener.document).find(".searchLocation").html($(".villCode").val())
          $(opener.document).find('[name="searchLocation"]').val($(".villCode").val())
          window.close()
      });
    });
  </script>
</head>

<body>
<%--
<div id="map" style="width:100%;height:350px;"></div>
<p><em>지도를 클릭해주세요!</em></p>
<div id="clickLatlng"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdddcf3f747ce062a0dc0af6d4a8b009&libraries=services"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(37.4994558002948, 127.029020621527), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  // 지도를 클릭한 위치에 표출할 마커입니다
  var marker = new kakao.maps.Marker({
    // 지도 중심좌표에 마커를 생성합니다
    position: map.getCenter()
  });
  // 지도에 마커를 표시합니다
  marker.setMap(map);

  // 지도에 클릭 이벤트를 등록합니다
  // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

    // 클릭한 위도, 경도 정보를 가져옵니다
    var latlng = mouseEvent.latLng;

    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);

    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';

    var resultDiv = document.getElementById('clickLatlng');
    resultDiv.innerHTML = message;
    getClubVilCode(latlng.getLng(), latlng.getLat());

  });
</script>
--%>

<div class="modal-header">
  <h1 class="modal-title fs-5">모임 만들기</h1>
  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">

  <div id="map" style="width:100%;height:350px;"></div>
  <p><em>지도를 클릭해주세요!</em></p>
  <div id="clickLatlng"></div>

  <div class="col-md-4 text-center col-md-offset-1">
    <input type="text" class="villCode" name="villCode" value="역삼동">
    <button type="button" class="btn btn-primary">확인</button>
  </div>

</div>
<div class="modal-footer">
  <button type="button" class="btn btn-primary">모임 만들기</button>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdddcf3f747ce062a0dc0af6d4a8b009&libraries=services"></script>
<script>
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(37.4994558002948, 127.029020621527), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
          };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  // 지도를 클릭한 위치에 표출할 마커입니다
  var marker = new kakao.maps.Marker({
    // 지도 중심좌표에 마커를 생성합니다
    position: map.getCenter()
  });
  // 지도에 마커를 표시합니다
  marker.setMap(map);

  // 지도에 클릭 이벤트를 등록합니다
  // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
  kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

    // 클릭한 위도, 경도 정보를 가져옵니다
    var latlng = mouseEvent.latLng;

    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);

    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';

    <%--function resizeMap() {
      var mapContainer = document.getElementById('map');
      mapContainer.style.width = '650px';
      mapContainer.style.height = '650px';
    }
    function relayout() {

      // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
      // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다
      // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
      map.relayout();
    }
    --%>
    var resultDiv = document.getElementById('clickLatlng');
    resultDiv.innerHTML = message;
    getClubVilCode(latlng.getLng(), latlng.getLat());

  });
</script>

<div class="col-md-4 text-center col-md-offset-1">
  <input type="text" class="villCode" name="villCode" value="역삼동">
    <button type="button" class="btn btn-primary">확인</button>
</div>

</body>
</html>
