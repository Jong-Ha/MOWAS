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
<%--    <link href="/resources/deal/css/getDeal.css" rel="stylesheet" type="text/css"/>--%>

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
            $("#updateDeal .updateDeal").on("click", function () {
                // $("form").attr("method","post").attr("action","/club/updateClubMasterBoard").submit()
                const data = new FormData($('#updateDealForm')[0])

                $.ajax({
                    url: "/deal/updateDeal",
                    method: 'post',
                    enctype: 'multipart/form-data',
                    processData: false,
                    contentType: false,
                    'data': data,
                    success: function (re) {
                        alert('수정되었습니다')
                       // $('#getClubMasterBoard .modal-content').html(re)
                     //   $('.getClubMasterBoard').click()
                       // $('.listClubMasterBoardView').click()
                        $('#updateDeal').modal('hide')
                        window.location.reload();

                    }
                })

            })

            //파일 갯수 체크
            $("#updateDealForm input:file").on("change", function () {
                if ($(this)[0].files.length > 10 - $('#fileSize').val()) {
                    alert('파일 갯수를 초과하였습니다.');
                    // alert(10-$('#fileSize').val());
                    $(this).val('');
                }
            })

            //파일 삭제 버튼
            var deleteFiles = $("#updateDealForm .deleteFile")

            deleteFiles.off('click').on("click", function () {
                $(this).css('display','none')
                var size = $("#updateDealForm #fileSize");
                size.parent().append('<input type="hidden" name="deleteFileName" value="' + $(this).parents('.dealBoardFiles').attr('id') + '">')
                $(this).parents('.dealBoardFiles').slideUp('slow')
                size.val(size.val() - 1)
            })

            deleteFiles.on('mouseenter',function(){
                $(this).addClass('bg-danger')
            })

            deleteFiles.on('mouseleave',function(){
                $(this).removeClass('bg-danger')
            })



            $(".dealChat").on("click", function () {

                var dealUserId = $(".active").val();
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

        // $('.slide').slick({
        //     lazyLoad: 'ondemand',
        //     slidesToShow: 3,
        //     slidesToScroll: 1
        // });

        $(function () {
            $(".close").on("click", function () {
                window.close();
            });
        })
        $(function () {
            $(".submit").on("click", function () {
                var rating = $(".rating").val()
                var content = $(".content").val();
                var dealBoardNum = $(".dealBoardNum").val();

                $.ajax({
                    url: "/deal/json/addReview",
                    method: "post",
                    data: JSON.stringify({
                        "reviewPt": rating,
                        "review": content,
                        "dealBoardNum": dealBoardNum
                    }),
                    dataType: "json",
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json; charset=UTF-8"
                    },
                    success: function (JSONData, result) {
                        console.log(JSONData);
                        alert(result);
                        alert(JSONData);
                        alert(rating)
                        alert(content)

                        // 성공시 해당 창을 닫고 부모창을 reload
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Your work has been saved',
                            showConfirmButton: false,
                            timer: 1500
                        });

                        setTimeout(function () {
                            // opener.location.reload();
                            //window.close();
                        }, 2000);
                        //error 발생시 그냥 창을 닫음

                    }, error: function () {
                        Swal.fire({
                            //  position: 'top-end',
                            //icon: 'success',
                            //title: 'Your work has been saved',
                            //showConfirmButton: false,
                            //timer: 1500
                        });
                        setTimeout(function () {
                            window.close();
                        }, 2000);
                    }
                })
            })
        })

