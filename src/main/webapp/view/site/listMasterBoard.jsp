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

  .avatar-xs {
  height: 2.3rem;
  width: 2.3rem;
  }
</style>
  <script type="text/javascript">

    function fncGetMasterBoardList(currentPage) {
      /* 	document.getElementById("currentPage").value = currentPage;
             document.detailForm.submit();	 */
      $("#currentPage").val(currentPage)
      $("form").attr("method" , "POST").attr("action" , "/site/listMasterBoard").submit();
    }


    $(function() {

      //==> 검색 Event 연결처리부분
      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      //==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.

      //$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
      $( "button.btn.btn-default" ).on("click" , function() {
        fncGetMasterBoardList(1);
      });

      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $( ".newMb" ).on("click" , function() {
        $("form").attr("method" , "POST").attr("action" , "/site/addMasterBoard").submit();
        //$(self.location).attr("href", "/site/addMasterBoard");
      });

      $( ".commReport" ).on("click" , function() {

        $(self.location).attr("href", "/site/listCommunityReport");
      });

      $( ".clubReport" ).on("click" , function() {

        $(self.location).attr("href", "/site/listClubReport");
      });

      $( ".clubMap" ).on("click" , function() {

        $(self.location).attr("href", "/view/site/clubMap.jsp");
      });

      //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
      $("a[href='#' ]").on("click" , function() {
        $("form")[0].reset();
      });
    });

  </script>

</head>
<body>
<jsp:include page="/layout/toolbar.jsp"/>
<div class="container">
  <div class="page-header text-info">
    <h3>공지사항</h3>
  </div>

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
    <div class="col-xl-3 col-md-6">
      <div class="card">
        <div class="card-body">
          <form>
            <div class="form-group mb-0">
              <label>Search</label>
              <div class="input-group mb-0">
                <input type="text" class="form-control" placeholder="Search..." aria-describedby="project-search-addon"
                       value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/>
                <div class="input-group-append">
                  <button class="btn btn-danger" type="button" id="project-search-addon"><i class="fa fa-search search-icon font-12"></i></button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- end row -->

  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">
          <div class="table-responsive project-list">
            <table class="table project-table table-centered table-nowrap">
              <thead>
              <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">날짜</th>
                <th scope="col">상세보기</th>
                <th scope="col">Action</th>
              </tr>
              </thead>
              <tbody>
                <c:set var="i" value="0" />
                <c:forEach var="mb" items="${list}">
                <c:set var="i" value="${ i+1 }" />
              <tr>
                  <td>${ i }</td>
                  <td>${mb.mbTitle}
                  <input id="mbNo" type="hidden" value="${mb.masterBoardNo }"/>
                  <%--<c:set var = "now" value="<%=new java.util.Date()%>"/>
                  <c:if test="${mb.mbRegDate}">
                      <span class="new">new</span>
                  </c:if>--%>
                  </td>

                <td>
                  <span class="text-success font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i> ${mb.adminId}</span>
                </td>
                 <td>
                  <p class="mb-0">${mb.mbRegDate}</p>
                </td>

                <td>
                  <a href="/site/getMasterBoard/${mb.masterBoardNo}" class="text-success mr-4" data-toggle="tooltip" data-placement="top" title="" data-original-title="NewMb">
                    <i class="bi bi-file-earmark-text h5 m-0"></i></a>
                </td>

                <td>
                    <a href="#" class="text-success mr-4" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"> <i class="fa fa-pencil h5 m-0"></i></a>
                    <a href="#" class="text-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Close"> <i class="fa fa-remove h5 m-0"></i></a>
                </td>
              </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- end project-list -->
          <div class="col-md-12 text-left ">
            <button type="button" class="addMb btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addMasterBoard">글쓰기</button>
            <%--<button type="button" class="addMb" data-bs-toggle="modal" data-bs-target="#addMasterBoard">--%>
            <a class="btn btn-default btn" href = "#" role="button">취 소 </a>
            <button type="button" class="commReport" >커뮤니티신고</button>
            <button type="button" class="clubReport" >모임신고</button>
            <button type="button" class="clubMap" >클럽맵 Test</button>
          </div>

          <div class="pt-3">
            <ul class="pagination justify-content-end mb-0">
              <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item active"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">Next</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end row -->
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
        <button type="button" class="btn btn-danger newMb" data-bs-dismiss="modal" style="margin-right: 185px">저 장</button>
      </div>
    </div>
  </div>
</div>
<%-- 모달창 끝--%>
</body>
</html>
