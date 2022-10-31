<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/resources/css/jquery.datetimepicker.min.css">
<script src="/resources/OpenSource/js/jquery.datetimepicker.full.min.js"></script>
<script>
    $(function () {
        $('#updateVote input').prop('autocomplete','off')
        $("#updateVote .voteItem").off('change').on("change", function () {
            // alert($(this).val()==="")
            // var id = $(this).attr("id")
            if ($(this).val() === "") {
                $(this).attr("name", "")
            } else {
                $(this).attr("name", $(this).attr("id"))
            }
            // alert($(this).attr("name"))
        })

        //투표 수정
        $("#updateVote .updateVote").off('click').on("click", function () {
            // $("#addVoteForm").attr("action", "/club/addVote").attr("method", "post").submit();
            const data = $('#updateVote #updateVoteForm').serialize()

            $.ajax({
                url : "/club/updateVote",
                'data' : data,
                method : 'post',
                success : function(re){
                    $('#getVote .modal-content').html(re)
                    alert('투표가 수정되었습니다!')
                    $('#updateVote').modal('hide')
                    $('#getVote').modal('show')
                }
            })
        })


        //마감시간 설정
        $("#updateVote .endDatePicker").datetimepicker()
        $('#updateVote input[name="endDateCheck"]').off('click').on("click", function () {
            // console.log($(this).prop('checked'))
            $("#updateVote .endDate").slideToggle('fast')
            if ($(this).prop('checked')) {
                $("#updateVote .endDatePicker").prop('disabled', false)
            } else {
                $("#updateVote .endDatePicker").prop('disabled', true)
            }
        })

        //투표항목 추가
        var nextVote = $('#updateVote .voteItem[name]').length+1
        if(nextVote<6){
            $('#updateVote #appendVote').off('click').on('click',function(){
                $('#voteItem'+(nextVote++)).parent().parent().slideDown('fast')
                if(nextVote === 6){
                    $(this).off('click').parent().slideUp('fast')
                }
            })
        }

    })
</script>


<div class="modal-header">
    <a class="navbar-brand back-btn" data-bs-target="#getVote" data-bs-toggle="modal">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left"
             viewBox="0 0 16 16">
            <path fill-rule="evenodd"
                  d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
            <path fill-rule="evenodd"
                  d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
        </svg>
    </a>
    <h5 class="modal-title">투표 수정</h5>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <form id="updateVoteForm">
        <input type="hidden" name="roomId" value="${roomId}">
        <input type="hidden" name="voteNum" value="${vote.voteNum}">

        <div class="input-group mb-3">
            <div class="form-floating">
                <input type="text" class="form-control" id="voteTitle" name="voteTitle"
                       placeholder="제목"
                       value="${vote.voteTitle}" required>
                <label for="voteTitle">제목</label>
            </div>
        </div>

        <div class="input-group mb-3">
            <div class="form-floating">
                <input type="text" class="form-control" id="voteText" name="voteText"
                       placeholder="내용"
                       value="${vote.voteText}" required>
                <label for="voteText">내용</label>
            </div>
        </div>
        <div class="input-group mb-3">
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem1"
                       placeholder="항목" ${empty vote.voteItem1?'':'name="voteItem1"'}
                       value="${vote.voteItem1}" required>
                <label for="voteItem1">항목</label>
            </div>
        </div>

        <div class="input-group mb-3" ${empty vote.voteItem2?'style="display: none;"':''}>
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem2"
                       placeholder="항목" ${empty vote.voteItem2?'':'name="voteItem2"'}
                       value="${vote.voteItem2}" required>
                <label for="voteItem2">항목</label>
            </div>
        </div>

        <div class="input-group mb-3" ${empty vote.voteItem3?'style="display: none;"':''}>
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem3"
                       placeholder="항목" ${empty vote.voteItem3?'':'name="voteItem3"'}
                       value="${vote.voteItem3}" required>
                <label for="voteItem3">항목</label>
            </div>
        </div>

        <div class="input-group mb-3" ${empty vote.voteItem4?'style="display: none;"':''}>
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem4"
                       placeholder="항목" ${empty vote.voteItem4?'':'name="voteItem4"'}
                       value="${vote.voteItem4}" required>
                <label for="voteItem4">항목</label>
            </div>
        </div>

        <div class="input-group" ${empty vote.voteItem5?'style="display: none;"':''}>
            <div class="form-floating">
                <input type="text" class="form-control voteItem" id="voteItem5"
                       placeholder="항목" ${empty vote.voteItem5?'':'name="voteItem5"'}
                       value="${vote.voteItem5}" required>
                <label for="voteItem5">항목</label>
            </div>
        </div>

        <div class="input-group">
            <button class="btn btn-outline-secondary" type="button" id="appendVote" style="width: 100%; height: 58px;font-size: 29px;">+</button>
        </div>

        <div class="input-group mb-3" style="margin-top: 10px;">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="multiVoteCheck"
                       value="1" ${vote.multiVoteCheck=='1'?'checked':''}
                       name="multiVoteCheck">
                <label class="form-check-label"
                       for="multiVoteCheck">중복 선택 가능</label>
            </div>
        </div>
        <div class="input-group mb-3">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="hideVoteCheck"
                       value="1" ${vote.hideVoteCheck=='1'?'checked':''}
                       name="hideVoteCheck">
                <label class="form-check-label"
                       for="hideVoteCheck">익명 투표</label>
            </div>
        </div>
        <div class="input-group mb-3">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="endDateCheck"
                       value="1" ${vote.endDateCheck=='1'?'checked':''}
                       name="endDateCheck">
                <label class="form-check-label"
                       for="endDateCheck">마감시간 설정</label>
            </div>
        </div>

        <div class="endDate" ${vote.endDateCheck=='1'?'':'style="display: none"'}>
            <div class="input-group mb-3">
                <div class="form-floating">
                    <input type="text" class="form-control endDatePicker" id="endDate" name="endDate"
                           placeholder="마감시간"
                           value="${vote.endDate}" required ${vote.endDateCheck=='1'?'':'disabled'}>
                    <label for="endDate">마감시간</label>
                </div>
            </div>
        </div>

    </form>
</div>
<div class="modal-footer" style="display: block; text-align: center">
    <button type="button" class="btn btn-primary updateVote">투표 수정
    </button>
</div>