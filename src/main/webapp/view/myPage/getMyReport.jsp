<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">


</script>
<body>
<hr/>
<h3>내 신고 목록 조회</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.getMyReport}"><br/>
    신고한 회원 아이디 ${list.reportId}<br/>
    신고 받은 회원 아이디 ${list.reportedId}<br/>
    신고기준 ${list.reportBasis}<br/>
    신고한 날짜${list.reportDate}<br/>
    신고 내용${list.reportText}<br/>
    처리 여부${list.processResult}<br/>
</c:forEach> <br/>

</body>
</html>
