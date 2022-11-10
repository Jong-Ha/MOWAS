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
<script type="text/javascript">
    $(function () {
        var userId = $(".myPageUserId").val();
    });
</script>



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
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

    .goods_wrapper .goods_group .goods_item {
        display: flex;
        justify-content: flex-start;
        align-items: center;
    }

    .goods_wrapper .goods_group .goods_item > img {
        width: 100px;
        height: 100px;
        margin: 10px;
    }

    .goods_wrapper .goods_group .goods_item .goods_info > ul {
        margin: 0;
        padding: 0;
    }

    .goods_wrapper .goods_group .goods_item .goods_info > ul > li.goods_name {
        font-weight: bold;
    }
</style>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr>


<div class="container" style="width: 1320px;">
<div class="tabBox">
    <span class="tabBtn" onclick="javascript:location.href='/myPage/getMyDeal?userId=${user.userId}';">완료한 거래 목록</span>
    <span>|</span>
    <span class="tabBtn" onclick="javascript:location.href='/myPage/getMyDealReview?userId=${user.userId}';">거래 후기 목록</span>
</div>


<!--
<div class="searchBox">
    <span class="searchIcon"><i class="fa-solid fa-magnifying-glass"></i></span>
    <input class="searchInput" type="text" name="search" id="search" />
</div>
-->




    <div class="goods_wrapper" style="border: 1px solid #CCCCCC; border-radius: 5px;">
        <c:set var="i" value="0" />
        <c:forEach var="list" items="${map.getMyDeal}">
        <div class="goods_group" style="border-bottom: 1px solid #CCCCCC;">
            <div class="goods_item">
                <img src="/resources/${list.files[i].fileName}">
                <div class="goods_info" style="text-align: left;">
                    <ul class="info">
                        <li class="goods_name">거래물품명 : <span>${list.productName}</span></li>
                        <li><span>거래날짜 : </span> ${list.dealEndDate}</li>
                        <li><span>가격 : </span>${list.price}원</li>

                            <li><span>거래자 아이디 : </span>${list.user.userId==user.userId?list.dealId:list.user.userId}</li>

                    </ul>
                </div>
            </div>

        </div>
        </c:forEach>
    </div>
 <br/>





</div>




<div style="margin-bottom: 100px;">
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>

</body>
</html>
