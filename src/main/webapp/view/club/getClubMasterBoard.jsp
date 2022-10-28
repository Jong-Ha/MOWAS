<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function () {

<c:if test="${!empty clubMasterBoard.files}">
        var clubMasterBoardFileCarouselCheck = true
        $('#getClubMasterBoard').off('shown.bs.modal').on('shown.bs.modal',function(){
            $(this).find('#clubMasterBoardFileCarousel').height($(this).find('#clubMasterBoardFileCarousel').width())
            $('#getClubMasterBoard .carousel-item img').height($(this).find('#clubMasterBoardFileCarousel').width())
            // $('#getClubMasterBoard #clubMasterBoardFileCarousel').carousel('next')
        })

        //캐러셀 자동 재생
        // setTimeout(function (){
        //     if(clubMasterBoardFileCarouselCheck){
        //         $('#getClubMasterBoard #clubMasterBoardFileCarousel').carousel('next')
        //     }
        // },5000);
        // $('#getClubMasterBoard .carousel-nav').off('click').on('click',function(){
        //     clubMasterBoardFileCarouselCheck = false
        //     $('#getClubMasterBoard .carousel-nav').off('click')
        // })
        // $('#getClubMasterBoard .carousel-indicators').off('click').on('click',function(){
        //     clubMasterBoardFileCarouselCheck = false
        //     $('#getClubMasterBoard .carousel-indicators').off('click')
        // })
        </c:if>

        $("#getClubMasterBoard .updateClubMasterBoard").off('click').on("click", function () {
            <%--location.href="/club/updateClubMasterBoard/${clubMasterBoard.boardNum}"--%>
            <%--$('#updateClubMasterBoard .modal-content').load("/club/updateClubMasterBoard/${clubMasterBoard.boardNum}")--%>
            $.ajax({
                url: "/club/updateClubMasterBoard/${clubMasterBoard.boardNum}",
                success: function (re) {
                    $('#updateClubMasterBoard .modal-content').html(re)
                }
            })
        })

        $('#updateClubMasterBoard').off('shown.bs.modal').on('shown.bs.modal', function () {
            $('#updateClubMasterBoard .updateImgBox').height($('#updateClubMasterBoard .updateImgBox').width())
        })

        $(".deleteClubMasterBoard").off('click').on("click", function () {
            <%--location.href="/club/deleteClubMasterBoard/${clubMasterBoard.boardNum}/${clubMasterBoard.clubNum}"--%>
            if (confirm('진짜로 삭제?')) {
                $.ajax({
                    url: "/club/deleteClubMasterBoard/${clubMasterBoard.boardNum}/${clubMasterBoard.clubNum}",
                    success: function (re) {
                        $('#ClubBoard').html(re)
                        $('#getClubMasterBoard').modal('hide')
                    }
                })
            }
        })
    })
</script>
<style>
    .modal-text {
        font-size: 18px;
        border: 1px solid #ced4da;
        padding: 10px;
        border-radius: 0.375rem;
        align-items: baseline;
        background-color: #00000003;
        margin-bottom: 15px;
    }

    .modal-text pre{
        text-align: left;
        margin : 0;
    }

    #getClubMasterBoard .carousel-item img {
        object-fit: contain;
    }

    #getClubMasterBoard .carousel-nav svg {
        font-size: 40px;
        border-radius: 50%;
        background-color: #FFF;
        fill: #000;
    }

    #getClubMasterBoard .carousel-nav-btn {
        opacity: 30%;
        transition: 0.5s;
    }

    #getClubMasterBoard .carousel-nav-btn:hover {
        opacity: 80%;
    }

    .carousel-indicators [data-bs-target] {
        box-sizing: content-box;
        flex: 0 1 auto;
        width: 15px;
        height: 15px;
        padding: 0;
        margin-right: 3px;
        margin-left: 3px;
        text-indent: -999px;
        cursor: pointer;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #000;
        opacity: .5;
        transition: opacity .6s ease;
        border-radius: 50%;
    }

    .carousel-indicators .active {
         opacity: 1;
     }
</style>


<div class="modal-header">
    <b class="modal-title fs-5" style="text-align: left">${clubMasterBoard.title}</b>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">

    <div class="modal-text" style="display: flex;justify-content: space-between;">
        <div>작성자 : ${clubMasterBoard.userId}</div>
        <div style="font-size: 15px;">${clubMasterBoard.regDate}</div>
    </div>

    <div class="modal-text">
        <div><pre style='font-family: system-ui,-apple-system,"Segoe UI",Roboto,"Helvetica Neue","Noto Sans","Liberation Sans",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";'>${clubMasterBoard.text}</pre></div>
    </div>

<c:if test="${!empty clubMasterBoard.files}">
        <div id="clubMasterBoardFileCarousel" class="carousel slide" data-bs-ride="false" style="border: 1px solid #ced4da;border-radius: 10px;">
            <div class="carousel-indicators">
                <c:forEach items="${clubMasterBoard.files}" var="i" varStatus="st">
                    <button type="button" data-bs-target="#clubMasterBoardFileCarousel" data-bs-slide-to="${st.index}" ${st.first?'class="active"':''}  aria-current="true" aria-label="Slide ${st.index+1}">
                    </button>
                </c:forEach>
            </div>
            <div class="carousel-inner" style="border-radius: 10px;">
                <c:forEach items="${clubMasterBoard.files}" var="i" varStatus="st">
                    <div class="carousel-item ${st.first?'active':''}" data-bs-interval="5000">
                            <img class="d-block w-100" src="/resources/${i.fileName}" alt="모임 공지사항">
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev carousel-nav-btn" type="button" data-bs-target="#clubMasterBoardFileCarousel" data-bs-slide="prev">
                <span class="carousel-nav" aria-hidden="true">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
  <path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/>
</svg>
                </span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next carousel-nav-btn" type="button" data-bs-target="#clubMasterBoardFileCarousel" data-bs-slide="next">
                                <span class="carousel-nav" aria-hidden="true">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
  <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
</svg>
                </span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
</c:if>

<%--    <c:forEach items="${clubMasterBoard.files}" var="i">--%>
<%--        <img src="/resources/${i.fileName}" alt="모임 공지사항"><br>--%>
<%--        <br>--%>
<%--    </c:forEach>--%>

</div>
<div class="modal-footer" style="display: block">
    <button type="button" class="btn btn-primary updateClubMasterBoard" data-bs-toggle="modal"
            data-bs-target="#updateClubMasterBoard">수정
    </button>
    <button type="button" class="btn btn-primary deleteClubMasterBoard">삭제
    </button>
</div>