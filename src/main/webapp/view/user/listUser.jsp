<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="EUC-KR">
    <title>MOWAS</title>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <!--  ///////////////////////// CSS ////////////////////////// -->

<style>
    body{
        background:#f3f3f3;
        margin-top:20px;
        color: #616f80;
    }

    .card-body{
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    #list {
        text-align: center;
    }

    #write {
        text-align: right;
    }

    /* Bootstrap 수정 */
    .table > thead {
        background-color: #b3c6ff ;
    }
    .table > thead > tr > th {
        text-align: center;
    }
    .table-hover > tbody > tr:hover {
        background-color: #EBDEF0;
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
    .card {
        border: none;
        margin-bottom: 20px;
        -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
        box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
    }

    .wrapper {
        height: 13ch;
        display: grid;
        place-items: center;
    }

    .typing {
        width: 9ch;
        color: #000000;
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

<script type="text/javascript">

    function fncGetList(currentPage) {
        $("#currentPage").val(currentPage)

        $("form").attr("method" , "POST").attr("action" , "/user/listUsers").submit();
    }

    $(function (){
        $(".userTable td:nth-child(2)").on("click" , function (){
            var userId = $(this).text().trim();
            console.log("userId"+userId);
            self.location ="/user/listUserDetail?userId="+userId;
        });
    });
    $(function (){
        $("#project-search-addon").on("click",function (){
            fncGetList(1);
        });
    });

            //$(".idd").text().trim();
            //self.location ="/user/listUserDetail?userId="+$(".idd");
            //$("form").attr("method" , "POST").attr("action" , "/user/listUserDetail").submit();

</script>
</head>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<jsp:include page="/layout/toolbar.jsp"/>

<div class="page-header text-center">
    <div class="wrapper">
        <div class="typing">
            <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
                회원 관리</h4>
        </div>
    </div>
</div>
<hr>

<div class="container">

    <!-- table 위쪽 검색 Start /////////////////////////////////////-->

        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-pattern">
                    <div class="card-body">
                        <div class="float-right">
                            <i class="fa fa-archive text-primary h4 ml-3" style="font-size: 1.5rem;"></i>
                        </div>
                        <h5 class="font-size-20 mt-0 pt-1">${resultPage.totalCount }</h5>
                        <p class="text-muted mb-0">Total Counts</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-pattern">
                    <div class="card-body">
                        <div class="float-right">
                            <i class="fa fa-th text-primary h4 ml-3" style="font-size: 1.5rem;"></i>
                        </div>
                        <h5 class="font-size-20 mt-0 pt-1">${resultPage.currentPage}</h5>
                        <p class="text-muted mb-0">Current Page</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-pattern">
                    <div class="card-body">
                        <div class="float-right">
                            <i class="fa fa-file text-primary h4 ml-3" style="font-size: 1.5rem;"></i>
                        </div>
                        <h5 class="font-size-20 mt-0 pt-1">${resultPage.maxPage}</h5>
                        <p class="text-muted mb-0">Max Page</p>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 text-right">
                <div class="card">
                    <div class="card-body">
                        <form id="userList">
                            <div class="form-group">
                                <label>Search</label>

                                <div class="input-group mb-0">
                                    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="Search..." aria-describedby="project-search-addon"
                                           value="${! empty search.searchKeyword ? search.searchKeyword : "" }"/>
                                    <div class="input-group-append">
                                        <button class="btn btn-danger" type="button" id="project-search-addon"><i class="fa fa-search search-icon fa-2x font-12"></i></button>
                                    </div>
                                </div>

                            </div>
                            <input type="hidden" id="currentPage" name="currentPage" value=""/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- table 위쪽 검색 Start /////////////////////////////////////-->

        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive project-list">
                            <table class="table project-table table-centered table-nowrap table-hover table-striped">
                                <thead>
    <tr>
        <th scope="col">번호</th>
        <th scope="col">회원 아이디</th>
        <th scope="col">신뢰온도</th>
        <th scope="col">패널티시작날짜</th>
        <th scope="col">패널티종료날짜</th>
        <th scope="col">회원상태</th>
    </tr>
    </thead>

    <tbody>
    <c:set var="i" value="0" />
    <c:forEach var="user" items="${list}">
        <c:set var="i" value="${ i+1 }" />
    <tr class="userTable">
        <th scope="row" style="text-align: center;">${ i }</th>
        <td class="ia">${user.userId}</td>
        <td class="ic">${user.reviewPt}</td>
        <td class="id">${user.psd}</td>
        <td class="ie">${user.ped}</td>
        <td class="if">${user.userStatus}</td>

    </tr>
    </c:forEach>

    </tbody>
</table>
                        </div>
                        <!--  table End /////////////////////////////////////-->

                        <nav aria-label="Page navigation example" style="display: flex;justify-content: center;">
                            <ul class="pagination">
                                <li class="page-item pageUnit ${resultPage.beginUnitPage==1?'disabled':''}" value="${resultPage.beginUnitPage-resultPage.pageUnit}">
                                    <a class="page-link" href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
                                    <li class="page-item ${search.currentPage==i?'active':'paging'}"><a class="page-link" href="javascript:fncGetList('${ i }');">${i}</a></li>
                                </c:forEach>
                                <li class="page-item pageUnit ${resultPage.maxPage==resultPage.endUnitPage?'disabled':''}" value="${resultPage.beginUnitPage+resultPage.pageUnit}">
                                    <a class="page-link" href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--
    <div class="col-md-12 text-center ">
        <button type="button" class="listCrProcess" >확인</button>
        <a class="btn btn-default btn" href = "#" role="button">취 소 </a>
    </div>
    --%>

<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
