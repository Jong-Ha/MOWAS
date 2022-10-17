<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
< type="text/javascript">
    $(function (){
        $("#updateMyInfor").on("click" , function (){
            var userId = $("#userId").text();
            alert('userid는? '+userId);
            self.location ="/myPage/updateMyInfor?userId="+userId;
        });

        //인증,비번,관심목록 수정해야함
    });

</head>
<body>
내 정보 수정하기<br/>

회원아이디 <input type="text" id="userId" name="userId" value="${map.user.userId}" readonly><br/>
비밀번호 <input type="password" id="password" name="password" value="${map.user.password}"><br/>
이름 <input type="text" id="userName" name="userName" value="${map.user.userName}" readonly><br/>
주민등록번호 <input type="text" id="rrd" name="rrd" value="${map.user.rrd}" readonly><br/>
성별 <input type="text" id="gender" name="gender" value="${map.user.gender}" readonly><br/>
이메일 <input type="text" id="email" name="email" value="${map.user.email}"><br/>
<input type="text" class="form-control CheckEmailKey" placeholder="인증번호 입력"  >
<button type="button" class="btn btn-primary btn-sm emailKey">인증번호 요청</button>
<button type="button" class="btn btn-secondary btn-sm CheckEmailKey2">인증 확인</button>
휴대폰번호 <input type="text" id="phone" name="phone" value="${map.user.phone}"><br/>
<input type="text" class="form-control" id="CheckSms" placeholder="인증번호 입력" >
<button type="button" class="btn btn-primary btn-sm smsKey">인증번호 요청</button>
<button type="button" class="btn btn-secondary btn-sm CheckSmsKey">인증 확인</button>
동네코드 <input type="text" id="villCode" name="villCode" value="${map.user.villCode}"><br/>
관심목록
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.interList}">
    ${list.interList}<br/>
</c:forEach> <br/>
마지막 접속 날짜 <input type="text" id="lcd" name="lcd" value="${map.user.lcd}" readonly><br/>
벌점 <input type="text" id="ppt" name="ppt" value="${map.user.ppt}" readonly><br/>
신뢰온도 <input type="text" id="reviewPt" name="reviewPt" value="${map.user.reviewPt}" readonly><br/>
패널티 시작 날짜 <input type="text" id="psd" name="psd" value="${map.user.psd}" readonly><br/>
패널티 종료 날짜 <input type="text" id="ped" name="ped" value="${map.user.ped}" readonly><br/>
회원 사진 ${map.user.userImage}<br/>

<button type="button" class="listUser" id="updateMyInfor">수정하기</button>
</body>
</html>
