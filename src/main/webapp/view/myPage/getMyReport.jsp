<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<style>
    .tabBox {
        display: flex;
        margin: 0 15px;
    }

    .tabBox span {
        font-size: 25px;
        margin: 5px;
        font-weight: bolder;
    }

    .tabBox span.tabBtn {
        font-size: 25px;
        margin: 5px;
        font-weight: bolder;
        cursor: pointer;
    }
</style>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    function fncGetMyReport(currentPage) {
        $("#currentPage").val(currentPage)
        var userIdReport = $("#userIdReport").val()
        alert('유저아이디? '+userIdReport)

        $("form").attr("method" , "POST").attr("action" , "/myPage/getMyReport").submit();
    }
    $(function(){
        var userId = $(".myPageUserId").val();

        $(".getMyPpt").on("click", function (){
            self.location="/myPage/getMyPpt?userId="+userId;
        })
        $(".getMyReport").on("click", function (){
            self.location="/myPage/getMyReport?userId="+userId;
        })
    })

</script>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<form>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr>
    <div class="container">



        <div class="tabBox">
            <span class="tabBtn getMyPpt" >내 벌점 조회</span>
            <span>|</span>
            <span class="tabBtn getMyReport" >내가 신고한 내역</span class="tabBtn">
        </div>

    <div class="container">
<hr>
    <table class="table table-bordered my-5">
        <thead>
        <tr class="bg-light text-center">
            <th scope="col">번호</th>
            <th scope="col">신고한 회원 아이디</th>
            <th scope="col">신고 받은 회원 아이디</th>
            <th scope="col">게시글 종류</th>
            <th scope="col">신고기준</th>
            <th scope="col">신고 내용</th>
            <th scope="col">신고한 날짜</th>
            <th scope="col">처리 여부</th>
        </tr>
        </thead>
        <tbody>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.getMyReport}" begin="${(resultPage.currentPage-1)*10}" end="${resultPage.currentPage*10-1}">
    <c:set var="i" value="${ i+1 }" />
        <tr class="userTable">
            <th scope="row">${i}</th>
            <th scope="row">${list.reportId}</th>
            <th scope="row">${list.reportedId}</th>
            <th scope="row">${list.boardCategory}</th>
            <td class="ia">${list.reportBasis}</td>
            <td class="ib">${list.reportText}</td>
            <td class="ic">${list.reportDate}</td>
            <td class="id">${list.processResult}</td>
        </tr>
        </c:forEach>

        </tbody>
    </table>
    <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
    <input type="hidden" id="userIdReport" name="userIdReport" value="${user.userId}"/>

    <nav class="d-flex justify-content-center mt-3">
        <ul class="pagination">
<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
            <li class="page-item disabled mx-1">
               <
            </li>
</c:if>
<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
    <li class="page-item disabled mx-1">
    <a class="page-link" href="javascript:fncGetMyReport('${ resultPage.currentPage-1}')">
    < </a>
    </li>
</c:if>
<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
            <li class="page-item active mx-1"><a class="page-link" href="http://192.168.0.235:8080/myPage/getMyReport?userId=${user.userId}&currentPage=${i}">${i}</a></li>
</c:forEach>

<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
            <li class="page-item mx-1">
              >
            </li>
</c:if>
            <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
            <li class="page-item mx-1">
                <a class="page-link" href="javascript:fncGetMyReport('${resultPage.endUnitPage+1}')">></a>
            </li>
            </c:if>
        </ul>
    </nav>
</div>
    </div>
</form>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
