<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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

</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

    $(function () {
        // const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        // const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

        // $('tbody tr').on('mouseover',function(){
        //     bootstrap.Tooltip.getOrCreateInstance($(this).find('span')[0]).toggle()
        // })
        $('tbody tr').on('mouseenter',function(){
            bootstrap.Tooltip.getOrCreateInstance($(this).find('span')[0]).show()
        })
        $('tbody tr').on('mouseleave',function(){
            bootstrap.Tooltip.getOrCreateInstance($(this).find('span')[0]).dispose()
        })

        var userId = $(".myPageUserId").val();

        $(".getMyClub1").on("click", function () {
            self.location = "/myPage/getMyClub?userId=" + userId;
        });
        $(".getMyClubApply1").on("click", function () {
            self.location = "/myPage/getMyClubApply?userId=" + userId;
        });
    })

    // function imgResize(){
    //     $('.clubImage').height($('.clubImage').width())
    // }

    $(function(){
        // imgResize()
        // $(window).on('resize',function(){
        //     imgResize()
        // })

        $('.listClubApply td').on('click',function(){
            location.href = '/club/getClub/'+$(this).parents('tr').find('.clubNum').val()
        })

        // paging
        $(".listClubApply .paging").off('click').on("click", function () {
            $("#getMyClubApplyForm #currentPage").val($(this).text())

            submitForm()
        })
        $(".listClubApply .pageUnit").off('click').on("click", function () {
            if($(this).hasClass('disabled')){
                return false
            }

            $("#getMyClubApplyForm #currentPage").val($(this).val())

            const data = $('#listClubMasterBoardForm').serialize()

            submitForm()
        })
        function submitForm(){
            $('#getMyClubApplyForm').attr('action','/myPage/getMyClubApply').attr('method','post').submit()
        }
    })

</script>
<style>
    .pagination li{
        cursor: default;
    }

    .pagination .paging{
        cursor: pointer;
    }

    .card-body .row {
        display: flex;
        align-items: center;
    }

    .listClubApply td{
        cursor: pointer;
        vertical-align: middle;
    }

    .bi-heart-fill {
        fill: #ff0000
    }

    .bi-heart {
        fill: #ff0000
    }

    .carditem {
        height: 230px;
        display: flex;
        flex-direction: column;
    }

    .card-title {
        width: 100%;
        font-size: 1.2em;
    }

    .listClub {
        display: flex;
        justify-content: space-evenly;
        flex-wrap: wrap;
        flex-direction: row;
    }

    .cardbox {
        display: block;
        flex-direction: row;
        margin: 0 0 20px;
    }

    button.buttonBox {
        font-size: 0.7em;
        /* float: left; */
        /* size: b4; */
        height: 25px;
        width: 5px;
    }

    .col.clubBox {
        width: 360px;
        padding: 0;
    }

    .add {
        /*margin-right: 800px;*/
        margin-bottom: 50px;
    }

    .card-img-top {
        text-align: center;
        width: 100%;
        height: 200px;
    }

    .card-img-top > img {
        object-fit: contain;
        width: 100%;
        height: 100%;
    }

    svg {
        font-size: 50px;
    }

    .clubTag {
        height: 210px;
        margin-top: 5px;
        word-break: keep-all;
        --bs-btn-color: #000000;
        --bs-btn-border-color: #000000;
        --bs-btn-hover-color: #000000;
        --bs-btn-hover-bg: #fff;
        --bs-btn-hover-border-color: #000000;
        --bs-btn-focus-shadow-rgb: 13, 110, 253;
        --bs-btn-active-color: #000000;
        --bs-btn-active-bg: #fff;
        --bs-btn-active-border-color: #000000;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #000000;
        --bs-btn-disabled-bg: transparent;
        --bs-btn-disabled-border-color: #000000;
        --bs-gradient: none;
    }

    .interList {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-evenly;
    }

    .modal-footer {
        display: block;
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

    @keyframes blink {
        80% {
            border-color: transparent
        }
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
</style>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>
<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr>
<div class="container">
<form id="getMyClubApplyForm">
    <input type="hidden" name="userId" value="${user.userId}">
    <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}">
</form>

    <div class="tabBox">
        <span class="tabBtn getMyClub1">가입한 모임</span>
        <span>|</span>
        <span class="tabBtn getMyClubApply1">가입 신청한 모임</span>
    </div>


    <hr>
    <h3>가입 신청한 모임</h3>
    <hr/>

    <!--  table Start /////////////////////////////////////-->
    <div class="listClubApply">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive project-list" style="border-radius: 5px;">
                            <table class="table project-table table-centered table-nowrap table-hover table-striped" style="    table-layout: fixed;">
                                <thead>
                                <tr>
                                    <th scope="col" style="width: 10%;">모임 이미지</th>
                                    <th scope="col" style="width: 20%;">모임명</th>
                                    <th scope="col" style="width: 10%">주요활동위치</th>
                                    <th scope="col" style="width: 10%;">관심목록</th>
                                    <th scope="col" style="width: 40%;">태그</th>
                                    <th scope="col" style="width: 10%;">신청상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${list}">
                                    <c:forEach begin="1" end="1">
                                    <tr>
                                        <input type="hidden" class="clubNum" value="${item.club.clubNum}"/>
                                        <td><img class="clubImage" src="/resources/${item.club.clubImage}" alt="모임이미지" style="width: 100%;aspect-ratio: 1/0.8;object-fit: cover;"></td>
                                        <td>${item.club.clubName}</td>
                                        <td>${item.club.villCode}</td>
                                        <td>${item.club.interList}</td>
                                        <td style="word-break: keep-all">${item.club.tag}</td>
                                        <td><span data-bs-toggle="tooltip" data-bs-placement="top" title="${item.cluber.cluberStatus} : ${item.cluber.cluberStatus=='신청'?item.cluber.clubApplyDate:item.cluber.clubRegDate}">${item.cluber.cluberStatus}</span></td>
                                    </tr>
                                </c:forEach>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!--  table End /////////////////////////////////////-->
                        <c:if test="${!empty list}">
                            <nav aria-label="Page navigation example" style="display: flex;justify-content: center;">
                                <ul class="pagination">
                                    <li class="page-item pageUnit ${resultPage.beginUnitPage==1?'disabled':''}" value="${resultPage.beginUnitPage-resultPage.pageUnit}">
                                        <a class="page-link" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
                                        <li class="page-item ${search.currentPage==i?'active':'paging'}"><a class="page-link">${i}</a></li>
                                    </c:forEach>
                                    <li class="page-item pageUnit ${resultPage.maxPage==resultPage.endUnitPage?'disabled':''}" value="${resultPage.beginUnitPage+resultPage.pageUnit}">
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
<div style="margin-bottom: 100px;">
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>