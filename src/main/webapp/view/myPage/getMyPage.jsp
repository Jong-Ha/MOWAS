<%--
  Created by IntelliJ IDEA.
  User: 903-15
  Date: 2022-10-10
  Time: 오후 5:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function (){
    $("#listUser").on("click",function (){
        self.location="/user/listUser";
    });
    $("#getMyInfor").on("click",function (){
        var userId = $("#userId").val();
        self.location="/myPage/getMyInfor?userId="+userId;
    });
    $("#getMyBoard").on("click",function (){
        var userId = $("#userId").val();
        self.location="/myPage/getMyBoard?userId="+userId;
    });
    $("#getMyComment").on("click",function (){
        self.location="/myPage/listUser";
    });
    $("#getMyLike").on("click",function (){
        self.location="/myPage/listUser";
    });
    $("#getMyClub").on("click",function (){
        self.location="/myPage/listUser";
    });
    $("#getMyDeal").on("click",function (){
        self.location="/myPage/listUser";
    });
    $("#getMyReport").on("click",function (){
        self.location="/myPage/listUser";
    });
    $("#getMyPpt").on("click",function (){
        self.location="/myPage/listUser";
    });
    $("#getMyNotice").on("click",function (){
        self.location="/myPage/listUser";
    });
    $("#getMyCalendar").on("click",function (){
        self.location="/myPage/listUser";
    });
});

</script>
<body>
마이페이지
<div>아이디 ${user.userId}</div>
<div>이름 ${user.userName}</div>
<div>아이디 ${user.email}</div>
<div>회원이미지 ${user.userImage}</div>

<button type="button" class="listUser" id="listUser">회원목록조회</button>
<button type="button" class="listUser" id="getMyInfor">내 정보 보기</button>
<button type="button" class="listUser" id="getMyBoard">작성글</button>
<button type="button" class="listUser" id="getMyComment">작성 댓글, 대댓글</button>
<button type="button" class="listUser" id="getMyLike">좋아요</button>
<button type="button" class="listUser" id="getMyClub">모임</button>
<button type="button" class="listUser" id="getMyDeal">거래</button>
<button type="button" class="listUser" id="getMyReport">신고</button>
<button type="button" class="listUser" id="getMyPpt">벌점</button>
<button type="button" class="listUser" id="getMyNotice">알림</button>
<button type="button" class="listUser" id="getMyCalendar">일정</button>

<input type="hidden" id="userId" name="userId" value="${user.userId}">



</body>
</html>
