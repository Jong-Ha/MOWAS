<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            $(".paging").on("click",function(){
                $("#currentPage").val($(this).text())
                $("form").submit()
            })
            $("form").on("submit",function(){
                $(this).attr("action","/club/listClubMasterBoard/${clubNum}").attr("method","post")
            })
        })
    </script>
</head>
<body>
<form>
<c:forEach items="${list}" var="clubMasterBoard">
    <a href="/club/getClubMasterBoard/${clubMasterBoard.boardNum}">${clubMasterBoard}</a>
    <br/>
</c:forEach>
<c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
    <span class="paging">${i}</span>
</c:forEach>
    <label>
        <input type="hidden" id="currentPage" name="currentPage" value="1">
        <input type="text" name="searchKeyword" value="${search.searchKeyword}">
    </label>
    <input type="submit" value="검색">
</form>
</body>
</html>
