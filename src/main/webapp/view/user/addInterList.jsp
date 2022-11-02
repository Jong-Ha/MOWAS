<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
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
    .form-check{
        width: 200px;
        height: 24px;
        padding: 14px;
    }
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    $(function (){
        $("#list01").on("change",function () {
            if($("#list01").is(":checked")){
                var check = $(this).val();
                console.log("check True의 값 :"+check);
                $.ajax({
                    url : "/user/json/addinterList",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

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
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }else {
                var check = $(this).val();
                console.log("check False의 값 :"+check);
                $.ajax({
                    url : "/user/json/deleteInter",
                    method : "POST",
                    data : JSON.stringify({
                        userId : $("#addUserId").val(),
                        interList : check
                    }),
                    contentType : "application/json",
                    dataType : "json",
                    success : function (result){

                    },
                    error : function (){

                    }
                });
            }
        })
    })

    //////////////////////////////////////////////////////////////////////////
      $(function (){
      $(".checkEnd").on("click",function (){
        location.href="/";
      })
  })
</script>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<jsp:include page="/layout/toolbar.jsp"/>

<div class="container" style="text-align: -webkit-center; width: 1080px; height: 800px;">
<div class="shadow-lg" style="background-color:#ffee58; border: 1px solid #ffee58; border-radius: 10px; width: 600px; height: 760px;">
    <div style="background-color: #c9bc1f; border-color: #c9bc1f; height: 30px; width: 600px; border-radius: 10px 10px 0px 0px;"></div>
    <div style="border: 1px solid; border-color: #ffee58 ">
    <h2 style="margin: 40px;">관심목록 선택</h2>
    </div>
    <hr>
  <div style="border: 1px solid #aeaeae; border-radius: 10px; width: 490px; height: 438px; background-color: white; border-color: white">
<span  id="checkItem">
          <span class="form-check" style="margin-top: 10px;">
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
            <span class="form-check" style="margin-bottom: 10px;">
            <input class="form-check-input" type="checkbox" value="13" id="list13" name="interList" >
            <label class="form-check-label" for="list13">
              그외
            </label>
          </span>
            </span>
  </div>
<hr>
        <button class="btn btn-primary checkEnd"  style="width: 200px; margin: 10px; margin-left: 10px;" type="button" > 선택 완료</button>


      <input type="hidden" id="addUserId" name="userId" value="${user.userId}">
</div>
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>

</html>
