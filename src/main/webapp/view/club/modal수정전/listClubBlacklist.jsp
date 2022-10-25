<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MOWAS</title>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/club/js/listClubBlacklist.js"></script>
    <link href="/resources/club/css/listClubBlacklist.css" rel="stylesheet" type="text/css"/>

    <script>

    </script>
</head>
<body>
<jsp:include page="backClose.jsp"/>

<div class="container content-box">
    <form>
        <input type="hidden" id="clubNum" name="clubNum" value="${clubNum}">
        <div style="padding-bottom: 20px; margin-left: 300px;">
            <label>
                <select class="form-select" name="searchCondition" id="searchCondition">
                    <option ${empty search.searchCondition?'selected':search.searchCondition == '0'?'selected':''}
                            value="0">전체 검색
                    </option>
                    <option ${search.searchCondition == '1'?'selected':''} value="1">현재 등록 상태</option>
                    <option ${search.searchCondition == '2'?'selected':''} value="2">등록 취소</option>
                </select>
            </label>
        </div>
        <c:if test="${empty list}">
            <div class="card shadow-lg cardBox" style="grid-template-columns: 1fr;">블랙리스트 대상자가 없습니다!</div>
        </c:if>
        <c:if test="${!empty list}">
            <c:forEach items="${list}" var="clubBlacklist">
                <div class="card shadow-lg cardBox each">
                    <input type="checkbox" class="clubUserNum" name="clubUserNum" value="${clubBlacklist.clubUserNum}"
                           style="display: none">
                    <input type="hidden" name="clubNum" value="${clubBlacklist.clubNum}">
                    <input type="hidden" name="userId" value="${clubBlacklist.user.userId}">
                    <div class="photoBox">
                        <img class="bd-placeholder-img img-fluid rounded-start photo"
                             src="/resources/${clubBlacklist.user.userImage}" alt="any">
                    </div>
                    <div>
                        <div class="card-body">
                            <div>
                                <h3 class="card-title">
                                        ${clubBlacklist.user.userId}
                                    <small class="text-muted" style="font-size: 16px;">
                                            ${clubBlacklist.blacklistDate}
                                    </small>
                                </h3>
                                <span class="badge bg-primary text-wrap">${clubBlacklist.blacklistCheck=='1'?'등록':'취소'}</span>
                            </div>
                            <div>
                                        <div class="blacklistText d-inline-block text-truncate" style="max-width: 270px;">
                                            <small>
                                                    ${clubBlacklist.blacklistText}
                                            </small>
                                        </div>
                                <span class="badge bg-primary text-wrap getClubBlacklist">자세히</span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div style="margin-left: 335px;">
                <input type="button" class="updateClubBlacklist btn btn-primary" value="등록">
                <input type="button" class="updateClubBlacklist btn btn-primary" value="취소">
            </div>
            <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
                <span class="paging">${i}</span>
            </c:forEach>
            <label>
                <input type="hidden" id="currentPage" name="currentPage" value="1">
            </label>
        </c:if>
    </form>
</div>
</body>
</html>
