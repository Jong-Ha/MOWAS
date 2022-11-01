<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-21
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>List MasterBoard</title>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

  <style>

  body{
  background:#f3f3f3;
  margin-top:20px;
  color: #616f80;
  }
  .card {
  border: none;
  margin-bottom: 24px;
  -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
  box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
  }

  .wrapper {
    height: 13ch;
    display: grid;
    place-items: center;
  }

  .typing {
    width: 14ch;
    animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;
    white-space: nowrap;
    overflow: hidden;
    border-right: 3px solid;
    font-size: 2em;
    height: 2ch;
  }
  .mbBox {
    margin-bottom: 50px;
    justify-content: center;
  }
  .underline {
    line-height: 1.2;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, "Apple Color Emoji", Arial, sans-serif, "Segoe UI Emoji", "Segoe UI Symbol";
    font-size: 1.5em;
    font-weight: 700;
    background-image: linear-gradient(transparent calc(100% - 3px), #000 3px);
    background-repeat: no-repeat;
    background-size: 0% 100%;
    transition: background-size 0.2s;
    color: #000;
    cursor: pointer;
    margin-right: 25px;
  }
  @media (min-width: 1000px) {
    .underline {
      font-size: 1.5em;
    }
  }
  .underline.yellow {
    background-image: linear-gradient(transparent 60%, #F8CD07 40%);
  }

  @keyframes typing {
    from {
      width: 0
    }
  }

  @keyframes blink {
    80% {
      border-color: transparent
    }
  }
  .table > thead {
    background-color: #ccd1d3;
  }
  .table > thead > tr > th {
    text-align: center;
  }
  .table-hover > tbody > tr:hover {
    background-color: #edf2f5;
  }
  .table > tbody > tr > td {
    text-align: center;
  }
  .table > tbody > tr > #title {
    text-align: left;
  }

  </style>

  <script type="text/javascript">

    function fncGetList(currentPage) {
      //document.getElementById("currentPage").value = currentPage;
      //document.detailForm.submit();
      $("#currentPage").val(currentPage)
      $("form[id='masterBoard']").attr("method" , "POST").attr("action" , "/site/listMasterBoard").submit();
    }

    $(function() {

      $( ".userMb" ).on("click" , function() {
        $("form[id='masterBdTag1']").attr("method" , "POST").attr("action" , "/site/listMasterBoard").submit();
      });

      $( ".clubMb" ).on("click" , function() {
        $("form[id='masterBdTag2']").attr("method" , "POST").attr("action" , "/site/listMasterBoard").submit();
      });

      $( ".reportMb" ).on("click" , function() {
        $("form[id='masterBdTag3']").attr("method" , "POST").attr("action" , "/site/listMasterBoard").submit();
      });

      //$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
      $( "button.btn.btn-danger" ).on("click" , function() {
        fncGetList(1);
      });

      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( ".newMb" ).on("click" , function() {
        $("form").attr("method" , "POST").attr("action" , "/site/addMasterBoard").submit();
      });

      $(".updateMasterBoard").on("click",function(){

        var masterBdNo = $(this).data('masterbdno')
        var mbCategory = $(this).data('masterbdcate')
        var mbTitle = $(this).data('masterbdtitle')
        var mbText = $(this).data('masterbdText')

        $("#updateMB .modal-content").load("/view/site/updateMasterBoard.jsp",
                {masterBoardNo: masterBdNo, mbCategory: mbCategory, mbTitle: mbTitle, mbText: mbText},
                function (re) {

                  // console.log(re);
                  $("#updateMB .modal-content").html(re);

                  $("#updateMB").modal("show");
                })
      });

      $( "button:contains('수 정')" ).on("click" , function() {
        self.location = "/site/updateMasterBoard/${masterBoard.masterBoardNo }"
      });

      $( "td.masterBdNo" ).on("click" , function() {

        var masterBdNo = $(this).data('masterbdno')

        $.ajax({
            url : "/site/json/getMasterBoard/"+masterBdNo,
            method : "GET",
            dataType : "json",

            success : function(JSONData, status) {
              var displayValue = "<h6>"
                                +"<br>"
                                +""+JSONData.mbText+"<br>"
                                //+"이미지 : "+JSONData.file+"<br>"
                                //+"<img src='/uploadFiles/"+JSONData.file+"'align='absmiddle' class='img-thumbnail'/>"
                                +"<br>"
                                +"</h6>";
              $("h6").remove();
              $("#" + masterBdNo + "").html(displayValue);
            }
        });
      });

    <%--
      $( ".commReport" ).on("click" , function() {

        $(self.location).attr("href", "/site/listCommunityReport");
      });

      $( ".clubReport" ).on("click" , function() {

        $(self.location).attr("href", "/site/listClubReport");
      });

     $( ".clubMap" ).on("click" , function() {
        $(self.location).attr("href", "/view/site/clubMap.jsp");
       alert("click clubMap")
       //resizeMap()
       //relayout()
      });
    --%>
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("a[href='#' ]").on("click" , function() {
        $("form")[0].reset();
      });
    });

  </script>

</head>
<body>
  <jsp:include page="/layout/toolbar.jsp"/>

  <div class="page-header text-center">
    <div class="wrapper">
    <div class="typing">
    <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);">
      공    지    사    항</h4>
    </div>
    </div>
  </div>
  <div class="container">

  <nav class="navbar navbar-expand-lg mbBox">
    <form id = "masterBdTag1">
       <div class="underline yellow userMb">
          <input type="hidden" name="searchCondition" value="${search.searchCondition = "100"}"/>회원
        </div>
    </form>

    <form id = "masterBdTag2">
        <div class="underline yellow clubMb">
          <input type="hidden" name="searchCondition" value="${search.searchCondition = "200"}"/>모임
        </div>
    </form>

    <form id = "masterBdTag3">
        <div class="underline yellow reportMb">
          <input type="hidden" name="searchCondition" value="${search.searchCondition = "300"}"/>신고
      </div>
    </form>
  </nav>

  <hr>
  <div class="row">
    <div class="col-xl-3 col-md-6">
      <div class="card bg-pattern">
        <div class="card-body">
          <div class="float-right">
            <i class="fa fa-archive text-primary h4 ml-3"></i>
          </div>
          <h5 class="font-size-20 mt-0 pt-1">${resultPage.totalCount }</h5>
          <p class="text-muted mb-0">Total Counts</p>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-pattern">
        <div class="card-body">
          <div class="float-right">
            <i class="fa fa-th text-primary h4 ml-3"></i>
          </div>
          <h5 class="font-size-20 mt-0 pt-1">${resultPage.currentPage}</h5>
          <p class="text-muted mb-0">Current Page</p>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-pattern">
        <div class="card-body">
          <div class="float-right">
            <i class="fa fa-file text-primary h4 ml-3"></i>
          </div>
          <h5 class="font-size-20 mt-0 pt-1">${resultPage.maxPage}</h5>
          <p class="text-muted mb-0">Max Page</p>
        </div>
      </div>
    </div>

    <div class="col-xl-3 col-md-6 text-right">
      <div class="card">
        <div class="card-body">
          <form id="masterBoard">
            <div class="form-group">
              <label>Search</label>
              <div class="input-group">
                <select class="form-control" name="searchCondition" >
                  <option value="0"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>제목</option>
                  <option value="1"${!empty search.searchCondition&&search.searchCondition==1 ? "selected":"" }>내용</option>
                </select>
              </div>

              <div class="input-group mb-0">
                <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="Search..." aria-describedby="project-search-addon"
                       value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/>
                <div class="input-group-append">
                  <button class="btn btn-danger" type="button" id="project-search-addon"><i class="fa fa-search search-icon fa-2x font-12"></i></button>
                </div>
              </div>
            <input type="hidden" id="currentPage" name="currentPage" value=""/>
        </div>

  <!-- end row -->
    </form>
   </div>
  </div>
 </div>

    <div class="col-md-12 mb-3 text-left ">
      <c:if test="${user.masterCheck eq 2}">
        <button type="button" class="addMb btn btn-primary" style="background-color: #F8CD07;" data-bs-toggle="modal" data-bs-target="#addMasterBoard">글쓰기</button>
        <%--<button type="button" class="updateMb btn" style="background-color: #F8CD07;" data-bs-toggle="modal" data-bs-target="#updateMasterBoard">수정</button>--%>
        <a class="btn btn-secondary" href = "#" role="button">취 소 </a>
      </c:if>
      <!--test version
      <button type="button" class="commReport" >커뮤니티신고</button>
      <button type="button" class="clubReport" >모임신고</button>
      <button type="button" class="clubMap" data-bs-toggle="modal" data-bs-target="#addMap">클럽맵 Test</button>-->
    </div>

  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">
          <div class="table-responsive project-list">
            <table class="table project-table table-centered table-nowrap table-hover table-striped">
              <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성날짜</th>
                <th scope="col">상세보기</th>
                <c:if test="${user.masterCheck eq 2}">
                <th scope="col">Action</th>
                </c:if>
              </tr>
              </thead>
              <tbody>
                <c:set var="i" value="0" />
                <c:forEach var="mb" items="${list}">
                <c:set var="i" value="${ i+1 }" />
              <tr>
                  <td>${ i }</td>
                  <td>${mb.mbTitle}
                    <span id = "${mb.masterBoardNo}"></span>
                    <input class="masterBdNo" name="masterBdNo" type="hidden" value="${mb.masterBoardNo}">
                    <input id="mbNo" type="hidden" value="${mb.masterBoardNo }"/>
                  </td>

                <td>
                  <span class="text-success font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i> ${mb.adminId}</span>
                </td>
                 <td>
                  <p class="mb-0">${mb.mbRegDate}</p>

                </td>
                <td data-masterbdno="${mb.masterBoardNo}" class="masterBdNo">
                  <span class="text-success mr-4 getMb" data-toggle="tooltip" data-placement="center" title="" data-original-title="NewMb">
                  <i class="fa fa-file-text h5 m-0"></i></span>
                </td>

                <c:if test="${user.masterCheck eq 2}">
                <td>
                  <button data-masterbdno="${mb.masterBoardNo}"
                          data-masterbdcate="${mb.mbCategory}"
                          data-masterbdtitle="${mb.mbTitle}"
                          data-masterbdText="${mb.mbText}"
                          class="btn updateMasterBoard" data-bs-toggle="modal"
                          data-bs-target="#updateMasterBoard">
                    <i class="fa fa-pencil h5 m-0"></i>
                  </button>
                    <%--<a href="#" class="text-success mr-4" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"> <i class="fa fa-pencil h5 m-0"></i></a>--%>
                    <a href="#" class="text-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Close"> <i class="fa fa-remove h5 m-0"></i></a>
                </td>
                </c:if>

              </tr>
              </c:forEach>

              </tbody>
            </table>
          </div>

          <!-- end project-list -->
            <div class="pt-3">
            <ul class="pagination justify-content-end mb-0">
              <!--  <<== 좌측 nav -->
            <c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
              <li class="page-item disabled">
            </c:if>
            <c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
              <li class="page-item">
            </c:if>
                <a class="page-link" href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-disabled="true" aria-label="Previous">
                  <span aria-hidden="true">Previous</span></a>
              </li>

          <!--  중앙  -->
          <c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
            <c:if test="${ resultPage.currentPage == i }">
              <li class="page-item active">
                <a class="page-link" href="javascript:fncGetList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
              </li>
            </c:if>

            <c:if test="${resultPage.currentPage != i}">
              <li class="page-item">
                <a class="page-link" href="javascript:fncGetList('${ i }');">${ i }</a>
              </li>
            </c:if>
          </c:forEach>

              <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
                <li class= "page-item disabled">
              </c:if>
              <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
                <li class= "page-item">
              </c:if>
                <a class="page-link" href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-disabled="true" aria-label="Next">
                  <span aria-hidden="true">Next</span></a>
              </li>

            </ul>
          </div>

        </div>
      </div>
    </div>
  </div>
  <%-- end row --%>