//업데이트
        $(function () {
//             // $(".updateClub").on("click",function(){
//             //     location.href="/club/updateClub/"+$(".boardNum").val()
//             // })
            $(".delete").on("click", function () {
                var check = confirm("진짜 삭제?");
                if (check === true) {
                    location.href = "/deal/deleteDeal/" + $(".dealBoardNum").val()
                }
            })
//         //업데이트
//         var dealTag = document.querySelector("#dealTag")
//         var tagify = new Tagify(dealTag, {
//             dropdown: {
//                 position: "input",
//                 enabled: 0 // always opens dropdown when input gets focus
//             }
//         })
//         $("#updateDeal").find(".newDeal").on("click", function () {
//             if ($("#dealTitle").val() === '') {
//                 alert("제목은 필수입니다")
//                 return;
//             }
//             if ($("#dealProduct").val() === '') {
//                 alert("제품명은 필수입니다")
//                 return;
//             }
//             if ($("#price").val() === '') {
//                 alert("가격은 필수입니다")
//                 return;
//             }
//             let updateForm = $("#updateDealForm");
//             $.each(JSON.parse($("#dealTag").val()), function (index, item) {
//                 updateForm.append('<input type="hidden" name="dealTags" value="' + item.value + '">')
//             })
//             updateForm.attr("method", "post").attr("action", "/deal/updateDeal").submit();
//         })
        })
        //최근 본 상품
        $(function (){
            $(".list").on("click", function(){
                window.location.assign('/deal/getListDeal')

            })
        })
    </script>
    <style type="text/css">
        /*body {*/
        /*  padding-top: 50px;*/
        /*}*/

        .wap {
          width: 1400px;
          font-size: 1.2em;
            height: 1000px;
        }
        .check{
          height: 20px;
          width: 35px;
        }

        .userImage1 {
            margin-top: -20px;
            display: flex;
        }
        .likebox {
            height: 75px;
            background: #ffff;
            margin-top: -30px;
            border-radius: 5px;
        }

        /* 창 여분 없애기 */
        body {
            margin: 0;
        }

        /* 전체 배경화면 색상 */
        .wrapper_div {
            background-color: #f5f5f5;
            height: 100%;
        }

        /* 팝업창 제목 */
        .subject_div {
            width: 100%;
            background-color: #7b8ed1;
            color: white;
            padding: 10px;
            font-weight: bold;
        }

        /* 컨텐츠, 버튼 영역 padding */
        .input_wrap {
            padding: 30px;
        }

        .btn_wrap {
            padding: 5px 30px 30px 30px;
            text-align: center;
        }

        /* 버튼 영역 */
        .cancel_btn {
            margin-right: 5px;
            display: inline-block;
            width: 130px;
            background-color: #5e6b9f;
            padding-top: 10px;
            height: 27px;
            color: #fff;
            font-size: 14px;
            line-height: 18px;
        }

        .enroll_btn {
            display: inline-block;
            width: 130px;
            background-color: #7b8ed1;
            padding-top: 10px;
            height: 27px;
            color: #fff;
            font-size: 14px;
            line-height: 18px;
        }

        /* 책제목 영역 */

        /* 평점 영역 */
        .rating_div {
            padding-top: 10px;
        }

        .rating_div h4 {
            margin: 0;
        }

        select {
            margin: 15px;
            width: 100px;
            height: 40px;
            text-align: center;
            font-size: 16px;
            font-weight: 600;
        }

        /* 리뷰 작성 영역 */
        .content_div {
            padding-top: 10px;
        }

        .content_div h4 {
            margin: 0;
        }

        textarea {
            width: 100%;
            height: 100px;
            border: 1px solid #dadada;
            padding: 12px 8px 12px 8px;
            font-size: 15px;
            color: #a9a9a9;
            resize: none;
            margin-top: 10px;
        }

        /*최근본 상품 */

        /*버튼*/
        .btn-primary {
            --bs-btn-color: #000;
            --bs-btn-bg: #f8cd07b3;
            --bs-btn-border-color: #f8cd07b3;
            --bs-btn-hover-color: #000;
            --bs-btn-hover-bg: #f8cd07;
            --bs-btn-hover-border-color: #f8cd07;
            --bs-btn-focus-shadow-rgb: 130, 138, 145;
            --bs-btn-active-color: #000;
            --bs-btn-active-bg: #f8cd07;
            --bs-btn-active-border-color: #f8cd07;
            --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
            --bs-btn-disabled-color: #fff;
            --bs-btn-disabled-bg: #6c757d;
            --bs-btn-disabled-border-color: #6c757d;
        }
        #article-profile #article-profile-right {
            position: absolute;
            right: 0;
            padding-right: 15%;
        }
    </style>

</head>


<body>
<%-- toolbar 시작--%>
<input hidden class="userId" value="${user.userId}"></h2>
<input hidden name="dealBoardNum" value="${deal.dealBoardNum}" class="dealBoardNum">
<input hidden name="boardCategory" value="${deal.boardCategory}" class="boardCategory">
<input hidden class="dealUserId" value="${deal.user.userId}">
<jsp:include page="/layout/toolbar.jsp"/>
<jsp:include page="/view/deal/history.jsp"/>
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

