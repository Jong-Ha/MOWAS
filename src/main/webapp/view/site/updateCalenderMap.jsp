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
    <h1 class="modal-title fs-5">모임 일정 위치 수정</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">

    <div id="map3" style="width:100%;height:350px;"></div>
    <p><em>지도를 클릭해주세요!</em></p>
    <div id="clickLatlng"></div>

    <div class="col-md-4 text-center col-md-offset-1">
        <input type="text" class="villCode2" name="villCode2" value="" readonly>

    </div>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-primary getLocation">확인</button>
</div>


<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bfc3f948468dbd85bd27fc9cd803d68b&libraries=services"></script>
<script>
    var mapCheck3 = false;

    function getClubVilCode3(longitude, latitude) {
        const sendData = "longitude=" + longitude + "&latitude=" + latitude;

        $.ajax({
            url: '/site/json/calendarMap',
            method: 'POST',
            data: sendData,
            success: function (vilCode) {
                //$(".searchLocation").html(vilCode);
                //alert(vilCode);
                $("#location3 .villCode2").val(vilCode)
                $(".location3").val(vilCode);
            }
        })
    }

    function relayout2() {
        if (mapCheck3) {
            return false;
        }
        mapCheck3 = true;
        var mapContainer = document.getElementById('map3'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(
                    ${empty param.searchLat?empty latitude?'37.4994558002948':latitude:param.searchLat},
                    ${empty param.searchLng?empty longitude?'127.029020621527':longitude:param.searchLng}
                ), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map3 = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 지도를 클릭한 위치에 표출할 마커입니다
        var marker = new kakao.maps.Marker({
            // 지도 중심좌표에 마커를 생성합니다
            position: map3.getCenter()
        });
        // 지도에 마커를 표시합니다
        marker.setMap(map3);

        // 지도에 클릭 이벤트를 등록합니다
        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        kakao.maps.event.addListener(map3, 'click', function (mouseEvent) {

            // 클릭한 위도, 경도 정보를 가져옵니다
            var latlng = mouseEvent.latLng;

            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);

            // var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            // message += '경도는 ' + latlng.getLng() + ' 입니다';
            //
            // var resultDiv = document.getElementById('clickLatlng');
            // resultDiv.innerHTML = message;
            getClubVilCode3(latlng.getLng(), latlng.getLat());
            $('.searchLng').val(latlng.getLng())
            $('.searchLat').val(latlng.getLat())

        });

        getClubVilCode3(${empty param.searchLng?'127.029020621527':param.searchLng}, ${empty param.searchLat?'37.4994558002948':param.searchLat})

        // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
        // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다
        // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
        map3.relayout();


        $(function () {

            $('#location3 .back-btn').on('click', function () {

                $('#location3').modal("hide");

                $("#exampleModal3").modal("show");

            })

            $('#location3 .getLocation').on('click', function () {

                $('#location3').modal("hide");

                $("#exampleModal3").modal("show");

            })
        })


    }
</script>
