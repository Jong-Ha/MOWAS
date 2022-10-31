<%--
  Created by IntelliJ IDEA.
  Date: 2022-10-12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

  <!--  ///////////////////////// CSS ////////////////////////// -->
  <style>
    body {
      padding-top: 50px;
    }

  </style>

    <script type="text/javascript">
      $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)


        $( ".addCR" ).on("click" , function() {

            //Controller
            $("form[id='addCommuForm']").attr("method" , "POST").attr("action" , "/site/addCommunityReport").submit();


            //RestController - ajax 사용

            /*
            var boardCategory = $(".boardCategory").val();
            var boardNo = $(".boardNo").val();
            var reportedId = $(".reportedId").val();
            var reportId = $(".reportId").val();
            var reportBasis = $(".reportBasis").val();
            var reportText = $(".reportText").val();

            $.ajax({
                url: "/site/json/addCommunityReport",
                method: "POST",
                data: JSON.stringify({
                    "boardNo": boardNo,
                    "boardCategory": boardCategory,
                    "reportedId": reportedId,
                    "reportId": reportId,
                    "reportBasis": reportBasis,
                    "reportText": reportText
                }),
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function(result) {

                    alert(result);

                    $("#commuReport").modal("hide");
                }
            });
            */
        });
     });


/*      $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("a[href='#' ]").on("click" , function() {
          $("form")[0].reset();
        });
      });*/

    </script>
    <div class="modal-header" >
       <h3 class="modal-title text-danger fs-5" id="addCommuLabel">커뮤니티 신고</h3>
       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
       <form id="addCommuForm" enctype="multipart/form-data">

       <input type="hidden" class= "boardNo" name="boardNo" value="${param.boardNum}">
       <input type="hidden" class= "boardCategory" name="boardCategory" value="${param.boardCategory}">
       <input type="hidden" class= "reportedId" name="reportedId" value="${param.reportedId}">
       <input type="hidden" class= "reportId" name="reportId" value="${user.userId}">

       <div class="input-group mb-3 mt-3">
       <div class="form-floating" >
       <select class="form-select reportBasis" id="reportBasis" name="reportBasis" required>
           <option value="0" selected>선택하세요</option>
           <option value="1">욕설</option>
           <option value="2">음담패설</option>
           <option value="3">도용</option>
           <option value="4">무단불참</option>
           <option value="5">연락두절</option>
           <option value="6">정치적발언</option>
       </select>
           <label for="reportBasis">카테고리</label>
       </div>
       </div>

       <div class="input-group mb-3 mt-3">
          <div class="form-floating">
             <input type="text" class="form-control reportText" id=reportText name="reportText" placeholder="상세신고내용"
                      required>
             <label for="reportText">상세신고내용</label>
          </div>
        </div>

       <div class="mb-3 mt-3">
             <label for="file" class="form-label" style="display: none"></label>
             <input class="form-control" type="file" id="file" name="file">
       </div>

       </form>
       </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-danger addCR"  style="margin-right: 185px">신 고</button>
       </div>


 <%-- <form>
    <div class="wap">
      <div class="container">
    <!--<form class="form-horizontal" name="detailForm">-->
        <input type="hidden" class= "boardNo" name="boardNo" value="${communityReport.boardNo}">
        <input type="hidden" class= "boardCategory" name="boardCategory" value="${communityReport.boardCategory}">
        <input type="hidden" class= "reportId" name="reportId" value="${communityReport.reportId}">
        <input type="hidden" class= "reportedId" name="reportedId" value="${communityReport.reportedId}">


          보드 번호 : ${communityReport.boardNo}<br>
          보드 카테고리 :${communityReport.boardCategory}<br>
          신고한 ID : ${communityReport.reportId}<br>
          신고받은 ID : ${communityReport.reportedId}<br>

        <div class="page-header">
          <h3 class=" text-info">커뮤니티 신고 작성</h3>
        </div>

        <hr/>
           <h6>신고 기준 선택</h6>

          <ul>

              <input type="radio" id="f-option" class = "reportBasis" name="reportBasis" value = '1'>
              <label for="f-option">욕설</label>

              <div class="check"></div>

              <input type="radio" id="s-option" class = "reportBasis" name="reportBasis" value = '2'>
              <label for="s-option">음담패설</label>

              <div class="check"><div class="inside"></div></div>

              <input type="radio" id="t-option" class = "reportBasis" name="reportBasis" value = '3'>
              <label for="t-option">도용</label>

              <div class="check"><div class="inside"></div></div>

              <input type="radio" id="a-option" class = "reportBasis" name="reportBasis" value = '4'>
              <label for="t-option">무단불참</label>

              <div class="check"><div class="inside"></div></div>

              <input type="radio" id="c-option" class = "reportBasis" name="reportBasis" value = '5'>
              <label for="t-option">연락두절</label>

              <div class="check"><div class="inside"></div></div>

              <input type="radio" id="p-option" class = "reportBasis" name="reportBasis" value = '6'>
              <label for="t-option">정치적발언</label>

              <div class="check"><div class="inside"></div></div>

          </ul>
        </div>
      <hr/>

      <div class="row">
        <div class="col-xs-4 col-xs-2"><strong> 신고 내용</strong></div>
        <div class="col-xs-8 col-xs-4">
                    <textarea class="form-control reportText" class = "reportText" name="reportText"
                              style=" height: 200px;  width: 500px; margin-left: 10px; margin-bottom: 20px;"></textarea>
        </div>
      </div>

      <hr/>

      <div class="row">

  <div class="col-md-12 text-center ">
    <button type="button" class="btn btn-primary btn-lg submit" >등 록</button>
    <a class="btn btn-primary btn" href = "#" role="button">취 소 </a>
  </div>
      </div>

      <br/>
    </div>

    </form>
--%>
