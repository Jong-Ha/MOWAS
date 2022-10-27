<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-10
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Title</title>
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">


    $(function (){
        $("#updatePsd").on("click" , function (){
            var userId = $("#userId").text();
            alert('userid는? '+userId);
            self.location ="/user/updatePsd?userId="+userId;
        });
    });
    $(function (){
        $("#kickoutUser").on("click" , function (){
            var userId = $("#userId").text();
            var result =confirm('정말로 강퇴하시겠습니까?');
            if(result) {
                self.location = "/user/kickoutUser?userId=" + userId;
                alert('강퇴되었습니다');
            }
        });
    });
    $(function (){
        $("#ok").on("click" , function (){
            self.location="/user/listUser";
        });
    });
</script>

<body>
회원 상세 조회<br/>
회원아이디 <div id="userId">${map.userDetail.userId}</div><br>
회원 상태${map.userDetail.userStatus}<br>
이름${map.userDetail.userName}<br>
성별${map.userDetail.gender}<br>
이메일${map.userDetail.email}<br>
휴대폰번호${map.userDetail.phone}<br>
동네코드${map.userDetail.villCode}<br>
마지막 접속 날짜${map.userDetail.lcd}<br>
패널티 시작 날짜${map.userDetail.psd}<br>
패널티 종료 날짜${map.userDetail.ped}<br>
벌점${map.userDetail.ppt}<br>
회원가입 상태${map.userDetail.loginType}<br>
관심목록<br>
<c:set var="i" value="0" />
    <c:forEach var="list" items="${map.listInterList}">
    ${list.interList}<br/>
    </c:forEach>
<c:if test="${map.userDetail.loginType=='1'}">
<span class="aaa" >회원 사진
    <img id="userImage1" style="width : 15%;" src="/resources/${map.userDetail.userImage}">
    <input type="hidden" class="userPhoto" value="${map.userDetail.userImage}">
</span>
</c:if>
<c:if test="${map.userDetail.loginType=='2'}">
<span class="aaa" >회원 사진
    <img id="userImage2" style="width : 15%;" src="${map.userDetail.userImage}">
    <input type="hidden" class="userPhoto" value="${map.userDetail.userImage}">
</span>
</c:if>
<c:if test="${map.userDetail.loginType=='3'}">
<span class="aaa" >회원 사진
    <img id="userImage3" style="width : 15%;" src="${map.userDetail.userImage}">
    <input type="hidden" class="userPhoto" value="${map.userDetail.userImage}">
</span>
</c:if>
<br>
<button type="button" id="updatePsd" >수정하기</button>
<button type="button" id="kickoutUser">강퇴하기</button>
<button type="button" id="ok">확인</button>
</body>
</html>
