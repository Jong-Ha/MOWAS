<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>MOWAS</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    let check = true

    $(function () {
        var userId = $(".myPageUserId").val();

        $(".getMyClub1").on("click", function () {
            self.location = "/myPage/getMyClub?userId=" + userId;
        });
        $(".getMyClubApply1").on("click", function () {
            self.location = "/myPage/getMyClubApply?userId=" + userId;
        });
        $(".getMyClubLike1").on("click", function () {
            self.location = "/myPage/getMyClubLike?userId=" + userId;
        });

        setListClub()

    })

    function setListClub() {

        //각 모임으로 이동
        $(".clubCard").off('click').on('click', function (e) {
            if (check) {
                location.href = "/club/getClub/" + $(this).find('.clubNum').val();
            }
        })

        //좋아요 기능
        $(".likeToggle").off('click').on("click", function () {
            if ($('.userId').val() === '') {
                alert('로그인이 필요합니다')
                return false
            }
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
                    if (button.children('svg').hasClass('bi-heart')) {
                        // alert("누름")
                        button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#ff0000" class="bi bi-heart-fill likeCheck" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>');
                    } else {
                        // alert("뺌")
                        button.html('<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-heart likeCheck" viewBox="0 0 16 16"> <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>');
                    }
                    check = true;
                }
            })
        })
    }

    //무한스크롤
    $(function () {

        let loadCheck = false
        $(window).on('scroll', function () {
            // console.log($(window).scrollTop())
            // console.log($(document).height())
            // console.log($(window).height())
            // console.log($(document).height() - $(window).height())
            if ($(document).height() - $(window).height() - $(window).scrollTop() < 1300) {
                if (loadCheck) {
                    return
                }

                loadCheck = true
                // console.log('ajax!')

                // const data = $('#listForm').serializeArray()
                // console.log(data)
// alert(json)
                $.ajax({
                    url: '/myPage/json/getMyClubLike',
                    method: 'post',
                    'data': JSON.stringify({
                        userId: '${user.userId}',
                        currentPage: $('.listClub .currentPage').val()
                    }),
                    contentType: 'application/json; charset=utf-8',
                    success: function (re) {
                        $.each(re.list, function (index, item) {
                            // console.log(index)
                            // console.log(item)
                            console.log(item.likeCheck)
                            let html = '<div class="row row-cols-1 row-cols-md-3 g-4 cardbox">' +
                                '           <div class="col clubBox" style="cursor: pointer">' +
                                '               <div class="card shadow-lg clubCard">' +
                                '                   <input type="hidden" class="clubNum" name="clubNum" value="' + item.clubNum + '">' +
                                '                   <div class="card-img-top" style="background-color: #f0f0f0">' +
                                '                       <img src="/resources/' + item.clubImage + '" alt="모임이미지">' +
                                '                   </div>' +
                                '                   <div class="card-body carditem">' +
                                '                       <h3 class="card-title">' + item.clubName + '</h3>' +
                                '                       <div class="row g-3">' +
                                '                           <div class="col-6">' +
                                '                               <div class="badge bg-primary text-wrap" style="width: 6rem;margin: 2px;">' + item.gatherCheck + '</div>' +
                                '                               <div class="badge bg-primary text-wrap" style="width: 6rem;margin: 2px;">' + item.villCode + '</div>' +
                                '                               <div class="badge bg-primary text-wrap" style="width: 6rem;margin: 2px;">' + item.interList + '</div>' +
                                '                           </div>' +
                                '                           <div class="col-6">' +
                                '                               <span class="likeToggle">'
                            if (item.likeCheck === 'y') {
                                html += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill likeCheck" viewBox="0 0 16 16">' +
                                    '<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>' +
                                    '</svg>'
                            } else {
                                html += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart likeCheck" viewBox="0 0 16 16">' +
                                    '<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>' +
                                    '</svg>'
                            }

                            html += '                   </span>' +
                                '                   </div>' +
                                '               </div>' +
                                '               <button type="button" class="btn btn-outline-primary clubTag">' + item.tag + '</button>' +
                                '           </div>' +
                                '       </div>' +
                                '   </div>' +
                                '</div>'

                            $('.listClub').append($(html))
                        })
                        $('.listClub .currentPage').val(parseInt($('.listClub .currentPage').val()) + 1)
                        setListClub()
                        if (re.list.length > 0) {
                            loadCheck = false
                        } else {
                            $(window).off('scroll')
                        }
                    }
                })

            }
        })
    })
</script>
<style>
    .card-body .row {
        display: flex;
        align-items: center;
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
        object-fit: cover;
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

    .underline.yellow {
        background-image: linear-gradient(transparent 60%, #F8CD07 40%);
    }

    .underline:hover {
        background-size: 100% 100%;
    }

    .cardbox {
        transition: all 0.2s linear;
    }

    .cardbox:hover {
        transform: scale(1.05);
    }

    .likeCheck:hover {
        transform: scale(1.2);
    }

    .likeCheck {
        transition: 0.2s;
    }
</style>
<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<%--상단 툴바--%>
<jsp:include page="/layout/toolbar.jsp"/>
<%--상단 탑바--%>
<jsp:include page="/view/myPage/myPageTitle.jsp"/>
<hr>
<div class="container">


    <div class="tabBox">
        <span class="tabBtn getMyClub1">가입한 모임</span>
        <span>|</span>
        <span class="tabBtn getMyClubApply1">가입 신청한 모임</span>
        <span>|</span>
        <span class="tabBtn getMyClubLike1">내가 찜한 모임</span>
    </div>


    <hr>
    <h3>내가 찜한 모임</h3>
    <hr/>

    <div class="listClub">
        <input type="hidden" class="currentPage" value="2">
        <c:forEach begin="1" end="1">
            <c:forEach var="item" items="${list}">


                <div class="row row-cols-1 row-cols-md-3 g-4 cardbox">
                    <div class="col clubBox" style="cursor: pointer">
                        <div class="card shadow-lg clubCard">
                            <input type="hidden" class="clubNum" name="clubNum" value="${item.clubNum}">
                            <div class="card-img-top" style="background-color: #f0f0f0">
                                <img src="/resources/${item.clubImage}" alt="모임이미지">
                            </div>

                            <div class="card-body carditem">
                                <h3 class="card-title">${item.clubName}</h3>
                                <div class="row g-3">
                                    <div class="col-6">
                                        <div class="badge bg-primary text-wrap" style="width: 6rem;margin: 2px;">
                                                ${item.gatherCheck}
                                        </div>
                                        <div class="badge bg-primary text-wrap" style="width: 6rem;margin: 2px;">
                                                ${item.villCode}
                                        </div>
                                        <div class="badge bg-primary text-wrap" style="width: 6rem;margin: 2px;">
                                                ${item.interList}
                                        </div>
                                    </div>
                                    <div class="col-6">
                                    <span class="likeToggle">
                                        <c:if test="${item.likeCheck!='y'}">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-heart likeCheck" viewBox="0 0 16 16"> <path
                                                    d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/> </svg>
                                        </c:if>
                                    <c:if test="${item.likeCheck=='y'}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-heart-fill likeCheck" viewBox="0 0 16 16"> <path
                                                fill-rule="evenodd"
                                                d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/> </svg>
                                    </c:if>
                                    </span>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-outline-primary clubTag">${item.tag}</button>
                            </div>
                        </div>
                    </div>
                </div>


            </c:forEach>
        </c:forEach>

    </div>
</div>
<div style="margin-bottom: 100px;">
</div>
<jsp:include page="/layout/chatIcon.jsp"/>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>