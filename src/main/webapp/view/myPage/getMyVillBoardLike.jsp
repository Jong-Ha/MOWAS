<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>MOWAS</title>
</head>
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

    ul li {
        list-style: none;
        cursor: pointer;
    }

    .wap {
        width: 1000px;
        height: 1500px;
    }

    .carditem {
        display: flex;
        flex-direction: column;
        float: left;
    }


    .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 30px;
        float: left;
        width: 442px;
        transition: all 0.1s linear;
    }

    .cardbox:hover {
        transform: scale(1.12);
    }

    .itemBox {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .clickBox {
        padding: 10px;
        display: flex;
        float: left;
        text-align: right;
        width: 100%;
        margin-right: 39px;
        margin-bottom: 11px;
    }

    .buttonBox {
        margin-left: 10px;
        cursor: pointer;
        height: 28px;
        width: 39px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .col.reviewBox {
        width: 100%;
        margin-right: 30px;
    }


    .addBox {
        width: 100%;
        display: flex;
        flex-direction: row-reverse;
        margin-bottom: 100px;
    }


    .get {
        width: 100%;
        height: 100%;
        overflow: hidden;
    }

    .carousel-inner {
        width: 100%;
        height: 100%;
    }

    .potoBox {
        cursor: pointer;
        padding: 1px;
        width: 100%;
        height: 361px;
        overflow: hidden;
        border-radius: 0 0 5px 5px;
        border-bottom: 2px solid #0a090912;
    }

    .userImg {
        width: 60px;
        height: 60px;
        padding: 5px;
    }

    .userInfo {
        padding: 6px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .user_manu {
        padding: 14px;
        display: flex;
        width: 101%;
        font-size: 1.9em;
        flex-direction: row-reverse;
    }

    .user_hidden_manu {
        width: 100px;
        height: 75px;
        position: absolute;
    }

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

    @keyframes typing {
        from {
            width: 0
        }
    }

    @keyframes blink {
        80% {
            border-color: transparent
        }
    }

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

    /* Bootstrap ?????? */
    .table > thead {
        background-color: #b3c6ff;
    }

    .table > thead > tr > th {
        text-align: left;
    }

    .table-hover > tbody > tr:hover {
        background-color: #e6ecff;
    }

    .table > tbody > tr > td {
        text-align: left;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }

    .table > tbody > tr > #title {
        text-align: left;
    }

    div > #paging {
        text-align: center;
    }

    .hit {
        animation-name: blink;
        animation-duration: 1.5s;
        animation-timing-function: ease;
        animation-iteration-count: infinite;
        /* ??? ???????????? ??? ?????? ???????????? */
        /* -webkit-animation: blink 1.5s ease infinite; */
    }
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">

    function pagingSubmit() {
        $("#villBoardLikeForm").attr('action', '/myPage/getMyVillBoardLike').attr('method', 'post').submit()

    }

    $(function () {
        var userId = '${user.userId}'

        $(".paging").off("click").on("click", function () {

            $("#villBoardLikeForm #currentPage").val($(this).text())

            pagingSubmit()
        })

        $(".pageUnit").off('click').on("click", function () {
            if ($(this).hasClass('disabled')) {
                return false
            }

            $("#villBoardLikeForm #currentPage").val($(this).val())

            pagingSubmit()
        })

        $(".getMyLike").on("click", function () {
            self.location = "/myPage/getMyVillBoardLike?userId=" + userId;
        })

        $(".getMyCbRvLike").off("click").on("click", function () {
            location.href = "/myPage/getMyCbRvLike?userId="+userId;
        })

        $(".getMyDealLike").on("click", function (){
            location.href="/myPage/getMyDealLike?userId="+userId;
        })

        $(".getVillBoard").on("click", function () {

            var villBoardNum = $(this).find(".villBoardNum").val()

            var boardCategory = '3';

            Swal.fire({
                title: '?????? ???????????? ??????????????????????????',
                text: "?????? ???????????? ???????????????",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: "??????",
                confirmButtonText: '???????????????'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        '???????????? ?????? ?????????',
                        'success'
                    )

                    setTimeout(() => {
                        location.href = "/commu/getVillBoard?villBoardNum=" + villBoardNum + "&boardCategory=" + boardCategory;
                    }, 1500)
                }
            })

        })

    })

</script>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--?????? ??????--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--?????? ??????--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr>
<div class="container">
<div class="tabBox">
    <span class="tabBtn getMyLike" >???????????? ???????????? ?????????</span>
    <span>|</span>
    <span class="tabBtn getMyCbRvLike">???????????? ?????? ????????? ?????????</span>
    <span>|</span>
    <span class="tabBtn getMyDealLike" >???????????? ??????/???????????? ?????????</span>
</div>

<hr/>
<h3>???????????? ???????????? ?????????</h3>
<hr/>


<div class="container">


    <form id="villBoardLikeForm">
        <input hidden class="userId" name="userId" value="${user.userId}">

        <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}">

        <!--  table Start /////////////////////////////////////-->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive project-list">
                            <table class="table project-table table-centered table-nowrap table-hover table-striped">
                                <thead>
                                <tr>
                                    <th scope="col">?????????</th>
                                    <th scope="col">??????</th>
                                    <th scope="col">????????????</th>
                                    <th scope="col">?????? ??????</th>
                                    <th scope="col">????????????</th>
                                    <th scope="col">?????????</th>
                                </tr>
                                </thead>
                                <tbody>



                                <c:set var="i" value="0"/>
                                <c:forEach var="VilBoard" items="${map.villBoardLike}">
                                    <c:set var="i" value="${ i+1 }"/>
                                    <tr class="getVillBoard" style="vertical-align: middle">
                                        <td style="width: 150px;aspect-ratio: 1;">
                                            <div>
                                                <input hidden class="villBoardNum" value="${VilBoard.villBoardNum}">
                                                <img src="/resources/${VilBoard.file[0].fileName}" style=" width: 100%; aspect-ratio: 1;  object-fit: cover;">
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                ${VilBoard.villTitle}
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                ${VilBoard.regDate}
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                ${VilBoard.villCode}
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                    ${VilBoard.likeCount}
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                    ${VilBoard.viewCount}
                                            </div>
                                        </td>

                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!--  table End /////////////////////////////////////-->
                        <c:if test="${!empty resultPage}">
                            <nav aria-label="Page navigation example" style="display: flex;justify-content: center;">
                                <ul class="pagination">
                                    <li class="page-item pageUnit ${resultPage.beginUnitPage == 1?'disabled':''}"
                                        value="${resultPage.beginUnitPage - resultPage.pageUnit}">
                                        <a class="page-link" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}"
                                               var="i">
                                        <li class="page-item ${search.currentPage == i?'active':'paging'}"><a
                                                class="page-link">${i}</a></li>
                                    </c:forEach>

                                    <li class="page-item pageUnit ${resultPage.maxPage==resultPage.endUnitPage?'disabled':''}"
                                        value="${resultPage.beginUnitPage+resultPage.pageUnit}">
                                        <a class="page-link" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </c:if>


                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
