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
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

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
회원 상세 조회
<span id="userId">${map.userDetail.userId}</span>
<br>

${map.userDetail.userStatus}
${map.userDetail.userName}
${map.userDetail.gender}
${map.userDetail.email}
${map.userDetail.phone}
${map.userDetail.villCode}
${map.userDetail.userImage}
${map.userDetail.lcd}
${map.userDetail.psd}
${map.userDetail.ped}
${map.userDetail.ppt}
${map.userDetail.reviewPt}
${map.userDetail.loginType}
관심목록
<c:set var="i" value="0" />
    <c:forEach var="list" items="${map.listInterList}">
    ${list.interList}<br/>
    </c:forEach>
<%--${map.listInterList[0].interList}--%>
<button type="button" id="updatePsd" >수정하기</button>
<button type="button" id="kickoutUser">강퇴하기</button>
<button type="button" id="ok">확인</button>
</body>
</html>
