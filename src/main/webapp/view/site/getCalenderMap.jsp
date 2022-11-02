<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>

<div class="modal-header">
    <a class="navbar-brand back-btn">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left"
             viewBox="0 0 16 16">
            <path fill-rule="evenodd"
                  d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
            <path fill-rule="evenodd"
                  d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
        </svg>
    </a>
    <h1 class="modal-title fs-5">모임 일정 위치 등록</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">

    <div id="map" style="width:100%;height:350px;"></div>
    <div id="clickLatlng3"></div>

    <div class="col-md-4 text-center col-md-offset-1">
        <input type="text" class="villCode1" name="villCode1" value="" readonly>

    </div>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-primary getLocation">확인</button>
</div>


<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdddcf3f747ce062a0dc0af6d4a8b009&libraries=services"></script>

<script>

   function getClubLocation() {
        const sendData = "address=" + '${param.location}';

        //alert(sendData);

        $.ajax({
            url: '/site/json/calendarLocation',
            method: 'POST',
            data: sendData,
            success: function (vilCode) {
                //console.log("==========" + vilCode.longitude + "::::" + vilCode.latitude);

                relayout3(vilCode.longitude, vilCode.latitude);
            }
        })

    }


    function relayout3(longitude, latitude) {

       var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(longitude, latitude), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        var markerPosition = new kakao.maps.LatLng(longitude, latitude);

        console.log(">>>>==========" + longitude + "::::" + latitude);
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        // 지도에 마커를 표시합니다
        marker.setMap(map);

        map.relayout();
    }
/*
    $(function () {
         getClubLocation();

         $('#location2 .back-btn').on('click', function () {
         $('#location2').modal("hide");
         $("#exampleModal").modal("show");

       })

        $('#location2 .getLocation').on('click', function () {
          $('#location2').modal("hide");
          $("#exampleModal").modal("show");
         })
      })
*/
 </script>
