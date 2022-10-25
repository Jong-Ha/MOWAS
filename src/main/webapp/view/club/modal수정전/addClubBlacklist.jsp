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
    <script src="/resources/club/js/addClubBlacklist.js"></script>
    <link href="/resources/club/css/addClubBlacklist.css" rel="stylesheet" type="text/css"/>
</head>
<body style="overflow: hidden">

<jsp:include page="backClose.jsp"/>

<div class="container content-box">
    <div class="modal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">블랙리스트 등록</h5>
                </div>
                <div class="modal-body">
                    <form>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="userId" placeholder="userId" name="userId" value="${cluber.user.userId}">
                        <label for="userId">아이디</label>
                    </div>
                    <div class="form-floating">
                        <input type="text" class="form-control" id="blacklistText" placeholder="blacklistText" name="blacklistText" value="${cluber.clubOutText}">
                        <label for="blacklistText">등록내용</label>
                    </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <input type="button" class="addClubBlacklist btn btn-primary" value="등록">
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
