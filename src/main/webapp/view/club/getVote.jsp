<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function () {
        var dialog = $( "#getVote #listVoter" )
            dialog.dialog({
            autoOpen: false
        });

        $("#getVote .listVoter").off('mouseenter').on("mouseenter", function () {
        })
        $("#getVote .listVoter").off('mouseleave').on("mouseleave", function () {
            dialog.dialog('close')
        })

        //누가 투표를 했는지 보자고
        $("#getVote .listVoter").off('mouseover').on("mouseover", function () {
            // alert($(this).attr("id"))
            const voteItem = $(this).attr("id")
            const voteNum = ${vote.voteNum}
                const el = $(this)
                $.ajax({
                    url: "/club/json/listVoter",
                    method: "POST",
                    data: JSON.stringify({
                        voteItem: voteItem,
                        voteNum: voteNum
                    }),
                    dataType: "JSON",
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json; charset=UTF-8"
                    },
                    success: function (json) {
                        console.log(json)
                        let str = ''
                        let maxLength=0
                        for(var i=0 ; i < 1; i++){
                            $.each(json,function(index, item){
                                str += '<div class="voter"><div class="voterImage"><img src="/resources/'+item.userImage+'" style="width: 40px;height: 40px;border-radius: 5px;object-fit: contain;" alt="img"/></div><div class="voterId">'+item.userId+'</div></div>'
                                if(maxLength<item.userId.length){
                                    maxLength = item.userId.length
                                }
                            })
                        }

                        console.log(maxLength)

                        const diaWidth = maxLength*7+80

                        console.log(diaWidth)

                        $('.voters').html(str)

                        dialog.dialog({
                            autoOpen: false,
                            position : {
                                my : "left+50",
                                of : el
                            },
                            width: diaWidth,
                            minWidth: 100,
                            minHeight:50
                        });
                        if(str!==''){
                            dialog.dialog('open')
                        }

                    }
                })
        })

        //투표 제출
        $("#getVote .updateVoter").off('click').on("click", function () {
            // $("form").attr("action", "/club/updateVoter").attr("method", "post").submit()
            const data = $('#getVote #getVoteForm').serialize()
            // alert(data)
            $.ajax({
                url : '/club/updateVoter',
                'data' : data,
                method : 'post',
                success : function(re){
                    alert('투표가 제출되었습니다!')
                    $('#getVote .modal-content').html(re)
                }
            })
        })

        //마감된 투표
        if(${vote.endCheck==1}){
            $('#getVote .form-check-input').prop("disabled", 'ture')
        }

        //다시 투표
        $(".updateVoterCheck").off('click').on("click", function () {
            $('[name="voteItem"]').prop("disabled", false)
            $(this).toggle()
            $('#getVote .updateVoter').toggle()
        })

        //투표 마감
        $(".endVote").off('click').on("click", function () {
            <%--location.href = "/club/endVote/${voteNum}"--%>
            if(confirm('투표를 마감하시겠습니까?')){
                $.ajax({
                    url : "/club/endVote/${voteNum}",
                    success : function(re){
                        alert('투표가 마감되었습니다!')

                        let msg ='"${vote.voteTitle}" 투표가 마감되었습니다!'

                        const data = {
                            name: '${user.userId}',
                            msg: msg,
                            userImage: '${user.userImage}'
                        }
                        //Server에 socket.on으로 data정보를 전달
                        chatSocket.emit("chatting", data)

                        $('#getVote .modal-content').html(re)
                    }
                })
            }
        })

        //투표 수정
        $("#getVote .updateVote").off('click').on("click", function () {
            <%--location.href = "/club/updateVote/${voteNum}"--%>
            $.ajax({
                url : "/club/updateVote/${voteNum}",
                success : function(re){
                    $('#updateVote .modal-content').html(re)
                }
            })
        })

        //투표 삭제
        $(".deleteVote").off('click').on("click", function () {
            <%--location.href = "/club/deleteVote/${vote.roomId}/${voteNum}"--%>
            if(confirm('투표를 삭제하시겠습니까?')){
                $.ajax({
                    url : "/club/deleteVote/${vote.roomId}/${voteNum}",
                    success : function(re){
                        alert('투표가 삭제되었습니다!')
                        $('#listVote .modal-content').html(re)
                        $('#getVote').modal('hide')
                        $('#listVote').modal('show')
                    }
                })
            }
        })
    })
