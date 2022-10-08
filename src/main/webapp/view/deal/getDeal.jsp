<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
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

    <title>��ǰ �����ȸ</title>
    <meta charset="EUC-KR">

    <!-- ���� : http://getbootstrap.com/css/   ���� -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function(){
            // $(".addClub").on("click",function(){
            //     location.href="/club/addClub"
            // })
            // $(".clubLogin").on("click",function(){
            //     location.href="/club/login?userId="+$("input[name='userId']").val()
            //})
            $(".likeToggle").on("click",function(){
                var dealBoardNum = $(this).parent().children("[name='dealBoardNum']").val();
                var button = $(this);
                $.ajax({
                    url: "/deal/json/dealLike",
                    type: "POST",
                    data: JSON.stringify({
                        "boardNum": clubNum,
                        "boardCategory": "8"
                    }),
                    dataType: "JSON",
                    contentType: 'application/json; charset=UTF-8',

                    success: function () {
                        // alert("ajax")
                        if(button.val()==='���ƿ�!'){
                            // alert("����")
                            button.val("���ƿ� ����");
                        }else{
                            // alert("��")
                            button.val("���ƿ�!");
                        }
                    }
                })
            })
        })
        $(function(){
            $(".updateDeal").on("click",function(){
                location.href="/deal/updateDeal/${deal.dealBoardNum}"
            })
        })
    </script>
    <!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


    <!-- jQuery UI toolTip ��� CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        body {
            padding-top : 50px;
        }

    </style>
    <link rel="stylesheet" href="/css/admin.css" type="text/css">
    <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
</head>



<body>
${deal}<br>
<div>

    <input type="button" class="likeToggle" value="${deal.likeCheck=='y'?'���ƿ� ����':'���ƿ�!'}">
    <input type="hidden" name="dealBoardNum" value="${deal.dealBoardNum}">
    <br/>
    <br/>
</div>
</table>
<input type="button" class="updateDeal" value="�ŷ� ����">
<input type="button" class="deleteDeal" value="�ŷ� ����">
<input type="button" class="#" value="ä���ϱ�">












<%--<body bgcolor="#ffffff" text="#000000">--%>
<%--<jsp:include page="/layout/toolbar.jsp" />--%>
<%--<form name="detailForm" method="post">--%>

<%--    <table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">--%>
<%--        <tr>--%>
<%--            <td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>--%>
<%--            <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">--%>
<%--                <table width="100%" border="0" cellspacing="0" cellpadding="0">--%>
<%--                    <tr>--%>
<%--                        <td width="93%" class="ct_ttl01">��ǰ����ȸ</td>--%>
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
<%--                ��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>--%>
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
<%--                ��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>--%>
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
<%--                ��ǰ�̹��� <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>--%>
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
<%--                ��ǰ������ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>--%>
<%--            </td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            &lt;%&ndash; 		<td class="ct_write01"><%=vo.getProdDetail()%></td>&ndash;%&gt;--%>
<%--            <td class="ct_write01">${product.prodDetail}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">��������</td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            &lt;%&ndash;		<td class="ct_write01"><%=vo.getManuDate()%></td> &ndash;%&gt;--%>
<%--            <td class="ct_write01">${product.manuDate }</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">����</td>--%>
<%--            <td bgcolor="D6D6D6" width="1"></td>--%>
<%--            &lt;%&ndash; 		<td class="ct_write01"><%=vo.getPrice()%></td>&ndash;%&gt;--%>
<%--            <td class="ct_write01">${product.price }</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="1" colspan="3" bgcolor="D6D6D6"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="104" class="ct_write">�������</td>--%>
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
<%--    <input type="button" class="likeToggle" value="${deal.likeCheck=='y'?'���ƿ� ����':'���ƿ�!'}"></td>--%>
<%--                        <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">--%>
<%--                            &lt;%&ndash; 					<a href="/addPurchaseView.do?prod_no=<%=vo.getProdNo()%>">����</a>&ndash;%&gt;--%>
<%--                            <a href="/addPurchaseView.do?prod_no=${product.prodNo }">ä���ϱ�</a>--%>
<%--                        </td>--%>
<%--                        <td width="14" height="23">--%>
<%--                            <img src="/images/ct_btnbg03.gif" width="14" height="23">--%>
<%--                        </td>--%>
<%--                        <td width="30"></td>--%>

<%--                        <td width="17" height="23">--%>
<%--                            <img src="/images/ct_btnbg01.gif" width="17" height="23"/>--%>
<%--                        </td>--%>
<%--                        <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">--%>
<%--                            <a href="javascript:history.go(-1)">����</a>--%>
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
