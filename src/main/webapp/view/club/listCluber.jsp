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
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<input type="hidden" id="clubNum" value="${clubNum}">

<!-- Example Code -->
<div class="container">

    <div class="buttonClass">
        <div>
            <button type="button" class="btn btn-primary"><img src="/resources/images/cluberApply.png" alt=""></button>
            <button type="button" class="btn btn-primary"><img src="/resources/images/clubBlacklist.png" alt=""></button>
            <button type="button" class="btn btn-primary"><img src="/resources/images/groupBlackllist.png" alt=""></button>
        </div>
    <button type="button" class="btn btn-primary">탈퇴한 모임원 조회</button>
    </div>

    <input type="button" class="listCluberApply" value="가입 신청 조회">
    <input type="button" class="addClubBlacklist" value="블랙리스트 등록">
    <input type="button" class="listClubBlacklist" value="블랙리스트 목록 조회">
    ${search.searchCondition==0?'<input type="button" class="listCluberOut" value="탈퇴한 모임원 목록 조회">':'<input type="button" class="listCluber" value="현재 모임원 목록 조회">'}
    <c:forEach items="${list}" var="cluber">
        <a href="/club/getCluber/${cluber.clubUserNum}">${cluber}</a>
        <br/><br/>
    </c:forEach>
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

</div>

</body>
</html>