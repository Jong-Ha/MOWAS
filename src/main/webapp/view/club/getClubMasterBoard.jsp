<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script>
        $(function(){
            $("#getClubMasterBoard .updateClubMasterBoard").off('click').on("click",function(){
                <%--location.href="/club/updateClubMasterBoard/${clubMasterBoard.boardNum}"--%>
                <%--$('#updateClubMasterBoard .modal-content').load("/club/updateClubMasterBoard/${clubMasterBoard.boardNum}")--%>
                $.ajax({
                    url : "/club/updateClubMasterBoard/${clubMasterBoard.boardNum}",
                    success : function(re){
                        $('#updateClubMasterBoard .modal-content').html(re)
                    }
                })
            })

            $('#updateClubMasterBoard').off('shown.bs.modal').on('shown.bs.modal',function(){
                $('#updateClubMasterBoard .updateImgBox').height($('#updateClubMasterBoard .updateImgBox').width())
            })

            $(".deleteClubMasterBoard").off('click').on("click",function(){
                <%--location.href="/club/deleteClubMasterBoard/${clubMasterBoard.boardNum}/${clubMasterBoard.clubNum}"--%>
                if(confirm('진짜로 삭제?')){
                    $.ajax({
                        url : "/club/deleteClubMasterBoard/${clubMasterBoard.boardNum}/${clubMasterBoard.clubNum}",
                        success : function(re){
                            $('#ClubBoard').html(re)
                            $('#getClubMasterBoard').modal('hide')
                        }
                    })
                }
            })
        })
    </script>


<div class="modal-header">
    <b class="modal-title fs-5" style="text-align: left">${clubMasterBoard.title}</b>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">

    <div style="display: flex;justify-content: space-between;font-size: 18px;border: 1px solid rgba(0, 0, 0, 0.175);padding: 10px;border-radius: 10px;align-items: baseline;background-color: #00000003">
        <div>작성자 : ${clubMasterBoard.userId}</div>
        <div style="font-size: 15px;">${clubMasterBoard.regDate}</div>
    </div>

    <c:forEach items="${clubMasterBoard.files}" var="i">
        <img src="/resources/${i.fileName}" alt="모임 공지사항"><br>
        <br>
    </c:forEach>

</div>
<div class="modal-footer" style="display: block">
    <button type="button" class="btn btn-primary updateClubMasterBoard" data-bs-toggle="modal" data-bs-target="#updateClubMasterBoard">수정
    </button>
    <button type="button" class="btn btn-primary deleteClubMasterBoard">삭제
    </button>
</div>