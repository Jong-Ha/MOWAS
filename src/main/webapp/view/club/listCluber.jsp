<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>listCluber</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function () {
            $(".listCluberApply").on("click", function () {
                location.href = "/club/listCluberApply/${clubNum}"
            })
            $(".addClubBlacklist").on("click", function () {
                location.href = "/club/addClubBlacklist/${clubNum}"
            })
            $(".listClubBlacklist").on("click", function () {
                location.href = "/club/listClubBlacklist/${clubNum}"
            })
            $(".listCluberOut").on("click", function () {
                location.href = "/club/listCluberOut/${clubNum}"
            })
            $(".listCluber").on("click", function () {
                location.href = "/club/listCluber/${clubNum}"
            })
            $(".paging").on("click", function(){
                $("form").attr("action","/club/listCluberOut/${clubNum}").attr("method","post").submit()
            })
        })
    </script>
</head>
<body>
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
</body>
</html>
