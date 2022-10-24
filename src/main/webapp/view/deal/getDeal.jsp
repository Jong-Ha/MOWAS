<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%@ page import="java.util.*"%>

<%@ page import="com.model2.mvc.service.domain.*"%>
<%@ page import="com.model2.mvc.common.*"%>

<%
Product vo=(Product)request.getAttribute("vo");



%>
--%>

<html>
<head>

    <title>상품 목록조회</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
    <script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="/resources/deal/js/getDeal.js"></script>
    <link href="/resources/deal/css/getDeal.css" rel="stylesheet" type="text/css"/>

    <title>Bootstrap Example</title>

    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1.0" />--%>

    <%--    <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->--%>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >--%>
    <%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >--%>
    <%--    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>--%>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>--%>
    <%--    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>--%>

    <script>

        $(function () {


            $(".dealChat").on("click", function () {

                var dealUserId = $(".dealUserId").val();
                var userId = $(".userId").val()
                var dealBoardNum = $(".dealBoardNum").val()
                var chatNameSpace = "dealChat"

                alert(dealBoardNum)

                if (userId === '' || userId === null) {

                    alert("로그인후 이용 가능 합니다");

                } else if (userId !== '') {
                    if (userId === dealUserId) {
                        alert("동명이인???");
                    } else {
                        const swalWithBootstrapButtons = Swal.mixin({
                            customClass: {
                                confirmButton: 'btn btn-success',
                                cancelButton: 'btn btn-danger'
                            },
                            buttonsStyling: false
                        })
                        swalWithBootstrapButtons.fire({
                            title: '해당 유저와 채팅을 하기겠습니까?',
                            text: "",
                            icon: 'warning',
                            showCancelButton: true,
                            confirmButtonText: '초대',
                            cancelButtonText: '취소',
                            reverseButtons: true
                        }).then((result) => {
                            if (result.isConfirmed) {
                                swalWithBootstrapButtons.fire(
                                    dealUserId + ' 님이 초대 되었습니다',
                                    'success',
                                )
                                setTimeout(() => (
                                    window.open("/chat/addOneChat?chatNameSpace=" + chatNameSpace + "&userId=" + dealUserId + "&boardNum=" + dealBoardNum, "채팅방",
                                        "left=500, top=100, width=500px, height=500px, marginwidth=0, marginheight=0,")
                                ), 2500)
                            } else if (
                                /* Read more about handling dismissals below */
                                result.dismiss === Swal.DismissReason.cancel
                            ) {
                                swalWithBootstrapButtons.fire(
                                    '초대 취소',
                                    'error'
                                )
                            }
                        })
                    }
                }
            })

            $(".dealCalender").on("click", () => {

                var dealBoardNum = $(".dealBoardNum").val()

                window.open("/commu/addDealCalender?boardNum=" + dealBoardNum, "거래 일정 등록",
                    "top=100, width=550px, height=500px, marginwidth=0, marginheight=0, marginright:100px; scrollbars=no, scrolling=no, menubar=no, resizable=no")

            });
        })
    </script>


</head>


<body>
<%-- toolbar 시작--%>
<jsp:include page="/layout/toolbar.jsp"/>
<%--&lt;%&ndash; toolbar 종료&ndash;%&gt;--%>

<%--<c:forEach items="${deal.files}" var="i">--%>
<%--    <img src="/resources/${i.fileName}" alt="거래 게시글 사진"><br>--%>
<%--    <br>--%>
<%--</c:forEach>--%>
<%--${deal}<br>--%>
<%--<div>--%>

<%--    <input type="button" class="likeToggle" value="${likeCheck == 'y'?'좋아요 해제':'좋아요!'}">--%>
<%--    <input type="hidden" name="dealBoardNum" value="${deal.dealBoardNum}">--%>
<%--    <input type="hidden" name="boardCategory" value="${deal.boardCategory}">--%>
<%--    <br/>--%>
<%--    <br/>--%>
<%--</div>--%>
<%--</table>--%>
<%--<input type="button" class="updateDeal" value="거래 수정">--%>
<%--<input type="button" class="deleteDeal" value="거래 삭제">--%>
<%--<input type="button" class="#" value="채팅하기">--%>

