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
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<h3>내가 가입한 모임</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.getMyClub}"><br/>
    <%--모임원상태${list.cluberStatus}<br/>--%>
    관심목록 ${list.interList}<br/>
    모임명 ${list.clubName}<br/>
    동네코드 ${list.villCode}<br/>
    모임 이미지 ${list.clubImage}<br/>
    모집여부 ${list.gatherCheck}<br/>
    태그 ${list.tag}<br/>
</c:forEach> <br/>
</body>
</html>
