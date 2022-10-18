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
            var userId = $("#userId").text();
            alert('userid는? '+userId);
            self.location ="/myPage/updateClick?userId="+userId;
        });
    });
    $(function (){
        $("#userOut").on("click" , function (){
            var userId = $("#userId").text();
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

</script>
<body>
내 정보 보기
<br>
회원아이디 <span id="userId">${map.user.userId}</span><br/>
비밀번호 ${map.user.password}<br/>
이름 ${map.user.userName}<br/>
주민등록번호 ${map.user.rrd}<br/>
성별 ${map.user.gender}<br/>
이메일 ${map.user.email}<br/>
휴대폰번호 ${map.user.phone}<br/>
동네코드 ${map.user.villCode}<br/>
관심목록
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.interList}">
    ${list.interList}
</c:forEach> <br/>
마지막 접속 날짜 ${map.user.lcd}<br/>
벌점 ${map.user.ppt}<br/>
신뢰온도 ${map.user.reviewPt}<br/>
패널티 시작 날짜 ${map.user.psd}<br/>
패널티 종료 날짜 ${map.user.ped}<br/>
<span class="bbb">
회원 사진 <img id="userImage" style="width: 15%;" src="/resources/${map.user.userImage}"><br/>
    <input type="hidden" class="userPhoto" value="${map.user.userImage}">
</span>

<button type="button" class="listUser" id="updateClick">내 정보 수정하기</button>
<button type="button" class="listUser" id="userOut">회원탈퇴 하기</button>
</body>
</html>