<%--<div class="reply_subject">리뷰</div>--%>
<%--<div class="replypt">${deal.reviewPt}</div>--%>
<%--<div class="replypt">${point}</div>--%>


<%--<div class="reply_button_wrap">--%>
<%--    <button>리뷰 쓰기</button>--%>
<%--</div>--%>


<%--<input type="button" class="dealLogin" value="로그인">--%>
<%--<label>--%>
<%--    아이디 : <input type="text" name="userId" value="">--%>
<%--    <input type="hidden" name="dealBoardNum" value="${deal.dealBoardNum}">--%>
<%--</label>--%>

<%--${user.userId}--%>

<%--<br>--%>


<%--<body bgcolor="#ffffff" text="#000000">--%>
<%--<jsp:include page="/layout/toolbar.jsp" />--%>
<%--<form name="detailForm" method="post">--%>

<%--    <table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">--%>
<%--        <tr>--%>
<%--            <td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>--%>
<%--            <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">--%>
<%--                <table width="100%" border="0" cellspacing="0" cellpadding="0">--%>
<%--                    <tr>--%>
<%--                        <td width="93%" class="ct_ttl01">상품상세조회</td>--%>
<%--                        <td width="20%" align="right">&nbsp;</td>--%>
<%--                    </tr>--%>
<%--                </table>--%>
<%--            </td>--%>
<%--            <td width="12" height="37">--%>
<%--                <img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>

<%--    <table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">--%>


<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">--%>
<%--                상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>--%>
<%--            </td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            <td class="ct_write01">--%>
<%--                <table width="100%" border="0" cellspacing="0" cellpadding="0">--%>
<%--                    <tr>--%>
<%--                        &lt;%&ndash;					<td width="105" name="prodNo" value="<%=vo.getProdNo() %>"><%=vo.getProdNo() %></td> &ndash;%&gt;--%>
<%--                        <td width="105" name="userId" value="${userId}">${userId}</td>--%>
<%--                    </tr>--%>
<%--                </table>--%>
<%--            </td>--%>
<%--        </tr>--%>


<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">--%>
<%--                상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>--%>
<%--            </td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            &lt;%&ndash;		<td class="ct_write01"><%=vo.getProdName()%></td> &ndash;%&gt;--%>
<%--            <td class="ct_write01"> ${product.prodName}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">--%>
<%--                상품이미지 <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>--%>
<%--            </td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            <td class="ct_write01">--%>
<%--                <img src = "../images/uploadFiles/${product.fileName}" />--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">--%>
<%--                상품상세정보 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>--%>
<%--            </td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            &lt;%&ndash; 		<td class="ct_write01"><%=vo.getProdDetail()%></td>&ndash;%&gt;--%>
<%--            <td class="ct_write01">${product.prodDetail}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">제조일자</td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            &lt;%&ndash;		<td class="ct_write01"><%=vo.getManuDate()%></td> &ndash;%&gt;--%>
<%--            <td class="ct_write01">${product.manuDate }</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">가격</td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            &lt;%&ndash; 		<td class="ct_write01"><%=vo.getPrice()%></td>&ndash;%&gt;--%>
<%--            <td class="ct_write01">${product.price }</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">등록일자</td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            &lt;%&ndash; 		<td class="ct_write01"><%=vo.getRegDate()%></td>&ndash;%&gt;--%>
<%--            <td class="ct_write01">${product.regDate}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--    </table>--%>

<%--    <table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">--%>
<%--        <tr>--%>
<%--            <td width="53%"></td>--%>
<%--            <td align="right">--%>

<%--                <table border="0" cellspacing="0" cellpadding="0">--%>
<%--                    <tr>--%>

