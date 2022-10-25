<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>MOWAS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/club/js/listCluber.js"></script>
    <link href="/resources/club/css/listCluber.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<jsp:include page="backClose.jsp"/>

<!-- Example Code -->
<div class="container content-box">
    <input type="hidden" id="clubNum" value="${clubNum}">


    <div class="buttonClass">
        <div class="badge bg-primary text-wrap listCluberApply">가입 신청 조회</div>
        <div class="badge bg-primary text-wrap addClubBlacklist">블랙리스트 등록</div>
        <div class="badge bg-primary text-wrap listClubBlacklist">블랙리스트 목록 조회</div>
        <c:if test="${search.searchCondition=='0'}">
            <div class="badge bg-primary text-wrap listCluberOut">탈퇴한 모임원 목록 조회</div>
        </c:if>
        <c:if test="${search.searchCondition=='1'}">
            <div class="badge bg-primary text-wrap listCluber">현재 모임원 목록 조회</div>
        </c:if>
    </div>

    <div class="card-list" style="margin-top: 30px">
        <c:if test="${empty list}">
            <div class="card shadow-lg cardBox" style="grid-template-columns: 1fr;">탈퇴한 모임원이 없습니다!</div>
        </c:if>
        <c:if test="${!empty list}">
        <c:forEach items="${list}" var="cluber">
            <div class="card shadow-lg cardBox">
                <input type="hidden" class="clubUserNum" name="clubUserNum" value="${cluber.clubUserNum}">
                <div class="photoBox">
                    <img class="bd-placeholder-img img-fluid rounded-start photo"
                         src="/resources/${cluber.user.userImage}" alt="any">
                </div>
                <div>
                    <div class="card-body">
                        <div>
                            <h4 class="card-title">${cluber.user.userId}</h4>
                            <div class="badge bg-primary text-wrap">
                                    ${cluber.cluberStatus=='4'?'모임원':''}
                                            ${cluber.cluberStatus=='5'?'매니저':''}
                                            ${cluber.cluberStatus=='6'?'모임장':''}
                                            ${cluber.cluberStatus=='7'?'탈퇴':''}
                                            ${cluber.cluberStatus=='8'?'강퇴':''}
                            </div>
                        </div>
                        <div>
                            <small class="text-muted">${cluber.clubRegDate}</small>
                            <div class="badge bg-primary text-wrap">접속중미구현</div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        </c:if>
    </div>

    <c:if test="${!empty list}">
    <c:if test="${search.searchCondition==1}">
        <form>
            <input type="hidden" name="clubNum" value="${clubNum}">
            <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
                <span class="paging">${i}</span>
            </c:forEach>
            <label>
                <input type="hidden" id="currentPage" name="currentPage" value="1">
            </label>
        </form>
    </c:if>
    </c:if>

</div>

</body>
</html>