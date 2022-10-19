<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-19
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
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

    //////////////////////////////////////////////////////////////////////////
      $(function (){
      $(".checkEnd").on("click",function (){
        location.href="/view/user/main.jsp";
      })
  })
</script>
<body>

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

<button class="w-100 btn btn-primary btn-lg checkEnd" type="button" > 선택 완료</button>
      <input type="hidden" id="userId" name="userId" value="${user.userId}">${user.userId}
</body>
</html>
