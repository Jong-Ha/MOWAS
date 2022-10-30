<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script>
        $(function(){
            $(".addVoteView").off('click').on("click",function(){
                $('#addVote .modal-content').load("/club/addVote/${roomId}")
            })

            $('#listVote .cardBox').off('click').on('click',function(){
                const voteNum = $(this).find('.voteNum').val()
                $('#getVote .modal-content').load('/club/getVote/'+voteNum)
            })
            // $(".getChat").on("click",function(){
            //     location.href="/club/getClub/10000"
            // })
        })
    </script>
<style>
    #listVote .cardBox{
        padding: 15px 25px;
        margin-bottom: 25px;
        transition: 0.2s;
        cursor: pointer;
    }
    #listVote .cardBox:hover{
        transform: scale(1.05);
    }
</style>



<div class="modal-header">
    <a class="navbar-brand back-btn" style="width: 32px;">
        <%--        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">--%>
        <%--            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>--%>
        <%--            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>--%>
        <%--        </svg>--%>
    </a>
    <h5 class="modal-title">투표</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <div class="card-list">
        <c:if test="${empty list}">
            <div class="card shadow-lg noHover" style="padding: 10px;"><h5 style="text-align: center;margin:0;">등록된 투표가 없습니다!</h5></div>
        </c:if>
        <c:if test="${!empty list}">
            <c:forEach items="${list}" var="vote">
                <div class="card shadow-lg cardBox" data-bs-target="#getVote" data-bs-toggle="modal">
                    <input type="hidden" class="voteNum" value="${vote.voteNum}">
                    <div>
                        <div style="display: flex;justify-content: space-between;align-items: center;">
                            <h4 style="font-weight: bold">
                                ${vote.voteTitle}
                            </h4>
                            <div class="badge bg-${vote.endCheck=='1'?'secondary':'primary'} text-wrap">
                                ${vote.endCheck=='1'?'마감':'진행중'}
                            </div>
                        </div>
                        <div style="display: flex;justify-content: space-between;">
                            <div>
                                <div>
                                    ${vote.voteDate}
                                </div>
                                <div>
                                    ${vote.voteMasterId}
                                </div>
                            </div>
                            <div>
                                <c:if test="${vote.endDateCheck=='1'}">
                                    ${vote.endDate}까지
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>
<div class="modal-footer" style="display: block; text-align: center">
<button type="button" class="btn btn-primary addVoteView" data-bs-target="#addVote" data-bs-toggle="modal">투표 등록</button>
<%--    <c:if test="${!empty list}">--%>
<%--        <c:if test="${search.searchCondition==1}">--%>
<%--            <form id="listCluberOutForm">--%>
<%--                <input type="hidden" name="clubNum" value="${clubNum}">--%>
<%--                <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">--%>
<%--                    <span class="paging">${i}</span>--%>
<%--                </c:forEach>--%>
<%--                <label>--%>
<%--                    <input type="hidden" id="currentPage" name="currentPage" value="1">--%>
<%--                </label>--%>
<%--            </form>--%>
<%--        </c:if>--%>
<%--    </c:if>--%>
</div>