<div class="container" style="text-align: -webkit-center;">

    <div class="wap shadow-lg">

        <div class="usedbox">
            <div class="thumbnailBox">
                <div class="shadow-lg midle"
                     style="margin-bottom: 50px; margin-top: -3px; width: 490px; overflow: hidden; height: 400px;">
                    <div id="carouselExampleDark" class=" shadow-lg carousel carousel-dark slide"
                         data-bs-ride="carousel">
                        <c:set var="i" value="0"/>
                        <c:forEach var="File" items="${deal.files}">
                            <c:set var="i" value="${i+1}"/>
                            <div class="carousel-inner">
                                <div class="carousel-item active" data-bs-interval="10000">
                                    <div type=hidden class="file" value="${File.fileName}"><img
                                            src="/resources/${File.fileName}" width="490px" height="400px"></div>
                                </div>
                            </div>
                        </c:forEach>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"
                                  style="z-index: 3; position: absolute;"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"
                                  style="z-index: 3; position: absolute;"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <section id="article-profile">
                        <div class="space-between">
                            <div style="display: flex;">
                                <div id="article-profile-image">
                                    <img src="/resources/${deal.user.userImage}">
                                </div>
                                <div id="article-profile-left">
                                    <div id="nickname">${deal.user.userId}</div>
                                    <div id="region-name">${deal.villCode}</div>
                                </div>
                                <div id="article-profile-right">
                                    <dl id="temperature-wrap">
                                        <dt>신뢰온도</dt>
                                        <dd class="text-color-05 ">
                                            ${reviewPt}
                                            <span>°C</span>
                                        </dd>
                                    </dl>

                                </div>
                            </div>
                            </a>  </div>  </section>
                            </div>

                <div class="likebox shadow-lg">
                    <div class="itembox" style="padding: 20px;">
                        <button type="button"
                                class="btn btn-primary position-relative itembutton likeButton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-hand-thumbs-up itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                            </svg>
                            <span
                                    class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger likeText"
                                    style="z-index: 1; font-size: 0.5em;">${deal.likeCount}</span>
                        </button>

                        <button type="button"
                                class="btn btn-secondary position-relative itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-eye itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                <path
                                        d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                            </svg>

                            <span
                                    class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger viewText"
                                    style="z-index: 1; font-size: 0.5em;">${deal.viewCount}</span>
                        </button>

                        <button type="button" class="btn btn-outline-primary itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-chat-left-quote itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path
                                        d="M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z"/>
                            </svg>
                        </button>

                        <button type="button" class="btn btn-outline-info itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor" class="bi bi-cart-plus-fill itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z"/>
                            </svg>
                        </button>

                        <button type="button" class="btn btn-outline-danger itembutton">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                 fill="currentColor"
                                 class="bi bi-hand-thumbs-down-fill itmesize"
                                 viewBox="0 0 16 16">
                                <path
                                        d="M6.956 14.534c.065.936.952 1.659 1.908 1.42l.261-.065a1.378 1.378 0 0 0 1.012-.965c.22-.816.533-2.512.062-4.51.136.02.285.037.443.051.713.065 1.669.071 2.516-.211.518-.173.994-.68 1.2-1.272a1.896 1.896 0 0 0-.234-1.734c.058-.118.103-.242.138-.362.077-.27.113-.568.113-.856 0-.29-.036-.586-.113-.857a2.094 2.094 0 0 0-.16-.403c.169-.387.107-.82-.003-1.149a3.162 3.162 0 0 0-.488-.9c.054-.153.076-.313.076-.465a1.86 1.86 0 0 0-.253-.912C13.1.757 12.437.28 11.5.28H8c-.605 0-1.07.08-1.466.217a4.823 4.823 0 0 0-.97.485l-.048.029c-.504.308-.999.61-2.068.723C2.682 1.815 2 2.434 2 3.279v4c0 .851.685 1.433 1.357 1.616.849.232 1.574.787 2.132 1.41.56.626.914 1.28 1.039 1.638.199.575.356 1.54.428 2.591z"/>
                            </svg>
                        </button>

                        <c:if test="${user.userId == deal.user.userId}">
                            <button type="button" class="btn btn-primary itembutton updateDeal" data-bs-toggle="modal"
                                    data-bs-target="#updateDeal">
                                수정
                            </button>
                            <button type="button" class="btn btn-outline-secondary itembutton delete">삭제</button>
                        </c:if>

                    </div>
                </div>
            </div>

            <div class="textbox shadow-lg">
                <div class="container">
                    <div class="row textboxrow">
                        <div class="col-3">제목</div>
                        <div class="col-6"></div>
                        <div class="col-3">${deal.dealTitle}</div>

                    </div>

                    <div class="row textboxrow">
                        <div class="col-3">상품명</div>
                        <div class="col-6"></div>
                        <div class="col-3">${deal.productName}</div>
                    </div>
