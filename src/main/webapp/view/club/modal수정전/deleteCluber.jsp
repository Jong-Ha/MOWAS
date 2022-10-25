<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="/resources/club/js/deleteCluber.js"></script>
    <link href="/resources/club/css/deleteCluber.css" rel="stylesheet" type="text/css"/>
</head>
<body style="overflow: hidden">

<jsp:include page="backClose.jsp"/>

<div class="container content-box">
    <div class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">${kickoutCheck=='T'?'모임원 강퇴':'모임 탈퇴'}</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <input type="hidden" name="kickoutCheck" value="${kickoutCheck}">
                        <input type="hidden" name="clubUserNum" value="${cluber.clubUserNum}">
                        <input type="hidden" id="clubNum" name="clubNum" value="${cluber.clubNum}">
                        <input type="hidden" name="userId" value="${cluber.user.userId}">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="userId" placeholder="userId" name="userId" value="${cluber.user.userId}">
                            <label for="userId">아이디</label>
                        </div>
                        <div class="form-floating">
                            <input type="text" class="form-control" id="clubOutText" placeholder="clubOutText" name="clubOutText" value="${cluber.clubOutText}">
                            <label for="clubOutText">${kickoutCheck=='T'?'강퇴 사유':'탈퇴 사유'}</label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <input type="button" class="deleteCluber btn btn-primary" value="${kickoutCheck=='T'?'강퇴':'탈퇴'}">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
