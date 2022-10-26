<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
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
<form>
비밀번호 찾기

아이디<input type="text" id="userId" name="userId" >

<div class="col-12">
    이메일 선택<br>
    <label for="CheckEamil" class="form-label"><input type="radio" class="form-check-input" id="CheckEamil" name="email&phone" required>
        이메일</label>
    <input type="email" class="form-control userEmail" id="email" name="email" >
    <input type="text" class="form-control CheckEmailKey" placeholder="인증번호 입력"  >
    <button type="button" class="btn btn-primary btn-sm emailKey">인증번호 요청</button>
    <button type="button" class="btn btn-primary btn-sm emailImage">인증번호 이미지 요청</button>
    <button type="button" class="btn btn-secondary btn-sm CheckEmailKey2">인증 확인</button>
    <span class="emailInfor" style="display: none;">
                <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
    <span class="emailYC" style="display: none">인증번호가 발송되었습니다</span>
    <span class="emailInforYes" style="display: none;">
                인증되었습니다
              </span><br/>

    휴대폰번호 선택

    <div>
        <label for="CheckPhone" class="form-label"><input type="radio" class="form-check-input" id="CheckPhone" name="email&phone" required>
            휴대폰번호</label>
    </div>
    <input type="tel" class="form-control userPhone" name="phone" >
    <input type="text" class="form-control" id="CheckSms" placeholder="인증번호 입력" >
    <button type="button" class="btn btn-primary btn-sm smsKey">인증번호 요청</button>
    <button type="button" class="btn btn-secondary btn-sm CheckSmsKey">인증 확인</button>
    <span class="smsNo" style="display: none;">
              <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
    <span class="smsYC" style="display: none">인증번호가 발송되었습니다</span>
    <span class="smsYes" style="display: none;">
                인증되었습니다
              </span>
</div>
<button type="submit" class="btn btn-secondary btn-sm" id="ok">확인</button>
</form>
</body>
</html>