<%--                    <div class="row textboxrow">--%>
<%--                        <c:if test="${reviewPt ==0}">--%>
<%--                            <div class="col-3">신뢰온도</div>--%>
<%--                            <div class="col-4">첫거래입니다</div>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${reviewPt !=0}">--%>


<%--                            <div class="col-3">신뢰온도</div>--%>
<%--                            <div class="col-4">${reviewPt}</div>--%>
<%--                        </c:if>--%>
<%--                        <div class="col-5"><img id="userImage1" style="width : 15%;"--%>
<%--                                                src="/resources/${deal.user.userImage}"></div>--%>
<%--                    </div>--%>
<%--                    <div class="row textboxrow">--%>
<%--                        <div class="col-2">작성자</div>--%>
<%--                        <div class="col-4">${deal.user.userId}</div>--%>
<%--                        <div class="col-2">동네</div>--%>
<%--                        <div class="col-4">${deal.villCode}</div>--%>
<%--                    </div>--%>
                    <div class="row textboxrow">
                                                <div class="col-3">가격</div>
                        <div class="col-6"></div>
                                                <div class="col-3">${deal.price}원</div>

                                            </div>
                    <div class="row textboxrow">
                        <div class="col-3">내용</div>
                        <div class="col-9">
                            <label for="exampleFormControlTextarea1" class="form-label"></label>
                            <textarea class="form-control" id="exampleFormControlTextarea1"
                                      rows="3" style="height: 255px;"
                                      placeholder="${deal.dealText}"></textarea>
                        </div>
                    </div>
                </div>
            </div>

        </div>

<%--        <jsp:include page="/layout/chatIcon.jsp"/>--%>


    </div>
</div>


<%--원래 코드 시작--%>
<%--    <div class="row" style="display: flex; align-items: center">--%>
<%--        <div class="col-2">--%>
<%--        </div>--%>
<%--        <div class="col-8">--%>
<%--            &lt;%&ndash;            <h1>${club.clubName}</h1>&ndash;%&gt;--%>
<%--            <h1>제목 : ${deal.dealTitle}</h1>--%>
<%--            <h2>--%>
<%--                <input type="hidden" value="${user.userId}"></h2>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--    <div class="container-fluid py-5" style="text-align: center; width: 100%; height: 500px">--%>
<%--        <c:forEach items="${deal.files}" var="i">--%>
<%--        <img src="/resources/${i.fileName}" alt="거래 게시글 사진"><br>--%>
<%--        <br>--%>
<%--        </c:forEach>--%>
<%--        <p>상세 설명 : ${deal.dealText}</p>--%>


<%--        <div class="dealinfo" style="display: flex;">--%>

<%--            <div class="dealInfoLeft">--%>

<%--                <div class="container">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-4">${deal.user.userId}</div>--%>
<%--                        <c:if test="${deal.user.userId == user.userId}">--%>
<%--                            <div class="col-4">--%>
<%--                                <button class="btn btn-primary updateDealView font" data-bs-toggle="modal"--%>
<%--                                        data-bs-target="#updateDeal">--%>
<%--                                    거래 수정--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                        </c:if>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="container">--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-4">--%>
<%--                            Since : ${deal.dealRegDate}--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

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
<%--뭔지 모르겠당--%>
<%--            <div class="clubBoarder &lt;%&ndash;shadow-lg&ndash;%&gt;">--%>
<%--                <div>내용 출력 예정</div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div style="float: right;">--%>
<%--            <c:if test="${deal.user.userId==user.userId}">--%>
<%--                <button class="btn btn-primary deleteDeal" data-bs-toggle="modal" data-bs-target="#deleteDeal">--%>
<%--                    거래 삭제--%>
<%--                </button>--%>
<%--            </c:if>--%>

