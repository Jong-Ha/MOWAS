<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/css/jquery.datetimepicker.min.css">
<script src="/resources/OpenSource/js/jquery.datetimepicker.full.min.js"></script>
<script>
    $(function () {
        $('#addVote input').prop('autocomplete','off')
        $("#addVote .voteItem").off('change').on("change", function () {
            // alert($(this).val()==="")
            // var id = $(this).attr("id")
            if ($(this).val() === "") {
                $(this).attr("name", "")
            } else {
                $(this).attr("name", $(this).attr("id"))
            }
            // alert($(this).attr("name"))
        })

        //투표 등록
        $("#addVote .addVote").off('click').on("click", function () {
            // $("#addVoteForm").attr("action", "/club/addVote").attr("method", "post").submit();
            const data = $('#addVote #addVoteForm').serialize()

            $.ajax({
                url : '/club/addVote',
                'data' : data,
                method : 'post',
                success : function(re){
                    $('#listVote .modal-content').html(re)
                    Swal.fire('투표가 등록되었습니다!').then(()=>{
                        $('#addVote').modal('hide')
                        $('#listVote').modal('show')
                    })

                    let msg ='"'+$('#addVote #addVoteForm #voteTitle').val()+'" 투표가 등록되었습니다!'
                    if($('#addVote #addVoteForm #endDateCheck').prop('checked')){
                        msg+='<br>마감기한은 '+$('#addVote #addVoteForm #endDate').val()+'까지 입니다!'
                    }

                    const data = {
                        name: '${user.userId}',
                        msg: msg,
                        userImage: '${user.userImage}'
                    }
                    //Server에 socket.on으로 data정보를 전달
                    chatSocket.emit("chatting", data)

                }
            })
        })


        //마감시간 설정
        $("#addVote .endDatePicker").datetimepicker()
        $('#addVote input[name="endDateCheck"]').off('click').on("click", function () {
            // console.log($(this).prop('checked'))
            $("#addVote .endDate").slideToggle('fast')
            if ($(this).prop('checked')) {
                $("#addVote .endDatePicker").prop('disabled', false)
            } else {
                $("#addVote .endDatePicker").prop('disabled', true)
            }
        })

        //투표항목 추가
        var nextVote = 3
        $('#addVote #appendVote').off('click').on('click',function(){
            $('#voteItem'+(nextVote++)).parent().parent().slideDown('fast')
            if(nextVote === 6){
                $(this).off('click').parent().slideUp('fast')
            }
        })
    })
</script>


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
    <h5 class="modal-title">투표 등록</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <form id="addVoteForm">
            <input type="hidden" name="roomId" value="${roomId}">
            <input type="hidden" name="voteMasterId" value="${user.userId}">

        <div class="input-group mb-3">
            <div class="form-floating">
                <input type="text" class="form-control" id="voteTitle" name="voteTitle"
                       placeholder="제목"
                       value="" required>
                <label for="voteTitle">제목</label>
            </div>
        </div>

        <div class="input-group mb-3">
            <div class="form-floating">
                <input type="text" class="form-control" id="voteText" name="voteText"
                       placeholder="내용"
                       value="" required>
                <label for="voteText">내용</label>
            </div>
        </div>
        <div class="input-group mb-3">
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem1"
                       placeholder="항목"
                       value="" required>
                <label for="voteItem1">항목</label>
            </div>
        </div>

        <div class="input-group mb-3">
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem2"
                       placeholder="항목"
                       value="" required>
                <label for="voteItem2">항목</label>
            </div>
        </div>

        <div class="input-group mb-3" style="display: none">
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem3"
                       placeholder="항목"
                       value="" required>
                <label for="voteItem3">항목</label>
            </div>
        </div>

        <div class="input-group mb-3" style="display: none">
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem4"
                       placeholder="항목"
                       value="" required>
                <label for="voteItem4">항목</label>
            </div>
        </div>

        <div class="input-group" style="display: none;">
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem5"
                       placeholder="항목"
                       value="" required>
                <label for="voteItem5">항목</label>
            </div>
        </div>

        <div class="input-group">
            <button class="btn btn-outline-secondary" type="button" id="appendVote" style="width: 100%; height: 58px;font-size: 29px;">+</button>
        </div>

        <div class="input-group mb-3" style="margin-top: 10px;">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="multiVoteCheck"
                       value="1"
                       name="multiVoteCheck">
                <label class="form-check-label"
                       for="multiVoteCheck">중복 선택 가능</label>
            </div>
        </div>
        <div class="input-group mb-3">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="hideVoteCheck"
                       value="1"
                       name="hideVoteCheck">
                <label class="form-check-label"
                       for="hideVoteCheck">익명 투표</label>
            </div>
</div>
        <div class="input-group mb-3">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="endDateCheck"
                       value="1"
                       name="endDateCheck">
                <label class="form-check-label"
                       for="endDateCheck">마감시간 설정</label>
            </div>
</div>

        <div class="endDate" style="display: none">
            <div class="input-group mb-3">
                <div class="form-floating">
                    <input type="text" class="form-control endDatePicker" id="endDate" name="endDate"
                           placeholder="마감시간"
                           value="" required disabled>
                    <label for="endDate">마감시간</label>
                </div>
            </div>
        </div>

    </form>
</div>
<div class="modal-footer" style="display: block; text-align: center">
    <button type="button" class="btn btn-primary addVote">투표 등록
    </button>
</div>