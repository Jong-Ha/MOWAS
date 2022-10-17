<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<title>Bootstrap Example</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        // $(".card-img-top").on('click', function () {
        //     location.href = "/club/getClub/" + $(this).parents('.clubBox').find('[name="clubNum"]').val()
        // })
        $(".addClub").on("click", function () {
            location.href = "/club/addClub"
        })
        $(".clubLogin").on("click", function () {
            location.href = "/club/login?userId=" + $("input[name='userId']").val()
        })
        let check = true;
        $(".likeToggle").on("click", function () {
            check = false;
            var clubNum = $(this).parents('.clubBox').find('[name="clubNum"]').val()
            var button = $(this);
            $.ajax({
                url: "/club/json/clubLike",
                method: "POST",
                data: JSON.stringify({
                    "boardNum": clubNum,
                    "boardCategory": "12"
                }),
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json; charset=UTF-8"
                },
                dataType: "JSON",
                success: function () {
                    // alert("ajax")
                    // alert(button.children('svg').attr("class"))
                    if (button.children('svg').attr("class") === 'bi bi-heart') {
                        // alert("누름")
                        button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>');
                    } else {
                        // alert("뺌")
                        button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"> <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>');
                    }
                    check = true;
                }
            })
        })
        $(".clubBox").on('click', function (e) {
            if(check){
            location.href = "/club/getClub/" + $(this).find('[name="clubNum"]').val()
            }
        })
    })
</script>


<style>
    .body {
        text-align: -webkit-center;
    }

    .wap {
        width: 1000px;
    }

    .carditem {
        height: 210px;
        display: flex;
        flex-direction: column;
    }

    .card-title {
        width: 250px;
        font-size: 1.2em;
    }

    .cardbox {
        display: flex;
        flex-direction: row;
        margin: 6px;
        float: left;
    }

    button.buttonBox {
        font-size: 0.7em;
        /* float: left; */
        /* size: b4; */
        height: 25px;
        width: 5px;
    }

    .col.clubBox {
        width: 320px;
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
        font-size: 40px;
    }

    .clubTag {
        height: 210px;
        --bs-btn-color: #000000;
        --bs-btn-border-color: #000000;
        --bs-btn-hover-color: #000000;
        --bs-btn-hover-bg: #fff;
        --bs-btn-hover-border-color: #000000;
        --bs-btn-focus-shadow-rgb: 13,110,253;
        --bs-btn-active-color: #000000;
        --bs-btn-active-bg: #fff;
        --bs-btn-active-border-color: #000000;
        --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
        --bs-btn-disabled-color: #000000;
        --bs-btn-disabled-bg: transparent;
        --bs-btn-disabled-border-color: #000000;
        --bs-gradient: none;
    }

</style>
</head>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">

<input type="button" class="clubLogin" value="로그인">
<label>
    아이디 : <input type="text" name="userId" value="user01">
</label>
${user.userId}
<!-- Example Code -->
<div class="wap">
    <input hidden class="boardCategory" value="1">
    <%--상단 툴바--%>
    <jsp:include page="/layout/toolbar.jsp"/>

    <div class="add" style="display:flex;justify-content: space-between;align-items: center;">
        <button class="btn btn-primary addClub">
            모임 만들기
        </button>
        <div>
            <button class="btn btn-primary searchLocation">
                위치
            </button>
            <button class="btn btn-primary searchInterList">
                관심목록
            </button>
            <button class="btn btn-primary searchTag">
                태그
            </button>
            <button class="btn btn-primary ">
                검색
            </button>
        </div>
    </div>

    <div style="display: grid;grid-template-columns: 1fr 1fr 1fr;">

        <c:forEach var="club" items="${list}">
            <div class="row row-cols-1 row-cols-md-3 g-4 cardbox">
                <div class="col clubBox">
                    <input type="hidden" name="clubNum" value="${club.clubNum}">
                    <div class="card h-100">
                        <div class="card-img-top" style="cursor: pointer">
                            <img src="/resources/${club.clubImage}" alt="모임이미지">
                        </div>

                        <div class="card-body carditem">
                            <h3 class="card-title">${club.clubName}</h3>
                            <div class="row g-3">
                                <div class="col-6">
                                    <div class="badge bg-primary text-wrap" style="width: 6rem;">
                                            ${club.gatherCheck==1?'모집중':'모집완료'}
                                    </div>
                                    <div class="badge bg-primary text-wrap" style="width: 6rem;">
                                            ${club.villCode}
                                    </div>
                                    <div class="badge bg-primary text-wrap" style="width: 6rem;">
                                            ${club.interList}
                                    </div>
                                </div>
                                <div class="col-6">
                                        ${club.currentCluber}/25<br>
                                    <span class="likeToggle">
                                        <c:if test="${club.likeCheck!='y'}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"> <path
                                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>
                                        </c:if>
                                    <c:if test="${club.likeCheck=='y'}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"> <path
                                                fill-rule="evenodd"
                                                d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>
                                    </c:if>
                                </span>
                                </div>
                            </div>
                            <button type="button" class="btn btn-outline-primary clubTag">${club.tag}</button>
                        </div>
                            <%--<div class="card-footer">
                                <small class="text-muted">Last updated 3 mins ago</small>
                            </div>--%>
                    </div>
                </div>
            </div>

        </c:forEach>

    </div>

</div>

</body>
</html>

