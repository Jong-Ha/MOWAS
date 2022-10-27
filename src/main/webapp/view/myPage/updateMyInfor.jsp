<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    $(function (){
        $("form").on("submit",function (){
            var userId = $("#userId").val();
            var loginType = $("#loginType").val();
            $("form").attr("method","POST").attr("action","/myPage/updateMyInfor").submit;
        });
        //인증,비번,관심목록 수정해야함
    });
    $(function () {
        $(".emailKey").on("click", function () {

            $.ajax({
                url: "/user/json/mailSender",
                method: "POST",
                data: {
                    email: $("#email").val()
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
                    phone : $("#phone").val()
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
    })
</script>
</head>
<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<form enctype="multipart/form-data">
    <div>
        <jsp:include page="/view/myPage/myPageTitle.jsp"/>
    </div>
내 정보 수정하기<br/>


<c:if test="${map.user.loginType=='1'}">
비밀번호 <input type="password" id="password" name="password" value="${map.user.password}"><br>

</c:if>
    <span id="passwordChk" style="display: none;">
                <strong class="text-danger" style="color : red;">영문,숫자 혼합, 8~16글자로 입력해주세요</strong><br>
        </span>


<c:if test="${map.user.loginType=='1'}">
    이메일 <input type="text" id="email" name="email" value="${map.user.email}" ><br/>
    <button type="button" class="btn btn-primary btn-sm emailKey">인증번호 요청</button><br/>
</c:if>

<c:if test="${map.user.loginType=='1'}">
    <input type="text" class="form-control CheckEmailKey" placeholder="인증번호 입력" ><br/>
    <button type="button" class="btn btn-secondary btn-sm CheckEmailKey2">인증 확인</button><br/>
    <span class="emailInfor" style="display: none;">
                <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
    <span class="emailYC" style="display: none">인증번호가 발송되었습니다</span>
    <span class="emailInforYes" style="display: none;">
                인증되었습니다
              </span>
</c:if>

<c:if test="${map.user.loginType=='1'}">
    휴대폰번호 <input type="text" id="phone" name="phone" value="${map.user.phone}"><br/>
    <button type="button" class="btn btn-primary btn-sm smsKey">인증번호 요청</button><br/>
</c:if>
<c:if test="${map.user.loginType=='1'}">
    <input type="text" class="form-control" id="CheckSms" placeholder="인증번호 입력" ><br/>
    <button type="button" class="btn btn-secondary btn-sm CheckSmsKey">인증 확인</button><br/>
    <span class="smsNo" style="display: none;">
              <strong class="text-danger" >인증번호가 틀렸습니다</strong>
              </span>
    <span class="smsYC" style="display: none">인증번호가 발송되었습니다</span>
    <span class="smsYes" style="display: none;">
                인증되었습니다
              </span>
</c:if>

동네코드 <input type="text" id="villCode" name="villCode" value="${map.user.villCode}"><br/>
<button type="button" class="btn btn-secondary btn-sm CheckSmsKey">동네인증 요청</button><br/>

관심목록<br>
<button type="button" class="btn btn-secondary btn-sm addinterList">관심목록 추가/삭제</button><br/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.interList}">
    ${list}<br/>
</c:forEach> <br/>

    <div class="col-12">
        <label for="file" class="form-label">파일 업로드</label>
        <input type="file" id="file" name="file" value="${map.user.userImage}">
    </div>
<br>

 <input type="hidden" id="userId" name="userId" value="${map.user.userId}" ><br/>
<input type="hidden" id="loginType" name="loginType" value="${map.user.loginType}">

<button type="submit" class="listUser" id="updateMyInfor">수정하기</button>
</form>
</body>
</html>
