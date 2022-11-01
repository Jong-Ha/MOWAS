<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function () {
        $('.ClubCalendarReviewList .card').off('click').on('click', function () {
            const calendarReviewNum = $(this).find('.CalenderReviewNum').val()
            location.href = '/clubCal/getClubCalenderReview?clubCalenderReviewNum=' + calendarReviewNum + '&boardCategory=1'
        })

        setTimeout(()=>{
            $.each($('.ClubCalendarReviewList .carousel'), function(index, item){
                console.log(item)
                const carousel = new bootstrap.Carousel(item, {
                    interval: 3000,
                    wrap: false
                })
                carousel.next()
            })
        },3000)
    })
</script>
<style>
    .ClubCalendarReviewList ul li {
        list-style: none;
        cursor: pointer;
    }

    .ClubCalendarReviewList .wap {
        width: 1000px;
        height: 1500px;
    }

    .ClubCalendarReviewList .carditem {
        display: flex;
        flex-direction: column;
        float: left;
    }


    .ClubCalendarReviewList .cardbox {
        display: flex;
        flex-direction: row;
        margin-bottom: 30px;
        float: left;
        width: 360px;
        transition: all 0.1s linear;
    }

    .ClubCalendarReviewList .cardbox:hover {
        transform: scale(1.05);
    }

    .ClubCalendarReviewList .itemBox {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .ClubCalendarReviewList .clickBox {
        padding: 10px;
        display: flex;
        float: left;
        text-align: right;
        width: 100%;
        margin-right: 39px;
        margin-bottom: 11px;
    }

    .ClubCalendarReviewList .buttonBox {
        margin-left: 10px;
        cursor: pointer;
        height: 28px;
        width: 39px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .ClubCalendarReviewList .col.reviewBox {
        width: 100%;
        margin-right: 30px;
    }


    .ClubCalendarReviewList .addBox {
        width: 100%;
        display: flex;
        flex-direction: row-reverse;
        margin-bottom: 100px;
    }


    .ClubCalendarReviewList .get {
        width: 100%;
        height: 100%;
        overflow: hidden;
    }

    .ClubCalendarReviewList .carousel-inner {
        width: 100%;
        height: 100%;
    }

    .ClubCalendarReviewList .potoBox {
        cursor: pointer;
        padding: 1px;
        width: 100%;
        height: 361px;
        overflow: hidden;
        border-radius: 0 0 5px 5px;
        border-bottom: 2px solid #0a090912;
    }

    .ClubCalendarReviewList .poto {
        object-fit: contain;
        background-color: #77777740;
    }

    .ClubCalendarReviewList .userImg {
        width: 88px;
        height: 60px;
        padding: 5px;
    }

    .ClubCalendarReviewList .userInfo {
        padding: 6px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .ClubCalendarReviewList .user_manu {
        padding: 14px;
        display: flex;
        width: 101%;
        font-size: 1.9em;
        flex-direction: row-reverse;
    }

    .ClubCalendarReviewList .user_hidden_manu {
        width: 100px;
        height: 75px;
        position: absolute;
        z-index: 2;
        margin-top: -14px;
        margin-left: 111px;

    }

    .ClubCalendarReviewList .user_hidden_manu > ul {
        width: 125px;
        border: 1px solid #0000001a;
        padding: 10px;
        border-radius: 5px;
        background: #ffff;
    }

    .ClubCalendarReviewList .reviewTitle {
        text-align: left;
        width: 100%;
        margin-bottom: 20px;
        font-size: 1.3em;
    }

    .ClubCalendarReviewList .reviewText {
        width: 100%;
        text-align: left;
        font-size: 0.8em;
    }

    .ClubCalendarReviewList .card-top {
        border-bottom: 1px solid;
        display: flex;
        font-weight: bold
    }


    .ClubCalendarReviewList .card-footer {
        height: 170px;
    }
</style>
<div style="width: 80%; padding-top: 30px;">
    <form>


        <div class="ClubCalendarReviewList"
             style="display: grid; grid-template-columns: 1fr 1fr;margin-bottom: 20px;justify-items: center;">
            <c:forEach var="ClubCalendarReview" items="${list}">
                <div class="cardbox" style="margin-bottom: 20px;margin-top: 10px;">
                    <div class="reviewBox">
                        <div class="card h-100 shadow-lg" style="width: 360px;">
                            <input hidden class="CalenderReviewNum" value="${ClubCalendarReview.clubCalenderReviewNum}">

                            <div class="card-top" style=" border-bottom: 1px solid; display: flex; font-weight: bold">
                                <div class="userImg">
                                    <img src="/resources/${ClubCalendarReview.userImg}" alt=""
                                         style="border-radius: 10px; width: 100%; height: 100%;">
                                </div>
                                <div class="userInfo">
                                    <div>
                                            ${ClubCalendarReview.userId}
                                    </div>
                                    <div style="font-size: 0.7em; margin-top: 5px;  text-align: left;  width: 150px;">
                                            ${ClubCalendarReview.location}
                                    </div>
                                </div>
                                <div style="width: 56%;">
                                    <div class="user_manu">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor"
                                             class="bi bi-three-dots" viewBox="0 0 16 16">
                                            <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                                        </svg>

                                    </div>
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

                            <div id="carouselExampleSlidesOnly" class="carousel slide potoBox getPage"
                                 data-bs-ride="carousel">

                                <div class="carousel-inner">
                                    <c:forEach var="File" items="${ClubCalendarReview.file}" varStatus="st">
                                        <div class="carousel-item ${st.index==0?'active':''} get">
                                            <img class="poto" width="100%" height="100%"
                                                 src="/resources/${File.fileName}"
                                                 alt="any">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>


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
                                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
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

                                        <div class="reviewText">
                                                ${ClubCalendarReview.reviewText}
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

            </c:forEach>
        </div>

        <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
            <span class="paging">${i}</span>
        </c:forEach>
        <label>
            <input type="hidden" id="currentPage" name="currentPage" value="1">
            <input type="text" name="searchKeyword" value="${search.searchKeyword}">
        </label>
        <input type="submit" value="검색">
        <button class="btn btn-primary addClubMasterBoardView" data-bs-toggle="modal"
                data-bs-target="#addClubMasterBoard">
            글쓰기
        </button>
    </form>
</div>