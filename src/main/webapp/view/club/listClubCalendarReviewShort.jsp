<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function () {
        $(".ListClubCaenderReview .ShortVideo").off('play').on("play", function () {
            var boardNum = $(this).parents(".cardbox").find(".boardNum").val()
            var viewCount = $(this).parents(".cardbox").find(".viewText");

            $.ajax({
                url: "/commu/json/viewCount",
                type: "POST",
                data: JSON.stringify({
                    "viewCount": viewCount.html(),
                    "boardNum": boardNum,
                    "boardCategory": '2'
                }),
                dataType: "JSON",
                contentType: 'application/json; charset=UTF-8',
                success: function (JSONData, result) {

                    viewCount.html(JSONData);

                }

            })

            var offset = $(this).parents(".cardbox").find(".ShortVideo").offset();

            $('html').animate({scrollTop: offset.top - 160}, 0);

        })

        // paging
        $("#listClubCalendarReviewShortForm .paging").off('click').on("click", function () {
            $("#listClubCalendarReviewShortForm #currentPage").val($(this).text())

            const data = $('#listClubCalendarReviewShortForm').serialize()

            $.ajax({
                url : "/club/listClubCalendarReview/${clubNum}/2",
                method : 'post',
                'data' : data,
                success : function(re){
                    $("#ClubBoard").html(re)
                    clubLayout()
                    $('#ClubBoard')[0].scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"})
                }
            })
        })
        $("#listClubCalendarReviewShortForm .pageUnit").off('click').on("click", function () {
            if($(this).hasClass('disabled')){
                return false
            }

            $("#listClubCalendarReviewShortForm #currentPage").val($(this).val())

            const data = $('#listClubCalendarReviewShortForm').serialize()

            $.ajax({
                url : "/club/listClubCalendarReview/${clubNum}/2",
                method : 'post',
                'data' : data,
                success : function(re){
                    $("#ClubBoard").html(re)
                    clubLayout()
                    $('#ClubBoard')[0].scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"})
                }
            })
        })

    })
