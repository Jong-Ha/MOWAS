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
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css"
          rel="stylesheet">
    <link href="/resources/css/comment.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
        // $(function () {
        //     var dealNum = $(this).parent().children("[name='dealBoardNum']").val();
        //     var boardCategory=$(this).parent().children("[name='boardCategory']").val();
        //
        //     $.ajax({
        //         url : "/deal/json/getLikeCheck",
        //         method : "POST",
        //         data : JSON.stringify({
        //             "boardNum" : dealNum,
        //             "boardCategory" : boardCategory
        //         }),
        //         dataType: "json",
        //         headers: {
        //             "Accept": "application/json",
        //             "Content-Type": "application/json; charset=UTF-8"
        //         },
        //         success:function (JSONData) {
        //             alter("성공 ?")
        //             if (JSONData.like === 'n') {
        //                 alert("누름")
        //                 $(".likeToggle").val("좋아요 해제") ;
        //             } else {
        //                 alert("뺌")
        //                 $(".likeToggle").val("좋아요!");
        //             }
        //         }
        //     })
        //
        // })

        $(function () {
            // $(document).ready(function(){
            // var dealNum = $(this).parent().children("[name='dealBoardNum']").val();
            // var boardCategory=$(this).parent().children("[name='boardCategory']").val();
            //
            // $.ajax({
            //     url : "/deal/json/getLikeCheck",
            //     method : "POST",
            //     data : JSON.stringify({
            //         "boardNum" : dealNum,
            //         "boardCategory" : boardCategory
            //     }),
            //     dataType: "json",
            //     headers: {
            //         "Accept": "application/json",
            //         "Content-Type": "application/json; charset=UTF-8"
            //     },
            //     success:function (JSONData) {
            //         if (JSONData.like === 'n') {
            //             alert("누름")
            //             $(".likeToggle").val("좋아요 해제") ;
            //         } else {
            //             alert("뺌")
            //             $(".likeToggle").val("좋아요!");
            //         }
            //     }
            // })
            // })
            // $(".addClub").on("click",function(){
            //     location.href="/club/addClub"
            // })
            $(".dealLogin").on("click", function () {
                location.href = "/deal/login?userId=" + $("input[name='userId']").val() + "&dealBoardNum=${deal.dealBoardNum}";
            })
            $(".likeToggle").on("click", function () {
                var dealNum = $(this).parent().children("[name='dealBoardNum']").val();
                var boardCategory = $(this).parent().children("[name='boardCategory']").val();
                $.ajax({
                    url: "/deal/json/dealLike",
                    method: "POST",
                    data: JSON.stringify({
                        "boardNum": dealNum,
                        "boardCategory": boardCategory
                    }),
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json; charset=UTF-8"
                    },
                    dataType: "JSON",
                    success: function (JSONData, result) {
                        alert(result)
                        alert(JSONData);
                        if (JSONData.like === 'n') {
                            alert("누름")
                            $(".likeToggle").val("좋아요 해제");
                        } else if (JSONData.like == 'null') {
                            $(".likeToggle").val
                        } else {
                            alert("뺌")
                            $(".likeToggle").val("좋아요!");
                        }
                    }
                })
            })

            $(".dealCaht").on("click", function () {
                var dealUserId = $(".dealUserId").val();
                var userId = $(".userId").val()

                var chatNameSpace = "dealChat"

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
                                    window.open("/chat/addOneChat?chatNameSpace=" + chatNameSpace + "&userId=" +dealUserId + "&boardNum=" + '${dealBoardNum}' , "채팅방",
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

        });
        //$(".likeToggle").on("click",function(){

        //
        //         var likeCount =$(this).parents(".cardbox").find(".likeText").html();
        //         var boardNum = $(this).parents(".cardbox").find(".boardNum").val();
        //         var boardCategory = $(this).parents(".cardbox").find(".boardCategory").val()
        //         var  likeText = $(this).parents(".cardbox").find(".likeText")
        //
        //         $.ajax({
        //             url: "/deal/json/addLike",
        //             type: "POST",
        //             data: JSON.stringify({
        //                 "likeCount": likeCount,
        //                 "boardNum": boardNum,
        //                 "boardCategory": boardCategory
        //             }),
        //             dataType: "JSON",
        //             contentType: 'application/json; charset=UTF-8',
        //             success: function (JSONData, result) {
        //
        //                 likeText.html(JSONData);
        //             }
        //         })
        //     });
        // });

        //
        //         var dealBoardNum = $(this).parent().children("[name='dealBoardNum']").val();
        //         var button = $(this);
        //         $.ajax({
        //             url: "/deal/json/dealLike",
        //             type: "POST",
        //             data: JSON.stringify({
        //                 "boardNum": dealBoardNum,
        //                 "boardCategory": "8"
        //             }),
        //             dataType: "JSON",
        //             contentType: 'application/json; charset=UTF-8',
        //
        //             success: function () {
        //                 // alert("ajax")
        //                 if(button.val()==='좋아요!'){
        //                     // alert("누름")
        //                     button.val("좋아요 해제");
        //                 }else{
        //                     // alert("뺌")
        //                     button.val("좋아요!");
        //                 }
        //             }
        //         })
        //     })
        // })
        $(function () {
            $(".updateDeal").on("click", function () {
                location.href = "/deal/updateDeal/${deal.dealBoardNum}"
            })
            $(".deleteDeal").on("click", function () {
                var check = confirm("진짜 삭제?");
                if (check == true) {
                    location.href = "/deal/deleteDeal/${deal.dealBoardNum}"
                }
            })
        });
        $(function () {
            /* 리뷰쓰기 */
            $(".reply_button_wrap").on("click", function (e) {

                e.preventDefault();

                const userId = '${user.userId}';
                const dealId = '${deal.dealId}';

                let popUrl = "/deal/review/${dealBoardNum}";


                console.log(popUrl);
                let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";

                window.open(popUrl, "리뷰 쓰기", popOption);
            });
        })


    </script>
    <!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


    <!-- jQuery UI toolTip 사용 CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip 사용 JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        body {
            padding-top: 50px;
        }


        /* 리뷰쓰기 버튼 */
        .reply_button_wrap {
            padding: 10px;
        }

        .reply_button_wrap button {
            background-color: #365fdd;
            color: white;
            font-weight: bold;
            font-size: 15px;
            padding: 5px 12px;
            cursor: pointer;
        }

        .reply_button_wrap button:hover {
            background-color: #1347e7;
        }

        /* 리뷰 영역 */
        .content_bottom {
            width: 80%;
            margin: auto;
        }

        .reply_content_ul {
            list-style: none;
        }

        .comment_wrap {
            position: relative;
            border-bottom: 1px dotted #d4d4d4;
            padding: 14px 0 10px 0;
            font-size: 12px;
        }

        /* 리뷰 머리 부분 */
        .reply_top {
            padding-bottom: 10px;
        }

        .id_span {
            padding: 0 15px 0 3px;
            font-weight: bold;
        }

        .date_span {
            padding: 0 15px 0;
        }

        /* 리뷰 컨텐트 부분 */
        .reply_bottom {
            padding-bottom: 10px;
        }


        /* 리뷰 선 */
        .reply_line {
            width: 80%;
            margin: auto;
            border-top: 1px solid #c6c6cf;
        }

        /* 리뷰 제목 */
        .reply_subject h2 {
            padding: 15px 0 5px 5px;
        }

        /* pageMaker */
        .repy_pageInfo_div {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 40px;
        }

        .pageMaker {
            list-style: none;
            display: inline-block;
        }

        .pageMaker_btn {
            float: left;
            width: 25px;
            height: 25px;
            line-height: 25px;
            margin-left: 20px;
            font-size: 10px;
            cursor: pointer;
        }

        .active {
            border: 2px solid black;
            font-weight: 400;
        }

        .next, .prev {
            border: 1px solid #ccc;
            padding: 0 10px;
        }

        /* 리뷰 없는 경우 div */
        .reply_not_div {
            text-align: center;
        }

        .reply_not_div span {
            display: block;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        /* 리뷰 수정 삭제 버튼 */
        .update_reply_btn {
            font-weight: bold;
            background-color: #b7b399;
            display: inline-block;
            width: 40px;
            text-align: center;
            height: 20px;
            line-height: 20px;
            margin: 0 5px 0 30px;
            border-radius: 6px;
            color: white;
            cursor: pointer;
        }

        .delete_reply_btn {
            font-weight: bold;
            background-color: #e7578f;
            display: inline-block;
            width: 40px;
            text-align: center;
            height: 20px;
            line-height: 20px;
            border-radius: 6px;
            color: white;
            cursor: pointer;
        }
    </style>
    <link rel="stylesheet" href="/css/admin.css" type="text/css">
    <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
</head>


<body>
<%-- toolbar 시작--%>
<jsp:include page="/layout/toolbar.jsp"/>
<%-- toolbar 종료--%>

<c:forEach items="${deal.files}" var="i">
    <img src="/resources/${i.fileName}" alt="거래 게시글 사진"><br>
    <br>
</c:forEach>
${deal}<br>
<div>

    <input type="button" class="likeToggle" value="${likeCheck == 'y'?'좋아요 해제':'좋아요!'}">
    <input type="hidden" name="dealBoardNum" value="${deal.dealBoardNum}">
    <input type="hidden" name="boardCategory" value="${deal.boardCategory}">
    <input type="hidden" class="dealUserId" value="${deal.user.userId}">
    <input type="hidden" class="userId" value="${user.userId}">
    <br/>
    <br/>
</div>
</table>
<input type="button" class="updateDeal" value="거래 수정">
<input type="button" class="deleteDeal" value="거래 삭제">
<input type="button" class="dealCaht" value="채팅하기">

<div class="reply_subject">리뷰</div>
<div class="replypt">${deal.reviewPt}</div>
<div class="replypt">${point}</div>


<div class="reply_button_wrap">
    <button>리뷰 쓰기</button>
</div>


<input type="button" class="dealLogin" value="로그인">
<label>
    아이디 : <input type="text" name="userId" value="">
    <input type="hidden" name="dealBoardNum" value="${deal.dealBoardNum}">
</label>

${user.userId}

<br>


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

</body>
</html>
