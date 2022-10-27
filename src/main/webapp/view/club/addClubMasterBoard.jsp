<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script>
        $(function(){
            $("#addClubMasterBoard .addClubMasterBoard").on("click",function(){
                const data = new FormData($('#addClubMasterBoardForm')[0])

                $.ajax({
                    url: "/club/addClubMasterBoard",
                    method: 'post',
                    enctype: 'multipart/form-data',
                    processData: false,
                    contentType: false,
                    'data': data,
                    success: function (re) {
                        alert('공지사항이 등록되었습니다')
                        // $('#addClubMasterBoard .btn-close').click()
                        $('.listClubMasterBoardView').click()
                        $('#getClubMasterBoard .modal-content').html(re)
                        $('.getClubMasterBoard').click()
                    }
                })
            })

            $("#addClubMasterBoard input:file").on("change",function(){
                if($(this)[0].files.length>10){
                    alert('파일 갯수를 초과하였습니다.');
                    $(this).val('');
                }
            })
        })
    </script>
<div class="modal-header">
    <h1 class="modal-title fs-5">모임 공지사항 작성</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <form id="addClubMasterBoardForm" enctype="multipart/form-data">
        <input type="hidden" name="clubNum" value="${clubNum}">
        <input type="hidden" name="userId" value="${user.userId}">
        <div class="input-group mb-3">
            <div class="form-floating">
                <input type="text" class="form-control" id="title" name="title"
                       placeholder="제목"
                       value="" required>
                <label for="title">제목</label>
            </div>
        </div>

        <div class="input-group mb-3">
            <div class="form-floating">
                                <textarea class="form-control" placeholder="내용" id="text" name="text"
                                          style="height: 200px;"></textarea>
                <label for="text">내용</label>
            </div>
        </div>

        <div class="mb-3">
            <label for="clubMasterBoardFile" class="form-label" style="display: none"></label>
            <input class="form-control" type="file" id="clubMasterBoardFile" multiple name="file">
        </div>

    </form>
</div>
<div class="modal-footer" style="display: block">
    <button type="button" class="btn btn-primary addClubMasterBoard">작성
    </button>
</div>