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
                    $('.listClubMasterBoardView').click()
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
        var deleteFiles = $("#updateClubMasterBoard .deleteFile")

        deleteFiles.off('click').on("click", function () {
            $(this).css('display','none')
            var size = $("#updateClubMasterBoardForm #fileSize");
            size.parent().append('<input type="hidden" name="deleteFileName" value="' + $(this).parents('.clubMasterBoardFiles').attr('id') + '">')
            $(this).parents('.clubMasterBoardFiles').slideUp('slow')
            size.val(size.val() - 1)
        })

        deleteFiles.on('mouseenter',function(){
            $(this).addClass('bg-danger')
        })

        deleteFiles.on('mouseleave',function(){
            $(this).removeClass('bg-danger')
        })

    })
</script>

<div class="modal-header">
    <a class="navbar-brand back-btn" data-bs-target="#getClubMasterBoard" data-bs-toggle="modal">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
        </svg>
    </a>
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

        <div class="mb-3">
            <label for="clubMasterBoardFile" class="form-label" style="display: none"></label>
            <input class="form-control" type="file" id="clubMasterBoardFile" multiple name="file">
        </div>

        <div>
            <c:forEach items="${clubMasterBoard.files}" var="i">
                <div class="clubMasterBoardFiles" id="${i.fileName}"
                     style="margin: 20px 0 30px 0;">

                    <button type="button" class="btn position-relative updateImgBox"
                            style="width: 90%; border: 1px #000 solid; border-radius: 5px; cursor: default">

                        <img src="/resources/${i.fileName}" alt="모임 공지사항 파일"
                             style="object-fit: contain;height: 99%;width: 99%;border-radius: 10px;">
                        <span class="position-absolute top-0 start-100 translate-middle border border-danger rounded-circle deleteFile" style="cursor:pointer; background-color: #FFFFFF">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16" style="font-size: 40px;">
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg>
  </span>
                    </button>
                </div>
            </c:forEach>
        </div>

    </form>
</div>
<div class="modal-footer" style="display: block">
    <button type="button" class="btn btn-primary updateClubMasterBoard">수정
    </button>
</div>