</script>
<style>

    .ListClubCaenderReview ul li {
        list-style: none;
        cursor: pointer;
    }

    .ListClubCaenderReview .body {
        text-align: -webkit-center;
    }


    .ListClubCaenderReview .carditem {
        display: flex;
        flex-direction: column;
    }

    .ListClubCaenderReview .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 100px;
    }

    .ListClubCaenderReview .carditem {
        display: flex;
        flex-direction: column;
    }


    .ListClubCaenderReview .itemBox {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .ListClubCaenderReview .clickBox {
        padding: 10px;
        display: flex;
        float: left;
        text-align: right;
        width: 100%;
        margin-right: 39px;
        margin-bottom: 11px;
    }

    .ListClubCaenderReview .buttonBox {
        margin-left: 10px;
        cursor: pointer;
        height: 28px;
        width: 39px;
        display: flex;
        align-items: center;
        justify-content: center;
    }


    .ListClubCaenderReview .card {
        width: 1012px;
    }

    .ListClubCaenderReview .addBox {
        width: 100%;
        display: flex;
        flex-direction: row-reverse;
        margin-bottom: 100px;
    }


    .ListClubCaenderReview .ShortVideo {
        /*padding: 5px;*/
    }

    .ListClubCaenderReview .addBox {
        margin-bottom: 50px;
    }

    .ListClubCaenderReview .add {
        margin-right: -700px;
    }

    .ListClubCaenderReview .userImg {
        width: 60px;
        height: 60px;
        padding: 5px;
    }

    .ListClubCaenderReview .userInfo {
        padding: 6px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .ListClubCaenderReview .user_manu {
        padding: 14px;
        display: flex;
        font-size: 1.9em;
        flex-direction: row-reverse;
        justify-content: space-between;
    }

    .ListClubCaenderReview .user_hidden_manu {
        width: 100px;
        height: 75px;
        position: absolute;
        z-index: 2;
        margin-top: -14px;
        margin-left: 705px;

    }

    .ListClubCaenderReview .user_hidden_manu > ul {
        width: 125px;
        border: 1px solid #0000001a;
        padding: 10px;
        border-radius: 5px;
        background: #ffff;
    }

    .ListClubCaenderReview .reviewTitle {
        text-align: left;
        width: 100%;
        margin-bottom: 20px;
        font-size: 1.3em;
    }

    .ListClubCaenderReview .reviewText {
        width: 100%;
        text-align: left;
        font-size: 0.8em;
    }

    .ListClubCaenderReview .card-top {
        border-bottom: 1px solid;
        display: flex;
        font-weight: bold;
        justify-content: space-between;
    }
</style>
<div style="width: 80%; padding-top: 30px;">
    <form id="listClubCalendarReviewShortForm">
        <c:if test="${empty list}">
            <div class="bg-light rounded-3" style="width: 70%; margin-bottom: 30px;">
                <div class="container-fluid" style="padding: 16px;">
                    <h3 class="fw-bold" style="margin-top: 16px;margin-bottom: 16px;">등록된 쇼츠가 없습니다</h3>
                </div>
            </div>
        </c:if>
        <c:if test="${!empty list}">
        <div class="ListClubCaenderReview">
            <c:forEach var="ClubCalendarReview" items="${list}">
                <div class="cardbox">
                    <input hidden class="boardNum" value="${ClubCalendarReview.clubCalenderReviewNum}">

                    <div class="col">
                        <div class="card h-100">

                            <div class="card-top" style=" border-bottom: 1px solid; display: flex; font-weight: bold">
                                <div style="display: flex">
                                    <div class="userImg">
                                        <img src="/resources/${ClubCalendarReview.userImg}" alt=""
                                             style="border-radius: 10px; width: 100%; height: 100%;">
                                    </div>
                                    <div class="userInfo">
                                        <div>
                                                ${ClubCalendarReview.userId}
                                        </div>
                                        <div style="font-size: 0.7em; margin-top: 5px">
                                                ${ClubCalendarReview.location}
                                        </div>
                                    </div>
                                </div>
                                <div class="user_manu">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-three-dots" viewBox="0 0 16 16">
                                        <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                                    </svg>
                                    <div class="user_hidden_manu" style="display: none">
                                        <ul class=" shadow-lg">
                                            <li class="getClub">
                                                모임 방문하기
                                            </li>

                                            <c:if test="${user.userId eq ClubCalendarReview.userId}">
                                                <li data-bs-toggle="modal" data-bs-target="#exampleModal"
                                                    class="update">
                                                    수정
                                                </li>
                                                <li class="delete">
                                                    삭제
                                                </li>
                                            </c:if>

                                        </ul>
                                    </div>


                                </div>
                            </div>
                            <video id="ShortVideo${i}" controls class="ShortVideo"
                                   style="height: 572px;background-color: #000;">
                                <source src="/resources/${ClubCalendarReview.file[0].fileName}" type="video/mp4">
                            </video>

                            <div class="card-footer">
                                <div class="card-body carditem" style="padding: 0;">

                                    <div class="itemBox">

                                        <div class="clickBox">

                                            <div class="btn btn-primary position-relative  buttonBox  likeButton">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                     fill="currentColor"
                                                     class="bi bi-hand-thumbs-up" viewBox="0 0 16 16"
                                                     style="font-size: 1.7em;">
                                                    <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                                </svg>
                                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText"
                                                      style=" z-index: 1; font-size: 0.5em;">${ClubCalendarReview.likeConunt}</span>
                                            </div>

                                            <div class="btn btn-secondary position-relative position-relative buttonBox">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                     fill="currentColor"
                                                     class="bi bi-eye" viewBox="0 0 16 16" style="font-size: 1.7em">
                                                    <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                                    <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                                </svg>
                                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger viewText"
                                                      style="z-index: 1; font-size: 0.5em;">${ClubCalendarReview.viewCount}</span>
                                            </div>

                                            <div class="btn btn-danger buttonBox report">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                     fill="currentColor"
                                                     class="bi bi-hand-thumbs-down-fill" viewBox="0 0 16 16"
                                                     style="font-size: 1.7em">
                                                    <path d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
                                                </svg>
                                            </div>
                                        </div>

                                        <div class="reviewTitle">
                                                ${ClubCalendarReview.reviewTitle}
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </c:forEach>
        </div>
        </c:if>

        <%--
        <div style="display: flex;justify-content: space-between;flex-direction: row-reverse;width: 90%;align-items: center;margin-bottom: 24px;${!empty list?'margin-top: -50px;':''}">
            <div style="display: flex;align-items: center;min-width: 250px;justify-content: space-between;">
                <label>
                    <input type="hidden" id="currentPage" name="currentPage" value="1">
                    <input type="text" name="searchKeyword" value="${search.searchKeyword}">
                </label>
                <button class="btn btn-primary">
                    검색
                </button>
            </div>
        </div>
        --%>

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

    </form>
</div>