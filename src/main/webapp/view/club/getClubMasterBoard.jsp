<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script>
        $(function(){
            $("#getClubMasterBoard .updateClubMasterBoard").on("click",function(){
                <%--location.href="/club/updateClubMasterBoard/${clubMasterBoard.boardNum}"--%>
                <%--$('#updateClubMasterBoard .modal-content').load("/club/updateClubMasterBoard/${clubMasterBoard.boardNum}")--%>
                $.ajax({
                    url : "/club/updateClubMasterBoard/${clubMasterBoard.boardNum}",
                    success : function(re){
                        $('#updateClubMasterBoard .modal-content').html(re)
                    }
                })
            })
            $(".deleteClubMasterBoard").on("click",function(){
                location.href="/club/deleteClubMasterBoard/${clubMasterBoard.boardNum}/${clubMasterBoard.clubNum}"
            })
        })
    </script>


<div class="modal-header">
    <h1 class="modal-title fs-5">${clubMasterBoard.title}</h1>
    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
</div>
<div class="modal-body">

    <c:forEach items="${clubMasterBoard.files}" var="i">
        <img src="/resources/${i.fileName}" alt="모임 공지사항"><br>
        <br>
    </c:forEach>

    <div>
        ${clubMasterBoard}
    </div>

</div>
<div class="modal-footer" style="display: block">
    <button type="button" class="btn btn-primary updateClubMasterBoard" data-bs-toggle="modal" data-bs-target="#updateClubMasterBoard">수정
    </button>
    <button type="button" class="btn btn-primary deleteClubMasterBoard">삭제
    </button>
</div>