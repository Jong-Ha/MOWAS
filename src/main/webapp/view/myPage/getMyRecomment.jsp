<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
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
    body{
        background:#f3f3f3;
        margin-top:20px;
        color: #616f80;
    }

    #list {
        text-align: center;
    }

    #write {
        text-align: right;
    }

    /* Bootstrap 수정 */
    .table > thead {
        background-color: #b3c6ff;
    }
    .table > thead > tr > th {
        text-align: center;
    }
    .table-hover > tbody > tr:hover {
        background-color: #e6ecff;
    }
    .table > tbody > tr > td {
        text-align: center;
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
        from {color: white;}
        30% {color: yellow;}
        to {color: red; font-weight: bold;}
        /* 0% {color:white;}
        30% {color: yellow;}
        100% {color:red; font-weight: bold;} */
    }

    .wrapper {
        height: 13ch;
        display: grid;
        place-items: center;
    }

    .typing {
        width: 17ch;
        animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;
        white-space: nowrap;
        overflow: hidden;
        border-right: 3px solid;
        font-size: 2em;
        height: 2ch;
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
<script type="text/javascript">
    $(function(){
        var userId = $(".myPageUserId").val();

        $(".getMyComment").on("click", function (){
            self.location="/myPage/getMyComment?userId="+userId;
        })
        $(".getMyRecomment").on("click", function (){
            self.location="/myPage/getMyRecommentLike?userId="+userId;
        })
    })

</script>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>

<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<div class="tabBox">
    <span class="tabBtn getMyComment" >댓글</span>
    <span>|</span>
    <span class="tabBtn getMyRecomment" >대댓글</span class="tabBtn">
</div>

<hr/>

<div class="container" style="width: 1200px;">
<!--  table Start /////////////////////////////////////-->
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive project-list">
                    <table class="table project-table table-centered table-nowrap table-hover table-striped" >
                        <thead>

                        <tr>
                            <th scope="col">게시글 카테고리</th>
                            <th scope="col">대댓글 내용</th>
                            <th scope="col">작성날짜</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="i" value="0" />
                        <c:forEach var="list" items="${map.myRecomment}" begin="${(resultPage.currentPage-1)*10}" end="${resultPage.currentPage*10-1}">
                            <c:set var="i" value="${ i+1 }" />
                            <tr>
                                <td>${list.boardCategory}
                                </td>
                                <td>${list.recommentText}
                                </td>
                                <td>
                                        ${list.regDate}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--  table End /////////////////////////////////////-->
                <nav class="d-flex justify-content-center mt-3">
                    <ul class="pagination">
                        <c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
                            <li class="page-item disabled mx-1">
                                <
                            </li>
                        </c:if>
                        <c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
                            <li class="page-item disabled mx-1">
                                <a class="page-link" href="javascript:fncGetMyPpt('${ resultPage.currentPage-1}')">
                                    < </a>
                            </li>
                        </c:if>
                        <c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
                            <li class="page-item active mx-1"><a class="page-link" href="http://192.168.0.235:8080/myPage/getMyRecomment?userId=${user.userId}&currentPage=${i}">${i}</a></li>
                        </c:forEach>

                        <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
                            <li class="page-item mx-1">
                                >
                            </li>
                        </c:if>
                        <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
                            <li class="page-item mx-1">
                                <a class="page-link" href="javascript:fncGetMyPpt('${resultPage.endUnitPage+1}')">></a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
