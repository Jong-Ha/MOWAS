<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="/resources/club/js/listCluberApply.js"></script>
    <link href="/resources/club/css/listCluberApply.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<jsp:include page="backClose.jsp"/>

<div class="container content-box">
    <input type="hidden" class="clubNum" value="${clubNum}">

        <div class="cluberList">

            <c:if test="${empty list}">
            <div class="card shadow-lg cardBox" style="grid-template-columns: 1fr;">가입 신청자가 없습니다!</div>
            </c:if>

    <c:forEach items="${list}" var="cluber">
        <div class="card shadow-lg cardBox">
            <input type="hidden" class="clubUserNum" name="clubUserNum" value="${cluber.clubUserNum}">
            <input type="hidden" name="clubNum" value="${cluber.clubNum}">
            <input type="hidden" name="userId" value="${cluber.user.userId}">
            <div class="photoBox">
                <img class="bd-placeholder-img img-fluid rounded-start photo"
                     src="/resources/${cluber.user.userImage}" alt="any">
            </div>
            <div>
                <div class="card-body">
                    <div>
                        <h3 class="card-title">
                                ${cluber.user.userId}
                            <small class="text-muted" style="font-size: 16px;">
                                    ${cluber.clubApplyDate}
                            </small>
                        </h3>
                    </div>
                    <div>
                        ${cluber.cluberText}
                    </div>
                    <div>
                        <small class="text-muted">
                            <input type="button" class="accept btn btn-primary" name="accept" value="승인">
                            <input type="button" class="reject btn btn-primary" name="reject" value="거절">
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
        </div>
</div>

</body>
</html>