<%--                        <td width="17" height="23">--%>
<%--                            <img src="/images/ct_btnbg01.gif" width="17" height="23"/>--%>
<%--                        </td>--%>
<%--<td><input type="hidden" name="clubNum" value="${club.clubNum}">--%>
<%--    <input type="button" class="likeToggle" value="${deal.likeCheck=='y'?'좋아요 해제':'좋아요!'}"></td>--%>
<%--                        <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">--%>
<%--                            &lt;%&ndash; 					<a href="/addPurchaseView.do?prod_no=<%=vo.getProdNo()%>">구매</a>&ndash;%&gt;--%>
<%--                            <a href="/addPurchaseView.do?prod_no=${product.prodNo }">채팅하기</a>--%>
<%--                        </td>--%>
<%--                        <td width="14" height="23">--%>
<%--                            <img src="/images/ct_btnbg03.gif" width="14" height="23">--%>
<%--                        </td>--%>
<%--                        <td width="30"></td>--%>

<%--                        <td width="17" height="23">--%>
<%--                            <img src="/images/ct_btnbg01.gif" width="17" height="23"/>--%>
<%--                        </td>--%>
<%--                        <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">--%>
<%--                            <a href="javascript:history.go(-1)">이전</a>--%>
<%--                        </td>--%>
<%--                        <td width="14" height="23">--%>
<%--                            <img src="/images/ct_btnbg03.gif" width="14" height="23">--%>
<%--                        </td>--%>
<%--                    </tr>--%>

<%--                </table>--%>

<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>
<div class="wap">

    <div class="row" style="display: flex; align-items: center">
        <div class="col-2">
        </div>
        <div class="col-8">
            <%--            <h1>${club.clubName}</h1>--%>
            <h1>제목 : ${deal.dealTitle}</h1>
            <input type="hidden" class="userId" value="${user.userId}">
            <input hidden class="dealUserId" value="${deal.user.userId}">
        </div>

    </div>
    <div class="container-fluid py-5" style="text-align: center; width: 100%; height: 500px">
        <c:forEach items="${deal.files}" var="i">
            <img src="/resources/${i.fileName}" alt="거래 게시글 사진"><br>
            <br>
        </c:forEach>
        <p>상세 설명 : ${deal.dealText}</p>


        <div class="dealinfo" style="display: flex;">

            <div class="dealInfoLeft">

                <div class="container">
                    <div class="row">
                        <div class="col-4">${deal.user.userId}</div>
                        <c:if test="${deal.user.userId == user.userId}">
                            <div class="col-4">
                                <button class="btn btn-primary updateDealView font" data-bs-toggle="modal"
                                        data-bs-target="#updateDeal">
                                    거래 수정
                                </button>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="col-4">
                            Since : ${deal.dealRegDate}
                        </div>
                    </div>
                </div>


                <div class="container">
                    <div class="row">
                        <%--                   // <div class="col-4">${club.currentCluber}/25--%>
                        <div class="badge bg-primary text-wrap">
                            <c:if test="${deal.dealStatus == 0}">
                                거래전
                            </c:if>
                            <c:if test="${deal.dealStatus ==1}">
                                거래중
                            </c:if>
                            <c:if test="${deal.dealStatus ==2}">
                                거래완료
                            </c:if>
                        </div>
                        <%--                    </div>--%>
                    </div>
                </div>

            </div>

            <div class="dealInfoRight">

                <div class="container">
                    <div class="badge bg-primary text-wrap">
                        ${user.villCode}
                    </div>
                </div>

                <div class="container">
                    <div class="badge bg-primary text-wrap"
                         style="width: 250px;height: 65px;display: grid;float: right;grid-template-columns: 1fr 1fr 1fr;">
                        <c:forEach items="${tagList}" var="tag">
                            <div>#${tag}</div>
                        </c:forEach>
                    </div>
                </div>

            </div>

        </div>

        <div>

            <%--<div class="shadow-lg navbar navbar-expand-lg bg-light"
                 style="margin-top: 50px; border-radius: 10px;">
                <div style="background-color: #0000">
                    <button type="button" class="btn btn-outline-primary btnlf">모임
                        공지사항
                    </button>
                    <button class="btn btn-outline-success btnlf" type="submit">모임
                        일정
                    </button>
                    <button type="button" class="btn btn-outline-danger btnlf">모임
                        일정 후기글
                    </button>
                    <button type="button" class="btn btn-outline-warning btnlf">모임
                        일정 후기 쇼츠
                    </button>
                </div>
            </div>--%>

            <div class="clubBoarder <%--shadow-lg--%>">
                <div>내용 출력 예정</div>
            </div>
        </div>

        <div style="float: right;">
            <c:if test="${deal.user.userId==user.userId}">
                <button class="btn btn-primary deleteDeal" data-bs-toggle="modal" data-bs-target="#deleteDeal">
                    거래 삭제
                </button>
            </c:if>
            <c:if test="${currentCluber.cluberStatus=='4'||currentCluber.cluberStatus=='5'||currentCluber.cluberStatus=='6'}">
                <button class="btn btn-primary deleteCluber" data-bs-toggle="modal" data-bs-target="#deleteCluber">
                    채팅방
                </button>
            </c:if>
        </div>

        <footer style="padding-top: 20px; clear: both;">
            <c:if test="${club.gatherCheck=='1'}">
                <c:if test="${empty currentCluber.cluberStatus}">
                    <button class="btn btn-primary addCluberApplyView" data-bs-toggle="modal"
                        ${!empty user?'data-bs-target="#cluberApply"':''}>
                        가입 신청
                    </button>
                </c:if>
            </c:if>
            <c:if test="${currentCluber.cluberStatus=='2'}">
                <button class="btn btn-primary updateCluberApplyView" data-bs-toggle="modal"
                        data-bs-target="#cluberApply">
                    가입 신청 수정
                </button>
            </c:if>
        </footer>
    </div>
