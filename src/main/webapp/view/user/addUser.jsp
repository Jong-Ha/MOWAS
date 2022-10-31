<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

    <style>
    .wap{ width: 400px; }
    tr { height:40px; }
    td { border-bottom:1px solid #CCC; font-size:12px; }
    span { cursor:pointer }

    .btn-prm {
        --bs-btn-color: #000;
        --bs-btn-bg: #f8cd07b3;
        --bs-btn-border-color: #f8cd07b3;
        --bs-btn-hover-color: #000;
        --bs-btn-hover-bg: #f8cd07;
        --bs-btn-hover-border-color: #f8cd07;
        --bs-btn-focus-shadow-rgb: 130,138,145;
        --bs-btn-active-color: #000;
        --bs-btn-active-bg: #f8cd07;
        --bs-btn-active-border-color: #f8cd07;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #fff;
        --bs-btn-disabled-bg: #6c757d;
        --bs-btn-disabled-border-color: #6c757d;
    }

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
<div class="wap">

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
</div>
</body>
<form id="join_form" method="post" action="/user2/V2Join?m=end">
    <input type="hidden" id="token_sjoin" name="token_sjoin" value="zNFkbIFK9a9YOgp3">
    <input type="hidden" id="encPswd" name="encPswd" value="">
    <input type="hidden" id="encKey" name="encKey" value="">
    <input type="hidden" id="birthday" name="birthday" value="">
    <input type="hidden" id="joinMode" name="joinMode" value="unreal">
    <input type="hidden" id="pbirthday" name="pbirthday" value="">
    <input type="hidden" id="ipinFlag" name="ipinFlag" value="">
    <input type="hidden" id="nid_kb2" name="nid_kb2" value="">

    <!-- container -->
    <div id="container" role="main">
        <div id="content">
            <!-- tg-text=title -->
            <h2 class="blind">네이버 회원가입</h2>
            <div class="join_content">
                <!-- 아이디, 비밀번호 입력 -->
                <div class="row_group">
                    <div class="join_row">
                        <h3 class="join_title"><label for="id">아이디</label></h3>
                        <span class="ps_box int_id">
							<input type="text" id="id" name="id" class="int" title="ID" maxlength="20">
                            <span class="step_url">@naver.com</span></span>
                        <span class="error_next_box" id="idMsg" style="display:none" aria-live="assertive"></span>
                    </div>

                    <div class="join_row">
                        <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                        <span class="ps_box int_pass" id="pswd1Img">
							<input type="password" id="pswd1" name="pswd1" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                            <span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
						</span>
                        <span class="error_next_box" id="pswd1Msg" style="display:none" aria-live="assertive">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>

                        <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                        <span class="ps_box int_pass_check" id="pswd2Img">
							<input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" aria-describedby="pswd2Blind" maxlength="20">
							<span id="pswd2Blind" class="wa_blind">설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
						</span>
                        <span class="error_next_box" id="pswd2Msg" style="display:none" aria-live="assertive"></span>
                    </div>
                </div>
                <!-- // 아이디, 비밀번호 입력 -->

                <!-- 이름, 생년월일 입력 -->
                <div class="row_group">

                    <!-- lang = ko_KR -->
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">이름</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
						</span>
                        <span class="error_next_box" id="nameMsg" style="display:none" aria-live="assertive"></span>
                    </div>
                    <!-- lang = ko_KR -->

                    <div class="join_row join_birthday">
                        <h3 class="join_title"><label for="yy">생년월일</label></h3>
                        <div class="bir_wrap">
                            <div class="bir_yy">
								<span class="ps_box">
									<input type="text" id="yy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
								</span>
                            </div>
                            <div class="bir_mm">
								<span class="ps_box">
									<select id="mm" class="sel" aria-label="월">
										<option value="">월</option>
										  	 			<option value="01">
                                                            1
                                                        </option>
										  	 			<option value="02">
                                                            2
                                                        </option>
										  	 			<option value="03">
                                                            3
                                                        </option>
										  	 			<option value="04">
                                                            4
                                                        </option>
										  	 			<option value="05">
                                                            5
                                                        </option>
										  	 			<option value="06">
                                                            6
                                                        </option>
										  	 			<option value="07">
                                                            7
                                                        </option>
										  	 			<option value="08">
                                                            8
                                                        </option>
										  	 			<option value="09">
                                                            9
                                                        </option>
										  	 			<option value="10">
                                                            10
                                                        </option>
										  	 			<option value="11">
                                                            11
                                                        </option>
										  	 			<option value="12">
                                                            12
                                                        </option>
									</select>
								</span>
                            </div>
                            <div class=" bir_dd">
								<span class="ps_box">
									<input type="text" id="dd" placeholder="일" aria-label="일" class="int" maxlength="2">
									<label for="dd" class="lbl"></label>
								</span>
                            </div>
                        </div>
                        <span class="error_next_box" id="birthdayMsg" style="display:none" aria-live="assertive"></span>
                    </div>

                    <div class="join_row join_sex">
                        <h3 class="join_title"><label for="gender">성별</label></h3>
                        <div class="ps_box gender_code">
                            <select id="gender" name="gender" class="sel" aria-label="성별">
                                <option value="" selected>성별</option>
                                <option value="M">남자</option>
                                <option value="F">여자</option>
                                <option value="U">선택 안함</option>
                            </select>
                        </div>
                    </div>
                    <span class="error_next_box" id="genderMsg" style="display:none" aria-live="assertive"></span>

                    <div class="join_row join_email">
                        <h3 class="join_title"><label for="email">본인 확인 이메일<span class="terms_choice">(선택)</span></label></h3>
                        <span class="ps_box int_email box_right_space">
							<input type="text" id="email" name="email" placeholder="선택입력" aria-label="선택입력" class="int" maxlength="100">
						</span>
                    </div>
                    <span class="error_next_box" id="emailMsg" style="display:none" aria-live="assertive"></span>
                </div>
                <!-- // 이름, 생년월일 입력 -->

                <!-- 휴대전화 번호, 인증번호 입력 -->
                <div class="join_row join_mobile" id="mobDiv">
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <div class="ps_box country_code">
                        <select id="nationNo" name="nationNo" class="sel" aria-label="전화번호 입력">
                            <option value="233" >
                                가나 +233
                            </option>
                            <option value="241" >
                                가봉 +241
                            </option>
                            <option value="592" >
                                가이아나 +592
                            </option>
                        </select>
                    </div>
                    <div class="int_mobile_area">
						<span class="ps_box int_mobile">
							<input type="tel" id="phoneNo" name="phoneNo" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
							<label for="phoneNo" class="lbl"></label>
						</span>
                        <a href="#" class="btn_verify btn_primary" id="btnSend" role="button">
                            <span class="">인증번호 받기</span>
                        </a>
                    </div>
                    <div class="ps_box_disable box_right_space" id="authNoBox">
                        <input type="tel" id="authNo" name="authNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="wa_verify" class="int" disabled maxlength="4">
                        <label id="wa_verify" for="authNo" class="lbl">
                            <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                            <span class="input_code" id="authNoCode" style="display:none;"></span>
                        </label>
                    </div>

                    <span class="error_next_box" id="phoneNoMsg" style="display:none" aria-live="assertive"></span>
                    <span class="error_next_box" id="authNoMsg" style="display:none" aria-live="assertive"></span>
                    <span class="error_next_box" id="joinMsg" style="display:none" aria-live="assertive"></span>
                </div>
                <!-- // 휴대전화 번호, 인증번호 입력 -->

                <!-- tg-display=>{"보호자 모바일 인증": [], "오류 메시지": []} -->
                <div class="join_minor tab" id="pmobDiv" style="display:none">
                    <ul class="tab_m" role="tablist">
                        <li class="m1" role="presentation"><a href="#" onclick="return false;" class="on" role="tab" aria-selected="true" aria-controls="wa_tab_phone">휴대전화인증</a></li>
                        <li class="m2" role="presentation"><a href="#" id="tabPrtsIpin" role="tab" aria-selected="false" aria-controls="wa_tab_ipin">아이핀 인증</a></li>
                    </ul>
                    <div id="wa_tab_phone" role="tabpanel">
                        <div class="agree_check_wrap">
                            <div class="terms_chk_all">
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_all" class="chk_all">
                                    <label for="pagree_all">
                                        <span class="chk_all_txt">아래 약관에 모두 동의합니다.</span>
                                    </label>
                                </span>
                            </div>
                            <div class="small_check_box">
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_01" class="chk">
                                    <label for="pagree_01">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewPersonalInfoTerms" target="_blank"><span>개인정보 이용</span></a>
                                    </label>
                                </span>
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_02" class="chk">
                                    <label for="pagree_02">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewUniqInfoTerms" target="_blank"><span>고유식별정보 처리</span></a>
                                    </label>
                                </span>
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_03" class="chk">
                                    <label for="pagree_03">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewCellPhoneCarriersTerms" target="_blank"><span>통신사 이용약관</span></a>
                                    </label>
                                </span>
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_04" class="chk">
                                    <label for="pagree_04">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewServiceTerms" target="_blank"><span>인증사 이용약관</span></a>
                                    </label>
                                </span>
                                <span class="input_chk">
                                    <input type="checkbox" id="pagree_05" class="chk">
                                    <label for="pagree_05">
                                        <a href="https://nid.naver.com/user2/common/terms/terms?m=viewNaverTerms" target="_blank"><span>네이버 개인정보 수집</span></a>
                                    </label>
                                </span>
                            </div>
                            <span class="error_next_box" id="pagreeMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                        <div class="row_group">
                            <div class="join_row">
                                <h3 class="join_title"><label for="pname">보호자 이름</label></h3>
                                <span class="ps_box box_right_space">
                                    <input type="text" id="pname" name="pname" title="보호자 이름" class="int" maxlength="40">
                                </span>
                                <span class="error_next_box" id="pnameMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            </div>
                            <div class="join_row join_birthday">
                                <h3 class="join_title"><label for="pyy">보호자 생년월일</label></h3>
                                <div class="bir_wrap">
                                    <div class="bir_yy">
                                        <span class="ps_box">
                                            <input type="text" id="pyy" placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4">
                                        </span>
                                    </div>
                                    <div class="bir_mm">
                                        <span class="ps_box">
                                            <select id="pmm" name="pmm" class="sel" aria-label="월">
                                                <option>월</option>
                                                <option>1</option><option>2</option><option>3</option>
                                                <option>4</option><option>5</option><option>6</option>
                                                <option>7</option><option>8</option><option>9</option>
                                                <option>10</option><option>11</option><option>12</option>
                                            </select>
                                        </span>
                                    </div>
                                    <div class="bir_dd">
                                        <span class="ps_box">
                                            <input type="text" id="pdd" placeholder="일" aria-label="일" class="int" maxlength="2">
                                            <label for="pdd" class="lbl"></label>
                                        </span>
                                    </div>
                                </div>
                                <span class="error_next_box" id="pbirthdayMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            </div>
                            <div class="join_row">
                                <h3 class="join_title"><label for="pgender">보호자 성별/국적</label></h3>
                                <div class="join_guardian">
                                    <div class="gender_nationality">
                                        <div class="ps_box gender_code">
                                            <select id="pgender" name="pgender" class="sel" aria-label="성별">
                                                <option value="" selected="">성별</option>
                                                <option value="0">남자</option>
                                                <option value="1">여자</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="gender_nationality">
                                        <div class="ps_box gender_code">
                                            <select id="pforeign" name="pforeign" class="sel" aria-label="내국인여부">
                                                <option value="0" selected="">내국인</option>
                                                <option value="1">외국인</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <span class="error_next_box" id="pgenderMsg" style="display:none" aria-live="assertive"></span>
                            </div>
                        </div>
                        <div class="join_row join_mobile">
                            <h3 class="join_title"><label for="ptelecom">통신사</label></h3>
                            <div class="ps_box country_code">
                                <select id="ptelecom" name="ptelecom" class="sel" aria-label="통신사">
                                    <option value="SKT" >SKT</option>
                                    <option value="KTF" >KT</option>
                                    <option value="LGT" >LG U+</option>
                                    <option value="SKR" >SKT 알뜰폰</option>
                                    <option value="KTR" >KT 알뜰폰</option>
                                    <option value="LGR" >LG U+ 알뜰폰</option>
                                </select>
                            </div>
                        </div>
                        <div class="join_row join_mobile">
                            <h3 class="join_title"><label for="pphoneNo">휴대전화</label></h3>
                            <div class="int_mobile_area">
                                <span class="ps_box int_mobile">
                                    <input type="tel" id="pphoneNo" name="pphoneNo" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
                                </span>
                                <a href="#" class="btn_verify btn_primary" id="btnPrtsSend" role="button">
                                    <span class="">인증번호 받기</span>
                                </a>
                            </div>
                            <div class="ps_box_disable box_right_space" id="pauthNoBox">
                                <input type="tel" id="pauthNo" name="pauthNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="pwa_verify" class="int" disabled maxlength="6">
                                <label id="pwa_verify" for="pauthNo" class="lbl">
                                    <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                                    <span class="input_code" id="pauthNoCode" style="display:none;"></span>
                                </label>
                            </div>
                            <span class="error_next_box" id="pphoneNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="pauthNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="pjoinMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                    </div>
                </div>
                <!-- tg-display -->

                <!-- tg-display=>{"보호자 아이핀 인증": [], "오류 메시지": []} -->
                <div class="join_minor tab" id="pipinDiv" style="display:none">
                    <ul class="tab_m" role="tablist">
                        <li class="m1" role="presentation"><a href="#" id="tabPrtsMobile" role="tab" aria-selected="false" aria-controls="wa_tab_phone">휴대전화인증</a></li>
                        <li class="m2" role="presentation"><a href="#" onclick="return false;" class="on" role="tab" aria-selected="true" aria-controls="wa_tab_ipin">아이핀 인증</a></li>
                    </ul>
                    <div id="wa_tab_ipin" role="tabpanel">
                        <div class="terms_chk_all">
                            <span class="input_chk">
                                <input type="checkbox" id="iagree_all" class="chk">
                                <label for="iagree_all" class="ipin_label">
                                    <span class="txt">보호자 인증이 완료되면 보호자 이름, 생년월일, 성별, 중복가입확인정보(DI)가 보호자 동의 확인을 위하여 아동의 정보와 함께 저장되며, <strong class="point">아동이 성년이 되는 시점에 파기됩니다.</strong></span>
                                </label>
                            </span>
                            <span class="error_next_box" id="iagreeMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                        <div class="ipin_box">
                            <p class="ipin_certify_txt">보호자 명의의 아이핀으로 인증 후<br> 가입이 가능 합니다.</p>
                            <button type="button" id="btnIpinPopup" class="ipin_certify_btn" title="새 창">
                                <span>아이핀 인증하기</span>
                            </button>
                            <span class="error_next_box" id="ipopupMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                        <div class="join_row join_mobile">
                            <h3 class="join_title"><label for="iphoneNo">휴대전화</label></h3>
                            <div class="int_mobile_area">
                                <span class="ps_box int_mobile">
                                    <input type="tel" id="iphoneNo" name="iphoneNo" placeholder="전화번호 입력" aria-label="전화번호 입력" class="int" maxlength="16">
                                </span>
                                <a href="#" class="btn_verify btn_primary" id="btnIpinSend" role="button">
                                    <span class="">인증번호 받기</span>
                                </a>
                            </div>
                            <div class="ps_box_disable box_right_space" id="iauthNoBox">
                                <input type="tel" id="iauthNo" name="iauthNo" placeholder="인증번호 입력하세요" aria-label="인증번호 입력하세요" aria-describedby="iwa_verify" class="int" disabled maxlength="4">
                                <label id="iwa_verify" for="iauthNo" class="lbl">
                                    <span class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span>
                                    <span class="input_code" id="iauthNoCode" style="display:none;"></span>
                                </label>
                            </div>
                            <span class="error_next_box" id="iphoneNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="iauthNoMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                            <span class="error_next_box" id="ijoinMsg" style="display:none" aria-live="assertive">필수 정보입니다.</span>
                        </div>
                    </div>
                </div>

                <div class="btn_area">
                    <button type="button" id="btnJoin" class="btn_type btn_primary"><span>가입하기</span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- // container -->
</form>


</html>