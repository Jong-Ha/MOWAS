<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    $(function () {

      $("#updateSNSUserInfor").on("click",function (){
      alert('aaaa');
        var userId=$("input[name='userId']").val();
        var name=$("input[name='userName']").val();
        var rrd=$("input[name='rrd']").val();
        var villCode=$("input[name='villCode']").val();
        var loginType = $("#loginType").val();
        var interList=$("input[name='interList']").val();

        alert('userId'+userId);
        alert('loginType'+loginType);
        alert('userName'+name);

        if(name == null || name.length <1){
          alert("이름은  반드시 입력하셔야 합니다.");
          return false;//해당 메서드(펑션)을 종료한다
        }

        if(rrd == null || rrd.length <1){
          alert("주민등록번호는  반드시 입력하셔야 합니다.");
          return false;
        }

        $.ajax({
          url: "/user/json/updateSNSUserInfor",
          method: "POST",
          data:JSON.stringify({
            userId : userId,
            userName : name,
            rrd : rrd,
            villCode : villCode,
            loginType : loginType
          }),

          contentType : "application/json;charset:UTF-8",
          success : function (result){
            alert(54611561456)
            console.log(result)
           if(result){
             alert('ajax 성공');
              window.opener.parent.location.reload();
              window.close();
          }},
          error : function (){
            console.log('ajax 실패');
          }
        })

       // $("form").attr("method","POST").attr("action","/user/updateSNSUserInfor").submit();
       // window.close();

      });

    });

    $(function (){
        $("#list01").on("change",function () {
            if($("#list01").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list02").on("change",function () {
            if($("#list02").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })
        $("#list03").on("change",function () {
            if($("#list03").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list04").on("change",function () {
            if($("#list04").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list05").on("change",function () {
            if($("#list05").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list06").on("change",function () {
            if($("#list06").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list07").on("change",function () {
            if($("#list07").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list08").on("change",function () {
            if($("#list08").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list09").on("change",function () {
            if($("#list09").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list10").on("change",function () {
            if($("#list10").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list11").on("change",function () {
            if($("#list11").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list12").on("change",function () {
            if($("#list12").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })

        $("#list13").on("change",function () {
            if($("#list13").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비저장성공');
                    },
                    error : function (){
                        alert('디비저장실패');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#userId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (){
                        alert('디비삭제성공');
                    },
                    error : function (){
                        alert('디비삭제실패');
                    }
                });
            }
        })
    })





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
<div class="container" style="text-align: -webkit-center; width: 600px; height: 1200px;">

<div style="width: 400px; height: 1000px;">
  <main>

    <form class="needs-validation" novalidate enctype="multipart/form-data">
      <div class="row g-3">


        <div class="col-12">
          <label for="userName" class="form-label">이름</label>
            <input type="text" class="form-control" id="userName" name="userName"  required>
          </div>
        </div>


        <div class="col-12 ">
          <label for="rrd" class="form-label">주민등록번호</label>
            <input type="text" class="form-control" id="rrd" name="rrd"  required>
          </div>


      <div class="col-12">
        <label for="address" class="form-label">동네인증</label>
      </div>

      <div class="col-12">
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

      <input type="hidden" id="userId" name="userId" value="${user.userId}">${user.userId}
        <c:if test="${user.loginType=='2'}">
      <input type="hidden" id="loginType" name="loginType" value="${user.loginType}">${user.loginType}
        </c:if>
        <c:if test="${user.loginType=='3'}">
      <input type="hidden" id="loginType" name="loginType" value="${user.loginType}">${user.loginType}
        </c:if>

            <span id="checkItem">
          <span class="form-check">
            <input class="form-check-input" type="checkbox" value="01" id="list01" name="interList" >
            <label class="form-check-label" for="list01">
              독서
            </label>
          </span>
          <span class="form-check">
            <input class="form-check-input" type="checkbox" value="02" id="list02" name="interList" >
            <label class="form-check-label" for="list02">
              자동차
            </label>
          </span>
          <span class="form-check">
            <input class="form-check-input" type="checkbox" value="03" id="list03" name="interList" >
            <label class="form-check-label" for="list03">
              반려동물
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="04" id="list04" name="interList" >
            <label class="form-check-label" for="list04">
              공예
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="05" id="list05" name="interList" >
            <label class="form-check-label" for="list05">
              스포츠
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="06" id="list06" name="interList" >
            <label class="form-check-label" for="list06">
              댄스
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="07" id="list07" name="interList" >
            <label class="form-check-label" for="list07">
              여행
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="08" id="list08" name="interList" >
            <label class="form-check-label" for="list08">
              사진
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="09" id="list09" name="interList" >
            <label class="form-check-label" for="list09">
              육아
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="10" id="list10" name="interList" >
            <label class="form-check-label" for="list10">
              공연
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="11" id="list11" name="interList" >
            <label class="form-check-label" for="list11">
              음악
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="12" id="list12" name="interList" >
            <label class="form-check-label" for="list12">
              게임
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="13" id="list13" name="interList" >
            <label class="form-check-label" for="list13">
              그외
            </label>
          </span>
            </span>

        <div class="col-12">

            <input class="w-100 btn btn-primary btn-lg " id="updateSNSUserInfor" type="button" value="확인">
        </div>

    </form>

      <hr>

  </main>


</div>
</div>

</body>
</html>