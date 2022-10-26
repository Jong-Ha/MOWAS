<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">


</script>

<style>
    .body {
        text-align: -webkit-center;
    }

    .wap {
        margin-top: 70px;
        font-size: 1em;
        width: 1030px;
        padding: 5px 5px;
        height: 580px;
        border-radius: 10px;
    }



    .card-title {
        width: 250px;
        font-size: 1em;
    }

    .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 30px;
        float: left;
    }

    button.buttonBox {
        font-size: 0.7em;
        /* float: left; */
        /* size: b4; */
        height: 25px;
        width: 5px;
    }

    .col.dealBox {
        width: 320px;
        margin-right: 30px;
    }

    .like {
        font-size: 0.1rem;
        width: 45px;
        outline: 0;
        border: none;
        background-color: #fff;
    }

    .addBox {
        margin-bottom: 50px;
    }

    .add {
        margin-right: -700px;
    }

    .update,
    .delete {
        font-size: 0.5em;
    }

    .get {
        width: 100px;
        height: 200px;
        overflow: hidden;
    }


    .carditem {
        display: flex;
        flex-direction: column;
    }

    .card-title {
        width: 250px;
        font-size: 1em;
    }

    .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 30px;
        float: left;
    }

    .cardbox:hover  {
        transform: scale(1.12);
    }

    .potoBox {
        cursor: pointer;
        padding: 1px;
        width: 294px;
        height: 200px;
        overflow: hidden;
        border-radius: 0 0 5px 5px;
        border-bottom: 2px solid #0a090945
    }

    .text {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .allFlex{
        display: flex;
    }
    .cartFont{
        font-size: 0.8em;
    }
    .wrapper {
        height: 13ch;
        display: grid;
        place-items: center;
    }
    .typing {
        width: 9ch;
        animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;
        white-space: nowrap;
        overflow: hidden;
        border-right: 3px solid;
        font-size: 2em;
        height: 2ch;
    }

    @keyframes typing {
        from {
            width: 0
        }
    }
    .color {
        color: #ffff;
    }

    .topbar {
        margin-bottom: 20px;
    }

    .navbar {
        justify-content: center;
    }

    .btnlf {
        margin-left: 20px;
    }

    .textint {
        font-size: 0.2em;
        margin-top: -20px;
    }

    .login {
        float: left;
        margin-right: 20px;
        width: 120px;
    }

    .alrim {
        font-size: 0.1rem;
        width: 45px;
    }

    .loginbox {
        color: #FFFFFF;
        width: 100px;
    }

    .navCenter {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 1200px;
        margin: auto;
        color: #fff;
    }

    .logitem {
        margin-top: -20px;
        display: flex;
    }

    .underline {
        line-height: 1.2;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 1.5em;
        font-weight: 700;
        background-image: linear-gradient(transparent calc(100% - 3px), #000 3px);
        background-repeat: no-repeat;
        background-size: 0% 100%;
        transition: background-size 0.2s;
        color: #000;
        cursor: pointer;
        margin-right: 25px;
    }

    @media (min-width: 1000px) {
        .underline {
            font-size: 1.5em;
        }
    }

    .underline.yellow {
        background-image: linear-gradient(transparent 60%, #F8CD07 40%);
    }

    .underline:hover {
        background-size: 100% 100%;
    }
</style>

<body>
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
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
<hr>

<div class="getMyEndDeal" style=" color: #6c757d; text-align:left; border-bottom: 1px solid; border-radius: 10px width: 400px; height: 300px;">
adfs

</div>

<div class="wap">


<div class="row row-cols-1 row-cols-md-3 g-4 cardbox">
    <div class="col dealBox">
        <input type="hidden" name="dealBoardNum" class="dealBoardNum" value="10184">
        <div class="card h-100 shadow-lg">
            <div class="card-footer" style=" border-bottom: 1px solid; display: flex; font-weight: bold">
                213
            </div>

            <div class="potoBox" >


                <img class="poto" width="100%" height="100%" src="/resources/uploadFiles\dealBoardFiles\43d18b1e-6b77-4c0c-92b8-a250b217a525fc05eced-7b19-44a9-834d-e83f520d229cbit.png"
                     alt="any">


            </div>
            <div class="cardM " style="display: flex; padding: 10px 0 0 10px; height: 120px;; ">
                <div class="card-text text allFlex" style="width: 50%; ">

                </div>

                <div class="dealinfo cartFont" style="flex: 1; width: 50%;">
                    <p class="allFlex ">
                        거래전


                    </p>
                    <p class="allFlex">가격 : 5465 원 </p>
                    <p class="allFlex">0031수정동</p>
                    <p class="allFlex">2022-10-24</p>
                </div>
            </div>
            <div class="tags" style="height: 30px;">



            </div>

        </div>
    </div>
</div>


</div>

</body>
</html>
