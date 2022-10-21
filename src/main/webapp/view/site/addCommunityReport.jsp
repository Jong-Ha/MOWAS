<%--
  Created by IntelliJ IDEA.
  Date: 2022-10-12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Add Community Report</title>
  <!-- include libraries(jQuery, bootstrap) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

  <!--  ///////////////////////// CSS ////////////////////////// -->
  <style>
    body {
      padding-top: 50px;
    }
    .wap {
      width: 700px;
      font-size: 0.9em;
    }
    .check {
      height: 20px;
      width: 35px;
    }
  </style>

    <script type="text/javascript">
      $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $( ".submit" ).on("click" , function() {
            //Controller
            //$("form").attr("method" , "POST").attr("action" , "/site/addCommunityReport").submit();

            //RestController - ajax 사용
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
                dataType: "text",
                contentType: "application/json; charset=UTF-8",
                success: function(result) {
                    alert(result);
                }
            });
        });
      });

      $(function() {
        //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("a[href='#' ]").on("click" , function() {
          $("form")[0].reset();
        });
      });

    </script>


</head>
<body>

  <form>
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

        <!--
            <hr/>


              <div class="row">
                <div class="col-xs-4 col-xs-2 ">
                  <strong> 파 일
                    <input id="file" type="file" multiple class="file" value="파일 첨부">
                  </strong>
                </div>
              </div>
        -->
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

</body>
</html>
