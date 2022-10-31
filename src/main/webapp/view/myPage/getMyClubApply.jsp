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
    $(function(){
        var userId = $(".myPageUserId").val();

        $(".getMyClub1").on("click", function () {
            self.location = "/myPage/getMyClub?userId="+userId;
        });
        $(".getMyClubApply1").on("click", function () {
            self.location = "/myPage/getMyClubApply?userId="+userId;
        });
    })

</script>
<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr/>
<div>
    <h3 class="getMyClub1">가입한 모임</h3>
    <h3 class="getMyClubApply1">가입신청한 모임</h3>
</div>
<hr>
<h3>내가 가입신청한 모임</h3>
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
