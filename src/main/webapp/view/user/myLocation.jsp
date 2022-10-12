<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<title>���� ��ġ</title>

<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	
	<!-- 
	<script type="text/javascript">
	function getLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(getAddressByCoords,redirectLocation, geo_options);
        //navigator.geolocation.getCurrentPosition(successCallback,errorCallback,{ timeout: 10_000 });
	} else {
			location.href = "/map/test/selectAddressList.do";
	}
}

//�������� ��
	function getAddressByCoords(position) {
		var longitude = position.coords.longitude;
		var latitude = position.coords.latitude;
		console.log(longitude);
    	console.log(latitude);
    //�ڡ����� �浵 ������ ������ ���� ���̵�� �Ѿ�� �κ�
		location.href = "/map/test/selectAddressList.do?longitude=" + longitude + "&latitude=" + latitude;
	}

//�������� ��
	function redirectLocation(error) {
		location.href = "/map/error/selectAddressList.do";
	}

//Ÿ�Ӿƿ�
	var geo_options = {
		maximumAge        : 5000, 
		timeout           : 3000
	};
</script>
-->

</head>
<body>
		
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdddcf3f747ce062a0dc0af6d4a8b009&libraries=services"></script>
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
</body>
</html>