</div>


<div class="modal fade" id="updateMB" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
    </div>
  </div>
</div>

<%-- 모달창 시작--%>
<div class="modal model-center fade" id="addMasterBoard" tabindex="-1" aria-labelledby="addMbLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header" >
        <h3 class="modal-title text-danger fs-5" id="addMbLabel">공지사항 작성</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="addMbForm" enctype="multipart/form-data">
          <div class="input-group mb-3 mt-3">
            <div class="form-floating">
              <input type="text" class="form-control " id="mbTitle" name="mbTitle" placeholder="제목"
                     required>
              <label for="mbTitle">제목</label>
            </div>
          </div>

          <div class="input-group mb-3 mt-3">
            <div class="form-floating">
              <select class="form-select" id="mbCategory" name="mbCategory" required>
                <option value="0" selected>선택하세요</option>
                <option value="1">회원</option>
                <option value="2">모임</option>
                <option value="3">신고</option>
              </select>
              <label for="mbCategory">카테고리</label>
            </div>
          </div>

          <div class="input-group mb-3 mt-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="mbText" name="mbText" placeholder="상세내용"
                     required>
              <label for="mbText">상세내용</label>
            </div>
          </div>

          <div class="mb-3 mt-3">
            <label for="file" class="form-label" style="display: none"></label>
            <input class="form-control" type="file" id="file" name="file">
          </div>

        </form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-danger newMb" data-bs-dismiss="modal">저 장</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
      </div>

    </div>
  </div>
</div>
<%--Add Modal 창 시작--%>
</body>
</html>
