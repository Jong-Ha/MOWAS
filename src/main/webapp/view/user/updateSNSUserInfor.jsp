<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MOWAS</title>
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
        console.log('aaaa');
        var userId=$("input[name='userId']").val();
        var name=$("input[name='userName']").val();
        var rrd=$("input[name='rrd']").val();
        var villCode=$("input[name='villCode']").val();
        var loginType = $("#loginType").val();
        var interList=$("input[name='interList']").val();

        console.log('userId'+userId);
        console.log('loginType'+loginType);
        console.log('userName'+name);

        if(name == null || name.length <1){
          alert("?????????  ????????? ??????????????? ?????????.");
          return false;//?????? ?????????(??????)??? ????????????
        }

        if(rrd == null || rrd.length <1){
          alert("?????????????????????  ????????? ??????????????? ?????????.");
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
            console.log(54611561456)
            console.log(result)
           if(result){
             console.log('ajax ??????');
              window.opener.parent.location.reload();
              window.close();
          }},
          error : function (){
            console.log('ajax ??????');
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
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list02").on("change",function () {
            if($("#list02").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })
        $("#list03").on("change",function () {
            if($("#list03").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list04").on("change",function () {
            if($("#list04").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list05").on("change",function () {
            if($("#list05").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list06").on("change",function () {
            if($("#list06").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list07").on("change",function () {
            if($("#list07").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list08").on("change",function () {
            if($("#list08").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list09").on("change",function () {
            if($("#list09").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list10").on("change",function () {
            if($("#list10").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list11").on("change",function () {
            if($("#list11").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list12").on("change",function () {
            if($("#list12").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })

        $("#list13").on("change",function () {
            if($("#list13").is(":checked")){
                var check = $(this).val();
                console.log("check True??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False??? ??? :"+check);
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
                      console.log('??????????????????');
                    },
                    error : function (){
                      console.log('??????????????????');
                    }
                });
            }
        })
    })





  /// @brief ??????????????? - ????????? Enter??? ??????
  function enterSearch() {
    var evt_code = (window.netscape) ? event.which : event.keyCode;
    if (evt_code == 13) {
      event.keyCode = 0;
      getAddr();
    }
  }

  //???????????????
  function getAddr(){
// ????????? (api ?????? ?????? ????????? ??????)
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
            // JSON????????? HTML????????? ??????
          }
        }
      },error: function(xhr,status, error){
        alert("????????????");
      }
    });
  }

  /// @brief ??????????????? - ????????? ??????
  function makeListJson(jsonStr) {
    let htmlStr = "<thead><tr><th style='width:70px;'>????????????</th><th>??????</th></tr></thead><tbody>";
    if(jsonStr.results.common.totalCount > 0) {
      jQuery("#totoalOutcome").css("display", "block");
      jQuery("#totalCnt").html(jsonStr.results.common.totalCount);

      jQuery(jsonStr.results.juso).each(function() {
        let zipNo = this.zipNo;                  // ????????????
        let roadAddr = this.roadAddr;        // ????????? ??????
        let jibunAddr = this.jibunAddr;       // ?????? ??????

        htmlStr += "<tr style='border:1px;'>";
        htmlStr += "<td>";
        htmlStr += "<a href='javascript:;' onClick='inputTextAddress(\""+zipNo+"\", \""+roadAddr+"\");'>";
        htmlStr += zipNo;
        htmlStr += "</a>";
        htmlStr += "</td>";
        htmlStr += "<td>";
       // htmlStr += "<a href='javascript:;' onClick='inputTextAddress(\""+zipNo+"\", \""+roadAddr+"\");'>";
       // htmlStr += "????????? : " + roadAddr;
       // htmlStr += "</a>";
       // htmlStr += "<br/>";
        htmlStr += "<a href='javascript:;' onClick='inputTextAddress(\""+zipNo+"\", \""+jibunAddr+"\");'>";
        htmlStr += "?????? : " + jibunAddr;
        htmlStr += "</a>";
        htmlStr += "</td>";
        htmlStr += "</tr>";
      });
      pageMake(jsonStr);
    } else {
      htmlStr += "<tr><td colspan='2'>????????? ???????????? ????????????.<br/>?????? ???????????? ????????? ????????????.</td></tr>";
    }
    htmlStr += "</tbody>";
    jQuery("#list").html(htmlStr);
  }
  /// @brief ??????????????? - ????????? ??????
  function inputTextAddress(zipcode, address) {
    document.getElementById("zipCode").value = zipcode;
    document.getElementById("address").value = address;
  }
  /// @brief ??????????????? - ??????
  function addressWindowOpen() {
    jQuery("#wrap").slideDown();
    jQuery("#searchAddr").focus();
  }
  /// @brief ??????????????? - ??????
  function addressWindowClose() {
    jQuery("#wrap").slideUp();
    jQuery("#searchAddr").val("");
    jQuery("#totoalOutcome").css("display", "none");
    jQuery("#list").empty();
    jQuery("#pagingList").empty();
    jQuery("#currentPage").val("1");
  }
  //????????????, ???????????????(sql ???????????? ?????? ?????? ??????) ??????
  function checkSearchedWord(obj){
    console.log(obj);
    if(obj.value.length > 0){
      //???????????? ??????
      var expText = /[%=><]/ ;
      if(expText.test(obj.value) == true){
        alert("??????????????? ?????? ?????? ????????????.") ;
        obj.value = obj.value.split(expText).join("");
        return false;
      }

      //???????????????(sql???????????? ??????????????????) ??????
      var sqlArray = new Array(
              //sql ?????????
              "OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC", "UNION", "FETCH", "DECLARE", "TRUNCATE"
      );

      var regex;
      for(var i=0; i<sqlArray.length; i++){
        regex = new RegExp( sqlArray[i] ,"gi") ;

        if (regex.test(obj.value) ) {
          alert("\"" + sqlArray[i]+"\"???(???) ?????? ??????????????? ????????? ??? ????????????.");
          obj.value =obj.value.replace(regex, "");
          return false;
        }
      }
    }
    return true ;
  }
  /// @brief ??????????????? - ????????? ??????
  function pageMake(jsonStr) {
    var total = jsonStr.results.common.totalCount;				// ?????????
    var pageNum = document.getElementById("currentPage").value;	// ???????????????
    var pageBlock = Number(document.getElementById("countPerPage").value);	// ???????????? ?????? ??????
    var paggingStr = "";

    // ?????? ????????? ???????????? ?????????????????? ????????? ???????????? ???????????? ?????????.
    if(total > pageBlock) {
      var totalPages = Math.floor((total - 1) / pageNum) + 1;
      var firstPage = Math.floor((pageNum - 1) / pageBlock) * pageBlock + 1;

      if(firstPage <= 0) { firstPage = 1; };

      var lastPage = (firstPage - 1) + pageBlock;

      if(lastPage > totalPages) { lastPage = totalPages; };

      var nextPage = lastPage + 1;
      var prePage = firstPage - pageBlock;

      if(firstPage > pageBlock) {
        paggingStr += "<a href='javascript:;' onClick='goPage(" + prePage + ");'>???</a>";
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
        paggingStr += "<a href='javascript:;' onClick='goPage(" + nextPage + ");'>???</a>";
      }
    }
    jQuery("#pagingList").html(paggingStr);
  }
  /// @brief ????????? ??????
  function goPage(pageNum) {
    document.getElementById("currentPage").value = pageNum;
    getAddr();
  }




