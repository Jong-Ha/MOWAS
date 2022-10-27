<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">


</script>
<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<h3>내 벌점 조회</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.getMyPpt}"><br/>
    신고받은 게시글 종류 ${list.boardCategory}<br/>
    신고받은 게시글 번호 ${list.boardNo}<br/>
    신고기준 ${list.reportBasis}<br/>
    벌점${list.ppt}<br/>
    벌점 부여 날짜${list.pptDate}<br/>
</c:forEach> <br/>
</body>
</html>
