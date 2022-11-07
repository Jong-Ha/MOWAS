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
        width: 360px;
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

    .wrapper {
        display: grid;
        place-items: center;
    }

    .typing {
        width: 14ch;
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
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript">

    function pagingSubmit() {
        $("#clubCalenderForm").attr('action', '/myPage/getMyCbReviewBoard').attr('method', 'post').submit()

    }


    $(function () {

        var userId = '${user.userId}'

        $(".paging").off("click").on("click", function () {

            $("#clubCalenderForm #currentPage").val($(this).text())

            pagingSubmit()
        })

        $(".pageUnit").off('click').on("click", function () {
            if ($(this).hasClass('disabled')) {
                return false
            }

            $("#clubCalenderForm #currentPage").val($(this).val())

            pagingSubmit()
        })


        $(".getClubCalender").on("click", function () {
            var clubCalenderNum = $(this).find(".clubCalenderReviewNum").val()
            var boardCategory = $(this).find(".boardCategory").val()

            Swal.fire({
                title: '해당 페이지로 이동하시겠습니까??',
                text: "해당 페이지로 이동합니다",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: "취소",
                confirmButtonText: '페이지이동'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire(
                        '페이지를 이동 합니다',
                        'success'
                    )

                    setTimeout(() => {
                        location.href = "/clubCal/getClubCalenderReview?clubCalenderReviewNum=" + clubCalenderNum + "&boardCategory=" + boardCategory;
                    }, 1500)
                }
            })


        })
        $(".getMyVillBoard").on("click", function () {
            self.location = "/myPage/getMyBoard?userId=" + userId;
        })
        $(".getMyCbMaster").on("click", function () {
            self.location = "/myPage/getMyCbMaster?userId=" + userId;
        })
        $(".getMyCbReviewBoard").on("click", function () {
            self.location = "/myPage/getMyCbReviewBoard?userId=" + userId;
        })
        $(".getMyDealBoard").on("click", function () {
            self.location = "/myPage/getMyDealBoard?userId=" + userId;
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
    <span class="tabBtn getMyVillBoard">우리동네 게시글</span>
    <span>|</span>
    <span class="tabBtn getMyCbReviewBoard">모임 일정 후기 게시글</span>
    <span>|</span>
    <span class="tabBtn getMyDealBoard">판매/판매요청 게시글</span>
</div>

<hr/>
<h4>모임 후기글</h4>
<hr/>


<!-- table Start /////////////////////////////////////-->
<div class="container">

    <form id="clubCalenderForm">

        <input hidden class="userId" name="userId" value="${user.userId}">
        <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}">
        <div class="row">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="table-responsive project-list">
                                <table class="table project-table table-centered table-nowrap table-hover table-striped"
                                       style="table-layout: fixed;">
                                    <thead>
                                    <tr>
                                        <th scope="col" style="width: 10%;">후기글 이미지</th>
                                        <th scope="col" style="width: 10%;">게시글 종류</th>
                                        <th scope="col" style="width: 20%;">후기글 제목</th>
                                        <th scope="col" style="width: 40%;">후기글 내용</th>
                                        <th scope="col" style="width: 10%">주요활동위치</th>
                                        <th scope="col" style="width: 10%">조회수</th>
                                        <th scope="col" style="width: 10%">좋아요수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="clubCalendarReview" items="${map.clubCalendarReview}">
                                        <c:forEach begin="1" end="1">
                                            <tr class="getClubCalender">
                                                <td style="display: none">
                                                    <input hidden class="clubCalenderReviewNum"
                                                           value="${clubCalendarReview.clubCalenderReviewNum}">
                                                    <input hidden class="boardCategory"
                                                           value="${clubCalendarReview.boardCategory}">
                                                    <input hidden class="SUserId" value="${clubCalendarReview.userId}">
                                                    <input hidden class="clubNum" value="${clubCalendarReview.clubNum}">
                                                </td>
                                                <td>
                                                    <c:if test="${clubCalendarReview.boardCategory == '1'}">
                                                        <img class="clubImage"
                                                             src="/resources/${clubCalendarReview.file[0]}"
                                                             alt="모임이미지"
                                                             style="width: 100%;height: 100%;object-fit: cover;">
                                                    </c:if>
                                                    <c:if test="${clubCalendarReview.boardCategory == '2'}">
                                                        <video class="clubImage" alt="모임이미지"
                                                               style="width: 100%;height: 100%;object-fit: cover;">
                                                            <source src="/resources/${clubCalendarReview.file}">
                                                        </video>
                                                    </c:if>
                                                </td>
                                                <td>
                                                        ${clubCalendarReview.boardCategory == '1' ? '후기글' : '후기쇼츠'}
                                                </td>
                                                <td>
                                                    <div>
                                                            ${clubCalendarReview.reviewTitle}
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                            ${clubCalendarReview.reviewText}
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                            ${clubCalendarReview.location}
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                            ${clubCalendarReview.viewCount}
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                            ${clubCalendarReview.likeConunt}
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
                                    </tbody>
                                </table>

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

                                            <c:forEach begin="${resultPage.beginUnitPage}"
                                                       end="${resultPage.endUnitPage}"
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
            </div>
        </div>
    </form>
</div>
    <div style="margin-bottom: 100px;">
    </div>
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
