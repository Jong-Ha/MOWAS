<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

    <style>
    .wap{ width: 400px; }
    tr { height:40px; }
    td { border-bottom:1px solid #CCC; font-size:12px; }
    span { cursor:pointer }


    </style>
  <script type="text/javascript">

    $(function () {
        $(".emailKey").on("click", function () {
            $.ajax({
                url: "/user/json/mailSender",
                method: "POST",
                data: {
                    email: $(".userEmail").val()
                },
                dataType: "json",
                success: function (emailNo) {

                    console.log("emailNo"+emailNo)
                    var num = emailNo;
                    $(".emailYC").css("display", '');
                }
            });
        });


/*
            $(".emailImage").on("click", function () {

                $.ajax({
                    url: "/user/json/mailImage",
                    method: "POST",
                    data: {
                        email: $(".userEmail").val()
                    },
                    dataType: "json",
                    success: function ({JSONData, status}) {
                        console.log(status);
                        $(".emailYC").css("display", '');
                    },
                    error: function () {
                        console.log('인증실패!');
                    }
                });
            });
*/
      $(".smsKey").on("click",function (){
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
      });

      $(".CheckEmailKey2").on("click",function (){
        var CheckEmailKey = $(".CheckEmailKey").val();
         //alert(CheckEmailKey);
         var emailNo = num;
            // alert("랜덤 이메일 인증번호 :"+emailNo);
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

       $("#rrd").on("keyup",function (){
         var rrd=$("input[name='rrd']").val();
           $.ajax({
                     url: "/user/json/checkDupRrd",
                   method : "POST",
                  data :{
                  rrd : rrd
                    },
             dataType: "json",
             success :
                function (map) {
                  if (map.result==true) {
                    $("#rrdChk").css("display", 'none');
                  } else {
                    $("#rrdChk").css("display", "");
                  }
                }
                });
              });
      /*
            $(".addInter").on("click", function (){
              $("#oridata input[type=checkbox]:checked").filter(function() {
                $("#movedata").append("<tr>" + $(this).parent().parent().html() + "</tr>");
                $(this).parent().parent().remove();
              });
            });



      $(".removeInter").on("click", function () {
        $("#movedata input[type=checkbox]:checked").filter(function() {
          $("#oridata").append("<tr>" + $(this).parent().parent().html() + "</tr>");
          $(this).parent().parent().remove();
        });
      });
      ///*

          */

      $("#userId").on("keyup",function (){
          $.ajax({
            url: "/user/json/userId",
            method: "POST",
            data: {
              userId: $("#userId").val()
            },
            dataType: "json",
            success: function (result) {
              if (result==true) {
                $("#idChk").css("display", 'none');

              } else {
                $("#idChk").css("display", "");
              }
            },
            error: function () {
              alert('아이디유효성검사실패');
            }
          });
      })
        $("#password").on("keyup",function () {
          $.ajax({
            url: "/user/json/password",
            method: "POST",
            data: {
              password : $("#password").val()
            },
            dataType: "json",
            success: function (result) {
              if (result == true) {
                $("#passwordChk").css("display", 'none');
              } else {
                $("#passwordChk").css("display", "");
              }
            },
            error: function () {
              alert('비밀번호유효성검사실패');
            }
          });
        })
          $("#password2").on("keyup",function (){
            $.ajax({
              url: "/user/json/password2",
              method: "POST",
              data: {
                password : $("#password").val(),
                password2: $("#password2").val()
              },
              dataType: "json",
              success: function (result) {
                if (result==true) {
                  $("#password2Chk").css("display", 'none');
                } else {
                  $("#password2Chk").css("display", "");
                }
              },
              error: function () {
                alert('비밀번호확인 유효성검사실패');
              }
            });
      });


      $("form").on("submit",function (){

        var id=$("input[name='userId']").val();
        var pw=$("input[name='password']").val();
        var pw2=$("input[name='password2']").val();
        var name=$("input[name='userName']").val();
        var rrd=$("input[name='rrd']").val();
        var male=$("#male").val();
        var female=$("#femail").val();
        var email=$("#CheckEamil").val();
        var phone=$("#CheckPhone").val();
        var interList=$("input[name='interList']").val();


        if(id == null || id.length <1){
          alert("아이디는 반드시 입력하셔야 합니다.");
          return false;//해당 메서드(펑션)을 종료한다
        }
        if(pw == null || pw.length <1){
          alert("패스워드는  반드시 입력하셔야 합니다.");
          return false;
        }
        if(pw2 == null || pw2.length <1){
          alert("패스워드 확인은  반드시 입력하셔야 합니다.");
          return false;
        }
        if(name == null || name.length <1){
          alert("이름은  반드시 입력하셔야 합니다.");
          return false;//해당 메서드(펑션)을 종료한다
        }

        if( pw != pw2 ) {
          alert("비밀번호 확인이 일치하지 않습니다.");
          $("input:text[name='password2']").focus();
          return false;
        }
        if(rrd == null || rrd.length <1){
          alert("주민등록번호는  반드시 입력하셔야 합니다.");
          return false;
        }
/*


        if(male.is("checked")==false || female.is("checked")==false){
          alert("성별은  반드시 입력하셔야 합니다.");
          return false;
        }
        if(email.is("checked")==false || phone.is("checked")==false){
          alert("이메일 또는 휴대폰번호는 반드시 인증하셔야 합니다.");
          return false;
        }
        if($("#addChk").val()==false){
          alert("동네인증은 반드시 인증하셔야 합니다.");
          return false;
        }

*/
        $("form").attr("method","POST").attr("action","/user/addUser").submit();

      });

      $(function (){
        $(".cancle").on("click",function (){
          history.go(-1);
        });
      });

    });





  /// @brief 주소검색창 - 키보드 Enter키 입력
  function enterSearch() {
    var evt_code = (window.netscape) ? event.which : event.keyCode;
    if (evt_code == 13) {
      event.keyCode = 0;
      getAddr();
    }
  }

  //도로명주소
  function getAddr(){
// 적용예 (api 호출 전에 검색어 체크)
    var keyword = document.getElementById("searchAddr");
    if (!checkSearchedWord(keyword))
    {
      return ;
    }

    $.ajax({
      url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"
      ,type:"post"
      ,data:{
        confmKey : "devU01TX0FVVEgyMDIyMTAxMjA5MTEyNjExMzA0NTI="
        , currentPage : document.getElementById("currentPage").value
        , countPerPage : document.getElementById("countPerPage").value
        , keyword : keyword.value
        , resultType : "json"
      }
      ,dataType:"jsonp"
      ,crossDomain:true
      ,success:function(jsonStr){
        $("#list").html("");
        var errCode =
                jsonStr.results.common.errorCode;
        var errDesc =
                jsonStr.results.common.errorMessage;

        if(errCode!= "0"){
          alert(errCode+"="+errDesc);
        }else{
          if(jsonStr!= null){
            makeListJson(jsonStr);
            console.log(jsonStr);
            // JSON데이터 HTML형태로 변환
          }
        }
      },error: function(xhr,status, error){
        alert("에러발생");
      }
    });
  }

  /// @brief 주소검색창 - 주소지 선택
  function makeListJson(jsonStr) {
    let htmlStr = "<thead><tr><th style='width:70px;'>우편번호</th><th>주소</th></tr></thead><tbody>";
    if(jsonStr.results.common.totalCount > 0) {
      jQuery("#totoalOutcome").css("display", "block");
      jQuery("#totalCnt").html(jsonStr.results.common.totalCount);

      jQuery(jsonStr.results.juso).each(function() {
        let zipNo = this.zipNo;                  // 우편번호
        let roadAddr = this.roadAddr;        // 도로명 주소
        let jibunAddr = this.jibunAddr;       // 지번 주소

        htmlStr += "<tr style='border:1px;'>";
        htmlStr += "<td>";
        htmlStr += "<a href='javascript:;' onClick='inputTextAddress(\""+zipNo+"\", \""+roadAddr+"\");'>";
        htmlStr += zipNo;
        htmlStr += "</a>";
        htmlStr += "</td>";
        htmlStr += "<td>";
       // htmlStr += "<a href='javascript:;' onClick='inputTextAddress(\""+zipNo+"\", \""+roadAddr+"\");'>";
       // htmlStr += "도로명 : " + roadAddr;
       // htmlStr += "</a>";
       // htmlStr += "<br/>";
        htmlStr += "<a href='javascript:;' onClick='inputTextAddress(\""+zipNo+"\", \""+jibunAddr+"\");'>";
        htmlStr += "지번 : " + jibunAddr;
        htmlStr += "</a>";
        htmlStr += "</td>";
        htmlStr += "</tr>";
      });
      pageMake(jsonStr);
    } else {
      htmlStr += "<tr><td colspan='2'>조회된 데이터가 않습니다.<br/>다시 검색하여 주시기 바랍니다.</td></tr>";
    }
    htmlStr += "</tbody>";
    jQuery("#list").html(htmlStr);
  }
  /// @brief 주소검색창 - 주소지 삽입
  function inputTextAddress(zipcode, address) {
    document.getElementById("zipCode").value = zipcode;
    document.getElementById("address").value = address;
  }
  /// @brief 주소검색창 - 열기
  function addressWindowOpen() {
    jQuery("#wrap").slideDown();
    jQuery("#searchAddr").focus();
  }
  /// @brief 주소검색창 - 닫기
  function addressWindowClose() {
    jQuery("#wrap").slideUp();
    jQuery("#searchAddr").val("");
    jQuery("#totoalOutcome").css("display", "none");
    jQuery("#list").empty();
    jQuery("#pagingList").empty();
    jQuery("#currentPage").val("1");
  }
  //특수문자, 특정문자열(sql 예약어의 앞뒤 공백 포함) 제거
  function checkSearchedWord(obj){
    console.log(obj);
    if(obj.value.length > 0){
      //특수문자 제거
      var expText = /[%=><]/ ;
      if(expText.test(obj.value) == true){
        alert("특수문자를 입력 할수 없습니다.") ;
        obj.value = obj.value.split(expText).join("");
        return false;
      }

      //특정문자열(sql예약어의 앞뒤공백포함) 제거
      var sqlArray = new Array(
              //sql 예약어
              "OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC", "UNION", "FETCH", "DECLARE", "TRUNCATE"
      );

      var regex;
      for(var i=0; i<sqlArray.length; i++){
        regex = new RegExp( sqlArray[i] ,"gi") ;

        if (regex.test(obj.value) ) {
          alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
          obj.value =obj.value.replace(regex, "");
          return false;
        }
      }
    }
    return true ;
  }
  /// @brief 주소검색창 - 페이징 생성
  function pageMake(jsonStr) {
    var total = jsonStr.results.common.totalCount;				// 총건수
    var pageNum = document.getElementById("currentPage").value;	// 현재페이지
    var pageBlock = Number(document.getElementById("countPerPage").value);	// 페이지당 출력 개수
    var paggingStr = "";

    // 검색 갯수가 페이지당 출력갯수보다 작으면 페이징을 나타내지 않는다.
    if(total > pageBlock) {
      var totalPages = Math.floor((total - 1) / pageNum) + 1;
      var firstPage = Math.floor((pageNum - 1) / pageBlock) * pageBlock + 1;

      if(firstPage <= 0) { firstPage = 1; };

      var lastPage = (firstPage - 1) + pageBlock;

      if(lastPage > totalPages) { lastPage = totalPages; };

      var nextPage = lastPage + 1;
      var prePage = firstPage - pageBlock;

      if(firstPage > pageBlock) {
        paggingStr += "<a href='javascript:;' onClick='goPage(" + prePage + ");'>◀</a>";
        paggingStr += "&nbsp;";
      }

      for(let num = firstPage; lastPage >= num; num++) {
        if(pageNum == num) {
          paggingStr += "<a style='font-weight:bold;color:#0000FF;' href='javascript:;'>" + num + "</a>";
          paggingStr += "&nbsp;";
        } else {
          paggingStr += "<a href='javascript:;' onClick='goPage(" + num + ");'>" + num + "</a>";
          paggingStr += "&nbsp;";
        }
      }

      if(lastPage < totalPages) {
        paggingStr += "<a href='javascript:;' onClick='goPage(" + nextPage + ");'>▶</a>";
      }
    }
    jQuery("#pagingList").html(paggingStr);
  }
  /// @brief 페이징 이동
  function goPage(pageNum) {
    document.getElementById("currentPage").value = pageNum;
    getAddr();
  }




</script>

 <body class="bg-light">

 <%--상단 툴바--%>
 <jsp:include page="/layout/toolbar.jsp"/>

<div class="container" style="text-align: -webkit-center;">


  <main>
    <div class="py-5 text-center">
        <img id="userImage1" src="https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png" class="w-50">

        <h2>회원가입</h2>
        <p class="lead">MOWAS에 오신걸 환영합니다</p>
      <p class="lead">계정 정보를 입력해주세요</p>
    </div>

      <hr>


    <form class="needs-validation" novalidate enctype="multipart/form-data">
      <div class="row g-3">

        <div class="col-sm">
            <span><h4><label for="userId" class="form-label" >아이디</label></h4></span>
          <input type="text" class="form-control" id="userId" name="userId" maxLength="20" required>
        </div>

        <span id="idChk" style="display: none;">
                <strong class="text-danger" >이미 가입된 아이디입니다</strong>
        </span>
        <div class="col-12">
          <label for="password" class="form-label" >비밀번호</label>
            <strong class="text-danger" style="color : red;" >영문,숫자 혼합, 8~16글자로 입력해주세요</strong><br/>
          <div class="input-group has-validation">
            <input type="password" class="form-control" id="password" name="password" maxLength="16" required>
          </div>
        </div>
        <span id="passwordChk" style="display: none;">
                <strong class="text-danger" >영문,숫자 혼합, 8~16글자로 입력해주세요</strong>
        </span>

        <div class="col-12">
          <label for="password2" class="form-label">비밀번호 확인</label>
          <div class="input-group has-validation">
            <input type="password" class="form-control" id="password2" name="password2" maxLength="16" required>
          </div>
        </div>
        <span id="password2Chk" style="display: none;">
                <strong class="text-danger" >비밀번호가 틀렸습니다</strong>
        </span>

        <div class="col-12">
          <label for="userName" class="form-label">이름</label>
          <div class="input-group has-validation">
            <input type="text" class="form-control" id="userName" name="userName"  required>
          </div>
        </div>

        <div class="col-12 ">
          <label for="rrd" class="form-label">주민등록번호</label>
          <div class="input-group has-validation">
            <input type="text" class="form-control" id="rrd" name="rrd"  required>
          </div>
            <span id="rrdChk" style="display: none;" >
              <strong class="text-danger" >이미 가입한 회원입니다</strong>
              </span>




        <div class="col-12">
          성별<label for="male" class="form-label">
          <input type="radio" class="form-check-input" id="male" name="gender" value="남자" required>남자</label>
          <label for="female" class="form-label">
            <input type="radio" class="form-check-input" id="female" name="gender" value="여자" required>여자</label>
        </div>

        <h6>이메일 또는 휴대폰번호 인증하기(택1)</h6>


        <div class="col-12">
          <label for="CheckEamil" class="form-label"><input type="radio" class="form-check-input" id="CheckEamil" name="email&phone" required>
            이메일</label>
          <input type="email" class="form-control userEmail" id="email" name="email" >
          <input type="text" class="form-control CheckEmailKey" placeholder="인증번호 입력"  >
          <button type="button" class="btn btn-prm btn-sm emailKey">인증번호 요청</button>

          <button type="button" class="btn btn-secondary btn-sm CheckEmailKey2">인증 확인</button>
          <span class="emailInfor" style="display: none;">
                <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
          <span class="emailYC" style="display: none">인증번호가 발송되었습니다</span>
          <span class="emailInforYes" style="display: none;">
                인증되었습니다
              </span>

            <input type="hidden" id="randomEmail" name="randomEmail" >
          <div>
          <label for="CheckPhone" class="form-label"><input type="radio" class="form-check-input" id="CheckPhone" name="email&phone" required>
            휴대폰번호</label>
          </div>
          <input type="tel" class="form-control userPhone" name="phone" >
          <input type="text" class="form-control" id="CheckSms" placeholder="인증번호 입력" >
          <button type="button" class="btn btn-prm btn-sm smsKey">인증번호 요청</button>
          <button type="button" class="btn btn-secondary btn-sm CheckSmsKey">인증 확인</button>
          <span class="smsNo" style="display: none;">
              <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
          <span class="smsYC" style="display: none">인증번호가 발송되었습니다</span>
          <span class="smsYes" style="display: none;">
                인증되었습니다
              </span>
      </div>

      <div class="col-12">
        <label for="address" class="form-label">동네인증</label>
      </div>

      <div class="col-12">
        <input type="hidden" id="currentPage" value="1" style="text-align:center;"/>
        <input type="hidden" id="countPerPage" value="5" style="text-align:center;"/>
        <input type=text id="zipCode" value="" onClick="addressWindowOpen();" placeholder="00000" readOnly />
        <a class="btn btn-prm btn-sm" href='javascript:void(0);' onclick="addressWindowOpen();">우편번호 찾기</a>
        <div id="wrap" style="display: none;">
          <a class="btn btn-danger" id="closeBtn" href='javascript:void(0);' onclick="addressWindowClose();"><i class="fa fa-remove"></i></a>
          <div>
            <input type="text" id="searchAddr" value="" onkeydown="enterSearch();" placeholder="도로명주소, 건물명 또는 지번 입력"/>
            <a class="btn btn-info btn-sm" href='javascript:void(0);' onclick="getAddr();">주소검색</a>
          </div>
          <div>
            <div id="totoalOutcome">검색결과 : <span id="totalCnt">0</span></div>
            <table id="list" style="width: 100%; border: 1px;"></table>
          </div>
          <div id="pagingList" style='text-align:center;'></div>
        </div>
        <div style="height:5px;"></div>
        <input type="text" id="address" value="" placeholder="도로명 주소, 지번 주소" name="villCode" readonly/>
        <input type="text" id="addressDetail" value=""  name="villCode" placeholder="상세주소"/>
        <div style="height:5px;"></div>


<div>
        <input class="form-check-input" type="checkbox"  id="addChk" disabled="disabled" >
        <button type="button" class="btn btn-prm btn-sm" id="checkAddress" name="checkAddress">동네인증 요청</button>
</div>
        <div class="col-12">
          <input type="hidden" class="form-control" id="addressTrue" value="동네인증 되었습니다" readonly>
        </div>
        <div class="col-12">
          <input type="hidden" class="form-control" id="addressFalse" value="동네인증 실패. 현재위치를 확인해주세요" readonly>
        </div>

      </div>

      <div  id="map" style="width:500px;height:400px;"></div>

        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdddcf3f747ce062a0dc0af6d4a8b009&libraries=services"></script>
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

            $(function (){


              $("#checkAddress").on("click", function (){
                console.log($("#address").val())
                // console.log(window['lat'])
                // console.log(window['lon'])
                $.ajax({
                  url : "/user/json/checkAddress",
                  method : "POST",
                  data : JSON.stringify({
                    villCode : $("#address").val(),
                    lat : position.coords.latitude,
                    lon : position.coords.longitude
                  }),
                  dataType : "JSON",
                  processData : true,
                  contentType : "application/json",
                  success : function (result){
                    if(result==true) {
                      $("#addressTrue").attr("type","text").css("color","red");
                      $("#map").fadeOut();
                      $("#addChk").prop("checked",true);
                    }else {
                      $("#addressFalse").attr("type","text").css("color","red");
                    }
                  },
                  error : function (){
                    alert('지도 인증 실패');
                  }
                })
              })
            })


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



      <div class="col-12">
        <label for="file" class="form-label">회원 사진 등록 *선택사항*</label>
        <input type="file" id="file" name="file" >
      </div>


      <div class="hiddem">
        <input type="hidden" id="interListCheck" value="true">
        <input type="hidden" class="masterCheck" name="masterCheck" value="1">
        <input type="hidden" class="userStatus" name="userStatus" value="1">
        <input type="hidden" class="lcd" name="lcd" value="2022-10-10">
        <input type="hidden" class="psd" name="psd" value="">
        <input type="hidden" class="ped" name="ped" value="">
        <input type="hidden" class="ppt" name="ppt" value="0">
        <input type="hidden" class="reviewPt" name="reviewPt" value="0">
        <input type="hidden" class="loginType" name="loginType" value="1">
        <input type="hidden" id="idcheck" value="false">
      </div>


      <hr>
            <div class="col-12">
            <button class="w-100 btn btn-prm btn-lg cancle" type="button"> 취소</button>
            <button class="w-100 btn btn-prm btn-lg addUser" type="submit"> 관심목록 선택</button>
          </div>
        </div>
      </div>
    </form>

  </main>

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