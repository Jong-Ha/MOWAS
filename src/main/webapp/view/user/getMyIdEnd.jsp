<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    $(function (){
        $(".ok").on("click", function (){
            self.location="/"
        })
    })

</script>
<body>
<%-- <%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>
<div class="container" style="width: 1080px; height: 700px; text-align: -webkit-center;">
    <div class="shadow-lg" style="width: 700px; height: 400px; border: 3px solid; background-color: #e0e0e0; border-color: #8d8d8d; margin-top: 100px;" >
        <div style="width: 696px; height: 20px; background-color: #8d8d8d"></div>
        <div style="width: 694px; height: 60px; background-color: #bdbdbd"align="left">
            <h3 style="padding: 10px;">아이디 찾기</h3>
        </div>
        <div style="margin-top: 100px;">
            <c:if test="${findUser.userId eq null}">
                조회된 아이디가 없습니다.<br>
                이메일 또는 휴대전화 번호를 확인해주세요.
            </c:if>
            <c:if test="${findUser.userId ne null}">
            회원님께서 가입한 아이디는<br>
            [ ${findUser.userId} ]입니다
            </c:if>
        </div>
        <button style="margin-top: 50px;" type="button" class="btn btn-primary ok" >확인</button>
    </div>
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