</div>

<%--모임 수정 모달창 시작--%>

<div class="modal fade" id="updateDeal" tabindex="-1" aria-labelledby="updateDealLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="updateDealLabel">거래 수정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateDealForm" enctype="multipart/form-data">
                    <input hidden name="dealBoardNum" value="${deal.dealBoardNum}" class="dealBoardNum">
                    <%--                                <input type="hidden" name="deleteFileName" value="${deal.clubImage}" disabled>--%>
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="dealTitle" name="dealTitle" placeholder="거래명"
                                   value="${deal.dealTitle}" required>
                            <label for="dealTitle">거래명</label>
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="productName" name="productName"
                                   placeholder="제품명"
                                   value="${deal.productName}" required>
                            <label for="productName">제품명</label>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="price" name="price" placeholder="가격"
                                   value="${deal.price}" required>
                            <label for="price">가격</label>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <select class="form-select" id="boardCategory" name="boardCategory" required>
                                <option value="08" selected>판매</option>
                                <option value="09">판매요청</option>

                            </select>
                            <label for="boardCategory">판매구분</label>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <select class="form-select" id="dealStatus" name="dealStatus" required>
                                <option value="01" ${deal.dealStatus == '01'? 'selected':''}>판매전</option>
                                <option value="02" ${deal.dealStatus== '02'? 'selected':''}>판매중</option>
                                <option value="03" ${deal.dealStatus == '03'? 'selected':''}>판매완료</option>

                            </select>
                            <label for="boardCategory">판매구분</label>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="dealText" name="dealText" placeholder="상품 설명"
                                   value="${deal.dealText}" required>
                            <label for="dealText">상품설명</label>
                        </div>
                    </div>


                    <div class="mb-3">
                        <div style="width: 466px;height: 233px; text-align: center;">

                            <c:forEach items="${deal.files}" var="i">
                                <img src="/resources/${i.fileName}" alt="수정 전 이미지"><br>
                                <input type="button" class="deleteFile" value="삭제">
                            </c:forEach>
                        </div>
                        <label for="file" class="form-label" style="display: none"></label>
                        <input class="form-control" type="file" id="file" name="file">
                    </div>

                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="text" class="tagify shadow-lg" id="dealTag"
                                   style="border-radius: 7px;"
                                   placeholder="태그 : Enter!">
                            <label for="dealTag" style="display: none">태그 : Enter!</label>
                            <c:forEach items="${deal.tag}" var="tag">
                                <input type="hidden" class="tagList" value="${tag}">
                            </c:forEach>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary updateClub" style="margin-right: 185px">거래 수정
                </button>
            </div>
        </div>
    </div>
</div>

<input type="button" class="dealChat" value="채팅하기">
<a class="dealList dealCalender">직거래 일정 등록 하기</a>

<%--모임 수정 모달창 끝--%>
</body>
</html>













