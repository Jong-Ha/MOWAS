<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>MOWAS</title>
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
    .table > thead {
        background-color: #b3c6ff ;
    }
    .table > thead > tr > th {
        text-align: center;
    }
    .table-hover > tbody > tr:hover {
        background-color: #EBDEF0;
    }
    .table > tbody > tr > td {
        text-align: center;
    }
    .table > tbody > tr > #title {
        text-align: left;
    }
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    function fncGetMyPpt(currentPage) {
        $("#currentPage").val(currentPage)
        var userIdReport = $("#userIdReport").val()
        alert('유저아이디? '+userIdReport)

        $("form").attr("method" , "POST").attr("action" , "/myPage/getMyPpt").submit();
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
        <span class="tabBtn getMyReport" >내가 신고한 내역</span>
    </div>

        <hr>
    <div class="container">
        <table class="table table-bordered my-5">
            <thead style="background-color: #b3c6ff">
            <tr class="bg-light text-center" style="background-color: #b3c6ff">
                <th scope="col">번호</th>
                <th scope="col">신고받은 게시글 종류</th>
                <th scope="col">신고한 게시글 내용</th>
                <th scope="col">신고기준</th>
                <th scope="col">벌점</th>
                <th scope="col">벌점 부여 날짜</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="i" value="0" />
            <c:forEach var="list" items="${map.getMyPpt}" begin="${(resultPage.currentPage-1)*10}" end="${resultPage.currentPage*10-1}">
                <c:set var="i" value="${ i+1 }" />
                <tr class="userTable">
                    <th scope="row" class="text-center">${i}</th>

                    <th scope="row" class="text-center">
                        <c:choose>
                            <c:when test="${! empty list.boardCategory && list.boardCategory eq '1 '}">
                                모임일정후기글
                            </c:when>
                            <c:when test="${! empty list.boardCategory && list.boardCategory eq '2 '}">
                                모임일정후기쇼츠
                            </c:when>
                            <c:when test="${! empty list.boardCategory && list.boardCategory eq '3 '}">
                                우리동네게시글
                            </c:when>
                            <c:when test="${! empty list.boardCategory && list.boardCategory eq '10'}">
                                댓글
                            </c:when>
                            <c:when test="${! empty list.boardCategory && list.boardCategory eq '11'}">
                                대댓글
                            </c:when>
                        </c:choose>
                    </th>

                    <th scope="row">${list.reportText}</th>
                    <c:if test="${list.reportBasis eq 1}">
                        <td class="ia">욕설</td>
                    </c:if>
                    <c:if test="${list.reportBasis eq 2}">
                        <td class="ia">음담패설</td>
                    </c:if>
                    <c:if test="${list.reportBasis eq 3}">
                        <td class="ia">도용</td>
                    </c:if>
                    <c:if test="${list.reportBasis eq 4}">
                        <td class="ia">무단불참</td>
                    </c:if>
                    <c:if test="${list.reportBasis eq 5}">
                        <td class="ia">연락두절</td>
                    </c:if>
                    <c:if test="${list.reportBasis eq 6}">
                        <td class="ia">정치적발언</td>
                    </c:if>
                    <td class="ia">${list.ppt}</td>
                    <td class="ib">${list.pptDate}</td>

                </tr>
            </c:forEach>

            </tbody>
        </table>
        <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
        <input type="hidden" id="userIdReport" name="userIdReport" value="${user.userId}"/>

            <nav aria-label="Page navigation example" style="display: flex;justify-content: center;">
                <ul class="pagination">
                    <li class="page-item pageUnit ${resultPage.beginUnitPage==1?'disabled':''}" value="${resultPage.beginUnitPage-resultPage.pageUnit}">
                        <a class="page-link" href="javascript:fncGetMyPpt('${ resultPage.currentPage-1}')" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
                        <li class="page-item ${search.currentPage==i?'active':'paging'}"><a class="page-link" href="/myPage/getMyPpt?userId=${user.userId}&currentPage=${i}">${i}</a></li>
                    </c:forEach>
                    <li class="page-item pageUnit ${resultPage.maxPage==resultPage.endUnitPage?'disabled':''}" value="${resultPage.beginUnitPage+resultPage.pageUnit}">
                        <a class="page-link" href="javascript:fncGetMyPpt('${resultPage.endUnitPage+1}')" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>

    </div>
    </div>

</form>
<div style="margin-bottom: 100px;">
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