<%--                <button class="btn btn-primary chatDeal" data-bs-toggle="modal" data-bs-target="#chatDeal">--%>
<%--                    채팅방--%>
<%--                </button>--%>

<%--        </div>--%>

<%--        <footer style="padding-top: 20px; clear: both;">--%>
<%--            <c:if test="${club.gatherCheck=='1'}">--%>
<%--                <c:if test="${empty currentCluber.cluberStatus}">--%>
<%--                    <button class="btn btn-primary addCluberApplyView" data-bs-toggle="modal"--%>
<%--                        ${!empty user?'data-bs-target="#cluberApply"':''}>--%>
<%--                        가입 신청--%>
<%--                    </button>--%>
<%--                </c:if>--%>
<%--            </c:if>--%>
<%--            <c:if test="${currentCluber.cluberStatus=='2'}">--%>
<%--                <button class="btn btn-primary updateCluberApplyView" data-bs-toggle="modal"--%>
<%--                        data-bs-target="#cluberApply">--%>
<%--                    가입 신청 수정--%>
<%--                </button>--%>
<%--            </c:if>--%>
<%--        </footer>--%>


<%--모임 수정 모달창 시작--%>

<div class="modal fade" id="updateDeal" tabindex="-1" aria-labelledby="updateDealLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
<%--                <a class="navbar-brand back-btn" data-bs-target="#getClubMasterBoard" data-bs-toggle="modal"></a>--%>
                <h1 class="modal-title fs-5">거래 수정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateDealForm" enctype="multipart/form-data" method="post">
                    <input hidden name="dealBoardNum" value="${deal.dealBoardNum}" class="dealBoardNum">
                    <input hidden name="boardCategory" value="${deal.boardCategory}" class="boardCategory">
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
                        <div class="form-floating ">
                            <input type="text" class="form-control" id="price" name="price" placeholder="가격"
                                   value="${deal.price}" required>
                            <label for="price">가격</label>
                        </div>
                    </div>

                    <div class="input-group mb-3 form-floating">
                        <select class="form-select" id="boardCategory"  required>
                                <option selected>판매 구분을 선택 하세요</option>
                                <option value="1" ${deal.boardCategory == "08"? 'selected':''}>판매</option>
                                <option value="2" ${deal.boardCategory == "09"? 'selected':''}>판매요청</option>
                            </select>

                            <label for="boardCategory">판매 구분</label>


                        </div>

                    <div class="input-group mb-3 form-floating">
                        <select class="form-select" id="dealStatus"  required>
                            <option value="0" ${deal.dealStatus == 0? 'selected':''}>거래전</option>
                            <option value="1" ${deal.dealStatus== 1? 'selected':''}>거래중</option>
                            <option value="2" ${deal.dealStatus == 2? 'selected':''}>거래완료</option>

                        </select>
                        <label for="dealStatus">거래상태</label>
                    </div>


                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="dealText" name="dealText" placeholder="상품 설명"
                                   value="${deal.dealText}" required>
                            <label for="dealText">상품설명</label>
                        </div>
                    </div>

                    <input type="hidden" id="fileSize" value="${fileSize}">
                    <%--                    <input class="form-control" type="file" id="file" name="file" multiple="multiple">--%>
                    <%--                    <label for="file" class="form-label" style="display: none"></label>--%>
                    <%--                            <c:forEach items="${deal.files}" var="i">--%>
                    <%--                    <div class="mb-3">--%>
                    <%--                        <div class="slide" style="width: 466px;height: 233px; text-align: center;">--%>
                    <%--                                <img src="/resources/${i.fileName}" alt="수정 전 이미지"  style="object-fit: contain; width: 100%; height: 100%"><br>--%>
                    <%--                                <input type="button" class="deleteFile" value="삭제">--%>
                    <%--                        </div>--%>


                    <%--                    </div>--%>
                    <%--                            </c:forEach>--%>
                    <div class="mb-3">
                        <label for="dealBoardFile" class="form-label" style="display: none"></label>
                        <input class="form-control" type="file" id="dealBoardFile" multiple name="file">
                    </div>
                    <div>
                        <c:forEach items="${deal.files}" var="File">
                            <div class="dealBoardFiles" id="${File.fileName}"
                                 style="margin: 20px 0 30px 0;">

                                <button type="button" class="btn position-relative updateImgBox"
                                        style="width: 90%; border: 1px #000 solid; border-radius: 5px; cursor: default">

                                    <img src="/resources/${File.fileName}" alt="중고거래 파일"
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
<%--                    <div class="shadow-lg midle"--%>
<%--                         style="margin-bottom: 50px; margin-top: -3px; width: 490px; overflow: hidden; height: 400px;">--%>
<%--                        <div id="carouselExampleDark1" class=" shadow-lg carousel carousel-dark slide"--%>
<%--                             data-bs-ride="carousel">--%>
<%--                            <c:set var="i" value="0"/>--%>
<%--                            <c:forEach var="File" items="${deal.files}">--%>
<%--                                <c:set var="i" value="${i+1}"/>--%>
<%--                                <div class="carousel-inner">--%>
<%--                                    <div class="carousel-item active" data-bs-interval="10000">--%>
<%--                                        <div type=hidden class="file" value="${File.fileName}"><img--%>
<%--                                                src="/resources/${File.fileName}" width="430px" height="330px"></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                            </c:forEach>--%>
<%--                            <input type="button" class="deleteFile" value="삭제">--%>
<%--                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark1"--%>
<%--                                    data-bs-slide="prev">--%>
<%--                            <span class="carousel-control-prev-icon" aria-hidden="true"--%>
<%--                                  style="z-index: 3; position: absolute;"></span>--%>
<%--                                <span class="visually-hidden">Previous</span>--%>
<%--                            </button>--%>
<%--                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark1"--%>
<%--                                    data-bs-slide="next">--%>
<%--                            <span class="carousel-control-next-icon" aria-hidden="true"--%>
<%--                                  style="z-index: 3; position: absolute;"></span>--%>
<%--                                <span class="visually-hidden">Next</span>--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>


