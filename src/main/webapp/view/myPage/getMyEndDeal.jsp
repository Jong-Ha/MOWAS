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

<style>

</style>

<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>

<h3>완료한 거래 조회</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.getMyDeal}"><br/>
    가격${list.price}<br/>
    거래물품명${list.productName}<br/>
    거래자 아이디${list.dealId}<br/>
    거래물품 사진<br>
    거래완료날짜${list.dealEndDate}<br/>
</c:forEach> <br/>
<hr>


</body>
</html>
