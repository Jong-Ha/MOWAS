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

    /* Bootstrap 수정 */
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
        /* 위 속성들을 한 줄로 표기하기 */
        /* -webkit-animation: blink 1.5s ease infinite; */
    }

    /* 애니메이션 지점 설정하기 */
    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
        from {
            color: white;
        }
        30% {
            color: yellow;
        }
        to {
            color: red;
            font-weight: bold;
        }
        /* 0% {color:white;}
        30% {color: yellow;}
        100% {color:red; font-weight: bold;} */
    }

    .card {
        border: none;
        margin-bottom: 24px;
        -webkit-box-shadow: 0 0 13px 0 rgba(236, 236, 241, .44);
        box-shadow: 0 0 13px 0 rgba(236, 236, 241, .44);
    }

    .wrapper {
        display: grid;
        place-items: center;
    }

    .typing {
        width: 15ch;
        animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;
        white-space: nowrap;
        overflow: hidden;
        border-right: 3px solid;
        font-size: 2em;
        height: 2ch;
    }

    .mbBox {
        margin-bottom: 50px;
        justify-content: center;
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
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">

    function pagingSubmit() {
        $("#commentForm").attr('action', '/myPage/getMyComment').attr('method', 'post').submit()

    }

    $(function () {
        var userId = '${user.userId}'

        $(".paging").off("click").on("click", function () {

            $("#commentForm #currentPage").val($(this).text())

            pagingSubmit()
        })

        $(".pageUnit").off('click').on("click", function () {
            if ($(this).hasClass('disabled')) {
                return false
            }

            $("#commentForm #currentPage").val($(this).val())

            pagingSubmit()
        })

        $(".getMyComment").on("click", function () {
            self.location = "/myPage/getMyComment?userId=" + userId;
        })

        $(".getMyRecomment").on("click", function () {

            location.href = "getMyRecomment?userId=" + userId;
        })

    })

</script>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr>
<div class="container">

    <div class="tabBox">
        <span class="tabBtn getMyComment">댓글</span>
        <span>|</span>
        <span class="tabBtn getMyRecomment">대댓글</span>
    </div>

    <hr/>
    <h3>작성한 댓글</h3>
    <hr/>

    <div class="container">
        <form id="commentForm">
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
                                        <th scope="col">게시글 번호</th>
                                        <th scope="col">게시글 카테고리</th>
                                        <th scope="col">댓글 내용</th>
                                        <th scope="col">작성날짜</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:set var="i" value="0"/>
                                    <c:forEach var="list" items="${map.myComment}">
                                        <c:set var="i" value="${ i+1 }"/>
                                        <tr>
                                            <td>
                                                <div>
                                                        ${list.boardNum}
                                                </div>
                                            </td>
                                            <td>
                                                <div>
                                                        ${list.boardCategory == '1 ' ? '후기글' : '우리동네 게시글'}
                                                </div>
                                            </td>
                                            <td>
                                                <div>
                                                        ${list.commentText}
                                                </div>
                                            </td>
                                            <td>
                                                <div>
                                                        ${list.regDate}
                                                </div>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!--  table End /////////////////////////////////////-->
                            <c:if test="${!empty resultPage}">
                                <nav aria-label="Page navigation example"
                                     style="display: flex;justify-content: center;">
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
    <div style="margin-bottom: 100px;">
    </div>
    <jsp:include page="/layout/chatIcon.jsp"/>
    <jsp:include page="/layout/footer.jsp"/>
</body>
</html>
