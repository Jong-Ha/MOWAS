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
완료한 거래 조회, 거래 후기 조회
<hr/>
<h3>완료한 거래 조회, 거래 후기 조회</h3>
<hr/>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.getMyDeal}"><br/>
    가격${list.price}<br/>
    거래물품명${list.productName}<br/>
    거래자 아이디${list.dealId}<br/>
    거래후기${list.review}<br/>
    신뢰온도${list.reviewPt}<br/>
    거래완료날짜${list.dealEndDate}<br/>
</c:forEach> <br/>


</body>
</html>