<%--                    <div class="input-group mb-3">--%>
<%--                        <div class="form-floating">--%>
<%--                            <input type="text" class="tagify shadow-lg" id="dealTag"--%>
<%--                                   style="border-radius: 7px;"--%>
<%--                                   placeholder="태그 : Enter!">--%>
<%--                            <label for="dealTag" style="display: none">태그 : Enter!</label>--%>
<%--                            <c:forEach items="${deal.tag}" var="tag">--%>
<%--                                <input type="hidden" class="tagList" value="${tag}">--%>
<%--                            </c:forEach>--%>
<%--                        </div>--%>
<%--                    </div>--%>


                </form>

            </div>
            <div class="modal-footer" >
                <button type="button" class="btn btn-primary btn-lg updateDeal" style="margin-right: 185px">거래 수정
                </button>

            </div>

        </div>
    </div>
</div>
<%--모임 수정 모달창 끝--%>
<input type="button" class="dealChat" value="채팅하기">
<a class="dealList dealCalender">직거래 일정 등록 하기</a>


<button type="button" class="addReview" data-bs-toggle="modal" data-bs-target="#addReview">리뷰작성</button>
<button class="btn btn-primary btn-lg list" style="margin-right: 185px">목록</button>
<%-- 리뷰 모달창 만들기 헤헷--%>

<div class="modal fade" id="addReview" tabindex="-1" aria-labelledby="addReviewLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="addReviewlLabel">리뷰 작성</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addReviewForm" enctype="multipart/form-data">
                    <input hidden name="dealBoardNum" value="${deal.dealBoardNum}" class="dealBoardNum">
                    <%--                                <input type="hidden" name="deleteFileName" value="${deal.clubImage}" disabled>--%>
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            ${deal.dealTitle}
                        </div>
                    </div>

                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <div class="rating_div">
                                <h4>평점</h4>

                                <select name="rating" class="rating">
                                    <c:forEach var="i" begin="0" end="100">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>

                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <div class="form-floating">
                            <div class="content_div">
                                <h4>리뷰</h4>
                                <textarea name="content" class="content" value=""></textarea>
                            </div>
                        </div>

                    </div>

            </div>
            <div class="row">
                <div class="col-xs-12 text-center ">
                    <button type="button" class="btn btn-primary btn-lg submit">확인</button>

                </div>
            </div>
        </div>
        <input type="hidden" value="${deal}">
        </form>
    </div>


</div>
</div>
</div>
<%--모임 수정 모달창 끝--%>



</body>
</html>













