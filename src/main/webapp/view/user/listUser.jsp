<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="EUC-KR">
    <title>Title</title>
</head>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
    $(function (){
        $(".userTable td:nth-child(2)").css("color" , "red");
    });
    $(function (){
        $(".userTable td:nth-child(2)").on("click" , function (){
            var userId = $(this).text().trim();
            console.log("userId"+userId);
            self.location ="/user/listUserDetail?userId="+userId;
        });
    });
    $(function (){
        $("#myPage").on("click" , function (){
            self.location = "/view/myPage/getMyPage.jsp"
        });
    });
            //$(".idd").text().trim();
            //self.location ="/user/listUserDetail?userId="+$(".idd");
            //$("form").attr("method" , "POST").attr("action" , "/user/listUserDetail").submit();



</script>

<body>

<form>
<table class="table table-bordered ">
    <thead>
    <tr>
        <th scope="col">번호</th>
        <th scope="col">회원 아이디</th>
        <th scope="col">마지막 접속 날짜</th>
        <th scope="col">신뢰온도</th>
        <th scope="col">패널티시작날짜</th>
        <th scope="col">패널티종료날짜</th>
        <th scope="col">회원상태</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="i" value="0" />
    <c:forEach var="user" items="${user.userList}">
        <c:set var="i" value="${ i+1 }" />
    <tr class="userTable">
        <th scope="row">${ i }</th>
        <td class="ia">${user.userId}</td>
        <td class="ib">${user.lcd}</td>
        <td class="ic">${user.reviewPt}</td>
        <td class="id">${user.psd}</td>
        <td class="ie">${user.ped}</td>
        <td class="if">${user.userStatus}</td>

    </tr>
    </c:forEach>

    </tbody>
</table>
    <button type="button" id="myPage">마이페이지</button>
</form>
</body>
</html>
