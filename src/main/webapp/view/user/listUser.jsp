<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="EUC-KR">
    <title>Title</title>
</head>
<style>
    #btn-back-to-top {
        position: fixed;
        bottom: 20px;
        right: 20px;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

    $(function (){
        $(".userTable td:nth-child(2)").on("click" , function (){
            var userId = $(this).text().trim();
            console.log("userId"+userId);
            self.location ="/user/listUserDetail?userId="+userId;
        });
    });

            //$(".idd").text().trim();
            //self.location ="/user/listUserDetail?userId="+$(".idd");
            //$("form").attr("method" , "POST").attr("action" , "/user/listUserDetail").submit();



</script>

<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<form>
    <div class="container">
        <div class="row mx-4 my-5">
            <h3>회원 목록 조회</h3>
        </div>

        <div class="row d-flex justify-content-end">
            <div class="col-2">
                <select class="form-select">
                    <option value="1" selected>전체 회원</option>
                    <option value="2">일반 회원</option>
                    <option value="3">활동 정지 회원</option>
                    <option value="4">탈퇴한 회원</option>
                    <option value="5">강퇴한 회원</option>
                </select>
            </div>
        </div>
        <div class="col-9 d-flex flex-column justify-content-between">
            <div class="row">
                <div class="col-4 d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </div>
            </div>

            <table class="table table-bordered ">
                <thead>
                <tr class="bg-light text-center">
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
        </div>
        <nav class="d-flex justify-content-center mt-3">
            <ul class="pagination">
                <li class="page-item disabled mx-1">
                    <a class="page-link">
                        < </a>
                </li>
                <li class="page-item active mx-1"><a class="page-link" href="#">1</a></li>
                <li class="page-item mx-1" aria-current="page">
                    <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item mx-1"><a class="page-link" href="#">3</a></li>
                <li class="page-item mx-1">
                    <a class="page-link" href="#">></a>
                </li>
            </ul>
        </nav>
    </div>
    </div>

</form>
</body>
</html>