</script>
<script>
    $(function () {
        $('[name="voteItem"]').prop("disabled", ${vote.voterCheck==1?'true':'false'})
    })
</script>
<style>
    .ui-dialog-titlebar {
        display: none;
    }

    .voter{
        display: flex;
        align-items: center;
    }
</style>

<div class="modal-header">
    <a class="navbar-brand back-btn" data-bs-target="#listVote" data-bs-toggle="modal">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left"
             viewBox="0 0 16 16">
            <path fill-rule="evenodd"
                  d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
            <path fill-rule="evenodd"
                  d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
        </svg>
    </a>
    <h5 class="modal-title">${vote.voteTitle} <span class="badge bg-${vote.endCheck=='1'?'secondary':'primary'} text-wrap">${vote.endCheck=='1'?'마감':'진행중'}</span></h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">

    <form id="getVoteForm">
        <input type="hidden" name="voteNum" value="${vote.voteNum}">

        <div class="modal-text mb-3" style="display: flex;justify-content: space-between;flex-wrap: wrap;align-items: center;">
            <div>작성자 : ${vote.voteMasterId}</div>
            <div style="font-size: 15px;text-align: right;">
                <div>
                    ${vote.voteDate}
                </div>
                <c:if test="${vote.endDateCheck=='1'}">
                <div>
                    ${vote.endDate}까지
                </div>
                </c:if>
            </div>
        </div>


        <div class="modal-text mb-3" style="word-break: break-all">

            ${vote.voteText}
        </div>

        <c:if test="${!empty vote.voteItem1}">
            <div class="input-group mb-3" style="height: 58px;">
                <div class="input-group-text" style="background-color: #FFFFFF; width: 58px;">
                    <input class="form-check-input" type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}"
                           name="voteItem" ${vote.myVoter1==1?'checked':''} value="${vote.voteItem1}"
                           style="margin: auto;font-size: 20px;">
                </div>
                <input type="text" class="form-control" value="${vote.voteItem1} " disabled
                       style="background-color: #FFFFFF; border-right: 0;">
                <div class="input-group-text" style="border-left: 0;background-color: #FFFFFF;">
                    <div class="voteBadge ${vote.hideVoteCheck=='1'?'':'listVoter'}" id="${vote.voteItem1}">
                            ${vote.voter1}
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty vote.voteItem2}">
            <div class="input-group mb-3" style="height: 58px;">
                <div class="input-group-text" style="background-color: #FFFFFF; width: 58px;">
                    <input class="form-check-input" type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}"
                           name="voteItem" ${vote.myVoter2==1?'checked':''} value="${vote.voteItem2}"
                           style="margin: auto;font-size: 20px;">
                </div>
                <input type="text" class="form-control" value="${vote.voteItem2} " disabled
                       style="background-color: #FFFFFF; border-right: 0;">
                <div class="input-group-text" style="border-left: 0;background-color: #FFFFFF;">
                    <div class="voteBadge ${vote.hideVoteCheck=='1'?'':'listVoter'}" id="${vote.voteItem2}">
                            ${vote.voter2}
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty vote.voteItem3}">
            <div class="input-group mb-3" style="height: 58px;">
                <div class="input-group-text" style="background-color: #FFFFFF; width: 58px;">
                    <input class="form-check-input" type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}"
                           name="voteItem" ${vote.myVoter3==1?'checked':''} value="${vote.voteItem3}"
                           style="margin: auto;font-size: 20px;">
                </div>
                <input type="text" class="form-control" value="${vote.voteItem3} " disabled
                       style="background-color: #FFFFFF; border-right: 0;">
                <div class="input-group-text" style="border-left: 0;background-color: #FFFFFF;">
                    <div class="voteBadge ${vote.hideVoteCheck=='1'?'':'listVoter'}" id="${vote.voteItem3}">
                            ${vote.voter3}
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty vote.voteItem4}">
            <div class="input-group mb-3" style="height: 58px;">
                <div class="input-group-text" style="background-color: #FFFFFF; width: 58px;">
                    <input class="form-check-input" type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}"
                           name="voteItem" ${vote.myVoter4==1?'checked':''} value="${vote.voteItem4}"
                           style="margin: auto;font-size: 20px;">
                </div>
                <input type="text" class="form-control" value="${vote.voteItem4} " disabled
                       style="background-color: #FFFFFF; border-right: 0;">
                <div class="input-group-text" style="border-left: 0;background-color: #FFFFFF;">
                    <div class="voteBadge ${vote.hideVoteCheck=='1'?'':'listVoter'}" id="${vote.voteItem4}">
                            ${vote.voter4}
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty vote.voteItem5}">
            <div class="input-group mb-3" style="height: 58px;">
                <div class="input-group-text" style="background-color: #FFFFFF; width: 58px;">
                    <input class="form-check-input" type="${vote.multiVoteCheck=='1'?'checkbox':'radio'}"
                           name="voteItem" ${vote.myVoter5==1?'checked':''} value="${vote.voteItem5}"
                           style="margin: auto;font-size: 20px;">
                </div>
                <input type="text" class="form-control" value="${vote.voteItem5} " disabled
                       style="background-color: #FFFFFF; border-right: 0;">
                <div class="input-group-text" style="border-left: 0;background-color: #FFFFFF;">
                    <div class="voteBadge ${vote.hideVoteCheck=='1'?'':'listVoter'}" id="${vote.voteItem5}">
                            ${vote.voter5}
                    </div>
                </div>
            </div>
        </c:if>

    </form>
