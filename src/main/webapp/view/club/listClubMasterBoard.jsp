<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function () {

        $('#addClubMasterBoard').off('show.bs.modal').on('show.bs.modal',function(){
            if(${currentCluber.cluberStatus=='4'}){
                return false
            }
        })

        $('.addClubMasterBoardView').off('click').on('click', function () {
            if(${currentCluber.cluberStatus=='4'}){
                return false
            }
            $.ajax({
                url: '/club/addClubMasterBoard/${clubNum}',
                success: function (re) {
                    $('#addClubMasterBoard .modal-content').html(re)
                }
            })
            return false
        })

        $('#ClubBoard .cardBox').off('click').on('click', function () {
            // alert($(this).find('.boardNum').val())
            $.ajax({
                url: '/club/getClubMasterBoard/' + $(this).find('.boardNum').val(),
                success: function (re) {
                    $('#getClubMasterBoard .modal-content').html(re)
                    $('#getClubMasterBoard').modal('show')
                }
            })
        })

        $('.clubMasterBoardBox .card-header .text-truncate').css('max-width',$('.clubMasterBoardBox .card-header').width()-75)
        $('.clubMasterBoardBox .card-body .text-truncate').css('max-width',$('.clubMasterBoardBox .card-header').width())
        $(window).off('resize').on('resize',function(){
            clubLayout()
            $('.clubMasterBoardBox .card-header .text-truncate').css('max-width',$('.clubMasterBoardBox .card-header').width()-75)
            $('.clubMasterBoardBox .card-body .text-truncate').css('max-width',$('.clubMasterBoardBox .card-header').width())
        })

        $('#getClubMasterBoard').off('show.bs.modal').on('show.bs.modal',function(){
            if(!${currentCluber.cluberStatus==4||currentCluber.cluberStatus==5||currentCluber.cluberStatus==6}){
                alert('모임원만 조회가 가능합니다')
                return false
            }
        })

        // paging
        $("#listClubMasterBoardForm .paging").off('click').on("click", function () {
            $("#listClubMasterBoardForm #currentPage").val($(this).text())

            const data = $('#listClubMasterBoardForm').serialize()

            $.ajax({
                url : "/club/listClubMasterBoard/${clubNum}",
                method : 'post',
                'data' : data,
                success : function(re){
                    $("#ClubBoard").html(re)
                    clubLayout()
                    $('#ClubBoard')[0].scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"})
                }
            })
        })
        $("#listClubMasterBoardForm .pageUnit").off('click').on("click", function () {
            if($(this).hasClass('disabled')){
                return false
            }

            $("#listClubMasterBoardForm #currentPage").val($(this).val())

            const data = $('#listClubMasterBoardForm').serialize()

            $.ajax({
                url : "/club/listClubMasterBoard/${clubNum}",
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
    .clubMasterBoardBox .cardBox{
        cursor: pointer;
        transition: 0.5s;
    }
    .clubMasterBoardBox .cardBox:hover{
        scale: 1.1;
    }
</style>
<div style="width: 80%; padding-top: 30px;">
    <form id="listClubMasterBoardForm">
        <c:if test="${empty list}">
            <div class="bg-light rounded-3" style="width: 70%; margin-bottom: 30px;">
                <div class="container-fluid" style="padding: 16px;">
                    <h3 class="fw-bold" style="margin-top: 16px;margin-bottom: 16px;">등록된 모임 공지사항이 없습니다</h3>
                </div>
            </div>
        </c:if>
        <c:if test="${!empty list}">
        <div class="clubMasterBoardBox"
             style="flex-wrap: wrap;display: grid;justify-content: space-evenly;margin-bottom: 30px;grid-template-columns: 1fr 1fr;justify-items: center;">
            <c:forEach items="${list}" var="clubMasterBoard">
                <div class="card shadow-lg cardBox"
                     style="width: 80%; min-width: 300px; margin: 10px 0 10px 0; text-align: left">
                    <input type="hidden" class="boardNum" value="${clubMasterBoard.boardNum}">
                    <div>
                        <div class="card-header" style="display: flex;justify-content: space-between;align-items: center;">
                                <h4 class="card-title text-truncate">
                                        ${clubMasterBoard.title}
                                </h4>
                                <div style="width: 70px">
                                    <small class="text-right" style="font-size: 20px;">
                                            ${clubMasterBoard.userId}
                                    </small><br>
                                    <small class="text-right" style="font-size: 13px;">
                                            ${clubMasterBoard.regDate}
                                    </small>
                                </div>
                        </div>
                        <div class="card-body">
                            <div class="text-truncate">
                                    ${clubMasterBoard.text}
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        </c:if>

        <div style="display: flex;justify-content: space-between;flex-direction: row-reverse;width: 90%;align-items: center;margin-bottom: 24px;">
            <div style="display: flex;align-items: center;min-width: 250px;justify-content: space-between;">
                <label>
                    <input type="hidden" id="currentPage" name="currentPage" value="1">
                    <input type="text" name="searchKeyword" value="${search.searchKeyword}">
                </label>
                <button class="btn btn-primary">
                    검색
                </button>
            </div>

            <c:if test="${currentCluber.cluberStatus=='5'||currentCluber.cluberStatus=='6'}">
                <button class="btn btn-primary addClubMasterBoardView" data-bs-toggle="modal"
                        data-bs-target="#addClubMasterBoard">
                    작성
                </button>
            </c:if>
        </div>

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