</script>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<div class="container" style="text-align: -webkit-center; width: 450px; height: 1200px;">

<div style="width: 400px;  border: 3px solid; border-color: #f8cd07; padding: 20px;">
  <main>

    <form class="needs-validation" novalidate enctype="multipart/form-data">
      <div class="row g-3">
<div style="width: 400px; height: 40px; font-size: 30px; margin-top: 30px; ">???????????? ??????</div>

        <div class="col-12">
          <label for="userName" class="form-label">??????</label>
            <input type="text" class="form-control" id="userName" name="userName"  required>
          </div>
        </div>


        <div class="col-12 ">
          <label for="rrd" class="form-label">??????????????????</label>
            <input type="text" class="form-control" id="rrd" name="rrd" placeholder="'-'?????? ??????" required>
          </div>


      <div class="col-12">
        <label for="address" class="form-label">??????</label>
      </div>

      <div class="col-12">
        <input type="hidden" id="currentPage" value="1" style="text-align:center;"/>
        <input type="hidden" id="countPerPage" value="5" style="text-align:center;"/>
        <input type=text id="zipCode" value="" onClick="addressWindowOpen();" placeholder="00000" readOnly />
        <a class="btn btn-primary btn-sm" href='javascript:void(0);' onclick="addressWindowOpen();">???????????? ??????</a>
        <div id="wrap" style="display: none;">
          <a class="btn btn-primary" id="closeBtn" href='javascript:void(0);' onclick="addressWindowClose();"><i class="fa fa-remove"></i></a>
          <div>
            <input type="text" id="searchAddr" value="" onkeydown="enterSearch();" placeholder="???????????????, ????????? ?????? ?????? ??????"/>
            <a class="btn btn-primary btn-sm" href='javascript:void(0);' onclick="getAddr();">????????????</a>
          </div>
          <div>
            <div id="totoalOutcome">???????????? : <span id="totalCnt">0</span></div>
            <table id="list" style="width: 100%; border: 1px;"></table>
          </div>
          <div id="pagingList" style='text-align:center;'></div>
        </div>
        <div style="height:5px;"></div>
        <input type="text" id="address" value="" placeholder="????????? ??????, ?????? ??????" name="villCode" readonly/>
        <input type="text" id="addressDetail" value=""  name="villCode" placeholder="????????????"/>
        <div style="height:5px;"></div>




      <input type="hidden" id="userId" name="userId" value="${user.userId}">
        <c:if test="${user.loginType=='2'}">
      <input type="hidden" id="loginType" name="loginType" value="${user.loginType}">
        </c:if>
        <c:if test="${user.loginType=='3'}">
      <input type="hidden" id="loginType" name="loginType" value="${user.loginType}">
        </c:if>
        <div class="col-12">
          <label for="address" class="form-label">???????????? ??????</label>
        </div>
            <span id="checkItem">
          <span class="form-check">
            <input class="form-check-input" type="checkbox" value="01" id="list01" name="interList" >
            <label class="form-check-label" for="list01">
              ??????
            </label>
          </span>
          <span class="form-check">
            <input class="form-check-input" type="checkbox" value="02" id="list02" name="interList" >
            <label class="form-check-label" for="list02">
              ?????????
            </label>
          </span>
          <span class="form-check">
            <input class="form-check-input" type="checkbox" value="03" id="list03" name="interList" >
            <label class="form-check-label" for="list03">
              ????????????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="04" id="list04" name="interList" >
            <label class="form-check-label" for="list04">
              ??????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="05" id="list05" name="interList" >
            <label class="form-check-label" for="list05">
              ?????????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="06" id="list06" name="interList" >
            <label class="form-check-label" for="list06">
              ??????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="07" id="list07" name="interList" >
            <label class="form-check-label" for="list07">
              ??????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="08" id="list08" name="interList" >
            <label class="form-check-label" for="list08">
              ??????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="09" id="list09" name="interList" >
            <label class="form-check-label" for="list09">
              ??????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="10" id="list10" name="interList" >
            <label class="form-check-label" for="list10">
              ??????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="11" id="list11" name="interList" >
            <label class="form-check-label" for="list11">
              ??????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="12" id="list12" name="interList" >
            <label class="form-check-label" for="list12">
              ??????
            </label>
          </span>
            <span class="form-check">
            <input class="form-check-input" type="checkbox" value="13" id="list13" name="interList" >
            <label class="form-check-label" for="list13">
              ??????
            </label>
          </span>
            </span>

        <div class="col-12">

            <input class="w-100 btn btn-primary btn-lg " style="margin-top: 15px;" id="updateSNSUserInfor" type="button" value="??????">
        </div>

    </form>



  </main>


</div>
</div>

</body>
</html>