
<%--
  Created by IntelliJ IDEA.
  User: 903-8
  Date: 2022-10-12
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>MOWAS</title>
    <!-- Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>

        body{
            background:#f3f3f3;
            margin-top:20px;
            color: #616f80;
        }

        #list {
            text-align: center;
        }

        #write {
            text-align: right;
        }

        /* Bootstrap 수정 */
        .table > thead {
            background-color: #AF7AC5 ;
        }
        .table > thead > tr > th {
            text-align: center;
        }
        .table-hover > tbody > tr:hover {
            background-color: #EBDEF0;
        }
        .table > tbody > tr > td {
            text-align: center;
        }
        .table > tbody > tr > #title {
            text-align: left;
        }

        div > #paging {
            text-align: center;
        }

        .hit {
            animation-name: blink;
            animation-duration: 1.5s;
            animation-timing-function: ease;
            animation-iteration-count: infinite;
            /* 위 속성들을 한 줄로 표기하기 */
            /* -webkit-animation: blink 1.5s ease infinite; */
        }

        /* 애니메이션 지점 설정하기 */
        /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
        @keyframes blink {
            from {color: white;}
            30% {color: yellow;}
            to {color: red; font-weight: bold;}
            /* 0% {color:white;}
            30% {color: yellow;}
            100% {color:red; font-weight: bold;} */
        }

        .wrapper {
            height: 13ch;
            display: grid;
            place-items: center;
        }

        .typing {
            width: 11ch;
            animation: typing 0.9s steps(22), blink .5s step-end infinite alternate;
            white-space: nowrap;
            overflow: hidden;
            border-right: 3px solid;
            font-size: 2em;
            height: 2ch;
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

        .card {
            border: 0;
        }

        .card-body{
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        function fncGetList(currentPage) {
            /* 	document.getElementById("currentPage").value = currentPage;
                   document.detailForm.submit();	 */
            $("#currentPage").val(currentPage)
            <%--$("form[id='clubReport']").attr("method" , "POST").attr("action" , "/site/listClubReport?clubNum=${param.clubNum}").submit();--%>
            $("form[id='clubReport']").attr("method" , "POST").attr("action" , "/site/listClubReport").submit();
        }


        $(function() {

            //==> 검색 Event 연결처리부분
            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            //==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.

            //$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
            $( "button.btn.btn-danger" ).on("click" , function() {
                fncGetList(1);
            });

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $( ".addCR" ).on("click" , function() {
               $("form").attr("method" , "POST").attr("action" , "/site/addClubReport").submit();
            });

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $("a[href='#' ]").on("click" , function() {
                $("form")[0].reset();
            });
        });

    </script>

</head>

<body class="p-3 m-0 border-0 bd-example" style="text-align: -webkit-center">
<jsp:include page="/layout/toolbar.jsp"/>

    <div class="page-header text-center">
     <div class="wrapper">
      <div class="typing">
         <h4 style="font-weight: bolder; margin-bottom: 50px; font-size: 2rem;
                    background-image: linear-gradient(transparent 60%, #F8CD07 40%);color: #000000;">
        모  임   신  고 </h4>
    </div>
    </div>
    </div>

    <hr>
    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
    <div class="container">
        <div class="row" style="margin-bottom: 24px;">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-pattern" style="height: 100%;">
                    <div class="card-body">
                        <div class="float-right">
                            <i class="fa fa-archive text-primary h4 ml-3" style="font-size: 1.5rem;"></i>
                        </div>
                        <h5 class="font-size-20 mt-0 pt-1">${resultPage.totalCount }</h5>
                        <p class="text-muted mb-0">Total Counts</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-pattern" style="height: 100%;">
                    <div class="card-body">
                        <div class="float-right">
                            <i class="fa fa-th text-primary h4 ml-3" style="font-size: 1.5rem;"></i>
                        </div>
                        <h5 class="font-size-20 mt-0 pt-1">${resultPage.currentPage}</h5>
                        <p class="text-muted mb-0">Current Page</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-pattern" style="height: 100%;">
                    <div class="card-body">
                        <div class="float-right">
                            <i class="fa fa-file text-primary h4 ml-3" style="font-size: 1.5rem;"></i>
                        </div>
                        <h5 class="font-size-20 mt-0 pt-1">${resultPage.maxPage}</h5>
                        <p class="text-muted mb-0">Max Page</p>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-md-6 text-right">
                <div class="card" style="height: 100%;">
                    <div class="card-body">
                        <form id="clubReport">
                            <div class="form-group">
                                <label>Search</label>

                                <div class="input-group">
                                    <select class="form-control" name="searchCondition" >
                                        <option value="0"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>번호</option>
                                        <option value="1"${!empty search.searchCondition&&search.searchCondition==1 ? "selected":"" }>신고한회원</option>
                                    </select>
                                </div>

                                <div class="input-group mb-0">
                                    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="Search..." aria-describedby="project-search-addon"
                                           value="${! empty search.searchKeyword ? search.searchKeyword : '' }"/>
                                    <div class="input-group-append">
                                        <button class="btn btn-danger" type="button" id="project-search-addon"><i class="fa fa-search search-icon fa-2x font-12"></i></button>
                                    </div>
                                </div>

                            </div>
                            <input type="hidden" id="currentPage" name="currentPage" value=""/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <!-- table 위쪽 검색 Start /////////////////////////////////////-->

    <!--  table Start /////////////////////////////////////-->
   <div class="row">
     <div class="col-lg-12">
       <div class="card">
         <div class="card-body">
            <div class="table-responsive project-list">
        <table class="table project-table table-centered table-nowrap table-hover table-striped" >
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col" >모임 번호</th>
                <th scope="col">모임신고기준</th>
                <th scope="col">신고한 아이디</th>
                <th scope="col">신고날짜</th>
                <th scope="col">처리여부</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="i" value="0" />
            <c:forEach var="cr" items="${list}">
                <c:set var="i" value="${ i+1 }" />
                <tr>
                    <td><a href="/site/getClubReport/${cr.clubReportNo}/${cr.clubNum}">${ i }</a>
                        <input id="crNo" type="hidden" value="${cr.clubReportNo }"/>
                        <input type="hidden" name="clubNum" value="${cr.clubNum}"></td>
                    </td>
                    <td>${cr.clubNum}</td>
                    <td>
                      <c:choose>
                        <c:when test="${! empty cr.crBasis && cr.crBasis == '1'}">
                            목적과 다른 모임
                        </c:when>
                        <c:when test="${! empty cr.crBasis && cr.crBasis == '2'}">
                            상업적 모임
                        </c:when>
                        <c:when test="${! empty cr.crBasis && cr.crBasis == '3'}">
                            정치적 성향의 모임
                        </c:when>
                        <c:when test="${! empty cr.crBasis && cr.crBasis == '4'}">
                            도박 모임
                        </c:when>
                        <c:when test="${! empty cr.crBasis && cr.crBasis == '5'}">
                            다단계 판매
                        </c:when>
                      </c:choose>
                    </td>
                    <td><span class="text-success font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i>${cr.reportId}</span>
                    </td>
                    <td>
                        <p class="mb-0">${cr.reportDate}</p>
                    </td>
                    <td>${cr.reportResult}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
  </div>
    <!--  table End /////////////////////////////////////-->

             <nav aria-label="Page navigation example" style="display: flex;justify-content: center;">
                 <ul class="pagination">
                     <li class="page-item pageUnit ${resultPage.beginUnitPage==1?'disabled':''}" value="${resultPage.beginUnitPage-resultPage.pageUnit}">
                         <a class="page-link" href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-label="Previous">
                             <span aria-hidden="true">&laquo;</span>
                         </a>
                     </li>
                     <c:forEach begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" var="i">
                         <li class="page-item ${search.currentPage==i?'active':'paging'}"><a class="page-link" href="javascript:fncGetList('${ i }');">${i}</a></li>
                     </c:forEach>
                     <li class="page-item pageUnit ${resultPage.maxPage==resultPage.endUnitPage?'disabled':''}" value="${resultPage.beginUnitPage+resultPage.pageUnit}">
                         <a class="page-link" href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-label="Next">
                             <span aria-hidden="true">&raquo;</span>
                         </a>
                     </li>
                 </ul>
             </nav>

       </div>
     </div>
    </div>
   </div>
  </div>
<!-- end row -->
<%--
        <div class="col-md-12 text-center ">
            <button type="button" class="newCR btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addClubReport">신고</button>
            <a class="btn btn-default btn" href = "#" role="button">취 소 </a>
        </div>
--%>
<%-- 모달창 시작--%>
<div class="modal model-center fade" id="addClubReport" tabindex="-1" aria-labelledby="addCrLabel" aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" >
                <h3 class="modal-title text-danger fs-5" id="addCrLabel">모임 신고</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form id="addCrForm" enctype="multipart/form-data">

                    <input type="hidden" name="clubNum" value="10000">
                    <input type="hidden" name="reportId" value="user01">

                      <div class="input-group mb-3 mt-3">
                        <div class="form-floating">
                            <select class="form-select" id="crBasis" name="crBasis" required>
                                <option value="0" selected>선택하세요</option>
                                <option value="1">목적과 다른 모임</option>
                                <option value="2">상업적 모임</option>
                                <option value="3">정치적 성향의 모임</option>
                                <option value="4">도박 모임</option>
                                <option value="5">다단계 판매</option>
                            </select>
                            <label for="crBasis">카테고리</label>
                        </div>
                    </div>

                    <div class="input-group mb-3 mt-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id=reportText name="reportText" placeholder="상세신고내용"
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
                <button type="button" class="btn btn-danger addCR" data-bs-dismiss="modal" style="margin-right: 185px">신 고</button>
            </div>
        </div>
    </div>
</div>
<%-- 모달창 끝--%>
<jsp:include page="/layout/footer.jsp"/>
</body>
</html>
