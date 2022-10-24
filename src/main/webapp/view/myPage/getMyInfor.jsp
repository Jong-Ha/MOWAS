<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-15
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    $(function (){
        $("#updateClick").on("click" , function (){
            var userId = $("#userId").val();
            self.location ="/myPage/updateClick?userId="+userId;
        });
    });
    $(function (){
        $("#userOut").on("click" , function (){
            var userId = $("#userId").val();
            var result =confirm('정말로 탈퇴하시겠습니까?');
            if(result) {
                self.location = "/myPage/userOut?userId=" + userId;
                alert('회원 탈퇴 되었습니다');
            }
        });
        $(".bbb").on("click",function (){
            var userPhoto = $(".userPhoto").val();
            window.open("/resources/"+userPhoto+"", "userPhoto", "height=500, width=500");
        })
    });
    $(function (){
        $("#myPage").on("click" , function (){
            self.location = "/view/myPage/getMyPage.jsp"
        });
    });

</script>
<body>
내 정보 보기
<br>
회원아이디 <input type="text" id="userId" name="userId" value="${map.user.userId}" disabled="disabled"><br/>
<c:if test="${map.user.loginType=='1'}">
    비밀번호 <input type="password" id="password" name="password" value="${map.user.password}" disabled="disabled"><br/>
</c:if>

    이름 <input type="text" id="userName" name="userName" value="${map.user.userName}" disabled="disabled"><br/>
    주민등록번호 <input type="text" id="rrd" name="rrd" value="${map.user.rrd}" disabled="disabled"><br/>
성별 <input type="text" id="gender" name="gender" value="${map.user.gender}" disabled="disabled"><br/>

이메일 <input type="text" id="email" name="email" value="${map.user.email}" disabled="disabled"><br/>

<c:if test="${map.user.loginType=='1'}">
    휴대폰번호 <input type="text" id="phone" name="phone" value="${map.user.phone}" disabled="disabled"> <br/>
</c:if>

동네코드 <input type="text" id="villCode" name="villCode" value="${map.user.villCode}" disabled="disabled"><br/>
관심목록
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.tmlist}">

    ${list.interList}
</c:forEach> <br/>
마지막 접속 날짜 <input type="text" id="lcd" name="lcd" value="${map.user.lcd}"  disabled="disabled"><br/>
벌점 <input type="text" id="ppt" name="ppt" value="${map.user.ppt}"  disabled="disabled"><br/>
신뢰온도 <input type="text" id="reviewPt" name="reviewPt" value="${map.user.reviewPt}"  disabled="disabled"><br/>
패널티 시작 날짜 <input type="text" id="psd" name="psd" value="${map.user.psd}"  disabled="disabled"><br/>
패널티 종료 날짜 <input type="text" id="ped" name="ped" value="${map.user.ped}"  disabled="disabled"><br/>
<c:if test="${map.user.loginType=='1'}">
<span class="aaa" >회원 사진
    <img id="userImage1" style="width : 15%;" src="/resources/${map.user.userImage}">
    <input type="hidden" class="userPhoto" value="${map.user.userImage}">
</span>
</c:if>
<c:if test="${map.user.loginType=='2'}">
<span class="aaa" >회원 사진
    <img id="userImage2" style="width : 15%;" src="${map.user.userImage}">
    <input type="hidden" class="userPhoto" value="${map.user.userImage}">
</span>
</c:if>
<c:if test="${map.user.loginType=='3'}">
<span class="aaa" >회원 사진
    <img id="userImage3" style="width : 15%;" src="${map.user.userImage}">
    <input type="hidden" class="userPhoto" value="${map.user.userImage}">
</span>
</c:if>
<button type="button" id="myPage"> 마이페이지</button>
<button type="button" class="listUser" id="updateClick">내 정보 수정하기</button>
<button type="button" class="listUser" id="userOut">회원탈퇴 하기</button>

</body>
</html>