</div>
<div class="modal-footer" style="display: block; text-align: center">
    <c:if test="${vote.endCheck=='0'}">
        <button type="button" class="btn btn-primary updateVoter" ${vote.voterCheck==1?'style="display : none"':''}>투표하기
        </button>
    </c:if>
<c:if test="${vote.endCheck=='0'}">
    <button type="button" class="btn btn-primary updateVoterCheck" ${vote.voterCheck==1?'':'style="display : none"'}>다시 투표하기
    </button>
</c:if>
<c:if test="${vote.voteMasterId==user.userId&&vote.endCheck=='0'}">
    <button type="button" class="btn btn-primary updateVote" data-bs-target="#updateVote" data-bs-toggle="modal">투표 수정
    </button>
</c:if>
    <c:if test="${vote.voteMasterId==user.userId&&vote.endCheck=='0'}">
    <button type="button" class="btn btn-primary endVote">투표 마감
    </button>
    </c:if>
    <c:if test="${vote.voteMasterId==user.userId}">
    <button type="button" class="btn btn-primary deleteVote">투표 삭제
    </button>
    </c:if>
</div>

<div id="listVoter" title="Basic dialog" class="speech-bubble" style="display: none;z-index: 1500;padding: 10px;">
    <div class="voters" style="background-color: #FFFFFF;border-radius: 5px;padding-top: 5px;padding-bottom: 5px;"></div>
</div>

<style>
    #getVote .voteBadge{
        border: 1px solid #FF0000; border-radius: 50%; width: 26px; height: 26px;background-color: #FF0000;cursor: default;color: #FFFFFF;font-weight: bold;
    }

    .speech-bubble {
        position: relative;
        background: #f8cd07;
        border-radius: .4em;
    }

    .speech-bubble:after {
        content: '';
        position: absolute;
        left: 0;
        top: 50%;
        width: 0;
        height: 0;
        border: 20px solid transparent;
        border-right-color: #f8cd07;
        border-left: 0;
        margin-top: -20px;
        margin-left: -20px;
    }
</style>