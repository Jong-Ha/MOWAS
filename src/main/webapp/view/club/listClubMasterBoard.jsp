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
        $(".paging").on("click", function () {
            $("#currentPage").val($(this).text())
            $("form").submit()
        })
        $("form").on("submit", function () {
            $(this).attr("action", "/club/listClubMasterBoard/${clubNum}").attr("method", "post")
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
    <form>
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

        <nav aria-label="Page navigation example" style="display: flex;justify-content: center;">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
                    <li class="page-item ${search.currentPage==i?'active':''}"><a class="paging page-link">${i}</a></li>
                </c:forEach>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>

        <label>
            <input type="hidden" id="currentPage" name="currentPage" value="1">
            <input type="text" name="searchKeyword" value="${search.searchKeyword}">
        </label>
        <input type="submit" value="검색">
        <c:if test="${currentCluber.cluberStatus=='5'||currentCluber.cluberStatus=='6'}">
        <button class="btn btn-primary addClubMasterBoardView" data-bs-toggle="modal"
                data-bs-target="#addClubMasterBoard">
            글쓰기
        </button>
        </c:if>
    </form>
</div>