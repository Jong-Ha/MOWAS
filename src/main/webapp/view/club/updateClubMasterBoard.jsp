<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function () {
        $("#updateClubMasterBoard .updateClubMasterBoard").on("click", function () {
            // $("form").attr("method","post").attr("action","/club/updateClubMasterBoard").submit()
            const data = new FormData($('#updateClubMasterBoardForm')[0])

            $.ajax({
                url: "/club/updateClubMasterBoard",
                method: 'post',
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                'data': data,
                success: function (re) {
                    alert('공지사항이 수정되었습니다')
                    $('#getClubMasterBoard .modal-content').html(re)
                    $('.getClubMasterBoard').click()
                }
            })

        })

        //파일 갯수 체크
        $("#updateClubMasterBoardForm input:file").on("change", function () {
            if ($(this)[0].files.length > 10 - $('#fileSize').val()) {
                alert('파일 갯수를 초과하였습니다.');
                // alert(10-$('#fileSize').val());
                $(this).val('');
            }
        })

        //파일 삭제 버튼
        $("#updateClubMasterBoard .deleteFile").off('click').on("click", function () {
            var size = $("#updateClubMasterBoardForm #fileSize");
            size.parent().append('<input type="hidden" name="deleteFileName" value="' + $(this).parent().attr('id') + '">')
            $(this).parent().remove()
            size.val(size.val() - 1)
        })
    })
</script>

<div class="modal-header">
    <h1 class="modal-title fs-5">모임 공지사항 수정</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">
    <form id="updateClubMasterBoardForm" enctype="multipart/form-data">
        <input type="hidden" name="boardNum" value="${clubMasterBoard.boardNum}">
        <input type="hidden" id="fileSize" value="${fileSize}">
        <div class="input-group mb-3">
            <div class="form-floating">
                <input type="text" class="form-control" id="title" name="title"
                       placeholder="제목"
                       value="${clubMasterBoard.title}" required>
                <label for="title">제목</label>
            </div>
        </div>

        <div class="input-group mb-3">
            <div class="form-floating">
                                <textarea class="form-control" placeholder="내용" id="text" name="text"
                                          style="height: 200px;">${clubMasterBoard.text}</textarea>
                <label for="text">내용</label>
            </div>
        </div>

        <div>
            <c:forEach items="${clubMasterBoard.files}" var="i">
                <div id="${i.fileName}">
                    <img src="/resources/${i.fileName}" alt="모임 공지사항 파일">
                    <br>
                    <button type="button" class="btn btn-primary deleteFile">삭제
                    </button>
                    <br>
                </div>
            </c:forEach>
        </div>

        <div class="mb-3">
            <label for="clubMasterBoardFile" class="form-label" style="display: none"></label>
            <input class="form-control" type="file" id="clubMasterBoardFile" multiple name="file">
        </div>

    </form>
</div>
<div class="modal-footer" style="display: block">
    <button type="button" class="btn btn-primary updateClubMasterBoard">수정
    </button>
</div>