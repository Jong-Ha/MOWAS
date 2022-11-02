<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    .ok {
        width: 100px;
        margin:auto;

    }
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
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
            success: function ({JSONData, status}) {
                console.log(status);
                $(".emailYC").css("display", '');
            }
        });
    });
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
        alert(CheckEmailKey);
        var emailNo = ${no.emailNo}
            alert("랜덤 이메일 인증번호 :"+emailNo);
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
    $("#ok").on("click",function (){
        $("form").attr("method","POST").attr("action", "/user/getMyPassword").submit();
    });
});

</script>
<body>
<%-- <%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>
<form>
    <div class="container">
        <div class="row mx-4 my-5">
            <h3>비밀번호 찾기</h3>
            <p class="w-100 border-top py-2">비밀번호를 찾을 방법을 선택해주세요.</p>
        </div>

        <div class="row m-5">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                <label class="form-check-label" for="flexRadioDefault1">
                    회원정보에 등록한 휴대전화로 인증하기<br>
                    회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.
                </label>
            </div>


            <div class="row mt-2 mb-2">
                <div class="form-group d-flex align-items-center">
                    <p class="fw-bold text-left mx-3" style="width: 10%;">아이디</p>
                    <input type="text" class="form-control w-25" id="findUserIdPhone" name="userId"  placeholder="아이디 입력" >
                </div>
            </div>


            <div class="row mt-2 mb-2">
                <div class="form-group d-flex align-items-center">
                    <p class="fw-bold text-left mx-3" style="width: 10%;">휴대전화 번호</p>
                    <input type="tel" class="form-control w-25 userPhone" name="phone"  placeholder="휴대폰 번호 입력">
                    <button class="btn btn-primary mx-3 smsKey">인증번호 요청</button>
                </div>
            </div>
            <div class="row mt-2 mb-2">
                <div class="form-group d-flex align-items-center">
                    <p class="fw-bold text-left mx-3" style="width: 10%;"></p>
                    <input type="text" class="form-control w-25" placeholder="인증번호 입력">
                    <button class="btn btn-primary mx-3 CheckSmsKey">인증번호 확인</button>
                </div>
            </div>
            <span class="smsNo" style="display: none;">
              <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
            <span class="smsYC" style="display: none">인증번호가 발송되었습니다</span>
            <span class="smsYes" style="display: none;">
                인증되었습니다
              </span>


            <div class="form-check mt-5">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                <label class="form-check-label" for="flexRadioDefault2">
                    본인확인 메일로 인증하기
                </label>

                <div class="row mt-2 mb-2">
                    <div class="form-group d-flex align-items-center">
                        <p class="fw-bold text-left mx-3" style="width: 10%;">아이디</p>
                        <input type="text" class="form-control w-25" id="findUserIdEmail" name="userId"  placeholder="아이디 입력" >

                    </div>
                </div>
                <div class="row mt-2 mb-2">
                    <div class="form-group d-flex align-items-center">
                        <p class="fw-bold text-left mx-3" style="width: 10%;">이메일</p>
                        <input type="email" class="form-control w-25"  id="email" name="email" placeholder="이메일 입력">
                        <button class="btn btn-primary mx-3 emailKey" >인증번호 요청</button>
                    </div>
                </div>
                <div class="row mt-2 mb-2">
                    <div class="form-group d-flex align-items-center">
                        <p class="fw-bold text-left mx-3" style="width: 10%;"></p>
                        <input type="text" class="form-control w-25" placeholder="인증번호 입력">
                        <button class="btn btn-primary mx-3 CheckEmailKey2">인증번호 확인</button>
                    </div>
                </div>
                <span class="emailInfor" style="display: none;">
                <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
                <span class="emailYC" style="display: none">인증번호가 발송되었습니다</span>
                <span class="emailInforYes" style="display: none;">
                인증되었습니다
              </span>
            </div>


        </div>
    </div>

    <div style="text-align: center";>
        <button type="button" class="btn btn-primary ok" style="display: inline-block; width: 200px;" id="ok">확인</button>
    </div>
</form>

<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
