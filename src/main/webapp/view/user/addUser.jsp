<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


    <style>
    .wap{ width: 400px; }
    tr { height:40px; }
    td { border-bottom:1px solid #CCC; font-size:12px; }

    .inputBox{
        display: flex;
        align-items: center;
        margin-bottom: 25px;
    }

    .inputLabel{
        width: 50%;
        text-align: right;
        padding-right: 3%;
    }

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
                        console.log('????????????!');
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
            // alert("?????? ????????? ???????????? :"+emailNo);
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
              // alert('??????????????????????????????');
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
              // alert('?????????????????????????????????');
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
                // alert('?????????????????? ?????????????????????');
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
              title: "???????????? ????????? ??????????????? ?????????."
        })
          return false;//?????? ?????????(??????)??? ????????????
        }
        if(pw == null || pw.length <1){
            Swal.fire({
                icon: 'warning',
                title: "??????????????? ????????? ??????????????? ?????????."
            })
          return false;
        }
        if(pw2 == null || pw2.length <1){
            Swal.fire({
                icon: 'warning',
                title: "???????????? ????????? ????????? ??????????????? ?????????."
            })
          return false;
        }
        if(name == null || name.length <1){
            Swal.fire({
                icon: 'warning',
                title: "????????? ????????? ??????????????? ?????????."
            })
          return false;//?????? ?????????(??????)??? ????????????
        }

        if( pw != pw2 ) {
            Swal.fire({
                icon: 'warning',
                title: "???????????? ????????? ???????????? ????????????."
            })

          $("input:text[name='password2']").focus();
          return false;
        }
        if(rrd == null || rrd.length <1){
            Swal.fire({
                icon: 'warning',
                title: "?????????????????????  ????????? ??????????????? ?????????."
            })
          return false;
        }



        if(!$("input:checked[id='male']").is(":checked") && !$("input:checked[id='female']").is(":checked")){
            Swal.fire({
                icon: 'warning',
                title: "?????????  ????????? ??????????????? ?????????."
            })
          return false;
        }

          if(!$("input:checked[id='CheckEamil']").is(":checked") && !$("input:checked[id='CheckPhone']").is(":checked")){
           Swal.fire({
                  icon: 'warning',
                  title: "????????? ?????? ?????????????????? ????????? ??????????????? ?????????."
              })
            return false;
          }
          if(!$("input:checked[id='addChk']").is(":checked")){
          Swal.fire({
                  icon: 'warning',
                  title: "??????????????? ????????? ??????????????? ?????????."
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
          // alert(errCode+"="+errDesc);
        }else{
          if(jsonStr!= null){
            makeListJson(jsonStr);
            console.log(jsonStr);
            // JSON????????? HTML????????? ??????
          }
        }
      },error: function(xhr,status, error){
        // alert("????????????");
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
        Swal.fire("??????????????? ?????? ?????? ????????????.") ;
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
          Swal.fire("\"" + sqlArray[i]+"\"???(???) ?????? ??????????????? ????????? ??? ????????????.");
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

 <%--?????? ??????--%>
 <jsp:include page="/layout/toolbar.jsp"/>

<div class="container shadow-lg" style="text-align: -webkit-center;display: flex;
    width: 1080px;
    border: 1px solid;

    flex-direction: column;">


  <main>
    <div class="text-center">
        <h2 style=" margin-top: 10px; padding: 10px;">????????????</h2>
    </div>
      <hr style="margin: 10px; color: #9e9e9e; opacity: 100%">
    <form class="needs-validation" novalidate enctype="multipart/form-data">
<div style="display:flex; margin-left: 50px; margin-right: 30px">

        <div style="display: flex;justify-content: space-between;width: 100%">
            <div style="width: 100%;">
                <div class="col-12 inputBox">
                    <div class="inputLabel">?????????</div>
                    <div class="input-group has-validation">
                        <input type="text" class="form-control" id="addUserId" name="userId" maxLength="20" required>
                    </div>
                </div>

                <span id="idChk" style="display: none;">
                <strong class="text-danger" style="margin-left: 40px;" >?????? ????????? ??????????????????</strong>
             </span>

                <div class="col-12 inputBox">
                    <div class="inputLabel">????????????</div>
                    <div class="input-group has-validation">
                        <input type="password" class="form-control" id="addPassword" name="password" maxLength="16" placeholder="??????,?????? ??????, 8~16?????? ??????" required>
                    </div>
                </div>

                <span id="passwordChk" style="display: none;">
                <strong class="text-danger" style="margin-left: 20px;">??????,?????? ??????, 8~16????????? ??????????????????</strong>
             </span>

                <div class="col-12 inputBox">
                    <div class="inputLabel">???????????? ??????</div>
                    <div class="input-group has-validation">
                        <input type="password" class="form-control" id="password2" name="password2" maxLength="16" required>
                    </div>
                </div>

                <span id="password2Chk" style="display: none;">
                <strong class="text-danger"  style="margin-left: 40px;" >??????????????? ???????????????</strong>
           </span>

                <div class="col-12 inputBox">
                    <div class="inputLabel">??????</div>
                    <div class="input-group has-validation">
                        <input type="text" class="form-control" id="userName" name="userName" required>
                    </div>
                </div>

                <div class="col-12 inputBox">
                    <div class="inputLabel">??????????????????</div>
                    <div class="input-group has-validation">
                        <input type="text" class="form-control" id="rrd" name="rrd"  placeholder="'-'???????????? ??????" required>
                    </div>
                </div>
                <span id="rrdChk" style="display: none;" >
                 <strong class="text-danger"  style="margin-left: 40px;">?????? ????????? ???????????????</strong>
              </span>


            </div>
            <div style="width: 100%;">

                <div>
                    <span>??????</span><label for="male" class="form-label">
                    <input type="radio" class="form-check-input" id="male" name="gender" value="??????" style="margin-left: 50px;" required>??????</label>
                    <label for="female" class="form-label">
                        <input type="radio" class="form-check-input" id="female" name="gender" value="??????" style="margin-left: 60px;" required>??????</label>
                    <span style="margin-right: 200px;"></span>
                </div>


                <h6>????????? ?????? ??????????????? ????????????(???1)</h6>

                <div>
                    <div class="col-12" style="display:flex; align-items: center;">
                        <div style="width: 130px; float: left;">
                            <label for="CheckEamil" class="form-label"><input type="radio" style="float: left;" class="form-check-input" id="CheckEamil" name="email&phone" required>
                                ?????????</label>
                        </div>
                        <div>
                            <div style="display: flex; ">
                                <input type="email" class="form-control userEmail" id="email" name="email" style="margin-bottom: 25px; width: 250px;" >
                                <button  type="button" class=" btn btn-primary btn-sm emailKey" style="margin-bottom: 25px; width: 130px; margin-left: 10px;">???????????? ??????</button>
                            </div>
                            <span class=" emailYC" style="display: none; margin-right: 192px;">
                                <strong class="text-danger" >??????????????? ?????????????????????</strong>
                            </span>
                            <div style="display: flex">
                                <input type="text" class="form-control CheckEmailKey" placeholder="???????????? ??????"  style="margin-bottom: 25px; width: 250px;">
                                <div>
                                    <button type="button" class="btn btn-primary btn-sm CheckEmailKey2" style="margin-bottom: 25px; width: 130px; margin-left: 10px;" >?????? ??????</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div style="display: flex">
                        <span class="emailInfor" style="display: none; margin-left: 130px;">
                            <strong class="text-danger" >??????????????? ???????????????</strong>
                        </span>

                        <span class="emailInforYes" style="display: none; margin-left: 130px;">
                            <strong class="text-danger" > ?????????????????????</strong>
                        </span>
                    </div>


                    <input type="hidden" id="randomEmail" name="randomEmail" >

                    <div>
                        <div style="display: flex; align-items: center;">
                            <div style="width: 130px;">
                                <label for="CheckPhone" class="form-label"><input type="radio" class="form-check-input" id="CheckPhone" name="email&phone" required>
                                    ???????????????</label>
                            </div>
                            <div>
                                <div style="display: flex">
                                    <input type="tel" class="form-control userPhone" name="phone" placeholder="'-'???????????? ??????" style="margin-bottom: 25px; width: 250px;" >
                                    <button type="button" class="btn btn-primary btn-sm smsKey" style="margin-bottom: 25px; width: 130px; margin-left: 10px;">???????????? ??????</button>
                                </div>
                                <span class="smsYC" id="smsYC" style="display: none; margin-right: 192px;">
                                    <strong class="text-danger" > ??????????????? ?????????????????????</strong>
                                </span>
                                <div style="display: flex">
                                    <input type="text" class="form-control" id="CheckSms" placeholder="???????????? ??????" style="margin-bottom: 25px; width: 250px;">
                                    <div>

                                        <button type="button" class="btn btn-primary btn-sm CheckSmsKey" style="margin-bottom: 25px; width: 130px; margin-left: 10px;">?????? ??????</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <span class="smsNo" style="display: none;margin-left: -90px;">
                            <strong class="text-danger" >??????????????? ???????????????</strong>
                        </span>

                        <span class="smsYes" style="display: none;margin-left: -90px;">
                            <strong class="text-danger" > ?????????????????????</strong>
                        </span>
                    </div>
                </div>

            </div>
        </div>





</div>


      <div  style="display: inline-block">
        <label for="address" class="form-label">????????????</label>


      <div class="col-12"  >
        <input type="hidden" id="currentPage" value="1" style="text-align:center;"/>
        <input type="hidden" id="countPerPage" value="5" style="text-align:center;"/>
        <input type=text id="zipCode" value="" onClick="addressWindowOpen();" placeholder="00000" readOnly />
        <a class="btn btn-primary btn-sm" href='javascript:void(0);' onclick="addressWindowOpen();">???????????? ??????</a>
        <div id="wrap" style="display: none;">
<%--          <a class="btn btn-primary" id="closeBtn" href='javascript:void(0);' onclick="addressWindowClose();"><i class="fa fa-remove"></i></a>--%>
          <div class="mt-3">
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


<div>
        <input class="form-check-input" type="checkbox"  id="addChk" disabled="disabled" >
        <button type="button" class="btn btn-primary btn-sm" id="checkAddress" name="checkAddress">???????????? ??????</button>
</div>
        <div class="col-12">
          <input type="hidden" class="form-control" id="addressTrue" value="???????????? ???????????????" readonly>
        </div>
        <div class="col-12">
          <input type="hidden" class="form-control" id="addressFalse" value="???????????? ??????. ??????????????? ??????????????????" readonly>
        </div>

      </div>
      </div>

      <div  id="map" style="width:500px;height:400px;"></div>

        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdddcf3f747ce062a0dc0af6d4a8b009&libraries=services"></script>
        <script>
          var mapContainer = document.getElementById('map'), // ????????? ????????? div
                  mapOption = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
                    level: 3 // ????????? ?????? ??????
                  };

          var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????

          // ????????? ????????? ???????????????
          var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);

          // ????????? ???????????????
          var marker = new kakao.maps.Marker({
            position: markerPosition
          });

          // ????????? ?????? ?????? ??????????????? ???????????????
          marker.setMap(map);


          if (navigator.geolocation) {

            // GeoLocation??? ???????????? ?????? ????????? ???????????????
            navigator.geolocation.getCurrentPosition(function(position) {

              var lat = position.coords.latitude, // ??????
                      lon = position.coords.longitude; // ??????

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
                    // alert('?????? ?????? ??????');
                  }
                })
              })
            })


              var locPosition = new kakao.maps.LatLng(lat, lon), // ????????? ????????? ????????? geolocation?????? ????????? ????????? ???????????????
                      message = '<div style="padding:5px;">????????? ?????????????!</div>'; // ?????????????????? ????????? ???????????????

              // ????????? ?????????????????? ???????????????
              displayMarker(locPosition, message);

              // self.location = "/map/json/myLocation?longitude=" + lon + "&latitude=" + lat;

            });

          } else { // HTML5??? GeoLocation??? ????????? ??? ????????? ?????? ?????? ????????? ??????????????? ????????? ???????????????

            var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
                    message = 'geolocation??? ???????????? ?????????..'

            displayMarker(locPosition, message);
          }

          function displayMarker(locPosition, message) {

            // ????????? ???????????????
            var marker = new kakao.maps.Marker({
              map: map,
              position: locPosition
            });

            var iwContent = message, // ?????????????????? ????????? ??????
                    iwRemoveable = true;

            // ?????????????????? ???????????????
            var infowindow = new kakao.maps.InfoWindow({
              content : iwContent,
              removable : iwRemoveable
            });

            // ?????????????????? ???????????? ???????????????
            infowindow.open(map, marker);

            // ?????? ??????????????? ??????????????? ???????????????
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

            <button class=" btn btn-primary addUser" type="submit" style="width: 200px;"> ???????????? ?????? ></button><br>
                <button class=" btn btn-primary  cancle" type="button" style="width: 200px;"> ??????</button>
          </div>

    </form>
<div style="margin-bottom: 100px;"></div>
  </main>


</div>
 <div style="margin-bottom: 100px;">
 </div>
 <jsp:include page="/layout/chatIcon.jsp"/>
 <jsp:include page="/layout/footer.jsp"/>

</body>
</html>