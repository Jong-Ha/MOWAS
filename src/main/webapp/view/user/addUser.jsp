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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


    <style>
    .wap{ width: 400px; }
    tr { height:40px; }
    td { border-bottom:1px solid #CCC; font-size:12px; }
    span { cursor:pointer }


    .btn-primary {
        --bs-btn-color: #000;
        --bs-btn-bg: #f8cd07b3;
        --bs-btn-border-color: #f8cd07b3;
        --bs-btn-hover-color: #000;
        --bs-btn-hover-bg: #f8cd07;
        --bs-btn-hover-border-color: #f8cd07;
        --bs-btn-focus-shadow-rgb: 130, 138, 145;
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
let num
let smsNum

function readURL(inputSelector, outputSelector) {
    const input = $(inputSelector)[0]
    const output = $(outputSelector)[0]
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            output.src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    } else {
        output.src = "/resources/images/proplePoto.png";
    }
}

    $(function () {
        $('.needs-validation #file').on('change',function(){
            readURL('.needs-validation #file','.needs-validation #preview')
        })

        function lodingNum() {
        $.ajax({
            url: "/user/json/mailSender",
            method: "POST",
            data: {
                email: $(".userEmail").val()
            },
            dataType: "json",
            success: function (emailNo) {

                console.log("emailNo"+emailNo)
                num = emailNo;
                $(".emailYC").css("display", '');
            }
        });
    }

        $(".emailKey").on("click", function () {
           lodingNum();
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


            function fncLodingSmsNum(){

                $.ajax({
                    url: "/user/json/smsSend",
                    method: "POST",
                    data: {
                        phone: $(".userPhone").val()
                    },
                    dataType: "json",
                    success: function (smsNo) {

                            console.log("smsNo"+smsNo)
                             smsNum = smsNo;
                            $("#smsYC").css("display", '');
                    }
                });
            }

             $(".smsKey").on("click",function (){
                  fncLodingSmsNum();
              });

      $(".CheckEmailKey2").on("click",function (){
          console.log('asdsad')
          console.log(num)

        var CheckEmailKey = $(".CheckEmailKey").val();
          console.log(CheckEmailKey)
         //alert(CheckEmailKey);
         //var emailNo = num;
            // alert("랜덤 이메일 인증번호 :"+emailNo);
        if(parseInt(CheckEmailKey)!=num){
            $(".emailYC").css("display", 'none');
            $(".emailInforYes").css('display','none');
          $('.emailInfor').css('display','');
        }else{
            $(".emailYC").css("display", 'none');
            $('.emailInfor').css('display','none');
          $(".emailInforYes").css('display','');
        }
      });
      $(".CheckSmsKey").on("click",function (){
        var CheckSms = $("#CheckSms").val();
        console.log(smsNum);
        console.log(CheckSms);
        if(CheckSms!=smsNum){
            $(".smsYC").css("display",'none');
            $(".smsYes").css('display','none');
          $('.smsNo').css('display','');
        }else{
            $(".smsYC").css("display",'none');
            $('.smsNo').css('display','none');
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

      $("#addUserId").on("keyup",function (){
          $.ajax({
            url: "/user/json/userId",
            method: "POST",
            data: {
              userId: $("#addUserId").val()
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
        $("#addPassword").on("keyup",function () {
          $.ajax({
            url: "/user/json/password",
            method: "POST",
            data: {
              password : $("#addPassword").val()
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
                password : $("#addPassword").val(),
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

        var id=$("#addUserId").val();
        var pw=$("#addPassword").val();
        var pw2=$("input[name='password2']").val();
        var name=$("input[name='userName']").val();
        var rrd=$("input[name='rrd']").val();
        var male=$("#male").val();
        var female=$("#femail").val();
        var email=$("#CheckEamil").val();
        var phone=$("#CheckPhone").val();
        var interList=$("input[name='interList']").val();


        if(id == null || id.length <1){
          Swal.fire({
          icon: 'warning',
              title: "아이디는 반드시 입력하셔야 합니다."
        })
          return false;//해당 메서드(펑션)을 종료한다
        }
        if(pw == null || pw.length <1){
            Swal.fire({
                icon: 'warning',
                title: "비밀번호는 반드시 입력하셔야 합니다."
            })
          return false;
        }
        if(pw2 == null || pw2.length <1){
            Swal.fire({
                icon: 'warning',
                title: "비밀번호 확인은 반드시 입력하셔야 합니다."
            })
          return false;
        }
        if(name == null || name.length <1){
            Swal.fire({
                icon: 'warning',
                title: "이름은 반드시 입력하셔야 합니다."
            })
          return false;//해당 메서드(펑션)을 종료한다
        }

        if( pw != pw2 ) {
            Swal.fire({
                icon: 'warning',
                title: "비밀번호 확인이 일치하지 않습니다."
            })

          $("input:text[name='password2']").focus();
          return false;
        }
        if(rrd == null || rrd.length <1){
            Swal.fire({
                icon: 'warning',
                title: "주민등록번호는  반드시 입력하셔야 합니다."
            })
          return false;
        }



        if(!$("input:checked[id='male']").is(":checked") && !$("input:checked[id='female']").is(":checked")){
            Swal.fire({
                icon: 'warning',
                title: "성별은  반드시 입력하셔야 합니다."
            })
          return false;
        }

          if(!$("input:checked[id='CheckEamil']").is(":checked") && !$("input:checked[id='CheckPhone']").is(":checked")){
           Swal.fire({
                  icon: 'warning',
                  title: "이메일 또는 휴대폰번호는 반드시 인증하셔야 합니다."
              })
            return false;
          }
          if(!$("input:checked[id='addChk']").is(":checked")){
          Swal.fire({
                  icon: 'warning',
                  title: "동네인증은 반드시 인증하셔야 합니다."
              })
            return false;
          }


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

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

 <%--상단 툴바--%>
 <jsp:include page="/layout/toolbar.jsp"/>

<div class="container shadow-lg" style="text-align: -webkit-center;display: flex;
    width: 1080px;
    border: 1px solid;

    flex-direction: column;">


  <main>
    <div class="text-center">
        <h2 style=" margin-top: 10px; padding: 10px;">회원가입</h2>
    </div>
      <hr style="margin: 10px; color: #9e9e9e; opacity: 100%">
    <form class="needs-validation" novalidate enctype="multipart/form-data">
<div style="display:flex; margin-left: 50px; margin-right: 30px">

        <div style="display: inline-block; height: 330px; width: 700px; border-right: 1px solid #9e9e9e;  padding-right: 50px; padding-top: 10px;">
             <div class="col-12" style=" display:flex ">
                <span style="width: 50%;">아이디</span>
                 <div class="input-group has-validation">
                 <input type="text" class="form-control" id="addUserId" name="userId" maxLength="20" style="margin-bottom: 25px;" required>
                 </div>
            </div>

             <span id="idChk" style="display: none;">
                <strong class="text-danger" style="margin-left: 40px;" >이미 가입된 아이디입니다</strong>
             </span>

              <div class="col-12"  style="display:flex">
                  <span style="width: 50%">비밀번호</span>
                     <div class="input-group has-validation">
                        <input type="password" class="form-control" id="addPassword" name="password" maxLength="16" placeholder="영문,숫자 혼합, 8~16글자 입력" style="margin-bottom: 25px;"required>
                     </div>
              </div>

             <span id="passwordChk" style="display: none;">
                <strong class="text-danger" style="margin-left: 20px;">영문,숫자 혼합, 8~16글자로 입력해주세요</strong>
             </span>

             <div class="col-12" style="display:flex">
               <span style="width: 50%;">비밀번호 확인</span>
                 <div class="input-group has-validation">
                  <input type="password" class="form-control" id="password2" name="password2" maxLength="16" style="margin-bottom: 25px;" required>
                  </div>
             </div>

            <span id="password2Chk" style="display: none;">
                <strong class="text-danger"  style="margin-left: 40px;" >비밀번호가 틀렸습니다</strong>
           </span>

             <div class="col-12" style="display:flex">
               <span style="width: 50%;">이름</span>
                     <div class="input-group has-validation">
                       <input type="text" class="form-control" id="userName" name="userName"  style="margin-bottom: 25px;" required>
                      </div>
             </div>

          <div class="col-12" style="display:flex">
               <span style="width: 50%;">주민등록번호</span>
                <div class="input-group has-validation">
                   <input type="text" class="form-control" id="rrd" name="rrd"  placeholder="'-'포함하여 작성" style="margin-bottom: 25px;" required>
                </div>
          </div>
             <span id="rrdChk" style="display: none;" >
                 <strong class="text-danger"  style="margin-left: 40px;">이미 가입한 회원입니다</strong>
              </span>


        </div>





        <div style="display: inline-block; height: 300px; width: 600px; padding-top: 10px;">

            <div  >
                <span >성별</span><label for="male" class="form-label">
                <input type="radio" class="form-check-input" id="male" name="gender" value="남자" style="margin-left: 50px;" required>남자</label>
                <label for="female" class="form-label">
                    <input type="radio" class="form-check-input" id="female" name="gender" value="여자" style="margin-left: 60px;" required>여자</label>
                <span style="margin-right: 200px;"></span>
            </div>


            <h6>이메일 또는 휴대폰번호 인증하기(택1)</h6>

<div>
        <div class="col-12" style="display:flex; align-items: center;">
            <div style="width: 130px; float: left;">
          <label for="CheckEamil" class="form-label"><input type="radio" style="float: left;" class="form-check-input" id="CheckEamil" name="email&phone" required>
            이메일</label>
            </div>
            <div>
                <div style="display: flex; ">
          <input type="email" class="form-control userEmail" id="email" name="email" style="margin-bottom: 25px; width: 250px;" >
                <button  type="button" class=" btn btn-primary btn-sm emailKey" style="margin-bottom: 25px; width: 130px; margin-left: 10px;">인증번호 요청</button>
                </div>
                <span class=" emailYC" style="display: none; margin-right: 192px;">
                <strong class="text-danger" >인증번호가 발송되었습니다</strong>
                    </span>
                <div style="display: flex">
          <input type="text" class="form-control CheckEmailKey" placeholder="인증번호 입력"  style="margin-bottom: 25px; width: 250px;">
                <div>
          <button type="button" class="btn btn-primary btn-sm CheckEmailKey2" style="margin-bottom: 25px; width: 130px; margin-left: 10px;" >인증 확인</button>
                </div>

                </div>
        </div>
        </div>
            <div style="display: flex">
          <span class="emailInfor" style="display: none; margin-left: 130px;">
                <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>

          <span class="emailInforYes" style="display: none; margin-left: 130px;">
              <strong class="text-danger" > 인증되었습니다</strong>
              </span>
            </div>


            <input type="hidden" id="randomEmail" name="randomEmail" >

    <div>
            <div style="display: flex; align-items: center;">
          <div style="width: 130px;">
          <label for="CheckPhone" class="form-label"><input type="radio" class="form-check-input" id="CheckPhone" name="email&phone" required>
            휴대폰번호</label>
          </div>
                <div>
                <div style="display: flex">
          <input type="tel" class="form-control userPhone" name="phone" placeholder="'-'포함하여 작성" style="margin-bottom: 25px; width: 250px;" >
                <button type="button" class="btn btn-primary btn-sm smsKey" style="margin-bottom: 25px; width: 130px; margin-left: 10px;">인증번호 요청</button>
                </div>
                    <span class="smsYC" id="smsYC" style="display: none; margin-right: 192px;">
                     <strong class="text-danger" > 인증번호가 발송되었습니다</strong>
                      </span>
                <div style="display: flex">
          <input type="text" class="form-control" id="CheckSms" placeholder="인증번호 입력" style="margin-bottom: 25px; width: 250px;">
                <div>

          <button type="button" class="btn btn-primary btn-sm CheckSmsKey" style="margin-bottom: 25px; width: 130px; margin-left: 10px;">인증 확인</button>
                </div>
                </div>
          <span class="smsNo" style="display: none; margin-right: 224px;">
              <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>

          <span class="smsYes" style="display: none; margin-right: 274px;">
               <strong class="text-danger" > 인증되었습니다</strong>
              </span>
            </div>
            </div>
    </div>
      </div>

        </div>
</div>


      <div  style="display: inline-block">
        <label for="address" class="form-label">동네인증</label>


      <div class="col-12"  >
        <input type="hidden" id="currentPage" value="1" style="text-align:center;"/>
        <input type="hidden" id="countPerPage" value="5" style="text-align:center;"/>
        <input type=text id="zipCode" value="" onClick="addressWindowOpen();" placeholder="00000" readOnly />
        <a class="btn btn-primary btn-sm" href='javascript:void(0);' onclick="addressWindowOpen();">우편번호 찾기</a>
        <div id="wrap" style="display: none;">
          <a class="btn btn-primary" id="closeBtn" href='javascript:void(0);' onclick="addressWindowClose();"><i class="fa fa-remove"></i></a>
          <div>
            <input type="text" id="searchAddr" value="" onkeydown="enterSearch();" placeholder="도로명주소, 건물명 또는 지번 입력"/>
            <a class="btn btn-primary btn-sm" href='javascript:void(0);' onclick="getAddr();">주소검색</a>
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
        <button type="button" class="btn btn-primary btn-sm" id="checkAddress" name="checkAddress">동네인증 요청</button>
</div>
        <div class="col-12">
          <input type="hidden" class="form-control" id="addressTrue" value="동네인증 되었습니다" readonly>
        </div>
        <div class="col-12">
          <input type="hidden" class="form-control" id="addressFalse" value="동네인증 실패. 현재위치를 확인해주세요" readonly>
        </div>

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
                        $("#addressFalse").hide();
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



      <div class="col-12" style="display:inline-block;">
        <br><label for="file" class="form-label"><img id="preview" src="/resources/images/proplePoto.png" alt="userImage" style="height: 100px;width: 100px;border-radius: 50%;object-fit: cover"></label><br>
        <input type="file" style="border: 1px solid;" id="file" name="file">
      </div>


      <div class="hiddem">
        <input type="hidden" id="interListCheck" value="true">
        <input type="hidden" class="masterCheck" name="masterCheck" value="1">
        <input type="hidden" class="userStatus" name="userStatus" value="1">
        <input type="hidden" class="psd" name="psd" value="">
        <input type="hidden" class="ped" name="ped" value="">
        <input type="hidden" class="ppt" name="ppt" value="0">
        <input type="hidden" class="reviewPt" name="reviewPt" value="0">
        <input type="hidden" class="loginType" name="loginType" value="1">
        <input type="hidden" id="idcheck" value="false">
      </div>


      <hr>
            <div class="col-12" >

            <button class=" btn btn-primary addUser" type="submit" style="width: 200px;"> 관심목록 선택 ></button><br>
                <button class=" btn btn-primary  cancle" type="button" style="width: 200px;"> 취소</button>
          </div>

    </form>
<div style="margin-bottom: 100px;"></div>
  </main>


</div>
 <jsp:include page="/layout/chatIcon.jsp"/>
 <jsp:include page="/layout/footer.jsp"/>

</body>
</html>