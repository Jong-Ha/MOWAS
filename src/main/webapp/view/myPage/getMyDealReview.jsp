<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>MOWAS</title>
</head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script type="text/javascript">


</script>

<style>
    .tabBox {
        display: flex;
        margin: 0 15px;
    }

    .tabBox span {
        font-size: 25px;
        margin: 5px;
        font-weight: bolder;
    }

    .tabBox span.tabBtn {
        font-size: 25px;
        margin: 5px;
        font-weight: bolder;
        cursor: pointer;
    }

    .searchBox {
        margin: 20px;
    }

    .searchBox .searchIcon {
        border: 1px solid rgb(118, 118, 118);
        padding: 3.5px;
        margin-right: -7px;
    }

    .searchBox .searchInput {
        width: 150px;
        height: 30px;
    }

    .goods_wrapper {
        height: 50%;
        overflow-y: auto;
        padding: 15px;
    }

    .goods_wrapper .goods_group .goods_item .goods_info {
        width: 40%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 10px;
        margin: 10px;
        border: 1px solid rgb(118, 118, 118);
    }

    .goods_wrapper .goods_group .goods_item .goods_info > ul {
        margin: 0;
        padding: 0;
    }

    .goods_wrapper .goods_group .goods_item .goods_info > ul > li {
        margin: 10px 0;
    }

    .goods_wrapper .goods_group .goods_item .goods_info > ul > li.goods_name {
        font-weight: bold;
    }
</style>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--?????? ??????--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--?????? ??????--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr>
<div class="container">
<div class="tabBox">
    <span class="tabBtn" onclick="javascript:location.href='/myPage/getMyDeal?userId=${user.userId}';">????????? ?????? ??????</span>
    <span>|</span>
    <span class="tabBtn" onclick="javascript:location.href='/myPage/getMyDealReview?userId=${user.userId}';">?????? ?????? ??????</span>
</div>


<hr/>
<div class="goods_wrapper">
    <div class="tit_month">

    </div>
<c:set var="i" value="0" />
<c:forEach var="list" items="${map.getMyDeal}">
    <div class="goods_group">
        <div class="goods_item">
            <div class="goods_info" style="display: flex;">
                <ul class="info">
                    <li class="goods_name"><span>??????????????? : ${list.productName}</span></li>
                    <li><span>???????????? : </span>${list.dealEndDate}</li>
                    <li><span>????????? ????????? : </span>${list.user.userId==user.userId?list.dealId:list.user.userId}</li>
                    <li><span>???????????? : </span>${list.reviewPt}</li>
                    <li>
                        <span>????????????</span><br />
                    ${list.review}
                    </li>
                </ul>
            </div>
        </div>
    </div>
        </c:forEach>

</div>
</div>
    <jsp:include page="/layout/chatIcon.jsp"/>
    <jsp:include page="/layout/footer.jsp"/>
</body>
</html>
